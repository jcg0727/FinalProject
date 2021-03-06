<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="deptStuStatusList" value="${dataMap.deptStuStatusList }" />
<c:set var="stuInfo" value="${dataMap.stuInfo }" />


<div class="card">
  <div class="card-header with-border staffStatus-card" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
     
     <h5 style="font-weight: bold;">학적변경 이력조회</h5>
         <div class="input-group input-group-sm">
         <select class="form-control" id="staffStatus-select" name="staffStatus-select">
            <option value=""        ${cri.searchType eq '' ? 'selected':''}>분류검색</option>
            <option value="CCDF001" ${cri.searchType eq 'CCDF001' ? 'selected':''}>신청완료</option>
            <option value="CCDF004" ${cri.searchType eq 'CCDF004' ? 'selected':''}>지도교수승인</option>
            <option value="CCDF005" ${cri.searchType eq 'CCDF005' ? 'selected':''}>학과교직원승인</option>
            <option value="CCDF006" ${cri.searchType eq 'CCDF006' ? 'selected':''}>교무처승인</option>
         </select> 
         <!-- keyword -->
         <input type="text" name="table_search" class="form-control" placeholder="학생명을 입력하세요" id="staffStatus-keyword" value="${cri.keyword }">
         <div class="input-group-append">
            <button type="button" class="btn btn-xs btnBlue text-white" style="background-color:#2A5F9E;" onclick="list_go(1);">검색</button>
         </div>
      </div>
   
  </div>
  
  
   <div class="card-body table-responsive p-0" style="height:270px;">
      <table class="table table-hover text-nowrap">
       <thead>
          <tr>
             <th>No</th>
            <th>학번</th>
            <th>성명</th>
            <th>소속학과</th>
            <th>변동구분</th>
            <th>신청일자</th>
            <th>처리상태</th>
          </tr>
         </thead>
         
          

      <c:forEach items="${deptStuStatusList }" var="list" varStatus="status">
         <tr onclick="DetailStuSta('${list.student_no }','<fmt:formatDate value="${list.register_date }" pattern="yyyy/MM/dd"/>');" >
             <td>${list.num }</td>
             <td>${list.student_no }</td>
             <td>${list.name }</td>                          
             <td>${list.dept_nm }</td>
             <td>${list.status_nm }</td>
             <td><fmt:formatDate value="${list.register_date }" pattern="yyyy-MM-dd"/></td>
         <td>
            <c:choose>
               <c:when test="${list.r_status_cd eq 'CCDF001'}">신청완료</c:when>
               <c:when test="${list.r_status_cd eq 'CCDF004'}">지도교수승인</c:when>
               <c:when test="${list.r_status_cd eq 'CCDF005'}">학과교직원승인</c:when>
               <c:when test="${list.r_status_cd eq 'CCDF006'}">교무처승인</c:when>
               <c:when test="${list.r_status_cd eq 'CCDF007'}">반려</c:when>
            </c:choose>
         </td>
            </tr>
       </c:forEach>      
            
                
         </table>
     </div> <!-- col-sm-12 -->
    <div class="card-footer clearfix"><%@ include file="../../common/pagination.jsp" %></div>
</div> <!-- row -->
<!-- /.card-body -->
<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --> 

<div class="card">
  <div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E"><h5 style="font-weight: bold;">학적변경 상세보기</h5></div>
   <div class="card-body" style="text-align:left; padding-bottom: 0; padding-top: 7px;">
    
    
    <!-- 사진 -->
     <div class="top1" style="float:right; width: 50px">
         <a href="" class="badge badge-file"  id="stuFile">첨부파일</a>

      </div>
     
     <div class="hpicdiv" style="width: 160px; height: 200px;">
     
     </div>
         <div class="htop3">  
            <label for="stuNo">학번</label>
            <input type="text" class="form-control" readonly id="stuNo" value="" >
         </div>
         <div class="htop3">  
            <label for="stuNm">성명</label>
            <input type="text" class="form-control" readonly id="stuNm" value="" >
         </div>
         <div class="htop3">  
            <label for="stuDept">소속학과</label>
            <input type="text" class="form-control" readonly id="stuDept" value="" >
         </div>
         <div class="htop4">  
            <label for="stuStatus">변동구분</label>
            <input type="text" class="form-control" readonly id="stuStatus" value="" >
         </div>
         <div class="htop4">  
            <label for="stuDate">신청일자</label>
            <input type="text" class="form-control" readonly id="stuDate" value="" >
         </div>
        <div class="htop5">  
         <label for="stuReason">신청사유</label>
         <input type="text" class="form-control" readonly id="stuReason" value="" >
      </div>
   
    <button type="button" id="confirm_s" class="btn btnBlue btn-sm text-white" onclick="confirm_s('CCDF005');" style="">승인</button>
    <button type="button" id="confirm_b" class="btn btnRed btn-sm text-white" onclick="confirm_b('CCDF007');" style="">반려</button>
   </div>
</div> <!-- card-body -->

<script>
function DetailStuSta(student_no, register_date) {
	
	console.log(student_no);
	console.log(register_date);
	
	$.ajax({
		url : '<%=request.getContextPath()%>/academic/fluctuation_as/deatil',
		data : {"student_no":student_no, "register_date":register_date},
		dataType : 'json',
		success: function(data){
			$(data).each(function(){
				document.getElementById("stuNo").value = student_no;
				document.getElementById("stuNm").value = this.name;
				document.getElementById("stuDept").value = this.dept_nm;
				document.getElementById("stuStatus").value = this.status_nm;
				document.getElementById("stuDate").value = register_date;
				document.getElementById("stuReason").value = this.register_reason;
				
				console.log(data.picture);
				
				if(document.getElementById('stuPicture')){
					document.getElementById('stuPicture').remove();
				}
				
				var img = document.createElement('img');
				img.setAttribute("id", "stuPicture")
				img.setAttribute('src', "<%=request.getContextPath() %>/academic/management_st/getPicture.do?picture="+data.picture);
				img.style.width = '160px';
				img.style.height = '200px';
				document.getElementsByClassName("hpicdiv")[0].append(img);
<%-- 				document.getElementById("stuFile").setAttribute("href", "<%=request.getContextPath() %>/getFile?attach_no="+data.attach);--%>
			
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
function confirm_s(r_status){
	
	var student_no = $('#stuNo').val();
	var register_date = $("#stuDate").val();
	var r_status = r_status;
	
	console.log(student_no);
	console.log(r_status);
	console.log(register_date);
	
	$.ajax({
		url : '<%=request.getContextPath()%>/academic/fluctuation_as/changeStatus',
		data : {"student_no":student_no, "r_status_cd":r_status, "register_date": register_date},
		dataType : 'json',
		success: function(data){
			$(data).each(function(){
				alert("승인되었습니다.");
				window.location.reload();
				});
		},
		error : function(error){
			console.log(error);
 			alert("에러 발생");
		}
	});
	
}
function confirm_b(r_status){

	var student_no = $('#stuNo').val();
	var register_date = $("#stuDate").val();
	var r_status = 'CCDF007';
	
	console.log(student_no);
	console.log(r_status);
	console.log(register_date);
	
	$.ajax({
		url : '<%=request.getContextPath()%>/academic/fluctuation_as/changeStatus',
		data : {"student_no":student_no, "r_status_cd":r_status, "register_date": register_date},
		dataType : 'json',
		success: function(data){
			$(data).each(function(){
				alert("반려되었습니다.");
				window.location.reload();
				});
		},
		error : function(error){
			console.log(error);
 			alert("에러 발생");
		}
	});
		
}
</script>