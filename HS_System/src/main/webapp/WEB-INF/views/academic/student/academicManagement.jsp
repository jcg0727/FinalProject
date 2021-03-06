<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<style>
.form-control:disabled, .form-control[readonly] {
	background-color: white;
	opacity: 1;
}

#departmentTransferDiv input[type="text"] {
	padding: 0;
	height: 30px;
	text-align: center;
}

#departmentTransferDiv:first-child .card-body .row {
	margin-left: 0;
	margin-right: 0;
}

.select-transefer-dept {
	padding-right: 0;
}

.select-transefer-dept-btn {
	padding-left: 0;
}

.form-group>input[type="text"] {
	text-align: left;
}

.filebox label {
	margin: 2px;
	padding-top: 6px;
	display: block;
	color: #fff;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #6c757d;
	cursor: pointer;
	border-radius: .25em;
	-webkit-transition: background-color 0.2s;
	transition: background-color 0.2s;
	text-align: center;
	vertical-align: middle;
	height: 36px;
}

.filebox, .filebox>input, .filebox>div {
	padding: 1px;
	margin: 0;
}

.filebox>div {
	width: 100%;
}

.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
}

.filebox {
	margin-bottom: 4px;
}

.transfer-filebox label {
	display: inline-block;
	padding: 0;
	color: #fff;
	background-color: #6c757d;
	padding-top: 4px;
	width: 100%;
	height: 30px;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

.transfer-filebox input[type="file"] {
	/* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.transfer-table {
	text-align: center;
	font-size: 0.8em;
}

.card-primary.card-outline-tabs>.card-header a.active {
	border-top: 3px solid #2A5F9E;
}

.card-primary.card-outline-tabs>.card-header a {
	color: #2A5F9E;
}

#custom-tabs-five-tabContent .card-header {
	border-bottom-width: 3px;
	border-bottom-color: #2A5F9E
}
</style>
</head>

<title>학적변동신청</title>

<body>
   <c:set var="now" value="<%=new java.util.Date()%>" />
   <c:forEach items="${calendarList }" var="calendar">
      <c:if test="${fn:substring(calendar.cal_semester, 4,6) eq '01'}">
         <c:set var="oneSemester" value="${calendar.start_date}" />
      </c:if>
      <c:if test="${fn:substring(calendar.cal_semester, 4,6) eq '02'}">
         <c:set var="twoSemester" value="${calendar.start_date}" />
      </c:if>
   </c:forEach>
   <div class="card card-outline" style="">
      <div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E; padding-top: 20px;">
         <h5 style="font-weight: bold;">학적변경</h5>
      </div>
      <div class="card-body">
         <div class="card card-primary card-outline card-outline-tabs">
            <div class="card-header p-0 border-bottom-0">
               <ul class="nav nav-tabs" id="custom-tabs-five-tab" role="tablist">
                  <li class="nav-item">
                     <a class="nav-link" id="custom-tabs-five-leave-tab" data-toggle="pill" href="#custom-tabs-five-leave" role="tab" aria-controls="custom-tabs-five-leave" aria-selected="false" onclick="">휴학</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" id="custom-tabs-five-return-tab" data-toggle="pill" href="#custom-tabs-five-return" role="tab" aria-controls="custom-tabs-five-return" aria-selected="false" onclick="printReturnAcademicStateList();">복학</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" id="custom-tabs-five-drop-tab" data-toggle="pill" href="#custom-tabs-five-drop" role="tab" aria-controls="custom-tabs-five-drop" aria-selected="false">자퇴</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" id="custom-tabs-five-plural-tab" data-toggle="pill" href="#custom-tabs-five-plural" role="tab" aria-controls="custom-tabs-five-plural" aria-selected="false" onclick="pluralMajorList();">복수전공</a>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link" id="custom-tabs-five-transfer-tab" data-toggle="pill" href="#custom-tabs-five-transfer" role="tab" aria-controls="custom-tabs-five-transfer" aria-selected="false" onclick="pritnDeptTransferList();">전과</a>
                  </li>
               </ul>
            </div>
            <div class="card-body">
               <div class="tab-content" id="custom-tabs-five-tabContent">
                  <div class="tab-pane fade" id="custom-tabs-five-leave" role="tabpanel" aria-labelledby="custom-tabs-five-leave-tab">
                     <!-- 휴학신청 탭 -->
                     <%@include file="../academicLeaveState.jsp"%>
                  </div>
                  <div class="tab-pane fade" id="custom-tabs-five-return" role="tabpanel" aria-labelledby="custom-tabs-five-return-tab">
                     <!-- 복학신청 탭 -->
                     <%@include file="../academicReturnState.jsp"%>
                  </div>
                  <!-- 자퇴신청 탭 -->
                  <div class="tab-pane fade" id="custom-tabs-five-drop" role="tabpanel" aria-labelledby="custom-tabs-five-drop-tab">
                     <%@include file="../academicDrop.jsp"%>
                  </div>
                  <div class="tab-pane fade" id="custom-tabs-five-plural" role="tabpanel" aria-labelledby="custom-tabs-five-plural-tab">
                     <%@include file="./pluralMajorApplication.jsp"%>
                  </div>
                  <div class="tab-pane fade" id="custom-tabs-five-transfer" role="tabpanel" aria-labelledby="custom-tabs-five-transfer-tab">
                     <%@include file="./departmentChange.jsp"%>
                  </div>
               </div>
            </div>
            <!-- /.card -->
         </div>
         <!-- /.card -->
      </div>
   </div>




<script>
window.onload=function(){
var currentPage = "";
var tabURL=parent.location.href;
var indexLength = "&currentPage=";

   console.log(tabURL);
   $('#custom-tabs-five-tab .nav-item a').on('click', function(){
      tabURL = parent.location.href;
      currentPage = $(this).attr('id');
      
      if(tabURL.includes('&currentPage=')){
         tabURL = tabURL.substring(0, tabURL.indexOf('&currentPage'))+'&currentPage='+currentPage;
         console.log(tabURL);
      }else{
         tabURL = tabURL +'&currentPage='+currentPage;
      }
      window.parent.postMessage(tabURL, '*');
   });
   
   $('.nav-link').each(function(index,el){
      $(this).removeClass('active');
   });
   
   if(tabURL.includes('currentPage=')){
      currentPage = tabURL.substring(tabURL.indexOf('&currentPage='));
      currentPage = currentPage.substring(indexLength.length);
   }else{
      currentPage = "custom-tabs-five-leave-tab";
   }
   
   $('#'+currentPage).addClass('active').attr('aria-selected', true).trigger('click');
   $($('#'+currentPage).attr('href')).addClass('active').addClass('show');

   printLeaveAcademicStateList();
   dropList();
   printReturnAcademicStateList();
}
</script>



</body>