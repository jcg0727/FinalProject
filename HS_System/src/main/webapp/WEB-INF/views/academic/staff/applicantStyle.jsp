<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<style>
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

.applicant-card .input-group{
	width : 330px;
	float: right;
	margin-top: 5px;
	margin-right: 15px;
}

.applicant-card .input-group input[type="text"]{
	width: 100px;
}

.applicant-card .input-group select{
	width:70px;
}

.applicant-table td, .applicant-table th{
	padding : 0.6em;
}
.transferIn-table td, .transferIn-table th{
	padding : 0.6em;
}

.applicant-table thead tr th:nth-child(6){
	width: 150px;
}

.applicant-body:hover, .transferIn-body:hover{
	background: #e2e2e3;
	cursor: pointer;
}



.form-control:disabled, .form-control[readonly] {
    background-color: white;
    opacity: 1;
}
.htop3{
   width: 200px;
   display: inline-block;
  /*  padding-top: 25px; */
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
   width: 408px;
   display: inline-block;
   padding-right: 10px;   
   padding-bottom: 8px;
}
.hpicdiv{
    background-color: lightgray;
    height: 150px;
    width: 160px;
    float: left;
    margin : 26px 20px 26px 0;

}


	</style>
</head>


