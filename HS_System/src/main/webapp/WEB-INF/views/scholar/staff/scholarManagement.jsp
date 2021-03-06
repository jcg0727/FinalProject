<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="deptStaffScoreList" value="${dataMap.deptStaffScoreList }" />

<head>

<style>
button {
   border-radius: 0.2rem;
}

.card-header .form-control {
   width: 130px;
}

.card-header select {
   padding-left: 2px;
   text-align: left;
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

.scholar-list-header {
   padding-top: 5px;
   padding-bottom: 0px;
   height: 51px;
}

.scholar-select-group {
   padding-left: 80px;
}

.scholar-list-footer {
   padding-top: 0px;
}

.scholar-list>.card-header {
   height: 50px;
}

/* .scholar-list-card-body {
   height: 380px;
} */

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

.scholar-select-group {
   height: 100%;
}

.scholar-select-group select {
   height: 100%;
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

.form-control:disabled, .form-control[readonly] {
    background-color: white;
    opacity: 1;
}

</style>
</c:if>


<script src="/hs/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script>

$(function(){
	
	$('#semester-select').on('change', function(){
	// 	if(!url) url= window.location.href;
		
	// 	var ScholarSearch=$('#ScholarSearch');
		
	// 	if(!page) page=1;
	
	// 	ScholarSearch.find("[name='page']").val(page);
	
	// 	if($('select[name="perPageNum"]').val()){
	// 		ScholarSearch.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	// 	}
		
	// 	console.log(ScholarSearch.find("[name='perPageNum']").val());
		
	// 	ScholarSearch.find("[name='searchType']").val($('select[name="searchType"]').val());
	// 	console.log(ScholarSearch.find("[name='searchType']").val());
				
	// 	ScholarSearch.attr({
	// 		action:url,
	// 		method:'get'
	// 	}).submit();
		list_goScholar();
	} );
});

var url;
var page;

/* function list_goD(){
	
	if(!url) 
		url= window.location.href;
	console.log(url);
	
	var ScholarSearchForm=$('#ScholarSearch');
	
	if(!page) page=1;

	ScholarSearchForm.find("[name='page']").val(page);

	if($('select[name="perPageNum"]').val()){
		ScholarSearchForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	}
	
			
	ScholarSearchForm.find("[name='lecture_semester']").val($('select[name="lecture_semester"]').val());
	ScholarSearchForm.find("[name='dept_nm']").val( $("#scholar-dept-search").val() );
	
    console.log(ScholarSearchForm.find("[name='lecture_semester']").val());
	console.log(ScholarSearchForm.find("[name='dept_nm']").val());

	ScholarSearchForm.attr({
		action:url,
		method:'post'
	}).submit(); 
	
	
} */

</script>

<script>

function list_goScholar(page,url){
	
 	if(!url) url= window.location.href;
	console.log(url);
	
	var ScholarSearchForm=$('#ScholarSearchForm');
	
	if(!page) page=1;

	ScholarSearchForm.find("[name='page']").val(page);

	if($('select[name="perPageNum"]').val()){
		ScholarSearchForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	}
	
			
	ScholarSearchForm.find("[name='lecture_semester']").val($('select[name="lecture_semester"]').val());
	ScholarSearchForm.find("[name='dept_nm']").val( $("#scholar-dept-search").val() );

	ScholarSearchForm.find("[name='searchType']").val($('select[name="searchType"]').val());
	ScholarSearchForm.find("[name='searchType2']").val($('select[name="searchType2"]').val());
	ScholarSearchForm.find("[name='keyword']").val($('#keywordStuNo').val());
	
	
    console.log(ScholarSearchForm.find("[name='lecture_semester']").val());
	console.log(ScholarSearchForm.find("[name='dept_nm']").val());
	
    console.log(ScholarSearchForm.find("[name='searchType']").val());
	console.log(ScholarSearchForm.find("[name='searchType2']").val());
	console.log(ScholarSearchForm.find("[name='keyword']").val());  

	ScholarSearchForm.attr({
		action:url,
		method:'get'
	}).submit(); 
	
}

</script>

</head>

<body>
<%-- <form id="ScholarSearch">
    <input type='hidden' name="page" value="" />
    <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum }"/>
	<input type='hidden' name="lecture_semester" value="" />
	<input type='hidden' name="dept_nm" value="" />
</form>  --%>

<form id="ScholarSearchForm">
    <input type='hidden' name="page" value="" />
    <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum }"/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="searchType2" value="" />
	<input type='hidden' name="lecture_semester" value="" />
	<input type='hidden' name="dept_nm" value="" />
	<input type='hidden' name="keyword" value="" />
</form> 

   <div class="card scholar-list" style="margin-top: 10px;">
      <div class="card-header">
         <div class="form-group form-group-sm row">
            <select class="form-control col-2" id="semester-select" name="lecture_semester" style="">
               <option value="" ${cri.lecture_semester eq '' ? 'selected' :'' } >?????? ??????</option>
               <option value="202101" ${cri.lecture_semester eq '202101' ? 'selected':''}>21?????? 1??????</option>
               <option value="202002" ${cri.lecture_semester eq '202002' ? 'selected':''}>20?????? 2??????</option>
               <option value="202001" ${cri.lecture_semester eq '202001' ? 'selected':''}>20?????? 1??????</option>
            </select>
            <div class="input-group input-group-mb-3 col-4" style="width: 250px;">
               <input type="text" id="scholar-dept-search" class="form-control float-right select-dept" id= "searchTypeDept" placeholder="???????????? ???????????????" value="${cri.dept_nm }" <c:if test="${loginUser.authority_cd eq 'ROLE_STAFF' }"> readonly="readonly"</c:if> />
               <input type="hidden" id="hidden-dept-cd" value="<c:if test="${loginUser.authority_cd eq 'ROLE_STAFF' }">${cri.dept_nm }</c:if>">
               <div class="input-group-append">
                  <button style="border-radius: 0.2rem;" type="button" class="btn btnBlue" onclick="OpenWindow('<%=request.getContextPath()%>/search/department', '????????????', '650', '600')" <c:if test="${loginUser.authority_cd eq 'ROLE_STAFF' }">
                        disabled=true   
                     </c:if>>
                     <i class="fas fa-search" aria-hidden="true"></i>
                  </button>
               </div>
               <button class="btn btnBlue text-white" style="margin-left: 10px;" 
<%--                onclick="<c:if test="${loginUser.authority_cd eq 'ROLE_STAFF' }">scholarList();unopenedscholarList();registscholarList();</c:if><c:if test="${loginUser.authority_cd eq 'ROLE_SCHOLAR' }">list_goD(); </c:if>">??????</button>--%>
               onclick="<c:if test="${loginUser.authority_cd eq 'ROLE_STAFF' }">scholarList();unopenedscholarList();registscholarList();</c:if><c:if test="${loginUser.authority_cd eq 'ROLE_SCHOLAR' }">list_goScholar(); </c:if>">??????</button>
          </div>
         </div>
      </div>
      <div class="card-body">
         <c:if test="${loginUser.authority_cd eq 'ROLE_STAFF' }">
            <%@ include file="./role_staff_scholar.jsp"%>
         </c:if>
         <c:if test="${loginUser.authority_cd eq 'ROLE_SCHOLAR' }">
            <%@ include file="./role_scholarStaff_scholar.jsp"%>
         </c:if>
      </div>
   </div>
<input type="hidden" id="staff_role" value="${loginUser.authority_cd }">



</body>