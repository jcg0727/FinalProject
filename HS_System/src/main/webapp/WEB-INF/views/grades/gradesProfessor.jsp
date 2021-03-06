<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style>
body {
	height: 100%;
}

.body>.card {
	height: 100%;
	width: 100%;
}

.main-card-body .card:nth-child(1) {
	height: 45vh;
}

.main-card-body .card:nth-child(2) {
	height: 38vh;
}

.lecture-card-body .row {
	padding: 5px;
}

.lecture-card-body .col-sm-4 {
	margin-top: 10px;
}

.position-relative .bth {
	height: 31px;
	margin: center;
	float: right;
}

.position-relative span {
	float: right;
}

.student-list-body {
	padding: 10px;
	height: 100%;;
}

.student-list-body table {
	text-align: center;
}

.student-list-body td {
	padding: 5px 0;
}

.dissent-list-tr td:nth-child(3) {
	width: 35%;
}

.student-list-body .table thead tr th {
	padding: 5px;
}
</style>
</head>

<body>
	<div class="card">
		<div class="card-body main-card-body">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">담당강의 목록 조회</h4>
				</div>
				<div class="card-body lecture-card-body row">
					<c:forEach items="${lectureList}" var="lecture">
						<div class="col-sm-4">
							<div class="position-relative p-3 lectureCard"
								style="height: 150px; background-color: #f7f7f7;">
								<div class="ribbon-wrapper">
									<div class="ribbon ribbonColor text-white"
										style="background-color: #2A5F9E;">${lecture.class_type}</div>
								</div>
								<h5 class="font-weight:normal;">${lecture.class_name}</h5>
								<br> <br> <span>
									<button type="button" class="btn btn-sm btnGray text-white"
										id=""
										onclick="OpenWindow('<%=request.getContextPath()%>/score/management_prof/studentList?class_name=${lecture.class_name }&class_no=${lecture.class_no}&lecture_semester=202102','성적입력','700','800');">성적입력</button>
								</span>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="card-footer"></div>
			</div>
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">성적 이의 신청 목록</h4>
				</div>
				<div class="card-body student-list-body">
					<table class="table" style="font-size: 15px;">
						<thead>
						<colgroup>
							<col width="5%">
							<col width="20%">
							<col width="10%">
							<col width="10%">
							<col width="15%">
							<col width="15%">
							<col width="5%">
							<col width="5%">
						</colgroup>

						<tr>
							<th>NO</th>
							<!--                         <th>학수번호</th> -->
							<th>교과목명</th>
							<th>학번</th>
							<th>성명</th>
							<th>신청일자</th>
							<th>이의신청 성적</th>
							<th>상태</th>
							<th>기타</th>
						</tr>
						</thead>
						<tbody id="dissent-list-tbody">
						</tbody>
					</table>
				</div>
				<div class="card-footer dissent-list-footer"></div>
			</div>
		</div>
	</div>
	<script>
var data = "";
var dissentPage =""

window.onload = function(){
	dissentList(1);
}

function dissentList(page){
	
	if(!page) page = 1;
	dissentPage = page;
	
	
	data = {"page" : page,"lecture_semester" : '202102',"perPageNum" : 5};
	
	$.ajax({
		url : '<%=request.getContextPath()%>/score/management_prof/dissentList',
		data : JSON.stringify(data),
        type : 'POST',
        contentType : 'application/json; charset=utf-8',
		success : function(data){
			console.log(data);
			printData(data.dissentList,'#dissent-list-tbody', '#dissent-list-template', '.dissent-list-tr');
			printPagination(data.pageMaker,'.dissent-list-footer','#dissent-pagination-template','.pagination');
		},
		error : function(error){
			
		}
	});
};

</script>
	<script
		src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
	<script id="dissent-list-template" type="text/x-handlebars-template">
{{#if this}}
{{#each .}}
	<tr class="dissent-list-tr">
		<td>{{rnum}}</td>
		<input type="hidden" value="{{class_no}}"/>
		<td>{{class_name}}</td>
		<td>{{student_no}}</td>
		<td>{{student_name}}</td>
		<td>{{parseDate dissent_grades_no}}</td>
		<td>{{grades_cd}}</td>
		<td>{{status_nm}}</td>
		<td>
			<button class="btn btn-xs btnGray text-white" onclick="OpenWindow('<%=request.getContextPath()%>/score/management_prof/dissentList/detail?dissentNo={{dissent_grades_no}}','성적이의신청','700','800');">상세보기</button>
		</td>
	</tr>
{{/each}}
{{else}}
	<tr class="student-list-tr">
		<td id="tdText" colspan="9"><br><i class="fas fa-exclamation-triangle" style="color:#2A5F9E"></<i><br><br>성적 이의신청 목록이 존재하지 않습니다</td>
	</tr>
{{/if}}
</script>
	<script id="dissent-pagination-template"
		type="text/x-handlebars-template">
<ul class="pagination pagination-sm justify-content-center m-0">
   <li class="paginate_button page-item">
      <a href="javascript:dissentList(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-left'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="{{#if prev}}javascript:dissentList({{prevPageNum}}){{else}}javascript:dissentList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-left'></i>
      </a>
   </li>
   {{#each pageNum}}
   <li class="paginate_button page-item {{dissentPage this}} ">
      <a href="javascript:dissentList({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         {{this}}
      </a>
   </li>
   {{/each}}

   <li class="paginate_button page-item ">
      <a href="{{#if next}}javascript:dissentList({{nextPageNum}}){{else}}javascript:dissentList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-right'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="javascript:dissentList({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-right'></i>
      </a>
   </li>
</ul>
</script>
	<script>
		Handlebars.registerHelper('dissentPage', function(value, options) {
			if (value == dissentPage) {
				return 'active';
			}
		});

		Handlebars.registerHelper('parseDate', function(value, options) {
			value = value.substring(2);
			value = value.substring(0, 2) + '-' + value.substring(3, 5) + '-'
					+ value.substring(5, 7)
			value = '20' + value;
			return value;
		})
	</script>
</body>