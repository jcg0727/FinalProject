<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<style>
button {
   border-radius: 0.2rem;
}

.card-header .form-control {
   width: 130px;
}

.card-header select {
   padding: 0;
   text-align: center;
   margin: 0px 5px;
}

.card-title {
   padding-top: 5px;
}

.card-header {
   padding-top: 5px;
   padding-bottom: 5px;
   padding-right: 40px;
   padding-left: 10px;
}

.card-body {
   padding: 10px;
}

.curriculum-list-header {
   padding-top: 5px;
   padding-bottom: 0px;
   height: 51px;
}

.curri-select-group {
   padding-left: 80px;
}

.curriculum-list-footer {
   padding-top: 0px;
}

.curriculum-list>.card-header {
   height: 50px;
}

.curriculum-list-card-body {
   height: 380px;
}

.sub-card-body {
   padding: 0;
   height: 210px;
}

.col-6 .card-footer {
   padding-top: 0;
}

.card-body .card-body {
   padding: 0px;
}

.col-6 input[name=table_search] {
   width: 180px;
}

.curri-select-group {
   height: 100%;
}

.curri-select-group select {
   height: 100%;
}

.class-name{
   width: 50%;
}
</style>
<c:if test="${loginUser.authority_cd ne 'ROLE_STAFF' }">
   <style>
.regist-body:hover {
   text-decoration: underline;
   cursor: pointer;
   
}
.card-body .form-control {
   text-align: center;
}

</style>
</c:if>

</head>

<body>
   <div class="card curriculum-list" style="margin-top: 10px;">
      <div class="card-header">
         <div class="form-group form-group-sm row">
            <select class="form-control col-2" id="semester-select">
               <option value="202201">22년도 1학기</option>
               <option value="202102">21년도 2학기</option>
               <option value="202101">21년도 1학기</option>
               <option value="202002">20년도 2학기</option>
            </select>
            <div class="input-group input-group-mb-3 col-4" style="width: 250px;">
               <input type="text" id="curri-dept-search" class="form-control float-right select-dept" placeholder="학과명을 입력하세요" <c:if test="${loginUser.authority_cd eq 'ROLE_STAFF' }">value="${staff.dept_nm }" readonly="readonly"</c:if> />
               <input type="hidden" id="hidden-dept-cd" value="<c:if test="${loginUser.authority_cd eq 'ROLE_STAFF' }">${staff.dept_cd }</c:if>">
               <div class="input-group-append">
                  <button style="border-radius: 0.2rem;" type="button" class="btn btnBlue" onclick="OpenWindow('<%=request.getContextPath()%>/search/department', '학과검색', '650', '600')" <c:if test="${loginUser.authority_cd eq 'ROLE_STAFF' }">
                        disabled=true   
                     </c:if>>
                     <i class="fas fa-search" aria-hidden="true"></i>
                  </button>
               </div>
               <button class="btn btnBlue text-white" style="margin-left: 10px;" onclick="<c:if test="${loginUser.authority_cd eq 'ROLE_STAFF' }">curriculumList();unopenedCurriculumList();registCurriculumList();</c:if><c:if test="${loginUser.authority_cd eq 'ROLE_ACADEMIC' }">registAcademicList(); </c:if>">검색</button>
            </div>
         </div>
      </div>
      <div class="card-body">
         <c:if test="${loginUser.authority_cd eq 'ROLE_STAFF' }">
            <%@ include file="./role_staff_curriculum.jsp"%>
         </c:if>
         <c:if test="${loginUser.authority_cd eq 'ROLE_ACADEMIC' }">
            <%@ include file="./role_academic_curriculum.jsp"%>
         </c:if>
      </div>
   </div>
<input type="hidden" id="staff_role" value="${loginUser.authority_cd }">
<script>
var curriculumListPage = 1;
var upopenedListPaging = 1;
var registListPaging = 1;

var semester = ""
var grade ="";
var class_no = "";
var class_type = "";
var score = "";
var class_nm = "";
var data = "";
var dept_cd = "";
var status_cd = "";

window.onload = function(){
   if(document.getElementById('curri-dept-search').value){
      curriculumList();
      unopenedCurriculumList();
      registCurriculumList();
   }
   var items = document.getElementsByClassName('regist-body');
  
   $('#semester-select').on('change', function(){
      semester = $(this).val();
	  if(document.getElementById('staff_role').value == 'ROLE_STAFF'){
         curriculumList();
         unopenedCurriculumList();
         registCurriculumList();
	  }else{
		  registAcademicList();
	  }
   });
   
}

function curriculumList(page, status_cd){
   grade = $('#grade-select').val();
   class_type = $('#class-type-select').val();
   score = $('#score-type-select').val();
   class_nm = $('input[name=class-nm]').val();
   dept_cd = $('#hidden-dept-cd').val();
   
   if(!page) page = 1;
   curriculumListPage = page;
   
   data = {"dept_cd" : dept_cd, "page": page, "class_type_cd" : class_type, "class_score" : score, "class_nm" : class_nm , "grade":grade};
   
   $.ajax({
      url : '<%=request.getContextPath()%>/curriculum/list',
      type : 'POST',
      data : JSON.stringify(data),
      contentType : 'application/json; charset=utf-8',
      success : function(data) {
         printData(data.curriculumList,'#curriculum-list-tbody','#curriculum-list-template','.curriculum-body');
         printPagination(data.pageMaker,'.curriculum-list-footer','#curri-pagination-template','.pagination');
      },
      error : function(error) {
      }
   })
};       

function registUnopenendCurriculum(class_no){
   
   data = {"class_no" : class_no, "lecture_semester"  : $('#semester-select').val()};
   
   $.ajax({
      url : '<%= request.getContextPath()%>/curriculum/notOpenCurriculum/regist',
      data : JSON.stringify(data),
      type : 'POST',
      contentType : 'application/json; charset=utf-8',
      success : function(data){
       if(data.message == "overlap"){
          alert('이미 선택하신 과목입니다');
       }
         unopenedCurriculumList();
      },
      error : function(error){
         alert('시스템 장애입니다\n관리자에게 문의해주세요');
      }
   })
};

function unopenedCurriculumList(page){
   if(!page) page = 1;
   upopenedListPaging = page;
   dept_cd = $('#hidden-dept-cd').val();
   
   data = {"dept_cd" : dept_cd, "page" : page, "lecture_semester"  : $('#semester-select').val(), "class_nm":$('#upopenedSearch').val()};
   $.ajax({
      url : '<%=request.getContextPath()%>/curriculum/unopenedCurriculum/list',
      data : JSON.stringify(data),
      type : 'POST',
      contentType : 'application/json; charset=utf-8',
      success : function(data){
         printData(data.unopenedList,'#unopened-list-tbody','#unopened-list-template','.unopened-body');
         printPagination(data.pageMaker,'.unopened-list-footer','#unopened-pagination-template','.pagination');
      },
      error : function(error){
         
      }
   })
};

function removeUnopenendCurriculum(class_no){
   data = {"class_no":class_no, "lecture_semester" : $('#semester-select').val()}
   
   if(window.confirm('정말로 취소하시겠습니까?')){
         $.ajax({
            url : '<%=request.getContextPath()%>/curriculum/notOpenCurriculum/remove',
            data : JSON.stringify(data),
            type : 'POST',
            contentType : 'application/json; charset=utf-8',
            success : function(data){
               unopenedCurriculumList();
            },
            error : function(error){
               alert('시스템 에러입니다\n관리자에게 문의하세요');
            }
         });
   }
}

function registCurriculumList(page){
   
   if(!page) page = 1;
   registListPaging = page;
   dept_cd = $('#hidden-dept-cd').val();
   data = {"status_cd" : $('#status-select').val(),"dept_cd" : dept_cd, "page":page, "lecture_semester" : $('#semester-select').val(),"class_nm":$('#upopenedSearch').val(), "class_nm" : $('#opened-search').val()}

   $.ajax({
      url : '<%=request.getContextPath()%>/curriculum/registeCurriculum/list',
      data : JSON.stringify(data),
      type : 'POST',
      contentType : 'application/json; charset=utf-8',
      success : function(data){
         printData(data.lectureList,'#regist-list-tbody','#regist-list-template','.regist-body');
         printPagination(data.pageMaker,'.regist-list-footer','#regist-pagination-template','.pagination');
      },
      error : function(error){
         alert('시스템 에러입니다\n관리자에게 문의하세요');
      }
   })
}


function registCurriculumOpen(){
   
   data = {"lecture_semester" : $('#semester-select').val(), "dept_cd": $('input[name=dept_cd]').val()}
   
   if(window.confirm('해당 강의들을 개설 신청하시겠습니까?')){
         $.ajax({
            url : '<%=request.getContextPath()%>/curriculum/registeCurriculum/regist',
            data : JSON.stringify(data),
            type : 'POST',
            contentType:'application/json; charset=utf-8',
            success : function(data){
               alert('이번학기 개설강의 신청이 완료되었습니다')   ;
               registCurriculumList();
            },
            error : function(error){
               alert('시스템 에러입니다\n관리자에게 문의하세요');
            }
         });
   }
}

function registAcademicList(page){
   grade = $('#grade-select').val();
   class_type = $('#class-type-select').val();
   score = $('#score-type-select').val();
   class_nm = $('input[name=class-nm]').val();
   dept_cd = $('#hidden-dept-cd').val();
   status_cd = $('#status-cd-select').val();
   dept_nm = $('#curri-dept-search').val();
   
   
   if(!page) page = 1;
   curriculumListPage = page;
   
   data = {"lecture_semester" : semester, "dept_cd" : dept_cd, "dept_nm" : dept_nm, "page": page, "class_type_cd" : class_type, "class_score" : score, "class_nm" : class_nm , "grade":grade, "status_cd" : status_cd};
   
   $.ajax({
      url : '<%=request.getContextPath()%>/curriculum/registeCurriculumAcademic/list',
      type : 'POST',
      data : JSON.stringify(data),
      contentType : 'application/json; charset=utf-8',
      success : function(data) {
         printData(data.lectureList,'#curriculum-list-tbody','#regist-academic-list-template','.regist-body');
         printPagination(data.pageMaker,'.curriculum-list-footer','#regist-academic-pagination-template','.pagination');
      },
      error : function(error) {
      }
   });
}


function registCuriculumDetail(class_no, lecture_semester){
   data = {"class_no": class_no, "lecture_semester" : lecture_semester};
	
   $.ajax({
	   url : '<%=request.getContextPath()%>/curriculum/registeCurriculumAcademic/detail',
   	   type: 'POST',
   	   data : JSON.stringify(data),
   	   contentType : 'application/json; charset=utf-8',
   	   success : function(data){
   	    	$('#class-no').text(data.class_no);
   	    	$('#class-type').text(data.class_type);
   	    	$('#class-year').text(data.class_year);
   	    	$('#class-name').text(data.class_name);
   	    	console.log(data.before_open);
   	    	if(parseInt(data.before_open) >= 1){
   		    	$('#before-open').text('Y');
   	    	}else{
   		    	$('#before-open').text('N');
   	    	}
   	    	$('#status-nm').text(data.status_nm);
   	    	$('#curriculum').text();
   	    	$('#dept-cd').text(data.dept_no);
   	    	$('#dept-nm').text(data.dept_name);
   	    	$('#lecture-semester').text(data.lecture_semester)
   	    	
   	    	if(data.status_nm == '신청완료'){
	   	    	$('.academic-btn').css('display', 'inline-block');
   	    	}else{
	   	    	$('.academic-btn').css('display', 'none');
   	    	}
   	   },
   	   error :function(error){
   		   alert('시스템 오류입니다\n관리자에게 문의하세요');
   	   }
   });
}


function updateStatusRegistCurriculu(status_cd){
	class_no = $('#class-no').text();
	lecture_semester = $('#lecture-semester').text();
	data = {"class_no" : class_no, "lecture_semester" : lecture_semester, "status_cd" :status_cd}

	var flag;
	
	if(status_cd == 'CCDR003'){
		flag = confirm('해당 개설 신청을 승인하시겠습니까?');	
	}else{
		flag = confirm('해당 개설 신청을 반려하시겠습니까?');	
	}
		
	
	if(flag){
      	$.ajax({
      		url : '<%=request.getContextPath()%>/curriculum/registeCurriculumAcademic/modify',
      		data : JSON.stringify(data),
      		type : 'POST',
      		contentType :'application/json; charset=utf-8',
      		success : function(data){
      			if(data.message){
      				alert('처리되었습니다');
      			}
      			registCuriculumDetail(class_no, lecture_semester);
      			registAcademicList(curriculumListPage);
      		},
      		error : function(error){
      			alert('시스템 에러입니다\n관리자에게 문의하세요');
      		}
      	})
	}
	
}
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script id="curriculum-list-template" type="text/x-handlebars-template">
{{#if this}}
{{#each .}}
<tr class="curriculum-body"<c:if test="${loginUser.authority_cd eq 'ROLE_ACADEMIC'}">onclick="registCuriculumDetail('{{class_no}}')"</c:if>>
<c:if test="${loginUser.authority_cd eq 'ROLE_STAFF' }">
   <td><button type="button" class='btnBlue btn btn-xs text-white' style='height: 21px;' onclick="registUnopenendCurriculum('{{class_no}}');">선택</button></td>
</c:if>   
    <td>{{rnum}}</td>
    <td>{{class_nm}}</td>
    <td>{{dept_nm}}</td>
    <td>{{grade}}</td>
    <td>{{class_no}}</td>
    <td>{{status_nm}}</td>
    <td>{{class_score}}</td>
</tr>
{{/each}}
{{else}}
   <tr class="curriculum-body">
      <td  colspan="8" style="text-align:center;">해당 검색 결과가 없습니다</td>
   </tr>
{{/if}}
</script>
<script type="text/x-handlebars-template" id="curri-pagination-template">
<ul class="pagination pagination-sm justify-content-center m-0">
   <li class="paginate_button page-item">
      <a href="javascript:curriculumList(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-left'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="{{#if prev}}javascript:curriculumList({{prevPageNum}}){{else}}javascript:curriculumList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-left'></i>
      </a>
   </li>
   {{#each pageNum}}
   <li class="paginate_button page-item {{curriculumPaging this}} ">
      <a href="javascript:curriculumList({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         {{this}}
      </a>
   </li>
   {{/each}}

   <li class="paginate_button page-item ">
      <a href="{{#if next}}javascript:curriculumList({{nextPageNum}}){{else}}javascript:curriculumList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-right'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="javascript:curriculumList({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-right'></i>
      </a>
   </li>
</ul>
</script>
<script id="unopened-list-template" type="text/x-handlebars-template">
{{#if this}}
{{#each .}}
<tr class="unopened-body">
   <td>{{rnum}}</td>
   <td>{{class_no}}</td>
   <td>{{stringLength class_nm}}</td>
   <td><button type="button" class='btn btnGray btn-xs text-white' style='height: 21px;' onclick="removeUnopenendCurriculum('{{class_no}}');">취소</button></td>
</tr>
{{/each}}
{{else}}
   <tr class="unopened-body">
      <td  colspan="4" style="text-align:center;">해당 검색 결과가 없습니다</td>
   </tr>
{{/if}}
</script>
<script type="text/x-handlebars-template" id="unopened-pagination-template">
<ul class="pagination pagination-sm justify-content-center m-0">
   <li class="paginate_button page-item">
      <a href="javascript:unopenedCurriculumList(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-left'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="{{#if prev}}javascript:unopenedCurriculumList({{prevPageNum}}){{else}}javascript:unopenedCurriculumList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-left'></i>
      </a>
   </li>
   {{#each pageNum}}
   <li class="paginate_button page-item {{upopenedListPaging this}} ">
      <a href="javascript:unopenedCurriculumList({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         {{this}}
      </a>
   </li>
   {{/each}}

   <li class="paginate_button page-item ">
      <a href="{{#if next}}javascript:unopenedCurriculumList({{nextPageNum}}){{else}}javascript:unopenedCurriculumList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-right'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="javascript:unopenedCurriculumList({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-right'></i>
      </a>
   </li>
</ul>
</script>
<script id="regist-list-template" type="text/x-handlebars-template">
{{#if this}}
{{#each .}}
<tr class="regist-body">
   <td>{{rnum}}</td>
   <td>{{class_no}}</td>
   <td>{{stringLength class_nm}}</td>
   <td>{{status_nm}}</td>
</tr>
{{/each}}
{{else}}
   <tr class="regist-body">
      <td  colspan="4" style="text-align:center;">해당 검색 결과가 없습니다</td>
   </tr>
{{/if}}
</script>
<script type="text/x-handlebars-template" id="regist-pagination-template">
<ul class="pagination pagination-sm justify-content-center m-0">
   <li class="paginate_button page-item">
      <a href="javascript:registCurriculumList(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-left'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="{{#if prev}}javascript:registCurriculumList({{prevPageNum}}){{else}}javascript:registCurriculumList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-left'></i>
      </a>
   </li>
   {{#each pageNum}}
   <li class="paginate_button page-item {{registListPaging this}} ">
      <a href="javascript:registCurriculumList({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         {{this}}
      </a>
   </li>
   {{/each}}

   <li class="paginate_button page-item ">
      <a href="{{#if next}}javascript:registCurriculumList({{nextPageNum}}){{else}}javascript:registCurriculumList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-right'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="javascript:registCurriculumList({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-right'></i>
      </a>
   </li>
</ul>
</script>
<script id="regist-academic-list-template" type="text/x-handlebars-template">
{{#if this}}
{{#each .}}
<tr class="regist-body" onclick="registCuriculumDetail('{{class_no}}','{{lecture_semester}}');">
   <td>{{rnum}}</td>
   <td>{{class_no}}</td>
   <td>{{stringLength class_name}}</td>
   <td>{{class_type}}</td>
   <td>{{class_grade}}</td>
   <td>{{status_nm}}</td>
</tr>
{{/each}}
{{else}}
   <tr class="regist-body">
      <td  colspan="6" style="text-align:center;">해당 검색 결과가 없습니다</td>
   </tr>
{{/if}}
</script>
<script type="text/x-handlebars-template" id="regist-academic-pagination-template">
<ul class="pagination pagination-sm justify-content-center m-0">
   <li class="paginate_button page-item">
      <a href="javascript:registAcademicList(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-left'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="{{#if prev}}javascript:registAcademicList({{prevPageNum}}){{else}}javascript:registAcademicList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-left'></i>
      </a>
   </li>
   {{#each pageNum}}
   <li class="paginate_button page-item {{curriculumPaging this}} ">
      <a href="javascript:registAcademicList({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         {{this}}
      </a>
   </li>
   {{/each}}

   <li class="paginate_button page-item ">
      <a href="{{#if next}}javascript:registAcademicList({{nextPageNum}}){{else}}javascript:registAcademicList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-right'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="javascript:registAcademicList({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-right'></i>
      </a>
   </li>
</ul>
</script>
<script>

Handlebars.registerHelper('curriculumPaging', function(value) {
   if (value == curriculumListPage) {
      return 'active';
   }
})
Handlebars.registerHelper('upopenedListPaging', function(value) {
   if (value == upopenedListPaging) {
      return 'active';
   }
})
Handlebars.registerHelper('registListPaging', function(value) {
   if (value == registListPaging) {
      return 'active';
   }
})
Handlebars.registerHelper('stringLength', function(value) {
   if (value.length > 15) {
      return value.substring(0,15)+'...';
   }else{
	  return value;
   }
})
</script>

</body>