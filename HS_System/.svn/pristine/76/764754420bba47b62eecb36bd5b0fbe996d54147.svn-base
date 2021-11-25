<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1">

<head>
<style>

</style>
</head>


<div class="row">

	<div class="form-group col-6">
		<div class="card">
		
			<div class="card-header">
				<h3 class="card-title">수강생 리스트</h3>
			</div>
			<div class="card-body" style="height:850px; ">
			
			<!-- <div class="card-body table-responsive p-0"> -->
				<table id="studentList" class="table table-hover table-sm" style="font-size: 15px;">
					<thead>
						<tr style="text-align: center;">
							<th>이름</th>
							<th>학번</th>
							<th>학과</th>
							<th>출석</th>
						</tr>
					</thead>
					<tbody class="lectureStudentListTable" style="text-align: center;">

					</tbody>
				</table>
			<!-- </div> -->
			
			</div><!-- card-body -->
		
		</div><!-- card -->
	</div><!-- form-group col-6 -->
	
	
	<div class="form-group col-6">
		<div class="card">
		
			<div class="card-header faceHeader" style="vertical-align: center;">
				<h3 class="card-title" style="">출석체크</h3>
				<input type="button" value="얼굴인식" class="btn btn-sm btnGray text-white" id="faceRecognitionBtn" onclick="takeSnapshot();" style="height: 26px; margin: center; float:right;">
			</div>
			<div class="card-body" style="width: 100%; height:100%; text-align: center;">
					
					<div style="height: 900px; text-align: center;">
						
						<i class="far fa-smile-wink fa-3x" style="color:#666666; padding: 5px;"></i>
						<br>
						<h4 style="font-weight: bold;">얼굴인식 출석</h4>
						얼굴을 화면 가운데 위치시켜주세요.
						<br><br>
										
							
						<video id="myVideo" width="100%" width="440px;" height="400px;"></video>
						
						<canvas id="myCanvas" style="height:100%; width:100%;  width:450px; height:380px; border: 1px solid #ddd; "></canvas>
					</div>
					<br>
					<form id="frm" method="post" action="http://127.0.0.1:5000/attendance">
						<input type="hidden" name="id1" />
						<input type="hidden" name="studentNo1" />
						<input type="hidden" name="classNo1"/>
						
					</form>


			</div><!-- card-body -->
		
		</div><!-- card -->
	</div><!-- form-group col-6 -->
	
	
</div><!-- row -->


<script>
var myVideoStream = document.getElementById('myVideo');     // make it a global variable
var myStoredInterval = 0;

function startFuntion(){
	
	// 수강생리스트 출력
lectureStudentList();

const constraints={audio: false, video: true };
	
navigator.mediaDevices.getUserMedia(constraints).then(function(stream){
     myVideoStream.srcObject = stream;
      myVideoStream.onloadedmetadata = function(e){
      	myVideoStream.play();
	 }; 
 })

$("#studentList").on('click', '.lectureStudentListBody', function(){
	var td = $(this).children();
	// 클릭한 학생의 학번 값
	var studentNo = td.eq(1).text();
	
	console.log("test 해보쟈~~~~~~~~~~~~~~~~~~~~"+studentNo);
	// hidden에 넣어주기
	$('#frm > input[name=studentNo1]').val(studentNo); 
	$('#frm > input[name=classNo1]').val("${class_no}" );
	
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

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script id="lectureStudentList" type="text/x-handlebars-template">
{{#each .}}
			<tr class="lectureStudentListBody" style="text-align: center;">
				<td>{{student_name}}</td>
				<td id="studentNo" name="studentNo">{{student_no}}</td>
				<td>{{dept_nm}}</td>
				
				<td>
					{{#ifEquals attendanceStatus "0"}}
						<button type="button" onclick="" class="btn btnGray btn-xs text-white"> </button>
					{{else ifEquals attendanceStatus "1"}}
						<button type="button" onclick="" class="btn btn-xs"> <i class="fas fa-check fa-3x" style="color:#2A5F9E"></i>  </button>
					{{/ifEquals}}
				</td>
			</tr>
{{/each}}
</script>	



	