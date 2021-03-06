<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<style>


</style>
</head>


<div class="col-12" >
	<div class="card">
		<div class="card-header">
		  <h3 class="card-title">복학신청</h3>
		  
		  
		</div>
	<!-- /.card-header -->
		<div class="card-body">
		    <div class="row">
			    <div class="form-group col-3">
				   <label for="year">신청학년도</label>
				    <input type="text" class="form-control" id="year" 
				    	value="<c:choose><c:when test="${now > twoSemester }">
				    	<c:set var="nextYear" value="<%=new Date(new Date().getTime() + ((long)(1000 * 60 * 60 * 24) * (long)365))%>"/><fmt:formatDate value="${nextYear}" pattern="yyyy"/></c:when><c:otherwise><fmt:formatDate value="${now}" pattern="yyyy"/></c:otherwise></c:choose>" 
				    	readonly="readonly"/>
		        </div>
			     <div class="form-group col-3">
				    <label for="">신청학기</label>
		    		<input type="text" class="form-control" id="semester" 
		    			value="<c:choose><c:when test="${now < oneSemester or now > twoSemester}">1학기</c:when><c:otherwise>2학기</c:otherwise></c:choose>" readonly="readonly" >
	    		</div>
			    <div class="form-group col-3">
				    <label for="">복학유형</label>
						<select class="form-control return_type_status_cd" id="return_type" name="return_type" style="font-size: large;">
			   				<option value="">복학유형</option>
			   				<option value="CCDC001">일반복학</option>
			   				<option value="CCDC002">군복학</option>
			   				<option value="CCDC003">질병복학</option>		   				
			   			</select>
		        </div>
			    <div class="form-group col-3">
				    <label for="">신청일자</label>
		    		<input id="register_date type="text"  class="form-control" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>" readonly="readonly" style="padding-top: 5px; font-size: large;">
	    		</div>
    		</div>
						
			<div class="row">
				<div class="form-group col-12">
					 <label for="">복학사유</label>
					 <textarea class="form-control register_reason" rows="5" placeholder="복학사유를 입력하세요"></textarea>
				</div>
			</div>
			<div align="center">
				<button type="button" class="btn btnBlue btn-sm text-white" style="width: 60px; background-color:#2A5F9E;" onclick="return_regist_go();">신청</button>
			</div>
			
		</div>
	</div>
</div>

<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --> 
    
<div class="col-12 transfer-div">
  <div class="card">
    <div class="card-header">
      <h3 class="card-title">복학신청내역</h3>

      <div class="card-tools">
        <div class="input-group input-group-sm" style="width: 150px;">
          <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

          <div class="input-group-append">
            <button type="submit" class="btn btn-default">
              <i class="fas fa-search"></i>
            </button>
          </div>
        </div>
      </div>
    </div>
    <!-- /.card-header -->
    <div class="card-body table-responsive p-0">
      <table class="table table-hover text-nowrap">
        <thead>
          <tr>
          	<th>No</th>
            <th>년도</th>
            <th>학기</th>
            <th>복학유형</th>
            <th>복학사유</th>
            <th>신청일자</th>
            <th>처리상태</th>
            <th>취소</th>
          </tr>
        </thead>
        <tbody class="return_table">
        
        </tbody>
      </table>
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>

<form id="academicStateReturnRegister">
	<input type="hidden" name="student_no" value="${loginUser.id}">
	<input type="hidden" name="register_date" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>">
	<input type="hidden" name="a_status_cd">
	<input type="hidden" name="register_reason">
</form>

<script>
function return_regist_go(){
		
	var a_status_cd = $('input[name="a_status_cd"]').val($('.return_type_status_cd').val());
	var register_reason = $('input[name="register_reason"]').val($('.register_reason').val());
	
	var form = $('#academicStateReturnRegister').serialize();
	
	var data = {"a_status_cd" : $('.return_type_status_cd').val(), "register_reason" : $('.register_reason').val(), "student_no" :'${loginUser.id}'};
	
	console.log(data);
	
	if(a_status_cd.val()==""){
		alert("복학유형 선택은 필수입니다.");
		document.getElementsByName("return_type")[0].focus();
		return;
	}
	
 	$.ajax({
 		type : "post",
 		contentType : 'application/json; charset=utf-8',
 		url : "<%=request.getContextPath()%>/academicState/academicReturn/regist",
 		data : JSON.stringify(data),
 		dataType : "json",
 		success : function(data) {
			alert('신청이 완료되었습니다.');
 			printReturnAcademicStateList();
 		},
 		error : function(error) {
 			console.log(error);
 			alert("에러 발생");
 		}
 	})
}	

function printReturnAcademicStateList(){
	
	$.ajax({
		url : "<%=request.getContextPath()%>/academicState/academicReturn/list",
		data : {"id" : ${loginUser.id}},
		dataType : "json",
		success : function(data){
			
			$.each(data,function(i,v){
				switch(v.a_status_cd) {
	               case "CCDC001" :
	                   v.a_status_cd="일반복학"; break;
	               case "CCDC002" :
	                   v.a_status_cd="군복학"; break;
	               case "CCDC003" :
	                   v.a_status_cd="질병복학"; break;	                  
				}
				
				switch(v.r_status_cd) {
	               case "CCDF001" :
	                   v.r_status_cd="신청완료"; break;
	               case "CCDF004" :
	                   v.r_status_cd="지도교수승인"; break;
	               case "CCDF005" :
	                   v.r_status_cd="학과교직원승인"; break;
	               case "CCDF006" :
	                   v.r_status_cd="교무처승인"; break;
	               case "CCDF007" :
	                   v.r_status_cd="반려"; break;
				}				
			})
			printData(data, '.return_table','#return_list','.return_body');
		},
		
		error:function(error){
			alert('에러');
		}
	});
};



function removeReturnState(date){
	if(confirm('정말 취소하시겠습니까?')){
		
		 var transferDate = new Date(parseInt(date,10));
		 transferDate = transferDate.YYYYMMDDHHMMSS();
		 
		 transferDate = transferDate.substring(0,10);
		 console.log(transferDate);
		 console.log(${loginUser.id});
		 
	$.ajax({
		url : "<%=request.getContextPath()%>/academicState/academicReturn/remove",
		data : {"register_date" : transferDate,
				"student_no" : ${loginUser.id}	
		},
		dataType : "json",
		success : function(data){
			alert('신청이 취소되었습니다.');
			
			printReturnAcademicStateList();
		},
		error : function(error){
			console.log(error);
		}
	});	
	} else {
		return
	}
}
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
<script id="return_list" type="text/x-handlebars-template">

	{{#if this}}
		{{#each .}}
			<tr class="return_body">
				<td>{{academic_state_no}}</td>
				<td>{{extractYear register_date}}</td>
				<td>{{extractSemester register_date}}</td>

			
				<td>{{a_status_cd}}</td>
				<td>{{register_reason}}</td>

				<td>{{registDate register_date}}</td>
				<td>{{r_status_cd}}</td>
				<td><button type="button" class="btn bg-gradient-danger btn-sm" style="width: 50px;" onclick="removeReturnState('{{register_date}}');">취소</button></td>
			<tr>
	{{/each}}
	
	{{else}}
			<tr class="return_body">
				<td colspan="10" style="text-align:center; "><br><i class="fas fa-exclamation-triangle" ></<i><br><br>복학신청내역이 없습니다.</td>
			</tr>
	{{/if}}

</script>