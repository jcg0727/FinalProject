<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta name="viewport" content="width=device-width,initial-scale=1">

<head>
<style>


</style>
</head>

<div class="col-12" >
	<div class="card">
		<div class="card-header">
		  <h3 class="card-title">휴학신청</h3>
		  
		  	<button type="button" class="btn btn-sm auto" style="font-size:11px; float:right; background-color:#e9ecef; width: 70px;" onclick="auto_leave_regist()">자동입력</button>
		  
		</div>
	<!-- /.card-header -->
	
		<div class="card-body">
		    <div class="row">
			    <div class="form-group col-4">
				    <label for="">휴학유형</label>
						<select class="form-control leave_type_status_cd" id="leave_type" name="leave_type" >
			   				<option value="">휴학유형</option>
			   				<option value="일반휴학">일반휴학</option>
			   				<option value="군휴학">군휴학</option>
			   				<option value="질병휴학">질병휴학</option>		   				
			   			</select>
		        </div>
			    <div class="form-group col-4">
				    <label for="">신청일자</label>
		    		<input id="register_date" type="text" class="form-control read-only" readOnly value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>" style="padding-top: 5px;">
	    		</div>
    			<div class="form-group col-4">
				    <label for="">신청학기</label>
				    <select class="form-control leave_semester" id="applySemesterAmmount" name="leave_semester" >
			   				<option value="">신청학기</option>
			   				<option value="1학기">1학기</option>
			   				<option value="2학기">2학기</option>
			   				<option value="3학기">3학기</option>	
			   				<option value="4학기">4학기</option>	   				
			   		</select>
			    </div>
			</div>
			
		    <div class="row">
			    <div class="form-group col-4">
				    <label for="">휴학시작일자</label>
				    <input type="text" name="leave_start_date" class="form-control leave_start_date" id="leave_start_date" value="" placeholder="-" readonly="readonly">
		        </div>
			    <div class="form-group col-4">
				    <label for="">휴학종료일자</label>
				    <input type="text"  name="leave_end_date" class="form-control leave_end_date" id="leave_end_date" value="" placeholder="-"  readonly="readonly">	    	
	    		</div>
    			<div class="form-group col-4">
				    <label for="">증빙자료</label>
				    <div class="filebox row">
                   		<div class="col-9">
							<input type="text" class="form-control" id="fileObjectId" value=""/>
						</div>
						<div class="col-3" style="vertical-align:center;">
						  <label for="ex_file" class="btn" style="margin:2px; font-size: medium; text-align: center; vertical-align: center;">첨부</label>
						   <input type="file" id="ex_file">
						  <script>
						  	var file = document.getElementById('ex_file');
						  	
						  	file.addEventListener('change', function(){
								inputFileName(this, '#fileObjectId');
								fileUpload(this);
						  	});
						  </script>
						</div>
				    </div>
			    </div>
			</div>
			<div class="row">
				<div class="form-group col-12">
					 <label for="">휴학사유</label>
					 <textarea class="form-control col-12 leave_reason" name="leave_reason" rows="5" placeholder="휴학사유를 입력하세요	"></textarea>
				</div>
			</div>
			<div align="center">
				<button id="leaveApplyBtn" type="button" class="btn btnBlue btn-sm text-white" style="width: 60px; background-color:#2A5F9E;" onclick="leave_regist_go();">신청</button>
			</div>
		</div>
	
		
	</div>
</div>

    
<div class="col-12 transfer-div">
  <div class="card">
    <div class="card-header">
      <h3 class="card-title">휴학신청내역</h3>

      <div class="card-tools">
       
      </div>
    </div>
    <!-- /.card-header -->
    <div class="card-body table-responsive p-0">
      <table class="table table-hover text-nowrap">
        <thead>
          <tr>
          	<th>NO</th>
            <th>연도</th>
            <th>학기</th>
            <th>휴학유형</th>
            <th>신청학기수</th>
            <th>신청일자</th>
            <th>휴학시작일자</th>
            <th>휴학종료일자</th>
            <th>처리상태</th>
            <th>취소</th>
          </tr>
        </thead>
        <tbody class="leave_table">
         
        </tbody>
      </table>
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>

<form id="academicStateLeaveRegister">
	<input type="hidden" name="student_no" value="${loginUser.id}">
	<input type="hidden" name="register_date" value="<fmt:formatDate value="${now}" pattern="yyyy/MM/dd"/>">
	<input type="hidden" name="leave_type_status_cd">
	<input type="hidden" name="leave_semester">
	<input type="hidden" name="leave_start_date">
	<input type="hidden" name="leave_end_date">
	<input type="hidden" name="leave_reason">
</form>

<script>
var file = document.getElementById('ex_file');

file.addEventListener('change', function(){
	var files;
	files = fileUpload(this,'<%=request.getContextPath()%>/fileUpload');
	inputFileName(this, '#fileObjectId');

	
	files.forEach(function(key){
		var input = document.createElement("input");
		input.setAttribute('type', 'hidden');
		input.setAttribute('value', key);
		input.setAttribute('name' , 'ex_file');
		
		console.log(input);
		inputTypeHidden(input, '#academicStateLeaveRegister');
	}) ;
});


function printLeaveAcademicStateList(){
	
	$.ajax({
		url : "<%=request.getContextPath()%>/academicState/leave/list",
		data : {"id" : ${loginUser.id}},
		dataType : "json",
		success : function(data){
			
			$.each(data,function(i,v){
				
				switch(v.a_status_cd) {
	               case "CCDB001" :
	                   v.a_status_cd="일반휴학"; break;
	               case "CCDB002" :
	                   v.a_status_cd="군휴학"; break;
	               case "CCDB003" :
	                   v.a_status_cd="질병휴학"; break;	                  
				}
				
				switch(v.r_status_cd) {
	               case "CCDF001" :
	                   v.r_status_cd="신청완료"; break;
	                case "CCDF002" :
	                   v.r_status_cd="상담대기"; break;
	                case "CCDF003" :
	                   v.r_status_cd="상담거절"; break;
	                case "CCDF004" :
	                   v.r_status_cd="지도교수승인"; break;
	                case "CCDF005" :
	                   v.r_status_cd="학과교직원승인"; break;
	                case "CCDF006" :
	                   v.r_status_cd="교무처승인 "; break;
	                case "CCDF007" :
	                v.r_status_cd="반려 "; break;
				}				
				
			})
			printData(data, '.leave_table','#leave_list','.leave_body');
		},
		
		error:function(error){
			alert('에러');
		}
	});
};


function leave_regist_go(){
	
	var leave_type_status_cd = $('input[name="leave_type_status_cd"]').val($('.leave_type_status_cd').val());
	var leave_semester = $('input[name="leave_semester"]').val($('.leave_semester').val());
	var leave_start_date = $('input[name="leave_start_date"]').val($('.leave_start_date').val());
	var leave_end_date = $('input[name="leave_end_date"]').val($('.leave_end_date').val());
	var leave_reason = $('input[name="leave_reason"]').val($('.leave_reason').val());
 
	// 필수항목
	if(leave_type_status_cd.val()==""){
		alert("휴학유형 선택은 필수입니다.");
		document.getElementsByName("leave_type")[0].focus();
		
		return;
	}
	if(leave_semester.val()==""){
		alert("신청학기 선택은 필수입니다.");
		document.getElementsByName("leave_semester")[0].focus();
		return;
	}
	if(leave_reason.val()==""){
		alert("휴학 사유를 입력하세요.");
		document.getElementsByName("leave_reason")[0].focus();
		return;
	}
	
	var form = $('#academicStateLeaveRegister').serialize();
	
 	$.ajax({
 		type : "post",
 		url : "<%=request.getContextPath()%>/academicState/leave/regist",
 		data : form,
 		dataType : "json",
 		success : function(data) {
 			alert(' '+data.message);
 			
 			printLeaveAcademicStateList();
 		},
 		error : function(error) {
 			console.log(error);
 			alert("에러 발생");
 		}
 	});
}	

function removeLeaveState(date){
	if(confirm('정말 취소하시겠습니까?')){
		
		 var transferDate = new Date(parseInt(date,10));
		 transferDate = transferDate.YYYYMMDDHHMMSS();
		 
		 transferDate = transferDate.substring(0,10);
		 console.log(transferDate);
	$.ajax({
		url : "<%=request.getContextPath()%>/academicState/leave/remove",
		data : {"register_date" : transferDate,
				"student_no" : ${loginUser.id}	
		},
		dataType : "json",
		success : function(data){
			alert('신청이 취소되었습니다.');
			
			printLeaveAcademicStateList();
		},
		error : function(error){
			console.log(error);
		}
	});	
	} else {
		return
	}
}



function auto_leave_regist(){
	alert('데이터 자동 입력 버튼');
}


</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
<script id="leave_list" type="text/x-handlebars-template">

	{{#if this}}
		{{#each .}}
			<tr class="leave_body">

				<td>{{academic_state_no}}</td>
				<td>{{extractYear register_date}}</td>
				<td>{{extractSemester register_date}}</td>

				<td>{{a_status_cd}}</td>

				<td>{{register_semester}}</td>
				<td>{{registDate register_date}}</td>
				<td>{{registDate start_date}}</td>
				<td>{{registDate end_date}}</td>
				<td>{{r_status_cd}}</td>
				<td><button type="button" class="btn bg-gradient-danger btn-sm" style="width: 50px;" onclick="removeLeaveState('{{register_date}}');">취소</button></td>
			</tr>
		{{/each}}

	{{else}}
			<tr class="leave_body">
				<td colspan="10" style="text-align:center; "><br><i class="fas fa-exclamation-triangle" ></<i><br><br>휴학신청내역이 없습니다.</td>
			</tr>
	{{/if}}

</script>
<%@include file="./js/academic_leave_js.jsp"%>




