<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="applicantList" value="${dataMap.applicantList }" />
<c:set var="stuInfo" value="${dataMap.stuInfo }" />

<head>
<%@include file="./applicantStyle.jsp" %>
</head>


<div class="card-body">
<div class="card">
   <div class="card-header with-border applicant-card" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
      <h5 style="font-weight: bold;">입학지원자 목록</h5>
      <div class="input-group input-group-sm">
         <select class="form-control" id="applicant-select" name="applicant-select">
            <option value=""       ${cri.searchType eq '' ? 'selected':''}>분류검색</option>
            <option value="pf"     ${cri.searchType eq 'pf' ? 'selected':''}>합격여부</option>
            <option value="re"     ${cri.searchType eq 're' ? 'selected':''}>등록여부</option>
            <option value="adept"  ${cri.searchType eq 'adept' ? 'selected':''}>지원학과</option>
            <option value="nm"     ${cri.searchType eq 'nm' ? 'selected':''}>성명</option>
         </select>
         <input type="text" name="table_search" class="form-control" placeholder="검색어를 입력하세요" id="applicant-keyword" value="${cri.keyword }" >
         <div class="input-group-append">
            <button type="button" class="btn btnBlue btn-sm text-white" id="search-applicant-btn" onclick="list_go(1);">검색</button>
         </div>
      </div>
   </div>
   <!-- /.card-header -->
   <div class="card-body applicant-card-body table-responsive p-0" style="height: 270px;">
      <table class="table table-hover text-nowrap applicant--table">
         <thead>
         	<tr>
               <th>No</th>
               <th>수험번호</th>
               <th>성명</th>
               <th>지원학과</th>
               <th>지원일자</th>
               <th>합격여부</th>
               <th>등록금 납부여부</th>
               <th>신입생 등록여부</th>
            </tr>
         </thead>
         
         <c:forEach items="${applicantList}" var="list" varStatus="status">
	         <c:set var="phone" value = "${list.phone }"/>
        	 <tr onclick="DetailApli('${list.applicant_no }','<fmt:formatDate value="${list.registdate }" pattern="yyyy/MM/dd"/>','${list.student_no}' ,'${fn:substring(phone,0,3)}-${fn:substring(phone,3,7)}-${fn:substring(phone,7,11)}');" >
        	 	<td>${list.no}</td>
        	 	<td>${list.applicant_no}</td>
        	 	<td>${list.name}</td>
        	 	<td>${list.dept_nm}</td>
       	        <td><fmt:formatDate value="${list.registdate}" pattern="yyyy-MM-dd"/></td>
        	 	<td>
	       	 		<c:choose>
						<c:when test="${list.pass_whether eq 'Y'}">합격</c:when>
						<c:when test="${list.pass_whether eq 'N'}">불합격</c:when>
						<c:when test="${empty list.pass_whether}">심사중</c:when>
					</c:choose>
        	 	</td>
        	 	<td>
	       	 		<c:choose>
						<c:when test="${list.pass_whether eq 'Y' && list.regist_check eq 'Y'}">납부완료</c:when>
						<c:when test="${list.pass_whether eq 'Y' && list.regist_check eq 'N'}">미납</c:when> 
						<c:when test="${empty list.regist_check || list.pass_whether eq 'N'}">-</c:when> 
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${empty list.student_no}">-</c:when> 
						<c:when test="${not empty list.student_no}">신입생등록완료</c:when>
					</c:choose>
				</td>
        	 </tr>
       	 </c:forEach>
        	 
      </table>
   </div>
  <div class="card-footer clearfix"><%@ include file="../../common/pagination.jsp" %></div>
</div>
<!-- /.card-->
   
	<div class="card">
	  <div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E"><h5 style="font-weight: bold;">입학지원자 정보조회</h5></div>
	    <div class="card-body" style="text-align:left; padding-bottom: 0; padding-top: 7px;">
		 
		 
		 <!-- 사진 -->
		  <div class="top1" style="float:right; width: 50px">
	<!-- 	   	<a href="" class="badge badge-file"  id="stuFile">첨부파일</a>-->
	 	  </div>
		  
		  <div class="hpicdiv" style="width: 160px; height: 200px;">
		  
		  </div>
			   <div class="htop3">  
			      <label for="stuNm">성명</label>
			      <input type="text" class="form-control" readonly id="applNm" value="" >
			   </div>
			   <div class="htop3">  
			      <label for="stuNo">수험번호</label>
			      <input type="text" class="form-control" readonly id="applNo" value="" >
			   </div>
			   <div class="htop3">  
			      <label for="stuDept">지원학과</label>
			      <input type="text" class="form-control" readonly id="applDeptNm" value=""  style="width: 210px;">
			   </div>
			   <div class="htop4">  
			      <label for="stuStatus">주민번호</label>
			      <input type="text" class="form-control" readonly id="applRegno" value="" >
			   </div>
			   <div class="htop4">  
			      <label for="stuDate">전화번호</label>
			      <input type="text" class="form-control" readonly id="applPhone" value="" >
			   </div>
			   <div class="htop4">  
			      <label for="stuDate">이메일주소</label>
			      <input type="text" class="form-control" readonly id="applEmail" value=""  style="width: 210px;">
			   </div>
		     <div class="htop4">  
		      <label for="stuReason">주소</label>
		      <input type="text" class="form-control" readonly id="applAdd" value="" >
		     </div>
		     <div class="htop5">  
		      <label for="stuReason">상세주소</label>
		      <input type="text" class="form-control" readonly id="applDetAdd" value="" style="width: 415px;">
		     </div>
			
	<!-- value="${stuInfoList.student_no }" -->
		 <button type="button" id="pass_b" class="btn btnBlue btn-sm text-white"  onclick="pass_P();" style="width:60px; margin-left:20px;">합격</button>
		 <button type="button" id="pass_f" class="btn btnRed btn-sm text-white" onclick="pass_F();">불합격</button>
		 <button type="button" id="passD" class="btn btnRed btn-sm text-white" onclick="passDelete();" style="display: none; margin-left:20px;">합격취소</button>
		 <button type="button" id="insert_stu" class="btn btnBlue btn-sm text-white" onclick="stu_regist();" style="display: none; margin-left:20px;">신입생 등록</button>
	   </div>
	</div> <!-- card-body -->
</div>

<script>
function DetailApli(applicant_no, registdate, student_no, phone) {
	
	console.log(phone);
	
	$.ajax({
		url : '<%=request.getContextPath()%>/academic/admission/candidate/detail',
		data : {"applicant_no":applicant_no},
		dataType : 'json',
		success: function(data){
				var reg_no = data.reg_no;
				
				 var regNoY = reg_no.substring(0,2);
				console.log(regNoY);
				
				var regNoM = reg_no.substring(2,4);
				console.log(regNoM);
	
				var regNoD = reg_no.substring(4,6);
				console.log(regNoD); 
				
				var regNo;
				
				if(regNoY.substring(0,1) == '0'){
					regNo = '20' + regNoY + '-' +  	regNoM + '-' + regNoD;
				}else{
					regNo = '19' + regNoY + '-' +  	regNoM + '-' + regNoD;
				}
	
			$(data).each(function(){
	
				document.getElementById("applNm").value = this.name;
				document.getElementById("applNo").value = applicant_no;
				document.getElementById("applDeptNm").value = this.dept_nm;
				document.getElementById("applRegno").value = regNo;
				document.getElementById("applPhone").value = phone;
				document.getElementById("applEmail").value = this.email;
				document.getElementById("applAdd").value = this.address;
				document.getElementById("applDetAdd").value = this.detail_add;
			
				document.getElementById("pass_b").style.display = "";
				document.getElementById("pass_f").style.display = "";
				document.getElementById("passD").style.display="none"; 
				document.getElementById("insert_stu").style.display="none";   

				if(data.pass_whether=='Y'&& data.regist_check=='N'){
					document.getElementById("pass_b").style.display = "none";
					document.getElementById("pass_f").style.display = "none";
					document.getElementById("passD").style.display = "";
					document.getElementById("passD").style.display = "";
		 		}else if(data.pass_whether=='Y' && data.regist_check=='Y' && !student_no){
					document.getElementById("pass_b").style.display = "none";
					document.getElementById("pass_f").style.display = "none";
					document.getElementById("insert_stu").style.display="";
				}else if(student_no){
					document.getElementById("pass_b").style.display = "none";
					document.getElementById("pass_f").style.display = "none";
				} 
				
				if(document.getElementById('stuPicture')){
					document.getElementById('stuPicture').remove();
				}
				
				var img = document.createElement('img');
				img.setAttribute("id", "stuPicture")
				img.setAttribute('src', "<%=request.getContextPath() %>/academic/management_st/getPicture.do?picture="+data.picture);
				img.style.width = '160px';
				img.style.height = '200px';
				document.getElementsByClassName("hpicdiv")[0].append(img);
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
function passDelete(){
	
	var applicant_no =  $('#applNo').val();
	
	$.ajax({
		url : '<%=request.getContextPath()%>/academic/admission/candidate/modify',
		data : {"applicant_no" : applicant_no},
		success: function(data){
				alert("합격취소되었습니다.");
				window.location.reload();
		},
		error : function(error){
			console.log(error);
 			alert("에러 발생");
		}
	});

}

</script>


<script>
function pass_P(){
	
	var applicant_no = $('#applNo').val();
	var pass_whether = 'Y';
	var phoneNumber = '01024748623'
	var name = $('#applNm').val();
	
	$.ajax({
		url : '<%=request.getContextPath()%>/academic/admission/candidate/change',
		data : {"applicant_no" : applicant_no, "pass_whether" : pass_whether, "phoneNumber" : phoneNumber, "name":name},
		dataType : 'json',
		success: function(data){
				alert("합격처리되었습니다.");
				window.location.reload();
		},
		error : function(error){
			console.log(error);
 			alert("에러 발생");
		}
	});

}	
function pass_F(){
	
	var applicant_no = $('#applNo').val();
	var pass_whether = 'N';
	
	$.ajax({
		url : '<%=request.getContextPath()%>/academic/admission/candidate/change',
		data : {"applicant_no" : applicant_no, "pass_whether" : pass_whether},
		dataType : 'json',
		success: function(data){
				alert("불합격 처리되었습니다.");
				window.location.reload();
		},
		error : function(error){
			console.log(error);
 			alert("에러 발생");
		}
	});

}	
</script>

<script>
function stu_regist(){

	var applicant_no = $('#applNo').val();
	
	$.ajax({
		url : '<%=request.getContextPath()%>/academic/admission/candidate/insert',
		data : {"applicant_no" : applicant_no},
		//dataType : 'json',
		success: function(data){
				alert("신입생 등록이 완료되었습니다.");
				window.location.reload();
			
		},
		error : function(error){
			console.log(error);
 			alert("에러 발생");
		}
	});

}
</script>

