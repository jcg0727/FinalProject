<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="curriculumStaffList" value="${dataMap.curriculumStaffList }" />


<head>
<%@include file="./curriculumStyle.jsp" %>

<style>

</style>
</head>


<%-- <form id="ScholarStaffSearch">
    <input type='hidden' name="page" value="" />
    <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum }"/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="searchType2" value="" />
	<input type='hidden' name="keyword" value="" />
</form>  --%>


            <div class="input-group input-group-mb-3 col-8" style="width: 300px; margin-top:10px;">
               <input type="text" id="scholar-dept-search" class="form-control float-right select-dept" id= "searchTypeDept" placeholder="경영학과" value=""  style="width: 130px; font-weight: bold"/>
               <input type="hidden" id="hidden-dept-cd" value="">
               <div class="input-group-append">
                  <button style="border-radius: 0.2rem;" type="button" class="btn btnBlue" onclick="OpenWindow('<%=request.getContextPath()%>/search/department', '학과검색', '650', '600')" >
                     <i class="fas fa-search" aria-hidden="true"></i>
                  </button>
               </div>
               <button class="btn btnBlue text-white" style="margin-left: 10px;" onclick="list_goScholar();">검색</button>
          </div>


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
	   <div class="card-body curriculum-card-body table-responsive p-0" style="height: 230px; ">
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
	         
	         <c:forEach items="${curriculumStaffList}" var="list" >
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


<div class="col-lg-6" style="float: left">
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
			

			   
			<div class="row" style="margin-right: 0px;">
			   <div class="form-group col-8">
			      <label for="Nm">교육과정 내용</label>
			      <input type="text" class="form-control"  id="ClassCont" value="" style="width:310px;">
			   </div>
			   <div style="margin-top:32px;">
			     <label for="Btn">     </label>
				 <button type="button" id="pass_b" class="btn btnBlue btn-sm text-white"  onclick="modify();" style="width:60px; height:35px; margin-left:20px; ">수정</button>
				 <button type="button" id="pass_b" class="btn btnRed btn-sm text-white"  onclick="del_w();" style="width:60px; height:35px;">삭제</button>
			   </div>
		   </div>
		
	   </div>
	</div> <!-- card-body -->
</div>

	
<div class="col-lg-6" style="float: left">
	<div class="card">
	  <div class="card-header with-border"><h5>교육과정 등록</h5></div>
	    <div class="card-body" style="text-align:left; padding-bottom: 0; padding-top: 7px;">
		 
 			<div class="row">
 			
				<div class="form-group col-3">
			      <label for="No">학수번호</label>
			      <input type="text" class="form-control class_No" value="${class_no }" readonly >
			   </div>
			   
			    <div class="form-group col-3">
			      <label for="tp">이수구분</label>
   					<select class="form-control class_Cd" name="class_Cd">
		   				<option value="">구분</option>
		   				<option value="CCDO001">전필</option>
		   				<option value="CCDO002">전선</option>
		   				<option value="CCDO003">교필</option>		   				
		   				<option value="CCDO004">교선</option>		   				
		   			</select>
			   </div>
			   
			   <div class="form-group col-6">
			      <label for="Nm">교과목명</label>
			      <input type="text" class="form-control class_Nm"  >
			   </div>
			   
			</div>
		 
		 <div class="row">
			   
			    <div class="form-group col-3">
			      <label for="Dept">학년</label>
				      <select class="form-control class_Grade" name="class_Grade">
			   				<option value="">구분</option>
			   				<option value="1">1</option>
			   				<option value="2">2</option>
			   				<option value="3">3</option>		   				
			   				<option value="4">4</option>		   				
			   			</select>
			   </div>
			   
			    <div class="form-group col-3">
			      <label for="Nm">학점</label>
			      	<select class="form-control class_Score" name="class_Score">
			   				<option value="">구분</option>
			   				<option value="1">1</option>
			   				<option value="2">2</option>
			   				<option value="3">3</option>		   				
			   			</select>
			   </div>
			   
                
             	<div class="col-6 from-group" style="padding: 0; ">
					<label for="registerDate">신청학과</label>
					<div class="row" style="padding: 0;">
					<div class="col-10 select-transefer-dept">
                    	<input type="text" class="form-control float-right select-dept" id="select-deptNm"/>
                    </div>
                    <div class="col-2 select-transefer-dept-btn">
	                    <button type="submit" class="btn btn-default" onclick="OpenWindow('<%=request.getContextPath()%>/search/department','학과검색','700','780');" style="padding: 0; padding-left: 7px; padding-right: 7px;  height: 100%;">
	                      <i class="fas fa-search"></i>
	                    </button>
                    </div>
                    </div>
                </div>
                
                
			</div>
			

			   
			<div class="row">
	
			    <div class="form-group col-9">
			      <label for="Nm">교육과정 내용</label>
			      <input type="text" class="form-control class_Content" style="width:390px;">
			    </div>
				<div style="margin-top:32px; margin-left:50px;">
			      <label for="Btn">     </label>
			    	<button type="button" id="pass_b" class="btn btnBlue btn-sm text-white"  onclick="regist();" style="width:60px; height:35px;">등록</button>
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
function regist(){
	
	var class_no 	   = $('input[name="class_no"]').val($('.class_No').val());
	var dept_nm 	   = $('input[name="curri_dept_nm"]').val($('#select-deptNm').val());
	var class_nm       = $('input[name="class_nm"]').val($('.class_Nm').val());
	var class_score    = $('input[name="class_score"]').val($('.class_Score').val());
	var curri_content  = $('input[name="curri_content"]').val($('.class_Content').val());
	var grade  		   = $('input[name="grade"]').val($('.class_Grade').val());
	var class_type_cd  = $('input[name="class_type_cd"]').val($('.class_Cd').val());
	
 	var falg = true;
	if(!(falg && $('#select-deptNm').val() && $('.class_Nm').val() && $('.class_Score').val() && $('.class_Content').val()  && $('.class_Grade').val()  && $('.class_Cd').val())){
		alert('필수 정보를 모두 입력해주세요');
		return;
	} 
	
	var form = $('#CurriculumRegister').serialize();
	
	var data = {"class_no":$('.class_No').val(), "dept_nm":$('#select-deptNm').val(), "class_nm":$('.class_Nm').val(),  "class_score":$('.class_Score').val(),  "curri_content":$('.class_Content').val(),  "grade":$('.class_Grade').val(),  "class_type_cd":$('.class_Cd').val()};
	
	console.log(data);
	
	$.ajax({
		type : "post",
		contentType : 'application/json; charset=utf-8',
		url : '<%=request.getContextPath()%>/curriculum/management/regist',
 		data : JSON.stringify(data),
 		dataType : "json",
		success: function(data){
				alert("교육과정 등록이 완료되었습니다.");
				/* $('#class-dept').val(null);
				$('.class_Nm').val(null);
				$('.class_Score').val(null);
				$('.class_content').val(null);
				$('.class_Grade').val(null);
				$('.class_Cd').val(null); */
				window.location.reload();
		},
		error : function(error){
			console.log(error);
 			alert("에러발생");
		}
	});

}
</script>

<script>
function DetailCuri(class_no) {
	console.log(class_no);
	
	$.ajax({
		url : '<%=request.getContextPath()%>/curriculum/management/detail',
		data : {"class_no":class_no},
		//dataType : 'json',
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

<script>
function modify(){
	
	var class_no = $('#ClassNo').val();
	
	console.log(class_no);
	
	$.ajax({
		url : '<%=request.getContextPath()%>',
		data : {"curriculum_no" : curriculum_no},
		dataType : 'json',
		success: function(data){
				alert("수정되었습니다.");
				window.location.reload();
		},
		error : function(error){
			console.log(error);
 			alert("에러 발생");
		}
	});

}	
function del_w(){
	
	var class_no = $('#ClassNo').val();
	console.log(class_no);

	$.ajax({
		url : '<%=request.getContextPath()%>/curriculum/management/remove',
		data : {"class_no" : class_no},
		//dataType : 'json',
		success: function(data){
				alert("삭제되었습니다.");
				window.location.reload();
		},
		error : function(error){
			console.log(error);
 			alert("에러 발생");
		}
	});

}	
</script>



