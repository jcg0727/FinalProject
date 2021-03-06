<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div class="col-12" id="departmentTransferDiv">
	<div class="card">
		<div class="card-header">
		  <h3 class="card-title">전과신청</h3>
		</div>
	<!-- /.card-header -->
		<div class="card-body">
		    <div class="row" style="margin: 0px;">
			    <div class="form-group col-3">
				    <label for="year">신청학년도</label>
				    <input type="text" class="form-control" id="year" 
				    	value="<c:choose><c:when test="${now > twoSemester }"><c:set var="nextYear" value="<%=new Date(new Date().getTime() + ((long)(1000 * 60 * 60 * 24) * (long)365))%>"/><fmt:formatDate value="${nextYear}" pattern="yyyy"/></c:when><c:otherwise><fmt:formatDate value="${now}" pattern="yyyy"/></c:otherwise></c:choose>"/>
		        </div>
			    <div class="form-group col-3">
				    <label for="semester">신청학기</label>
		    		<input type="text" class="form-control" id="semester" 
		    			value="<c:choose><c:when test="${now < oneSemester or now > twoSemester}">1학기</c:when><c:otherwise>2학기</c:otherwise></c:choose>" readonly="readonly" >
	    		</div>
    			<div class="form-group col-3">
				    <label for="registerDate">신청일자</label>
				    <input type="text" class="form-control" id="registerDate" 
				    	value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>" 
				    	readonly="readonly">
			    </div>
    			<div class="col-3 from-group" style="padding: 0; ">
					<label for="registerDate">신청학과</label>
					<div class="row" style="padding: 0;">
					<div class="col-10 select-transefer-dept">
                    	<input type="text" class="form-control float-right select-dept" id="transfer-apply"/>
                    </div>
                    <div class="col-2 select-transefer-dept-btn">
	                    <button type="submit" class="btn btn-default" onclick="OpenWindow('<%=request.getContextPath()%>/search/department','학과검색','700','780');" style="padding: 0; padding-left: 7px; padding-right: 7px;  height: 100%;">
	                      <i class="fas fa-search"></i>
	                    </button>
                    </div>
                    </div>
                </div>

			</div>
			<div class="row">
				<div class="form-group col-3">
				    <label for="">학번</label>
				    <input type="text" class="form-control" value="${loginUser.id }">
				    <c:if test="${empty loginUser.id }">
				    	true
				    </c:if>
			    </div>
				<div class="form-group col-3">
				    <label for="">성명</label>
				    <input type="text" class="form-control" value="${loginUser.name }">
			    </div>
				<div class="form-group col-3">
				    <label for="registerDept">상담신청</label>
	    	    	<div class="row" style="margin-right: 0px;">
		        		<div class="col-10 select-transefer-dept" style="padding: 0;">
			        		<input type="text" id="transfer_counsel-date" class="form-control" style="text-align: center;">
			        	</div>
		        		<div class="col-2 select-transefer-dept-btn" style="padding: 0">
				        	<button type="button" class="btn btn-default" onclick="OpenWindow('<%=request.getContextPath()%>/counsel/regist?proNo=${advisor.pro_no}&lectureSemester=202102','상담신청','1300','800');" style="padding: 0; padding-left: 7px; padding-right: 7px; height: 100%;">
		              			<i class="fas fa-search">
		              			</i>
		              		</button>
             			</div>
			    	</div>
				</div>
				<div class="form-group col-3" style="padding-right: 0px;">
				    <label for="registerDept">학업계획서</label>
                   	<div class="row transfer-filebox" style="width: 100%;">
                   		<div class="col-9" style="padding: 0;">
							<input type="text" class="form-control" id="transfer-fileObjectId" style="font-size: 0.8em;">
						</div>
						<div class="col-3" style="padding: 0;">
						  <label for="transfer-file" class="btn btnGray">첨부</label>
						  <input type="file" id="transfer-file">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="form-group col-12">
					<label>신청사유</label>					
					<textarea class="form-control transfer-register-reason" rows="3" placeholder="" style="margin-top: 0px; margin-bottom: 0px; height: 100px; width: 100%; resize: none;"></textarea>
				</div>
			</div>
		</div>
	</div>
</div>

	<div style="margin-bottom: 10px;" align="center">
		<button type="button" class="btn btnBlue btn-sm text-white" style="width: 60px;" onclick="registerDeptTransfer()">신청</button>
	</div>
<div>

<div class="col-12 transfer-div">
  <div class="card">
    <div class="card-header" style="padding: 0;">
      <h3 class="card-title" style="margin-top: 13px; margin-left: 20px;">전과신청내역</h3>
      <div class="card-tools">
	  		<button  style="float: right;" class="btn btnGray text-white btn-sm transfer-pdf" onclick="OpenWindow('<%=request.getContextPath()%>/academic/departmentChange/pdf?studentNO=${loginUser.id}','전과 증명서','700','900');" disabled="disabled">전과증명서 발급</button>
      </div>
    </div>
    <!-- /.card-header -->
    <div class="card-body table-responsive p-0">
      <table class="table table-hover text-nowrap transfer-table">
        <thead>
          <tr>
            <th style="padding-left: 15px;">No</th>
            <th>신청연도</th>
            <th>신청학기</th>
            <th>소속학과</th>
            <th>지원학과</th>
            <th>처리 상태</th>
            <th>상담</th>
            <th style="padding-right: 15px;">취소</th>
          </tr>
        </thead>
        <tbody>
         
        </tbody>
      </table>
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>
</div>
<form id="transferRegister">
	<input type="hidden" name="student_no" value="${loginUser.id }">
	<input type="hidden" name="register_reason">
	<input type="hidden" name="apply_dept_nm">
	<input type="hidden" name="transfer_counsel">
</form>
<script>
var file = document.getElementById('transfer-file');

file.addEventListener('change', function(){
	LoadingWithMask();
	var files;
	
	files = fileUpload(this,'<%=request.getContextPath()%>/fileUpload');
	
	closeLoadingWithMask();
	
	inputFileName(this, '#transfer-fileObjectId');
 	
	files.forEach(function(key){
		console.log(key);
		var input = document.createElement("input");
		input.setAttribute('type', 'hidden');
		input.setAttribute('value', key);
		input.setAttribute('name' , 'transfer_files');
		console.log(input);
		inputTypeHidden(input, '#transferRegister');
	}) ;
});
function registerDeptTransfer(){
	$('input[name="register_reason"]').val($('.transfer-register-reason').val());
	$('input[name="transfer_counsel"]').val($('#transfer_counsel-date').val());
	$('input[name="apply_dept_nm"]').val($('#transfer-apply').val());
	
	var falg = true;
	if(!(falg && $('.transfer-register-reason').val() && $('#transfer_counsel-date').val() && $('#transfer-apply').val() && $('#transfer-fileObjectId').val())){
		alert('필수 정보를 모두 입력해주세요');
		return;
	}
	
	var form = $('#transferRegister').serialize();
	
	$.ajax({
		type : "post",
		url : "<%=request.getContextPath()%>/academic/departmentChange/regist",
		data : form,
		dataType : "json",
		success : function(data){
			alert('         '+data.message);
			$('.transfer-register-reason').val(null);
			$('#fileObjectId').val(null);
			$('#transfer_counsel-date').val(null);
			$('#transfer-fileObjectId').val(null);
			$('#transfer-apply').val(null);
			pritnDeptTransferList();
		},
		error : function(error){
			alert('시스템 에러 신청이 불가합니다\n잠시후 다시 신청해주세요');
		}
	})	
}

function pritnDeptTransferList(){
	$.ajax({
		url : "<%=request.getContextPath()%>/academic/departmentChange/list",
		data : {"id":'${loginUser.id}'},
		dataType:"json",
		success:function(data){
			printData(data,'.transfer-table','#department-transfer-list','.transfer-body');	
			for (var i = 0; i < data.length; i++){
				if(data.status_nm == '최종승인'){
					$('.transfer-pdf').attr('disabled',false);
				}			
			}
		},
		error:function(error){
			console.log(error);
		}
	});
};

function removeDeptChange(date, counsel_no){
	if(confirm('정말 취소하시겠습니까?')){
	 var transferDate = new Date(parseInt(date,10));
	 transferDate = transferDate.YYYYMMDDHHMMSS();
	 
	 console.log(counsel_no.value);
	 
	 var data = {"register_date" : transferDate, "student_no" : ${loginUser.id},"counsel_no": counsel_no.value};
	 
	$.ajax({
		url : "<%=request.getContextPath()%>/academic/departmentChange/remove",
		data : JSON.stringify(data),
		type : 'POST',
		contentType :'application/json; charset=utf-8',
		success : function (data){
			alert('신청이 취소되었습니다');
			pritnDeptTransferList();
		},
		error : function(error){
			console.log(error);			
		}
	});
	}else{
		return;
	}
}

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script>
<script id="department-transfer-list" type="text/x-handlebars-template" >
{{#each .}}
<tr class = "transfer-body">
	<td>{{inc @index}}</td>
	<td>{{extractYear register_date}}</td>
	<td>{{extractSemester register_date}}</td>
	<td>{{belong_dept_nm}}</td>
	<td>{{apply_dept_nm}}</td>
	<td>{{status_nm}}</td>
	<td>
	{{#ifEquals counsel_status_nm "대기"}}
		<button type="button" class="btn text-white btnGray btn-xs">상담 대기</button>
	{{else ifEquals counsel_status_nm "수락"}}
		<button type="button" class="btn text-white btnBlue btn-xs" onclick="javascript:goPage('<%=request.getContextPath()%>/counsel/management_st');">상담실 이동</button>
	{{else ifEquals counsel_status_nm "거절"}}
		<button type="button" class="btn btnRed text-white btn-xs">상담 재신청</button>
	{{else ifEquals counsel_status_nm "완료"}}
		<button type="button" class="btn text-white btn-success btn-xs">상담 완료</button>
	{{/ifEquals }}
	</td>
	<td>
	{{#ifEquals status_nm "신청완료"}}
		<button type="button" class="btn btnRed text-white btn-xs" onclick="removeDeptChange('{{register_date}}', this)" value="{{counsel_no}}">취소</button>
	{{else}}
		<button type="button" class="btn btnRed text-white btn-xs" disabled>취소</button>
	{{/ifEquals}}
	</td>
<tr>
{{/each}}
</script>
