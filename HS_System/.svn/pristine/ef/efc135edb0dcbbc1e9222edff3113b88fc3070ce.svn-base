<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="curriculumDeptList" value="${dataMap.curriculumDeptList }" />

<head>
<%@include file="./curriculumStyle.jsp" %>

<style>

</style>
</head>


<div class="col-12" style="padding-top: 10px;">
	<div class="card">
	   <div class="card-header with-border curriculum-card" >
	      <h5>교육과정 목록</h5>
	      <div class="input-group input-group-sm">
	         <select class="form-control" id="curriculum-select" name="curriculum-select">
	            <option value=""       ${cri.searchType eq '' ? 'selected':''}>분류검색</option>
	            <option value="cno"     ${cri.searchType eq 'cno' ? 'selected':''}>학수번호</option>
	            <option value="cnm"     ${cri.searchType eq 'cnm' ? 'selected':''}>교과목명</option>
	            <option value="ctype"  ${cri.searchType eq 'ctype' ? 'selected':''}>이수구분</option>
	         </select>
	         <input type="text" name="table_search" class="form-control" placeholder="검색어를 입력하세요" id="curriculum-keyword" value="${cri.keyword }" >
	         <div class="input-group-append">
	            <button type="button" class="btn btnBlue btn-sm text-white" style="background-color:#2A5F9E;" id="search-curriculum-btn" onclick="list_go(1);">검색</button>
	         </div>
	      </div>
	   </div>
	   <!-- /.card-header -->
	   <div class="card-body curriculum-card-body table-responsive p-0" style="height: 400px; ">
	      <table class="table table-hover text-nowrap curriculum-table">
	         <thead>
	         	<tr>
	               <th>No</th>
	               <th>학과</th>
	               <th>학년</th>
	               <th>이수구분</th>
	               <th>학수번호</th>
	               <th>교과목명</th>
	               <th>학점</th>
	            </tr>
	         </thead>
	         
	         <c:forEach items="${curriculumDeptList}" var="list" >
	        	 <tr onclick="DetailCuri('${list.class_no }');" >
	         	 	<td>${list.no}</td>
	        	 	<td>${list.dept_nm}</td>
	        	 	<td>${list.grade}</td>
	        	 	<td>
	        	 		<c:choose>
							<c:when test="${list.class_type_cd eq 'CCDO001'}">전필</c:when>
							<c:when test="${list.class_type_cd eq 'CCDO002'}">전선</c:when>
							<c:when test="${list.class_type_cd eq 'CCDO003'}">교필</c:when>
							<c:when test="${list.class_type_cd eq 'CCDO004'}">교선</c:when>
						</c:choose>
	        	 	</td>
	        	 	<td>${list.class_no}</td>
	        	 	<td>${list.class_nm}</td>
	        	 	<td>${list.class_score}</td>
	        	 </tr>
	       	 </c:forEach>
	        	 
	      </table>
	   </div>
	  <div class="card-footer clearfix"><%@ include file="../../common/pagination.jsp" %></div>
	</div>
</div>
<!-- /.card-->


<div class="col-lg-12" style="float: left">
	<div class="card">
	  <div class="card-header with-border"><h5>교육과정 상세조회</h5></div>
	    <div class="card-body" style="text-align:left; padding-bottom: 0; padding-top: 7px;">
		 
 			<div class="row">
			
				<div class="form-group col-3">
			      <label for="No">학수번호</label>
			      <input type="text" class="form-control"  id="ClassNo" value="" >
			   </div>
			
			    <div class="form-group col-3">
			      <label for="tp">이수구분</label>
			      <input type="text" class="form-control"  id="CuriNm" value="" >
			   </div>
			   
			    <div class="form-group col-6">
			      <label for="Nm">교과목명</label>
			      <input type="text" class="form-control"  id="ClassNm" value="" >
			   </div>
			   
			</div>
		 
		 <div class="row">
   			    
			    <div class="form-group col-3">
			      <label for="Dept">학년</label>
			      <input type="text" class="form-control"  id="CuriGrad" value="" >
			   </div>
			    
			    <div class="form-group col-3">
			      <label for="Nm">학점</label>
			      <input type="text" class="form-control"  id="ClassSc" value="" >
			   </div>
			   
			   <div class="form-group col-6">
			      <label for="Dept">주관학과</label>
			      <input type="text" class="form-control"  id="CuriDept" value="" >
			   </div>
			   
			</div>
			

			   
			<div class="row">
			   <div class="form-group col-12">
			      <label for="Nm">교육과정 내용</label>
			      <input type="text" class="form-control"  id="ClassCont" value="" >
			   </div>
			   <div class="form-group col-4" style="margin-top:32px;">
			     <label for="Btn">     </label>
			   </div>
		   </div>
		
	   </div>
	</div> <!-- card-body -->
</div>
	
	
<form id="CurriculumRegister">
	<input type="hidden" name="class_no" >
	<input type="hidden" name="class_nm">
	<input type="hidden" name="class_type_cd">
	<input type="hidden" name="curri_dept_nm">
	<input type="hidden" name="grade">
	<input type="hidden" name="class_score">
	<input type="hidden" name="curri_content">
</form>


<script>
function DetailCuri(class_no) {
	console.log(class_no);
	
	$.ajax({
		url : '<%=request.getContextPath()%>/curriculum/management/detail',
		data : {"class_no":class_no},
		dataType : 'json',
		success: function(data){
			$(data).each(function(){
				document.getElementById("CuriDept").value = this.dept_nm;
				document.getElementById("CuriGrad").value = this.grade;
				document.getElementById("ClassNo").value = class_no;
				document.getElementById("ClassNm").value = this.class_nm;
				document.getElementById("ClassSc").value = this.class_score;
				document.getElementById("ClassCont").value = this.curri_content;				
				document.getElementById("CuriNm").value = this.status_nm;
				console.log(status_nm);
				
			});

			
		},
		error : function(error){
			console.log(error);
 			alert("에러 발생");
		}
	});


}
</script>



