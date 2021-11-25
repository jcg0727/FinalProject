<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 <c:set var="list" value="${dataMap.lecturePlanList}" /> 
 <c:set var="list2" value="${dataMap2.lectureEvaluationScore}" />  
 <c:set var="list3" value="${dataMap3.listQ_6}" />  

<head>
<style>
.form-control:disabled, .form-control[readonly] {
    background-color: white;
    opacity: 1;
}

.card-header{
 	border-bottom-width: 3px; border-bottom-color: #2A5F9E
 }
 
.card-title{
	font-weight: bold;
} 

.class_content{
	height: 500px;
}

.table td, .table th {
	border-top: none;
    padding: 0.75rem;
    vertical-align: middle;
    border-top: 1px solid #dee2e6;
}



</style>
</head>

<body>
	 <div class="card card-outline">
		<!-- <div class="card-header">
			<h4>강의상세</h4>
		</div> -->
		
		<div class="card-body">
			<div class="card card-outline card-outline-tabs">
				<div class="card-header p-0 border-bottom-0">
					<ul class="nav nav-tabs" id="custom-tabs-two-tab" role="tablist">
						<li class="nav-item"><a class="nav-link active" id="custom-tabs-two-leave-tab" data-toggle="pill" href="#custom-tabs-two-leave" role="tab" aria-controls="custom-tabs-two-leave" aria-selected="false" onclick="">강의계획서</a></li>
						<li class="nav-item"><a class="nav-link" id="custom-tabs-two-return-tab" data-toggle="pill" href="#custom-tabs-two-return" role="tab" aria-controls="custom-tabs-two-return" aria-selected="false" onclick="">강의평가</a></li>
					</ul>
				</div>
				<div class="card-body">
					<div class="tab-content" id="custom-tabs-two-tabContent">
						<div class="tab-pane fade show active" id="custom-tabs-two-leave" role="tabpanel" aria-labelledby="custom-tabs-two-leave-tab">
							<!-- 강의계획서 탭 -->
								<%@include file="../lecturePlan.jsp"%>  
						</div>
						<div class="tab-pane fade" id="custom-tabs-two-return" role="tabpanel" aria-labelledby="custom-tabs-two-return-tab">
							<!-- 강의평가 탭 -->
								<%@include file="../lectureEvaluation.jsp"%> 
						</div>
					</div>
				</div>
				<!-- /.card -->
			</div>
			<!-- /.card -->
		</div>
	</div><!-- card card-outline --> 







</body>
