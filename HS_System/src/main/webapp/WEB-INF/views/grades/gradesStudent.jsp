<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
<style>
.main-card-body .this-semester-card .card-body, .main-card-body .each-semester-card .card-body{
   height: 27vh;
}

.main-card-body .card .card-body, .main-card-body .card .card-footer{
   padding: 5px 5px;
}

.main-card-body .total-grades-card .card-body {
   height: 8vh;
}

.this-semester-tbody {
   height: 20%;
}

.main-card-body .card-footer {
   height: 10vh:
}

.card-header {
   padding: 10px;
}

.card-header .input-group {
   width: 300px;
   float: right;
}

.card-header .card-title {
   padding: 5px 0 0 0;
}

table {
   text-align: center;
}

.total-grades-card th {
   width: 20%;
}

.this-semester-card .card-header .input-group {
   width: 15%;
}

.each-semester-tbody td:nth-child(6) {
   width: 250px;
}

.this-semester-tbody td:nth-child(5) {
   width: 250px;  
}

.total-grades-card .card-header{
   padding: 5px 10px;
}
</style>
</head>

<body>
   <div class="card">
      <div class="card-body main-card-body">
         <div class="card this-semester-card">
  			<div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
               <h4 class="card-title">금학기 성적 조회</h4>
               <div class="input-group input-group-mb-3 input-group-sm">
                  <select class="form-control float-right" id="this-searchType">
                     <option value="">정렬순서</option>
                     <option value="class_type">이수구분순</option>
                     <option value="class_name">과목명순</option>
                  </select>
               </div>
            </div>
            <div class="card-body">
               <table class="table table-hover table-sm" style="font-size: 15px;">
                  <thead>
                     <tr style="height: 40px;">
                        <th>NO</th>
                        <th>이수구분</th>
                        <th>학수번호</th>
                        <th>학점</th>
                        <th>교과목명</th>
                        <th>담당교수</th>
                        <th>등급</th>
                        <th>이의신청</th>
                        <th>신청결과</th>
                     </tr>
                  </thead>
                  <tbody id="this-semester-list-body">
                  </tbody>
               </table>
            </div>
            <div class="card-footer this-semester-list-footer"></div>
         </div>
         <div class="card each-semester-card">
 			 <div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">	
               <h4 class="card-title">학기별 성적 조회</h4>
               <div class="input-group input-group-mb-3 input-group-sm">
                  <select name="table_search" class="form-control float-right" id="each-semester">
                     <option value="">전체</option>
                     <c:forEach items="${semesterList }" var="semester">
                        <c:set var="front" value="${fn:substring(semester,2,4) }" />
                        <c:set var="back" value="${fn:substring(semester,5,7) }" />
                        <option value="${semester }"><c:out value="${front }년도  ${back }학기" /></option>
                     </c:forEach>
                  </select>
                  <select class="form-control float-right" id="each-searchType">
                     <option value="">정렬순서</option>
                     <option value="lecture_semester">학년도순</option>
                     <option value="class_type">이수구분순</option>
                     <option value="class_name">과목명순</option>
                  </select>
                  <div class="input-group-append">
                     <button type="submit" class="btn" style="background-color: #2A5F9E;">
                        <i class="fas fa-search text-white" aria-hidden="true"></i>
                     </button>
                  </div>
               </div>
            </div>
            <div class="card-body">
               <table class="table table-hover table-sm" style="font-size: 15px;">
                  <thead>
                     <tr style="height: 40px;">
                        <th>NO</th>
                        <th>학년도</th>
                        <th>이수구분</th>
                        <th>학수번호</th>
                        <th>학점</th>
                        <th>교과목명</th>
                        <th>성적</th>
                        <th>재수강여부</th>
                     </tr>
                  </thead>
                  <tbody id="each-semester-list-body">
                  </tbody>
               </table>
            </div>
            <div class="card-footer each-semester-list-footer"></div>
         </div>
         <div class="card total-grades-card">
 			 <div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
               <h4 class="card-title">전체 성적 조회</h4>
               <div style="float: right;"><button class="btn btnBlue btn-sm text-white" onclick="OpenWindow('<%=request.getContextPath()%>/score/management_st/gradesPdf','성적증명서','900','900');">성적 증명서 발급</button></div>
            </div>
            <div class="card-body">
               <table class="table table-hover table-sm" style="font-size: 15px;">
                  <thead>
                     <tr>
                        <th>수강신청학점계</th>
                        <th>신청학점</th>
                        <th>취득학점</th>
                        <th>평점계</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>${totalGrades.regist_score}</td>
                        <td>${totalGrades.regist_score}</td>
                        <td>${totalGrades.getted_score}</td>
                        <td>${totalGrades.grades_avg}</td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
   </div>
<script>
window.onload=function(){
   thisSemesterList();
   eachSemesterList();
   
   document.getElementById('this-searchType').addEventListener('change', function(){
      thisSemesterList();
   });

   document.getElementById('each-semester').addEventListener('change', function(){
      eachSemesterList();
   });
   document.getElementById('each-searchType').addEventListener('change', function(){
      eachSemesterList();
   });
   
};

var lecture_semester = "";
var data = "";
var thisSemesterPage = 1;
var eachSemesterPage = 1;
var searchType = "";

function thisSemesterList(page) {
   lecture_semester = ${semesterList[0]}
   searchType = $('#this-searchType').val();
   
   if (!page){
      page = 1;
   }

   thisSemesterPage = page;
   
   data ={"lecture_semester" : lecture_semester, "searchType" : searchType , "page":page};
   
   $.ajax({
      url : '<%=request.getContextPath()%>/score/management_st/thisSemester',
      data : JSON.stringify(data),
      type : 'POST',
      contentType : 'application/json; charset=utf-8',
      success : function(data) {
         printData(data.gradesList,'#this-semester-list-body','#this-semester-template','.this-semester-tbody');
         printPagination(data.pageMaker,'.this-semester-list-footer','#this-pagination-template','.pagination');
      },
      error : function(error) {
         alert('시스템 에러입니다 \n관리자에게 문의하세요');
      }
   })
}

function eachSemesterList(page) {
   lecture_semester = $('#each-semester').val();
   searchType = $('#each-searchType').val();
   
   if(!page) page = 1;
   eachSemesterPage = page;
   
   data = {"lecture_semester" : lecture_semester, "searchType" : searchType , "page":page};
   
   $.ajax({
      url : '<%=request.getContextPath()%>/score/management_st/eachSemester',
      data : JSON.stringify(data),
      type : 'POST',
      contentType : 'application/json; charset=utf-8',
      success : function(data){
         printData(data.semesterGradesList,'#each-semester-list-body','#each-semester-template','.each-semester-tbody');
          printPagination(data.pageMaker,'.each-semester-list-footer','#each-pagination-template','.pagination');
      },
      error : function(error) {
         
      }
   
   });
}
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script id="this-semester-template" type="text/x-handlebars-template">
{{#if this}}
{{#each .}}
   <tr class="this-semester-tbody">
      <td>{{rnum}}</td>
      <td>{{class_type}}</td>
      <td>{{class_no}}</td>
      <td>{{class_grade}}</td>
      <td>{{class_name}}</td>
      <td>{{pro_nm}}</td>
      <td>{{grades_cd}}</td>
      <td>
		{{#ifEquals dissent_result "승인"}}
		<button type="button" class="btn btn-xs btnGray text-white" data-toggle="modal" data-target="#exampleModal">
        	결과확인
        </button>
        {{else}} 
		<button type="button" class="btn btn-xs btnBlue text-white" style="background-color:#2A5F9E;" {{disabled dissent_result}} onclick="OpenWindow('<%=request.getContextPath()%>/score/management_st/thisSemester/dissentRegist?lecture_semester={{lecture_semester}}&pro_name={{pro_nm}}&class_no={{class_no}}&class_name={{class_name}}&class_type={{class_type}}&grades_cd={{grades_cd}}','성적이의신청','600','600');"/>신청</button>
        {{/ifEquals}}
	  </td>
      <td>{{dissent_result}}</td>
   </tr>
{{/each}}
{{else}}
   <tr class="this-semester-tbody">
      <td colspan="11">성적 공고기간이 아닙니다</td>
   </tr>
{{/if}}
</script>
<script id="this-pagination-template" type="text/x-handlebars-template">
<ul class="pagination pagination-sm justify-content-center m-0">
   <li class="paginate_button page-item">
      <a href="javascript:thisSemesterList(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-left'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="{{#if prev}}javascript:thisSemesterList({{prevPageNum}}){{else}}javascript:thisSemesterList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-left'></i>
      </a>
   </li>
   {{#each pageNum}}
   <li class="paginate_button page-item {{thisSemesterPage this}} ">
      <a href="javascript:thisSemesterList({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         {{this}}
      </a>
   </li>
   {{/each}}

   <li class="paginate_button page-item ">
      <a href="{{#if next}}javascript:thisSemesterList({{nextPageNum}}){{else}}javascript:thisSemesterList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-right'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="javascript:thisSemesterList({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-right'></i>
      </a>
   </li>
</ul>
</script>
<script id="each-semester-template" type="text/x-handlebars-template">
{{#if this}}
{{#each .}}
   <tr class="each-semester-tbody">
      <td>{{rnum}}</td>
      <td>{{lecture_semester}}</td>
      <td>{{class_type}}</td>
      <td>{{class_no}}</td>
      <td>{{class_grade}}</td>
      <td>{{class_name}}</td>
      <td>{{grades_cd}}</td>
      <td>{{retake}}</td>
   </tr>
{{/each}}
{{else}}
   <tr class="each-semester-tbody">
      <td colspan="11">해당학기 성적이 존재하지 않습니다</td>
   </tr>
{{/if}}
</script>
<script id="each-pagination-template" type="text/x-handlebars-template">
<ul class="pagination pagination-sm justify-content-center m-0">
   <li class="paginate_button page-item">
      <a href="javascript:eachSemesterList(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-left'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="{{#if prev}}javascript:eachSemesterList({{prevPageNum}}){{else}}javascript:eachSemesterList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-left'></i>
      </a>
   </li>
   {{#each pageNum}}
   <li class="paginate_button page-item {{eachSemesterPage this}} ">
      <a href="javascript:eachSemesterList({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         {{this}}
      </a>
   </li>
   {{/each}}

   <li class="paginate_button page-item ">
      <a href="{{#if next}}javascript:eachSemesterList({{nextPageNum}}){{else}}javascript:eachSemesterList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-right'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="javascript:eachSemesterList({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-right'></i>
      </a>
   </li>
</ul>
</script>
<script>
Handlebars.registerHelper('thisSemesterPage', function(value,options){
   if(thisSemesterPage == value){
      return 'active';
   }
})
Handlebars.registerHelper('disabled', function(value,options){
   if(value != '없음'){
      return 'disabled';
   }
})
Handlebars.registerHelper('eachSemesterPage', function(value,options){
   if(eachSemesterPage == value){
      return 'active';
   }
})
</script>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>