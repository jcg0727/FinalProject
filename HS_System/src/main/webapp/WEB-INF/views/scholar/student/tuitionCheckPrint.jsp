<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
<style>

@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@400;700;800&display=swap');

body{
	font-family: 'Nanum Myeongjo', serif;
}

.table thead th {

	widdh:30px;
}
table{
	width: 300px;
}
</style>
</head>

<body>
<br>
<div class="row no-print">
	<div class="col-12">
		<button type="button" class="btn bg-gradient-secondary float-right" style="margin-right: 30px;" id="print" onclick="window.print()">
			<i class="fas fa-print"></i> Print
		</button>
		<button type="button" class="btn btn-primary float-right" style="margin-right: 20px;" id="btn">
			<i class="fas fa-download"></i> Generate PDF
		</button>
	</div>
</div><br>
<div class="" style="width:80%; height:90%; margin-left: 10%; margin-top:10%; border-width: thin; border-color: gray; background-position: bottom; border-style: solid; background-image: url('<%=request.getContextPath() %>/resources/logo3.png');" id="back">

    <div class="row">
      <div class="col-12">
        <h1 style="text-align: center;margin-top: 10%;">교육비납입증명서</h1>
      </div>
    </div>
    <br>
        
    <div>
      <div style="margin-left: 10%; margin-top: 10%; margin-bottom: 8%">
      	<c:forEach items="${tuitionDetailList }" var="list">
    	<c:set var="TextValue" value = "${list.reg_no }"/>
    	<c:set var="semester" value = "${list.semester }"/>
        <h5>학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;과&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp; <c:out value="${list.dept_nm}" /></h5>
        <h5>학&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;번&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp; ${list.student_no }</h5>
        <h5>성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp; ${list.name }</h5>
        <h5 style="margin-bottom:30px;">생&nbsp;년&nbsp;월&nbsp;일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : &nbsp;&nbsp;&nbsp;&nbsp;19${fn:substring(TextValue,0,2)}년${fn:substring(TextValue,2,4)}월${fn:substring(TextValue,4,6)}일 </h5>
		
			<table class="table table-sm tutionTable"  border="1" style="font-size: 17px; text-align: center; width:580px;">
		            <thead>
		               <tr>
		                  <th style="width:150px;">구분</th>
		                  <th style="width:150px;">등록금액</th>
		                  <th style="width:150px;">장학금액</th>
		                  <th style="width:150px;">납입금액</th>
		               </tr>
		            </thead>
	         
				<tr>
	        	 	<td>${fn:substring(semester,0,4)}년 ${fn:substring(semester,5,6)}학기</td>
	        	 	<td><fmt:formatNumber value='${list.tuition_amount}' type="number"/></td>
	        	 	<td>
	        	 		<c:choose>
	        	 			<c:when test="${empty list.scholar_amount}">0</c:when>
	        	 			<c:when test="${not empty list.scholar_amount}"><fmt:formatNumber value='${list.scholar_amount}' type="number"/></c:when>
	        	 		</c:choose>
	       	 		</td>
	       	 		<td><fmt:formatNumber value='${list.payment_amount}' type="number"/></td>
	        	 </tr>
	        	 
     	 		 <tr>
     	 		 	<td>합계</td>
	        	 	<td><fmt:formatNumber value='${list.tuition_amount}' type="number"/></td>
	        	 	<td>
	        	 		<c:choose>
	        	 			<c:when test="${empty list.scholar_amount}">0</c:when>
	        	 			<c:when test="${not empty list.scholar_amount}"><fmt:formatNumber value='${list.scholar_amount}' type="number"/></c:when>
	        	 		</c:choose>
	       	 		</td>
	       	 		<td><fmt:formatNumber value='${list.payment_amount}' type="number"/></td>
	        	 </tr>
        	 	
      </table>
 	  	</c:forEach>
 	  </div>
 	  <h6 style="font-size:19px; font-weight:bold">&nbsp;※ 연말정산 세액공제와 관련하여 소득세법이 개정(16. 12. 20)됨에 따라 관련 교육기관에서 제공하는 공제대상 교육비에서 학자금대출
 	  	    실행금액이 제외됨을 알려드립니다.
 	  </h6>
 	  <h6 style="font-size:19px;  font-weight:bold">&nbsp;※ 한국장학재단 학자금대출 실행여부는 한국장학재단(1599-2000)에서 발급하는 부채확인서에서 확인할 수 있으며, 대출상환금 및
 	  	    대출 잔액에 관한 정보는 한국장학재단에서 국세청으로 직접 제공할 예정입니다.
 	  </h6>
 	  <h5 style="color:red; font-weight:bold">※ 한국장학재단으로 대출상환된 장학금은 장학금 지급액에서 제외되고 표시됩니다.</h5>
    </div>

    <div class="" style="text-align: center;margin-top: 10%;" >
        <h4>위의 사실을 증명함.</h4><br>
	    <h5 id="today"></h5>
    	<h5>HS 대학교</h5>
    </div>

</div>
   
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script>

	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var dateString = year + '년' + month  + '월' + day + '일';
	
	document.getElementById('today').innerHTML=dateString;
	
$('#btn').click(function(){
	
	 //숨기기
 	  document.getElementById('btn').style.display = "none";	  
 	  document.getElementById('print').style.display = "none";	  
	 
//현재 document.body의 html을 A4 크기에 맞춰 PDF로 변환
html2canvas(document.body, {
  onrendered: function(canvas) {
 
    // 캔버스를 이미지로 변환
    var imgData = canvas.toDataURL('image/png');
     
    var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
    var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
    var imgHeight = canvas.height * imgWidth / canvas.width;
    var heightLeft = imgHeight;
     
        var doc = new jsPDF('p', 'mm');
        var position = 0;
        
         // 첫 페이지 출력
         doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
         <%-- doc.addImage(<%=request.getContextPath()%>/resources/logo.png , 'PNG', 15,40,500,500); --%>
         heightLeft -= pageHeight;
         
       
 		
        // 파일 저장
        doc.save('교육비납입증명서.pdf');
  		}
	});
});
</script>
</body>

</html>