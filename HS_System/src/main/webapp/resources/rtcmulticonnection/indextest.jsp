<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
  <meta charset="utf-8">
  <title>H.S. 화상상담</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
  <link rel="shortcut icon" href="/demos/logo.png">
  <link rel="stylesheet" href="./demos/stylesheet.css">
  <script src="./demos/menu.js"></script>
</head>
<body>

  <h1>
	H.S. 화상상담
  </h1>

  <section class="make-center">
    <div>
      <label><input type="checkbox" id="record-entire-conference"> 상담 저장하시겠습니까?</label>
      <span id="recording-status" style="display: none;"></span>
      <button id="btn-stop-recording" style="display: none;">저장 종료</button>
      <br><br>
      <input type="text" id="room-id" value="" autocorrect=off autocapitalize=off size=20 placeholder="회의 ID를 입력해주세요">
	  <c:if test="${loginUser.authority_cd eq 'ROLE_PROFESSOR'}">     
      <button id="open-room">상담 생성</button>
      </c:if>
      <button id="join-room">상담 참가</button>
      <button id="close-room">상담 종료</button>
    </div>

    <div id="videos-container" style="margin: 20px 0;"></div>

    <div id="room-urls" style="text-align: center;display: none;background: #F1EDED;margin: 15px -10px;border: 1px solid rgb(189, 189, 189);border-left: 0;border-right: 0;"></div>
  </section>

<script src="./dist/RTCMultiConnection.min.js"></script>
<script src="./node_modules/webrtc-adapter/out/adapter.js"></script>
<script src="/socket.io/socket.io.js"></script>

<!-- custom layout for HTML5 audio/video elements -->
<link rel="stylesheet" href="./dev/getHTMLMediaElement.css">
<script src="./dev/getHTMLMediaElement.js"></script>

<script src="./node_modules/recordrtc/RecordRTC.js"></script>
<script>
// ......................................................
// .......................UI Code........................
// ......................................................

document.getElementById('close-room').onclick = function() {
    confirm("상담을 종료하고 창을 닫으시겠습니까?")
    if(confirm){
        connection.getAllParticipants().forEach(function(pid) {
            connection.disconnectWith(pid);
        });

        // stop all local cameras
        connection.attachStreams.forEach(function(localStream) {
            localStream.stop();
        });
        
    	connection.closeSocket();
    	window.close();	
    }
}


document.getElementById('open-room').onclick = function() {
    disableInputButtons();
    connection.open(document.getElementById('room-id').value, function(isRoomOpened, roomid, error) {
        if(isRoomOpened === true) {
          showRoomURL(connection.sessionid);
        }
        else {
          disableInputButtons(true);
          if(error === 'Room not available') {
            alert('이미 존재하는 방번호입니다.');
            return;
          }
          alert(error);
        }
    });
};

document.getElementById('join-room').onclick = function() {
    disableInputButtons();
    connection.join(document.getElementById('room-id').value, function(isJoinedRoom, roomid, error) {
      if (error) {
            disableInputButtons(true);
            if(error === 'Room not available') {
              alert('존재하지 않는 방번호 입니다.');
              return;
            }
            alert(error);
        }
    });
};

/* document.getElementById('open-or-join-room').onclick = function() {
    disableInputButtons();
    connection.openOrJoin(document.getElementById('room-id').value, function(isRoomExist, roomid, error) {
        if(error) {
          disableInputButtons(true);
          alert(error);
        }
        else if (connection.isInitiator === true) {
            // if room doesn't exist, it means that current user will create the room
            showRoomURL(roomid);
        }
    });
}; */

// ......................................................
// ..................RTCMultiConnection Code.............
// ......................................................

var connection = new RTCMultiConnection();

// by default, socket.io server is assumed to be deployed on your own URL
connection.socketURL = '/';

// comment-out below line if you do not have your own socket.io server
// connection.socketURL = 'https://rtcmulticonnection.herokuapp.com:443/';

connection.socketMessageEvent = 'video-conference-demo';

connection.session = {
    audio: true,
    video: true
};

connection.sdpConstraints.mandatory = {
    OfferToReceiveAudio: true,
    OfferToReceiveVideo: true
};

// STAR_FIX_VIDEO_AUTO_PAUSE_ISSUES
// via: https://github.com/muaz-khan/RTCMultiConnection/issues/778#issuecomment-524853468
var bitrates = 512;
var resolutions = 'Ultra-HD';
var videoConstraints = {};

if (resolutions == 'HD') {
    videoConstraints = {
        width: {
            ideal: 1280
        },
        height: {
            ideal: 720
        },
        frameRate: 30
    };
}

if (resolutions == 'Ultra-HD') {
    videoConstraints = {
        width: {
            ideal: 1920
        },
        height: {
            ideal: 1080
        },
        frameRate: 30
    };
}

connection.mediaConstraints = {
    video: videoConstraints,
    audio: true
};

var CodecsHandler = connection.CodecsHandler;

connection.processSdp = function(sdp) {
    var codecs = 'vp8';
    
    if (codecs.length) {
        sdp = CodecsHandler.preferCodec(sdp, codecs.toLowerCase());
    }

    if (resolutions == 'HD') {
        sdp = CodecsHandler.setApplicationSpecificBandwidth(sdp, {
            audio: 128,
            video: bitrates,
            screen: bitrates
        });

        sdp = CodecsHandler.setVideoBitrates(sdp, {
            min: bitrates * 8 * 1024,
            max: bitrates * 8 * 1024,
        });
    }

    if (resolutions == 'Ultra-HD') {
        sdp = CodecsHandler.setApplicationSpecificBandwidth(sdp, {
            audio: 128,
            video: bitrates,
            screen: bitrates
        });

        sdp = CodecsHandler.setVideoBitrates(sdp, {
            min: bitrates * 8 * 1024,
            max: bitrates * 8 * 1024,
        });
    }

    return sdp;
};
// END_FIX_VIDEO_AUTO_PAUSE_ISSUES

// https://www.rtcmulticonnection.org/docs/iceServers/
// use your own TURN-server here!
connection.iceServers = [{
    'urls': [
        'stun:stun.l.google.com:19302',
        'stun:stun1.l.google.com:19302',
        'stun:stun2.l.google.com:19302',
        'stun:stun.l.google.com:19302?transport=udp',
    ]
}];

connection.videosContainer = document.getElementById('videos-container');
connection.onstream = function(event) {
    var existing = document.getElementById(event.streamid);
    if(existing && existing.parentNode) {
      existing.parentNode.removeChild(existing);
    }

    event.mediaElement.removeAttribute('src');
    event.mediaElement.removeAttribute('srcObject');
    event.mediaElement.muted = true;
    event.mediaElement.volume = 0;

    var video = document.createElement('video');

    try {
        video.setAttributeNode(document.createAttribute('autoplay'));
        video.setAttributeNode(document.createAttribute('playsinline'));
    } catch (e) {
        video.setAttribute('autoplay', true);
        video.setAttribute('playsinline', true);
    }

    if(event.type === 'local') {
      video.volume = 0;
      try {
          video.setAttributeNode(document.createAttribute('muted'));
      } catch (e) {
          video.setAttribute('muted', true);
      }
    }
    video.srcObject = event.stream;

    var width = parseInt(connection.videosContainer.clientWidth / 3) - 20;
    var mediaElement = getHTMLMediaElement(video, {
        title: event.title, 
        buttons: ['full-screen'],
        width: width,
        showOnMouseEnter: false
    });

    connection.videosContainer.appendChild(mediaElement);

    setTimeout(function() {
        mediaElement.media.play();
    }, 5000);

    mediaElement.id = event.streamid;

    // to keep room-id in cache
    localStorage.setItem(connection.socketMessageEvent, connection.sessionid);

    chkRecordConference.parentNode.style.display = 'none';

    if(chkRecordConference.checked === true) {
      btnStopRecording.style.display = 'inline-block';
      recordingStatus.style.display = 'inline-block';

      var recorder = connection.recorder;
      if(!recorder) {
        recorder = RecordRTC([event.stream], {
          type: 'video'
        });
        recorder.startRecording();
        connection.recorder = recorder;
      }
      else {
        recorder.getInternalRecorder().addStreams([event.stream]);
      }

      if(!connection.recorder.streams) {
        connection.recorder.streams = [];
      }

      connection.recorder.streams.push(event.stream);
      recordingStatus.innerHTML = '녹화중  : ' + connection.recorder.streams.length + ' 명';
    }

    if(event.type === 'local') {
      connection.socket.on('disconnect', function() {
        if(!connection.getAllParticipants().length) {
          location.reload();
        }
      });
    }
};

var recordingStatus = document.getElementById('recording-status');
var chkRecordConference = document.getElementById('record-entire-conference');
var btnStopRecording = document.getElementById('btn-stop-recording');
btnStopRecording.onclick = function() {
  var recorder = connection.recorder;
  if(!recorder) return alert('No recorder found.');
  recorder.stopRecording(function() {
    var blob = recorder.getBlob();
    invokeSaveAsDialog(blob);

    connection.recorder = null;
    btnStopRecording.style.display = 'none';
    recordingStatus.style.display = 'none';
    chkRecordConference.parentNode.style.display = 'inline-block';
  });
};

connection.onstreamended = function(event) {
    var mediaElement = document.getElementById(event.streamid);
    if (mediaElement) {
        mediaElement.parentNode.removeChild(mediaElement);
    }
};

connection.onMediaError = function(e) {
    if (e.message === 'Concurrent mic process limit.') {
        if (DetectRTC.audioInputDevices.length <= 1) {
            alert('Please select external microphone. Check github issue number 483.');
            return;
        }

        var secondaryMic = DetectRTC.audioInputDevices[1].deviceId;
        connection.mediaConstraints.audio = {
            deviceId: secondaryMic
        };

        connection.join(connection.sessionid);
    }
};

// ..................................
// ALL below scripts are redundant!!!
// ..................................

function disableInputButtons(enable) {
    document.getElementById('room-id').onkeyup();

    //document.getElementById('open-or-join-room').disabled = !enable;
    document.getElementById('open-room').disabled = !enable;
    document.getElementById('join-room').disabled = !enable;
    document.getElementById('room-id').disabled = !enable;
}

// ......................................................
// ......................Handling Room-ID................
// ......................................................

function showRoomURL(roomid) {
    var roomHashURL = '#' + roomid;
    var roomQueryStringURL = '?roomid=' + roomid;

    var html = '<h2>Dock-Hub 화상 URL :</h2><br>';

    html += 'Hash URL: <a href="' + roomHashURL + '" target="_blank">' + roomHashURL + '</a>';
    html += '<br>';
    html += 'QueryString URL: <a href="' + roomQueryStringURL + '" target="_blank">' + roomQueryStringURL + '</a>';

    var roomURLsDiv = document.getElementById('room-urls');
    roomURLsDiv.innerHTML = html;

    roomURLsDiv.style.display = 'block';
}

(function() {
    var params = {},
        r = /([^&=]+)=?([^&]*)/g;

    function d(s) {
        return decodeURIComponent(s.replace(/\+/g, ' '));
    }
    var match, search = window.location.search;
    while (match = r.exec(search.substring(1)))
        params[d(match[1])] = d(match[2]);
    window.params = params;
})();

var roomid = '';
if (localStorage.getItem(connection.socketMessageEvent)) {
    roomid = localStorage.getItem(connection.socketMessageEvent);
} else {
    roomid = connection.token();
}

var txtRoomId = document.getElementById('room-id');
/* txtRoomId.value = roomid; */
txtRoomId.onkeyup = txtRoomId.oninput = txtRoomId.onpaste = function() {
    localStorage.setItem(connection.socketMessageEvent, document.getElementById('room-id').value);
};

var hashString = location.hash.replace('#', '');
if (hashString.length && hashString.indexOf('comment-') == 0) {
    hashString = '';
}

var roomid = params.roo
if (!roomid && hashString.length) {
    roomid = hashString;
}

if (roomid && roomid.length) {
    document.getElementById('room-id').value = roomid;
    localStorage.setItem(connection.socketMessageEvent, roomid);

    // auto-join-room
    (function reCheckRoomPresence() {
        connection.checkPresence(roomid, function(isRoomExist) {
            if (isRoomExist) {
                connection.join(roomid);
                return;
            }

            setTimeout(reCheckRoomPresence, 5000);
        });
    })();

    disableInputButtons();
}

// detect 2G
if(navigator.connection &&
   navigator.connection.type === 'cellular' &&
   navigator.connection.downlinkMax <= 0.115) {
  alert('2G is not supported. Please use a better internet service.');
}
</script>

  <footer>
    <small id="send-message"></small>
  </footer>

  <script src="https://www.webrtc-experiment.com/common.js"></script>
</body>
</html>
