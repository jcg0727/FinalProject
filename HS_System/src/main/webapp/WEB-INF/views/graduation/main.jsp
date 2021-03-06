<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces ="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<title>Insert title here</title>

<style>
th{
	text-align: center;

}
td{
	text-align: center;
}
</style>
</head>
<body>

<c:set var="status_nm" value="" />
<c:set var="orginal_nm" value="" />
<c:set var="extension" value="" />



<div class="row" style="margin: 10px;">


<div class="card" style="margin: 10px;margin-right: 5px;width: 480px;">
  <div class="card-header" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
    <h3 class="card-title" style="font-weight:bold;">졸업 취득학점</h3>
  </div>
  <!-- /.card-header -->
  <div class="card-body">
     <div class="form-group row">
     <table class="table table-hover table-sm" id="sugangTable">
   		<thead>
   			<tr>
               	<th>이수구분</th>
               	<th>이수기준</th>
               	<th>취득학점</th>
               	<th>부족학점</th>
            </tr>
           </thead>
           
            <tr>
            	<td>전공필수</td>
            	<td>30</td>
            	<td>${dataMap.jp }</td>
            	<td>
            		<c:if test="${(30 - dataMap.jp) > 0 }">
            			${30 - dataMap.jp }            	
            		</c:if>
            		<c:if test="${(30 - dataMap.jp) <= 0 }">
						0
            		</c:if>             	
            	</td>
            </tr>
           
            <tr>
            	<td>전공선택</td>
            	<td>33</td>
            	<td>${dataMap.js }</td>
            	<td>
            		<c:if test="${(33 - dataMap.js) > 0 }">
            			${33 - dataMap.js }            	
            		</c:if>
            		<c:if test="${(33 - dataMap.js) <= 0 }">
						0
            		</c:if>             	
            	</td>
            </tr>
           
            <tr>
            	<td>교양필수</td>
            	<td>10</td>
            	<td>${dataMap.gp }</td>
            	<td>
            		<c:if test="${(10 - dataMap.gp) > 0 }">
            			${10 - dataMap.gp }            	
            		</c:if>
            		<c:if test="${(10 - dataMap.gp) <= 0 }">
						0
            		</c:if> 
            	</td>
            </tr>
           
            <tr>
            	<td>교양선택</td>
            	<td>10</td>
            	<td>${dataMap.gs }</td>
            	<td>
            		<c:if test="${(10 - dataMap.gs) > 0 }">
            			${10 - dataMap.gs }            	
            		</c:if>
            		<c:if test="${(10 - dataMap.gs) <= 0 }">
						0
            		</c:if>            	
            	</td>
            </tr>

            <tr style="background-color: lightyellow; font-weight: bold;">
            	<td>총합계</td>
            	<td>114</td>
            	<c:set var="total" value="${dataMap.jp + dataMap.js + dataMap.gp + dataMap.gs }" />
            	<td>${dataMap.jp + dataMap.js + dataMap.gp + dataMap.gs }</td>
            	<td>
					<c:if test="${(114 - (dataMap.jp + dataMap.js + dataMap.gp + dataMap.gs)) > 0 }">
		            	${114 - (dataMap.jp + dataMap.js + dataMap.gp + dataMap.gs) }
            		</c:if>
					<c:if test="${(114 - (dataMap.jp + dataMap.js + dataMap.gp + dataMap.gs)) <= 0 }">
						0
            		</c:if>            	
            	</td>
            </tr>
              	
           </table>
     
	</div>
  </div>
  <!-- /.card-body -->
</div>

<div class="card" style="margin: 10px;width: 474px;">
  <div class="card-header" style="height: 46px;padding-top: 0px; border-bottom-width: 3px; border-bottom-color: #2A5F9E">
    <h3 class="card-title" style="padding-top: 12px; font-weight:bold;">졸업 논문제출</h3>
    <a href="<%=request.getContextPath() %>/getFile?attach_no=AT2111200701"><button class="btn btnBlue btn-sm text-white" style="float: right;margin-top: 7px; background-color:#2A5F9E;">양식다운로드</button></a>
   <%-- 	<button type="button" class="btn btnBlue btn-sm text-white" id="formDownload" onclick="location.href='<%=request.getContextPath() %>/getFile?attach_no='AT2111080375'';" style="float: right;margin-top: 7px; background-color:#2A5F9E;">양식다운로드</button> --%>
  </div>
  
  
<c:forEach items="${list }" var="li">
	<c:set var="status_nm" value="${li.status_nm }" />
	<c:set var="orginal_nm" value="${li.orginal_nm }" />
	<c:set var="extension" value="${li.extension }" />
</c:forEach>


  <!-- /.card-header -->
  <div class="card-body">
  		<div class="row" style="width: 100%;height: 140px;">
  			<span>
  			※ 학위논문 제출절차 안내 및 유의사항 ※ 
  			</span>
  			<span style="font-size: 13px;">
  			- 상단의 양식을 다운로드 후 양식에 맞추어 제출해주시기 바랍니다..<br>
  			- 이수기준을 충족할시 논문제출이 가능합니다.<br>
  			- 담당 지도교수가 심사중일 경우 논문제출취소가 가능합니다.<br>
  			- 지도교수 승인시 졸업예정자가 되며 반려시 재제출을 해야합니다. 
  			</span>
  			
  			
  		</div>
		<div class="row">
	        <div class="row graduation-filebox" style="width: 100%;margin-left: 5px;">
	        
	        	<c:if test="${empty status_nm }">
	        		        	
 	        		<c:if test="${total >= 114 and dataMap.jp >=30 and dataMap.js >=33 and dataMap.gp >= 10 and dataMap.gs >=10}">
 	        		
			            <div class="col-9" style="padding: 0;">
							<input type="text" class="form-control" id="graduation-fileObjectId">
						</div>
						<div class="col-3" style="padding: 0;">
						  <label for="graduation-file" class="btn btnBlue btn-sm text-white" style="margin-left: 5px; margin-top: 3px; background-color:#2A5F9E;">첨부</label>
						  <input type="file" id="graduation-file" hidden="">
						<button type="button" class="btn btnBlue btn-sm text-white" id="graduationConfirm" style="margin-bottom: 5px; background-color:#2A5F9E;">확인</button>
						</div>
						<div style="display: flex;padding-top: 10px;">
							<button type="button" class="btn btn-xs btnRed text-white" style="background-color:#666666;height: 26px;">심사현황</button>
							<p>&nbsp;&nbsp;제출된 졸업논문이 없습니다.</p></div>
					
					</c:if>
				
					<c:if test="${(total < 114)or(dataMap.jp < 30)or(dataMap.js < 33)or(dataMap.gp < 10)or(dataMap.gs < 10) }">
					
		            	<div class="col-9" style="padding: 0;">
							<input type="text" class="form-control" id="graduation-fileObjectId" disabled="disabled">
						</div>
						<div class="col-3" style="padding: 0;">
					  		<label for="graduation-file" class="btn btnBlue btn-sm text-white"   style="margin-left: 5px; margin-top: 3px; background-color:#7597C0;">첨부</label>
					  		<input type="file" id="graduation-file" hidden="" disabled="disabled">
							<button type="button" class="btn btnBlue btn-sm text-white" id="graduationConfirm" style="margin-bottom: 5px; background-color:#2A5F9E;" disabled="disabled">확인</button>
						</div>
						<div style="display: flex;padding-top: 10px;">
							<span style="color: red;">*&nbsp;&nbsp;</span><p>졸업 취득학점을 충족하지 못하므로<br> 논문제출이 불가능합니다.</p></div>
							
					</c:if> 
					
				</c:if>
				
				<c:if test="${status_nm eq '지도교수승인' }">
				
					<div class="col-9" style="padding: 0;">
						<input type="text" class="form-control" id="" value="${orginal_nm }${extension }">
					</div>
				
					<div class="col-3" style="padding: 0;">
						<button type="button" class="btn btnBlue btn-sm text-white" id="cancel" style="margin-left: 5px; margin-top: 3px;" onclick="Cancel();" disabled="disabled">제출취소</button>
					</div>
					<div style="display: flex;padding-top: 10px;">
						<button type="button" class="btn btn-xs btnRed text-white" style="background-color:#B94040;height: 26px;margin-right: 10px;">심사현황</button>				
						<p>${status_nm }</p></div>
				
				</c:if>
				
				<c:if test="${status_nm eq '심사중' }">
					<div class="col-9" style="padding: 0;">
						<input type="text" class="form-control" id="" value="${orginal_nm }${extension }">
					</div>
				
					<div class="col-3" style="padding: 0;">
						<button type="button" class="btn btnBlue btn-sm text-white" id="cancel" style="margin-left: 5px; margin-top: 3px;" onclick="Cancel();">제출취소</button>
					</div>
					<div style="display: flex;padding-top: 10px;">
						<button type="button" class="btn btn-xs btnRed text-white" style="background-color:#B94040;height: 26px;margin-right: 10px;">심사현황</button>				
					<p>지도교수&nbsp;</p><p>${status_nm }</p></div>
				</c:if>
				
			</div>
		</div>     
  </div>
  <!-- /.card-body -->

</div>
</div>



<div class="form-group row" style="margin: 10px;padding-right: 40px;">


<div class="card col-12" style="margin: 10px;">
  <div class="card-header" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
    <h3 class="card-title" style="font-weight:bold;">졸업 예정</h3>
  </div>
  <!-- /.card-header -->
  <div class="card-body">
     <div class="form-group row">
     
     <c:if test="${empty graduated.graduate_date }">
     
     	<button type="button" class="btn btn-sm btnBlue text-white" >미대상자</button>	
     	<div style="font-size: 17px; padding-left: 20px;">
  		  	졸업 예정일자   <span style="font-weight: bold; margin-left: 4px; margin-right: 2px; ">미정</span>입니다.
		</div> 
     </c:if>
     
     <c:if test="${not empty graduated.graduate_date }">
     
     	<button type="button" class="btn btn-sm btnBlue text-white" >${graduated.status_nm }</button>	
     	<div style="font-size: 17px; padding-left: 20px;">
    	졸업 예정일자는   <span style="font-weight: bold; margin-left: 4px; margin-right: 2px; "><fmt:formatDate value="${graduated.graduate_date }" pattern="yyyy-MM-dd"/>일</span>입니다.
		</div> 
     </c:if>
     
	</div>
  </div>
  <!-- /.card-body -->
</div>

</div>


<div class="form-group row" style="margin: 10px;padding-right: 40px;">
</div>



<script>
var file = document.getElementById('graduation-file');
var files;


file.addEventListener('change', function(){
	inputFileName(this, '#graduation-fileObjectId');		 	
});


var con = document.getElementById('graduationConfirm');
con.addEventListener('click',function(){
	files = fileUpload(file,'<%=request.getContextPath()%>/graduation/management_st/thesis');
	    files.forEach(function(key){
		console.log(key);
		var input = document.createElement("input");
		input.setAttribute('type', 'hidden');
		input.setAttribute('value', key);
		input.setAttribute('name' , 'graduation_files');
		console.log(input);
		inputTypeHidden(input, '#graduationRegister');
	});
	
	   alert('제출이 완료되었습니다.');
	   window.location.reload(true);
	 
});

function Cancel(){
	$.ajax({
      url : '<%=request.getContextPath()%>/graduation/management_st/remove',
      data : {"student_no": ${student_no} },
      dataType : 'json',
      success: function(data){
		alert('논문제출이 취소되었습니다.');
   	    window.location.reload(true);
		
      },
      error : function(error){
		alert('논문제출이 취소되었습니다.');
   	    window.location.reload(true);		
      }
	});
};
</script>

</body>
