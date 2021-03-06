<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<style>

.card-primary.card-outline-tabs>.card-header a.active {
    border-top: 3px solid #2A5F9E;
    color: black;
}
.card.card-outline-tabs .card-header a{
    color: black;
}

.card-header > h5{
	float: left;
	margin-top: 10px;
	margin-left: 15px;
}	

.card > .card-header{
	padding: 5px;
}

select[class="form-control"]{
	text-align: left;
	float: right; 
	width: 150px;
}

.card-body table{
	text-align: center;
	font-size: small;
}

.card-header > select, .card-header > select option {
	font-size: small;
	padding: 0;
	height: 30px;
	width: 130px;
	margin-top: 7px;
/* 	text-align: center; */
}

.transferOut-card .input-group{
	width : 330px;
	float: right;
	margin-top: 5px;
	margin-right: 15px;
}

.transferOut-card .input-group input[type="text"]{
	width: 100px;
}

.transferOut-card .input-group select{
	width:70px;
}
.transferIn-card .input-group{
	width : 330px;
	float: right;
	margin-top: 5px;
	margin-right: 15px;
}

.transferIn-card .input-group input[type="text"]{
	width: 100px;
}

.transferIn-card .input-group select{
	width:70px;
}

.transferIn-card-body, .transferOut-card-body{
	height: 220px;
}

.transferOut-table td, .transferOut-table th{
	padding : 0.6em;
}
.transferIn-table td, .transferIn-table th{
	padding : 0.6em;
}

.transferOut-table thead tr th:nth-child(6){
	width: 150px;
}

.transferOut-body:hover, .transferIn-body:hover{
	background: #e2e2e3;
	cursor: pointer;
}

.In-card{
	margin-top: 60px;
}




.staffStatus-card .input-group{
	width : 330px;
	float: right;
	margin-top: 5px;
	margin-right: 15px;
}

.staffStatus-card .input-group input[type="text"]{
	width: 100px;
}

.staffStatus-card .input-group select{
	width:70px;
}

.form-control:disabled, .form-control[readonly] {
    background-color: white;
    opacity: 1;
}

.card-header .card-body .row1 {
    width: fit-content;
    height: fit-content;
    margin: 0 -7.5px 0 ;
}
.htop3{
   width: 200px;
   display: inline-block;
   padding-right: 4px;
   padding-bottom: 8px;
}
.htop4{
   width: 200px;
   display: inline-block;
   padding-right: 4px;   
   padding-bottom: 8px;
}
.htop5{
   display: inline-block;
   padding-right: 4px;   
   padding-bottom: 8px;
   width: 400px;
}
.hpicdiv{
    background-color: lightgray;
    height: 200px;
    width: 160px;
    float: left;
    margin : 26px 20px 26px 0;

}

.badge-file {
	color: #fff;
    background-color: #6c757d;
/*     position: relative;
    left: 660px;"
    position: left; */
}
/* .staffStatus-card{
	/* display:-webkit-box; */
}

/*
.select-transefer-dept{
	padding: 0;
    height: 30px;
    width:8px;
    text-align: center;
    
} */


</style>

</head>
<body>
	<div class="card card-outline">
		<div class="card-body">
			<div class="card card-primary card-outline card-outline-tabs">
				<div class="card-header p-0 border-bottom-0">
					<ul class="nav nav-tabs" id="custom-tabs-three-tab" role="tablist">
						<li class="nav-item"><a class="nav-link" id="custom-tabs-three-manage-tab" data-toggle="pill" href="#custom-tabs-three-manage" role="tab" aria-controls="custom-tabs-three-leave" aria-selected="false">??????/??????/??????</a></li>
						<li class="nav-item"><a class="nav-link" id="custom-tabs-three-pural-tab" data-toggle="pill" href="#custom-tabs-three-pural" role="tab" aria-controls="custom-tabs-three-return" aria-selected="false" onclick="pluralMajorIn(); pluralMajorOut();">????????????</a></li>
						<li class="nav-item"><a class="nav-link" id="custom-tabs-three-transfer-tab" data-toggle="pill" href="#custom-tabs-three-transfer" role="tab" aria-controls="custom-tabs-three-drop" aria-selected="false" onclick="transferInList(); transferOutList();">??????/??????</a></li>
					</ul>
				</div>
				<div class="card-body">
					<div class="tab-content" id="custom-tabs-three-tabContent">
						<div class="tab-pane fade" id="custom-tabs-three-manage" role="tabpanel" aria-labelledby="custom-tabs-three-manage-tab">
							 <!-- ???/???/??? ??? -->
		                     <c:if test="${loginUser.authority_cd eq 'ROLE_STAFF' }">
		                     	<%@include file="./academicStatementDeptStaff.jsp" %>
		                     </c:if>
		
		                 	 <c:if test="${loginUser.authority_cd eq 'ROLE_ACADEMIC' }">
			            		<%@ include file="./academicStatementAcademicStaff.jsp"%>
			         		 </c:if>
	                    </div>
						<div class="tab-pane fade" id=custom-tabs-three-pural role="tabpanel" aria-labelledby="custom-tabs-three-pural-tab">
							<!-- ???????????? ??? -->
							<%@include file="./pluralMajorStaff.jsp" %>
						</div>
						<div class="tab-pane fade" id="custom-tabs-three-transfer" role="tabpanel" aria-labelledby="custom-tabs-three-transfer-tab">
						<!-- ?????? ??? -->
							<%@include file="./departmentTransfer.jsp" %>
						</div>
					</div>
				</div>
				<!-- /.card -->
			</div>
			<!-- /.card -->
		</div>
	</div>
   
<script>
var currentPage = "";
var tabURL=parent.location.href;
var indexLength = "&currentPage=";

window.onload=function(){
	$('#custom-tabs-three-tab .nav-item a').on('click', function(){
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
		currentPage = "custom-tabs-three-manage-tab";
	}
	
	
	//????????????
	$('#'+currentPage).addClass('active').attr('aria-selected', true).trigger('click');
	$($('#'+currentPage).attr('href')).addClass('active').addClass('show');
	
	$('#transferIn-table-body').on('click', '.counsel-set', function(e){
	   	dept_nm = $(this).attr('dept_nm');
        student_no = $(this).attr('student_no');
		register_date = $(this).attr('register_date');        
	   	OpenWindow('<%=request.getContextPath()%>/counsel/assignment?dept_nm='+dept_nm+'&student_no='+student_no+'&register_date='+register_date,'????????????','1300','800');
        e.stopPropagation();
   });
   
   $('#transferIn-table-body').on('click', '.advisor-set', function(e){
         dept_nm = $(this).attr('dept_nm');
         student_no = $(this).attr('student_no');
         
         OpenWindow('<%=request.getContextPath()%>/academic/admission/advisorList?dept_nm='+dept_nm+'&student_no='+student_no+'&professorYN=Y','??????????????????','640','670');
         e.stopPropagation();
   })
   
   $('#transferIn-table-body').on('click','.transferIn-body', function(e){
	   var student_no = $(this).attr('student_no');
	   var register_date = $(this).attr('register_date');
		OpenWindow('<%=request.getContextPath()%>/academic/transfer/detail?student_no='+student_no+'&register_date='+register_date, '??????????????????', '800', '700');
   });
	
}
</script>
</body>
