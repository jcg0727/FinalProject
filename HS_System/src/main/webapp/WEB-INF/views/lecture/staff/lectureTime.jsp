<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="lectureTimeList" value="${dataMap.lectureTimeList }" />
<c:set var="class_no" value="${class_no }" />
<head>
<style>
.card-header{
	border-bottom-width: 3px; 
	border-bottom-color: #2A5F9E;
}
</style>
</head>


<div class="col-12" id="" style="padding-top: 5px">
	<div class="card"  style="">
	  <div class="card-header with-border">
	    <h5 class="card-title m-0">개설 강의 목록</h5>
	  </div>
	  
	  <div class="card-body" style="min-height: 520px;padding-bottom: 0px; padding-top: 5px;">
	  
	  <table class="table table-hover table-sm" style="font-size: 15px; text-align: center;">
	  		
	  		<div class="input-group row" style="float: right;width: 450px;height: 25px;display: flex;padding-left: 73px;margin-bottom: 10px;">
				<select class="form-control col-md-4" name="searchType" id="searchType" style="height: 35px;" >
	               <option value="">학기</option>
	               <option value="202201">22년도 1학기</option>
	               <option value="202102">21년도 2학기</option>
	               <option value="202101">21년도 1학기</option>
	               <option value="202002">20년도 2학기</option>
	               <option value="202001">20년도 1학기</option>
				</select>	
				<select class="form-control col-md-4" name="searchType2" id="searchType2" style="height: 35px;" >
	               <option value="">이수구분</option>
	               <option value="전필">전공필수</option>
	               <option value="교필">교양필수</option>
	               <option value="전선">전공선택</option>
	               <option value="교선">교양선택</option>
				</select>	
			  <div class="input-group-append" style="float: right;">
	            <button type="button" class="btn btnBlue" style="color: white; height: 35px;" onclick="list();">검색</button>
	           </div>
         </div>
		</div>
<br>

		<thead>
			<tr style="height: 40px;">
				<th>No</th>
				<th>선택</th>
				<th>학수번호</th>
				<th>교과목명</th>
				<th>담당학과</th>
				<th>이수구분</th>
				<th>학년</th>
				<th>학점</th>
				<th>담당교수</th>
				<th>강의시간</th>
			</tr>
		</thead>
		
		<tbody id="lectureList">	
		</tbody>
	</table>
	  </div>
	 	 <div class="card-footer lectureList"></div>
	</div>
</div><!-- 목록 -->

<div class="col-lg-6" style="float: left">
	<div class="card">
		<div class="card-header with-border" style="padding-bottom: 5px;">
			<h5 class="card-title m-0">담당교수 목록</h5>
			<button type="button" class="btn btnBlue btn-sm" style="float: right; color: white;" onclick="updateProfessor();">저장</button>
		</div>
		<div class="card-body" style="padding-bottom: 10px; padding-right: 10px; padding-top: 10px; padding-left: 10px; height: 150px;">
			<table class="table table-hover table-sm" style="font-size: 15px; text-align: center;">
				<thead>
					<tr style="height: 40px;">
						<th>NO</th>
						<th>학수번호</th>
						<th>교과목명</th>
						<th>변경전 담당교수</th>
						<th>변경후 담당교수</th>
					</tr>
				</thead>
				<tbody id="professorList">	
					
				</tbody>
			</table>
		</div>
	</div>
</div>



<div class="col-lg-6" style="float: left">
   <div class="card"  style="">
              <div class="card-header with-border" style="padding-bottom: 5px;">
	                <h5 class="card-title m-0">강의시간목록</h5>
					<button type="button" class="btn btnBlue btn-sm" style="float: right;color:white" onclick="updateTimetable();">저장</button>
              </div>
              <div class="card-body" style="padding-bottom: 10px; padding-right: 10px; padding-top: 10px; padding-left: 10px; height: 150px;">
                <table class="table table-hover table-sm" style="font-size: 15px; text-align: center;">
					<thead>
						<tr style="height: 40px;">
							<th>NO</th>
							<th>교과목명</th>
							<th>요일</th>
							<th>시작교시</th>
							<th>종료교시</th>
							<th>강의실</th>
						</tr>
					</thead>
					<tbody id="timeList">	
 
					</tbody>
				</table>
         </div>
   </div>
</div>
<form id="updateProfessor">
	<input type="hidden" class="pro_no" name ="pro_no" id="pro_no">
	<input type="hidden" class="class_no" name ="class_no" id="class_no">
</form>
<form id="updatetimeTable">
	<input type="hidden" class="timeLectureSemester" name ="timeLectureSemester" id="timeLectureSemester">
	<input type="hidden" class="timeClassNo" name ="timeClassNo" id="timeClassNo">
</form>


<script>
var outListPage = 1;
var searchType = "";
var searchType2="";
var keyword = "";
var data = "";

function list(page){
	outListPage = page;
	if(!page) outListPage = 1;
	
	searchType = $('#searchType option:selected').val();
	searchType2 = $('#searchType2 option:selected').val();
	keyword= $('#keyword').val();
	
	data = {"staff_no" : ${loginUser.id}, 
			"searchType" : searchType, 
			"searchType2" : searchType2, 
			"keyword" : keyword, 
			"page" : outListPage
			};
	
	$.ajax({
		url : '<%=request.getContextPath()%>/lecture/lectureTimeList',
		data : JSON.stringify(data),
		type : 'post',
		contentType : 'application/json; charset=utf-8',
		dataType : "json",
		success : function(data){
			printData(data.lectureTimeList, '#lectureList', '#list', '.list');
			printPagination(data.pageMaker, '.lectureList', '#lecture-list', '.pagination');
		},
		error : function(error){
			alert("리스트ㅜㅜ");
		}
	
	
	});
}


function lectureProfessor(class_no,lecture_semester){
	
	$.ajax({
		url : '<%=request.getContextPath()%>/lecture/professor',
		data : {"class_no" : class_no, "lecture_semester":lecture_semester},
		type : 'POST',
		success : function(data){
			printData(data.lectureList, '#professorList', '#professor', '.professor')
		},
		error : function(error){
			alert("ㅜㅜ");
		}
		
	});//ajax
}//function


function lectureTimeTableList(class_no,lecture_semester,class_name){
	 document.getElementById("timeClassNo").value = class_no;
	 document.getElementById("timeLectureSemester").value = lecture_semester;
	 
	alert("'" + class_name + "' 선택되었습니다")
	$.ajax({
		url : '<%=request.getContextPath()%>/lecture/timeTable',
		data : {"class_no" : class_no, "lecture_semester":lecture_semester},
		type : 'POST',
		success : function(data){
			printData(data.timeList, '#timeList', '#time', '.timetime')
		},
		error : function(error){
			alert("ㅜㅜ");
		}
		
	});//ajax
	
}

function updateProfessor(){
	pro_no = document.getElementById('pro_no').value;
	class_no = document.getElementById('class_no').value;
	data = {"class_no" : class_no, "pro_no" : pro_no };
	
	$.ajax({
		url : '<%=request.getContextPath()%>/lecture/updateProfessor',
		data : JSON.stringify(data),
		contentType : "application/json; charset=UTF-8",
		type : 'POST',
		success : function(data){
			alert("변경되었습니다.");
			list();
		},
		error : function(error){
			alert("실패쓰");
		}
	});
}

function updateTimetable(){
	period = document.getElementById('period').value;
	end_period = document.getElementById('end_period').value;
	day = document.getElementById('day').value;
	class_no = document.getElementById('timeClassNo').value;
	lecture_semester = document.getElementById('timeLectureSemester').value;
	
	data = {"class_no" : class_no, "day":day, "lecture_semester":lecture_semester, "period":period, "end_period":end_period}
	$.ajax({
		url : '<%=request.getContextPath()%>/lecture/updateTimetable',
		contentType : "application/json; charset=UTF-8",
		data : JSON.stringify(data),
		type : 'POST',
		success : function(data){
			alert("변경되었습니다.");
			list();
		},
		error : function(error){
			alert("실패쓰");
		}
	});
}

</script>
<script>
window.onload = function(){
	
	list();
	
}
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>

<script id="professor" type="text/x-handlebars-template">
{{#each .}}
	<tr class = "professor">
		<td>{{no}}</td>
		<td>{{class_no}}</td>
		<td>{{class_name}}</td>
		<td>{{pro_name}}</td>
		<td><input type="text" class = "updateProfessor" id="updateProfessor" name="updateProfessor" style="width:70px" readonly >
			<button class="btn btnBlue" type="button" onclick="OpenWindow('proList.do?class_no={{class_no}}','','500','700');" data-card-widget="search" style="width:30px;height:30px;color:white">
								<i class="fa fa-fw fa-search" aria-hidden="true"style="width:20px;height:20px;"></i>
			</button></td>
	</tr>
{{/each}}
</script>
<script id="time" type="text/x-handlebars-template">
{{#each .}}
	<tr class = "timetime">
		<td>{{no}}</td>
		<td>{{class_name}}</td>
		<td><input type='text' value='{{day}}' id = 'day' style="border:none; width:30px;"></td>
		<td><input type='text' value='{{period}}' style='width:45px;' id = 'period'></td>
		<td><input type='text' value='{{end_period}}' style='width:45px;' id='end_period'></td>
		<td>{{room_no}}</td>
	</tr>
{{/each}}
</script>
<script id="list" type="text/x-handlebars-template">
{{#each .}}
	<tr class = "list">
		<td>{{no}}</td>
		<td><button type="button" class="btn btnBlue btn-sm" style="color:white;" onclick="lectureTimeTableList('{{class_no}}','{{lecture_semester}}','{{class_name}}'); lectureProfessor('{{class_no}}','{{lecture_semester}}');">선택</button></td>
		<td>{{class_no}}</td>
		<td>{{class_name}}</td>
		<td>{{dept_name}}</td>
		<td>{{class_type}}</td>
		<td>{{class_year}}</td>
		<td>{{class_grade}}</td>
		<td>{{pro_name}}</td>
		<td>{{time}}</td>
	</tr>
{{/each}}
</script>
<script type="text/x-handlebars-template"  id="lecture-list" >
<ul class="pagination pagination-sm justify-content-center m-0">
   <li class="paginate_button page-item">
      <a href="javascript:list(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-left'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="{{#if prev}}javascript:list({{prevPageNum}}){{else}}javascript:list(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-left'></i>
      </a>
   </li>
   {{#each pageNum}}
   <li class="paginate_button page-item {{outSignActive this}} ">
      <a href="javascript:list({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         {{this}}
      </a>
   </li>
   {{/each}}

   <li class="paginate_button page-item ">
      <a href="{{#if next}}javascript:list({{nextPageNum}}){{else}}javascript:list(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-right'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="javascript:list({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-right'></i>
      </a>
   </li>
</ul>

</script>
