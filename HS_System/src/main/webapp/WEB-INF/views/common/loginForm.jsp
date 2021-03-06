<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<title>로그인</title>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">

<!-- Font Awesome Icons -->
<link rel="stylesheet"	href="<%=request.getContextPath()%>/resources/bootstrap/plugins/fontawesome-free/css/all.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/adminlte.min.css">
	
<!-- include summernote css/js -->
<link href="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote.min.css" rel="stylesheet">

<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<style>

.login-container{
    margin-top: 5%;
    margin-bottom: 5%;
}
.login-form-1{
    padding: 5%;
    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
}
.login-form-1 h3{
    text-align: center;
    color: #333;
}
.login-form-2{
    padding: 5%;
    background: #2A5F9E;
    box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);
}
.login-form-2 h3{
    text-align: center;
    color: #fff;
}
.login-container form{
    padding: 10%;
}
.btnSubmit
{
    width: 50%;
    border-radius: 1rem;
    padding: 1.5%;
    border: none;
    cursor: pointer;
}
.login-form-1 .btnSubmit{
    font-weight: 600;
    color: #fff;
    background-color: #0062cc;
}
.login-form-2 .btnSubmit{
    font-weight: 600;
    color: #0062cc;
    background-color: #fff;
}
.login-form-2 .ForgetPwd{
    color: #fff;
    font-weight: 600;
    text-decoration: none;
}
.login-form-1 .ForgetPwd{
    color: #0062cc;
    font-weight: 600;
    text-decoration: none;
}
</style>
<!------ Include the above in your HEAD tag ---------->
<body style="margin-top: 250px;">
<!------ Include the above in your HEAD tag ---------->
<div class="container login-container">
            <div class="row">
                <div class="col-md-6 login-form-1">
                   <img src="<%=request.getContextPath() %>/resources/mainLogo.png" style="height: 400px; margin-left: 20px;"/>
                   
                </div>
                <div class="col-md-6 login-form-2">
                    <h3>LOGIN</h3>
                    <form action="<%=request.getContextPath() %>/common/login.do" id="loginForm" method="post" style="padding-bottom: 15px;">
	                    <div class="form-group has-feedback">
							<select class="form-control" name="selectLogin" id="selectLogin" onchange="selectLoginChange(this)">
								<option value="">구분 유형을 선택해 주세요</option>
								
								<option value="">---------------------</option>
                        		<option value="2">학생▶ 경영</option>
                        		<option value="1">학생▶ 멀티</option>
                        		<option value="9">학생▶ 박두루미</option>
                        		<option value="10">학생▶ 이메일&보안레벨</option>
                        		<option value="">---------------------</option>
                        		<option value="3">교수▶ 경영</option>
                        		<option value="4">교수▶ 멀티</option>
                        		<option value="">---------------------</option>
                        		<option value="5">교직▶ 경영</option>
	                        	<option value="6">교직▶ 멀티</option>
	                        	<option value="">---------------------</option>
	                        	<option value="7">교무처</option>
	                        	<option value="8">장학처</option>
							</select>
							<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
						</div>
						
                        <div class="form-group has-feedback">
                             <input type="hidden" name="gubun" id="gubun" value="">
 <!--                             <input type="hidden" name="id" id="id" value=""> -->
							<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력하세요." value="">
							<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                        </div>
                        
                        <div class="form-group has-feedback">
                            <input type="password" class="form-control" id="userpassword" name="pwd" placeholder="패스워드를 입력하세요."  value=""  onkeyup="enter()">
							<span class="glyphicon glyphicon-lock form-control-feedback"></span>
                        </div>
                        
                        <div class="form-group">
                            <input type="button" class="btnSubmit" value="Login" id="btnLogin"/>
                            <button style="display: none;" type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" id="modal">얼굴인식</button>	
                        </div>

                    </form>
              
                        <div class="form-group" style="padding-left:60px;">
                            <a href="javascript:void(0);" onclick="OpenWindow('<%=request.getContextPath()%>/idFindForm','아이디찾기',450,300)" class="ForgetId" style="color: white;">Forget ID</a>&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="javascript:void(0);" onclick="OpenWindow('<%=request.getContextPath()%>/pwFindForm','비밀번호찾기',450,300)" class="ForgetPwd" style="color: white;">Forget Password</a>
                        </div>
                </div>
            </div>
        </div>
        
        <!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="myModalLabel">얼굴인식</h4>
      </div>
      <div class="modal-body">
       <video  id="myVideo" width="465" height="300" style="border: none;"></video>
		<canvas id="myCanvas" width="200" height="200" style="border: 1px solid #ddd; margin-left: 125px;" ></canvas><br>
		
<!-- 		<input type=button value="get Video" onclick="getVideo();"> -->
		 <button type="button" class="btn btn-default" onclick="takeSnapshot();" style="margin-left: 180px;">사진촬영</button>
<!-- 		<input type="hidden" id="myInterval"  value="3000"> -->
<!-- 		<input type=button value="서버전송" onclick="server()"> -->
			<form id="frm" method="post" action="http://127.0.0.1:5000/" >
				<input type="hidden"  name="id1"/>
				<input type="hidden"  name="pwd1"/>
				<input type="hidden"  name="gubun1"/>
			</form>
      </div>
      <script>
var myVideoStream = document.getElementById('myVideo')     // make it a global variable
var myStoredInterval = 0



window.onload=function(){
const constraints={audio: false, video: true };
	
navigator.mediaDevices.getUserMedia(constraints).then(function(stream){
     myVideoStream.srcObject = stream;
     myVideoStream.onloadedmetadata = function(e){
      	myVideoStream.play();
	 }; 
 })
$('#btnLogin').on('click', function(){
	$('#frm > input[name=id1]').val($('#id').val());
	$('#frm > input[name=pwd1]').val($('#userpassword').val());
	$('#frm > input[name=gubun1]').val($('#gubun').val());
});
}

function takeSnapshot() {
 var myCanvasElement = document.getElementById('myCanvas');
 var myCTX = myCanvasElement.getContext('2d');
 myCTX.drawImage(myVideoStream, 0, 0, myCanvasElement.width, myCanvasElement.height);
 server();
}

function server() {
     const canvas = document.getElementById('myCanvas');
     const imgBase64 = canvas.toDataURL('image/png', 1.0);
	
     var input = document.createElement('input');
     input.setAttribute('type', 'hidden');
     input.setAttribute('name', 'imgBase64');
     input.value = imgBase64;

     document.getElementById('frm').append(input);
     document.getElementById('frm').submit();
};

</script>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/adminlte.min.js"></script>

<!-- summernote Editor -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/summernote/summernote.min.js"></script>

<!-- jquery cookie -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
<c:if test = "${!empty message }">
<script>
	alert("${message}");
</script>

</c:if>
<script>
function selectLoginChange(e){
	const value = e.value;
	if(value==1){
		$('input[name=gubun]').attr('value',"1");
		$('input[name=id]').attr('value',"2021001004");
		$('input[name=pwd]').attr('value',"1");
	}else if(value==2){
		$('input[name=gubun]').attr('value',"1");
		$('input[name=id]').attr('value',"2014001001");
		$('input[name=pwd]').attr('value',"1");
	}else if(value==3){
		$('input[name=gubun]').attr('value',"3");
		$('input[name=id]').attr('value',"21004002");
		$('input[name=pwd]').attr('value',"1");
	}else if(value==4){
		$('input[name=gubun]').attr('value',"3");
		$('input[name=id]').attr('value',"11004001");
		$('input[name=pwd]').attr('value',"1");
	}else if(value==5){
		$('input[name=gubun]').attr('value',"2");
		$('input[name=id]').attr('value',"21001001001");
		$('input[name=pwd]').attr('value',"1");
	}else if (value==6){
		$('input[name=gubun]').attr('value',"2");
		$('input[name=id]').attr('value',"19001004006");
		$('input[name=pwd]').attr('value',"1");
	}else if(value==7){
		$('input[name=gubun]').attr('value',"2");
		$('input[name=id]').attr('value',"19002000003");
		$('input[name=pwd]').attr('value',"1234");
	}else if(value==8){
		$('input[name=gubun]').attr('value',"2");
		$('input[name=id]').attr('value',"20003000004");
		$('input[name=pwd]').attr('value',"1");
	}else if(value==9){
		$('input[name=gubun]').attr('value',"1");
		$('input[name=id]').attr('value',"2021001099");
		$('input[name=pwd]').attr('value',"1");
	}else if(value==10){
		$('input[name=gubun]').attr('value',"1");
		$('input[name=id]').attr('value',"2021001011");
		$('input[name=pwd]').attr('value',"1");
	}
}
</script>


<script type="text/javascript">



function loginForm(){
//  	const gubun = $("#gubun").val();
// 	if(gubun=="0"){
// 		alert("구분 유형을 선택하세요.");
// 		return false;
// 	}
	
	let userId = $("#id").val();
	if(userId==""){
		alert("ID를 입력하세요.");
		return false;
	}
	
	
	$("#id").val(userId);
// 	$("#gubun").val(gubun);
	$("#loginForm").submit();
}


function loginfn(){
	
	$("#id").val();
	// 아이디 , 비번 체크해서 보안레벨 가져오는 ajax
	var form = $('#loginForm').serialize();
	$.ajax({
		type : "post",
		url : "<%=request.getContextPath()%>/common/userCheck",
		data : form,
		dataType : "json",
		success : function(data){

			// 문자인증해됨
			if(data.returnLev == 2){
				OpenWindow('<%=request.getContextPath()%>/smsForm','문자인증',600,500);				
			} else if(data.returnLev == 3){
				// 얼굴인증 
					var ele = document.getElementById("modal");
					ele.click();
			} else if(data == 99){
				alert("아이디 또는 비밀번호가 맞지 않습니다.\n다시 입력해 주세요");
			} else{
				loginForm();	
			}
			
			//
		},
		error : function(error){

		}
	})
}

$("#btnLogin").click(function(){
	loginfn();
});

function enter() {
	if(window.event.keyCode == 13){
		loginfn();
	}
}


</script>
</body>
</html>





