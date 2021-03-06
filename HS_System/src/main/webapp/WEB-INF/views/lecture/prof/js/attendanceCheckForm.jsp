<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width,initial-scale=1">
    
<body>


<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<script defer src="<%=request.getContextPath() %>/resources/js/face-api.min.js"></script>
<script defer src="<%=request.getContextPath() %>/resources/js/faceJs.js"></script>
<style>
.form-control:disabled, .form-control[readonly] {
    background-color: white;
    opacity: 1;
}

.card-header{
 	border-bottom-width: 3px; border-bottom-color: #2A5F9E
 }
 
.card-title{
	font-weight: bold;
} 

.class_content{
	height: 500px;
}

.table td, .table th {
	border-top: none;
    padding: 0.75rem;
    vertical-align: middle;
    border-top: 1px solid #dee2e6;
}


</style>
</head>

<body>
	 <div class="card card-outline">
		<!-- <div class="card-header">
			<h4>강의상세</h4>
		</div> -->
		
		<div class="card-body">
			<div class="card card-outline card-outline-tabs">
				<div class="card-header p-0 border-bottom-0">
					<ul class="nav nav-tabs" id="custom-tabs-two-tab" role="tablist">
						<li class="nav-item"><a class="nav-link active" id="custom-tabs-two-leave-tab" data-toggle="pill" href="#custom-tabs-two-leave" role="tab" aria-controls="custom-tabs-two-leave" aria-selected="true" onclick="">출석등록</a></li>
						<li class="nav-item"><a class="nav-link" id="custom-tabs-two-return-tab" data-toggle="pill" href="#custom-tabs-two-return" role="tab" aria-controls="custom-tabs-two-return" aria-selected="false" onclick="drawChart();">출석현황</a></li>
					</ul>
				</div>
				<div class="card-body">
					<div class="tab-content" id="custom-tabs-two-tabContent">
						<div class="tab-pane fade show active" id="custom-tabs-two-leave" role="tabpanel" aria-labelledby="custom-tabs-two-leave-tab">
							<!-- 얼굴인식 탭 -->
								<%@include file="../attendance_FaceRecognition.jsp"%>  
						</div>
						<div class="tab-pane fade" id="custom-tabs-two-return" role="tabpanel" aria-labelledby="custom-tabs-two-return-tab">
							<!-- 출석현황 탭 -->
								<%@include file="../attendanceStatus.jsp"%> 
						</div>
					</div>
				</div>
				<!-- /.card -->
			</div>
			<!-- /.card -->
			
			<div style="text-align: center;">	
			<button type="button" class="btn btn-sm btnGray text-white" id="" onclick="window.close();" style="height: 31px; margin: center;">닫기</button>		
			</div>
		</div>
	</div><!-- card card-outline --> 

<script>
function lectureStudentList(){
	
	data = {
			"class_no" : "${class_no}",
			"pro_no" : "${loginUser.id}"
	};
	
	  $.ajax({
			url : '<%=request.getContextPath()%>/lecture/management_prof/lectureStudentList',
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8",
			type : 'post',
			dataType : "json",
			success : function(data) {
			console.log(data);	
			
			printData(data.lectureStudentList,'.lectureStudentListTable','#lectureStudentList','.lectureStudentListBody');
				
			},
			error : function(error) {
				console.log(error);
			}

		});
}

 <%-- function checkAttendanceStatus(){
	data = {
			"class_no" : "${class_no}",
			"student_no" : "${student_no}"
	};
	
	  $.ajax({
			url : '<%=request.getContextPath()%>/lecture/management_prof/checkAttendanceStatus',
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8",
			type : 'post',
			dataType : "json",
			success : function(data) {
				
			console.log(data);	
			if(data.message=="attendance"){
				
			} else {
				
			}
				
			},
			error : function(error) {
				console.log(error);
			}

		});	
	
} --%>
 

</script>

<script>
window.onload = function(){
	lectureStudentList();
	startFuntion();
}
</script>

</body>