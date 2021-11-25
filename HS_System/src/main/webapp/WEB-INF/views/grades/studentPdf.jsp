<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <c:set target="${dataMap }" value="dataMap" /> --%>
<%-- <c:set var="stuInfo" value="${dataMap.stuInfo }" /> --%>
<%-- <c:set var="bankInfo" value="${dataMap.bankInfo }" /> --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@400;700;800&display=swap')
	;

body {
	font-family: 'Nanum Myeongjo', serif;
	height: 296.94mm;
}

.background {
	width: 90%;
	height: 100%;
	margin-left: 40px;
	border-width: thin;
	border-color: gray;
	background-position: bottom;
	border-style: solid;
	background-image: url(/hs/resources/logo3.png);
	border-width: thin;
}

.info-row {
	height: 100%;
}

.row {
	width: 100%;
}

table {
	border: 1;
	width: 100%;
	text-align: center;
}

.table th {
	padding: 5px;
}

div table tr:nth-child(1) td:nth-child(even), div table tr:nth-child(2) td:nth-child(even)
	{
	width: 17%;
}

.table .tr_semester td {
	padding-top: 10px;
}

div table tr:nth-child(3) td {
	padding: 0;
}

td[colspan="8"] {
	padding: 0;
}

td[colspan="8"] .row {
	padding: 0;
	margin: 0;
	width: 100%;
}

td .row .col-4 td:nth-child(2) {
	width: 50%;
}

.tr-semester:nth-child(1) {
	height: 20px;
}

.table td {
	font-size: 0.7em;
	padding: 0.25rem;
}

.col-4 .table td {
	font-size: 0.8em;
}

.semester {
	margin: 5px 0;
	text-decoration: underline;
	height: 60px;
}

.tr-semester td {
	font-size: 1.2em;
	height: 40px;
	margin-top: 10px;
}

/* tbody .tr-semester:nth-child(1) td { */
/* 	padding-top: 10px; */
/* } */
.info-row>.row {
	height: 800px;
}

<%--
#back::after {
	content: "";
	background: url(<%= request.getContextPath ()%>/resources/logo.png);
	background-size: contain;
	opacity: 0.15;
	position: fixed;
	top: 42px;
	left: 0px;
	right: 0px;
	bottom: 0px;
}
--%>
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
</head>
<body>
   <!-- <button type="button" class="btn bg-gradient-secondary btn-sm" id="btn" style="text-align: right;">pdf 다운로드</button> -->
   <!-- <hr id="hr"/> -->
   <br>
   <div class="row no-print">
      <div class="col-12">
         <button type="button" class="btn bg-gradient-secondary float-right" style="margin-right: 30px;" id="print" onclick="window.print()">
            <i class="fas fa-print"></i>
            Print
         </button>
         <button type="button" class="btn btn-primary float-right" style="margin-right: 20px;" id="btn">
            <i class="fas fa-download"></i>
            Generate PDF
         </button>
      </div>
   </div>
   <br>
   <div class="background" style="border-width: thin; border-color: gray; background-position: bottom; border-style: solid; background-image: url('<%=request.getContextPath()%>/resources/logo3.png');" id="back">
      <!-- title row -->

      <div class="row">
         <div class="col-12">
            <h1 style="text-align: center; margin-top: 5%;">성적 증명서</h1>
         </div>
      </div>
      <br>


      <!-- info row -->
      <div class="info-row">
         <table border="1" class="table">
            <tr>
               <td>학번</td>
               <td>${student.student_no}</td>
               <td>학년</td>
               <td>4</td>
               <td>성명</td>
               <td>${student.name }</td>
               <td>생년월일</td>
               <td>1995-07-07</td>
            </tr>
            <tr>
               <td>입학</td>
               <td>2018-03-01</td>
               <td>졸업</td>
               <td>2021-08-01</td>
               <td>증명서번호</td>
               <td>제20211572호</td>
               <td>학위등록번호</td>
               <td>제212-231호</td>
            </tr>
            <tr>
               <td colspan="8">
                  <div class="row" style="height: 1000px;">
                     <div class="col-4" style="border-right: 0.5px solid gray">
                        <table class="table">
                           <thead>
                              <tr>
                                 <th>구분</th>
                                 <th>교과목명</th>
                                 <th>학점</th>
                                 <th>성적</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:set value="0" var="count" />
                              <c:forEach items="${semesterList }" var="semester" begin="0" end="2">
                                 <c:set value="${count+1 }" var="count" />
                                 <tr class="tr-semester">
                                    <td colspan="4" style="font-size: 1.3em; padding-top: 20px; height: 40px;" id="semester${count }">
                                       <c:set value="${fn:substring(semester,0,4) }" var="front" />
                                       <c:set value="${fn:substring(semester,5,7) }" var="back" />
                                       <span class="semester">${front}년도 ${back}학기</span>
                                    </td>
                                 </tr>
                                 <c:forEach items="${gradesList}" var="grades">
                                    <c:if test="${semester eq grades.lecture_semester }">
                                       <tr style="height: 20px;">
                                          <td>${grades.class_type }</td>
                                          <td>${grades.class_name }</td>
                                          <td>${grades.class_grade }</td>
                                          <td>${grades.grades_cd}</td>
                                       </tr>
                                    </c:if>
                                 </c:forEach>
                              </c:forEach>
                           </tbody>
                        </table>
                     </div>
                     <div class="col-4" style="border-right: 0.5px solid gray">
                        <table  class="table">
                           <thead>
                              <tr>
                                 <th>구분</th>
                                 <th>교과목명</th>
                                 <th>학점</th>
                                 <th>성적</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:set value="0" var="count" />
                              <c:forEach items="${semesterList }" var="semester" begin="3" end="5">
                                 <c:set value="${count+1 }" var="count" />
                                 <tr class="tr-semester">
                                    <td colspan="4" style="font-size: 1.3em; padding-top: 20px; height: 40px;" id="semester${count }">
                                       <c:set value="${fn:substring(semester,0,4) }" var="front" />
                                       <c:set value="${fn:substring(semester,5,7) }" var="back" />
                                       <span class="semester">${front}년도 ${back}학기</span>
                                    </td>
                                 </tr>
                                 <c:forEach items="${gradesList}" var="grades">
                                    <c:if test="${semester eq grades.lecture_semester }">
                                       <tr style="height: 20px;">
                                          <td>${grades.class_type }</td>
                                          <td>${grades.class_name }</td>
                                          <td>${grades.class_grade }</td>
                                          <td>${grades.grades_cd}</td>
                                       </tr>
                                    </c:if>
                                 </c:forEach>
                              </c:forEach>
                           </tbody>
                        </table>
                     </div>
                     <div class="col-4">
                        <table  class="table">
                           <thead>
                              <tr>
                                 <th>구분</th>
                                 <th>교과목명</th>
                                 <th>학점</th>
                                 <th>성적</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:set value="0" var="count" />
                              <c:forEach items="${semesterList }" var="semester" begin="6" end="8">
                                 <c:set value="${count+1 }" var="count" />
                                 <tr class="tr-semester">
                                    <td colspan="4" style="font-size: 1.3em; padding-top: 20px; height: 40px;" id="semester${count }">
                                       <c:set value="${fn:substring(semester,0,4) }" var="front" />
                                       <c:set value="${fn:substring(semester,5,7) }" var="back" />
                                       <span class="semester">${front}년도 ${back}학기</span>
                                    </td>
                                 </tr>
                                 <c:forEach items="${gradesList}" var="grades">
                                    <c:if test="${semester eq grades.lecture_semester }">
                                       <tr style="height: 20px;">
                                          <td>${grades.class_type }</td>
                                          <td>${grades.class_name }</td>
                                          <td>${grades.class_grade }</td>
                                          <td>${grades.grades_cd}</td>
                                       </tr>
                                    </c:if>
                                 </c:forEach>
                              </c:forEach>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </td>
            </tr>
            <tr>
               <td colspan="8">
                  <table  class="table">
                     <thead>
                        <tr>
                           <th>총신청학점</th>
                           <th>총취득학점</th>
                           <th>총평점평균</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                           <td>${totalGrades.class_grade }</td>
                           <td>${totalGrades.class_grade }</td>
                           <td>${totalGrades.grades_avg }</td>
                        </tr>
                     </tbody>
                  </table>
               </td>
            </tr>
         </table>
      </div>
      <!-- /.row -->

      <!-- Table row -->
      <div class="" style="text-align: center; margin-top: 40px;">
         <h4>위의 사실을 증명함.</h4>
         <br>
         <h5 id="today"></h5>
         <h5>00 대학교</h5>
      </div>

   </div>
   <script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
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
        doc.save('성적증명서.pdf');
      }
   });
});
</script>
</body>

</html>