?<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces ="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set target="${dataMap }" value="dataMap" />
<c:set var="stuInfo" value="${dataMap.stuInfo }" />
<c:set var="bankInfo" value="${dataMap.bankInfo }" />

<head>
<title>학적조회</title>

<style>
.form-control:disabled, .form-control[readonly] {
    background-color: white;
    opacity: 1;
}

.top{
   display: inline-block;
   width: 19%;
   padding-right: 4px;
}
.top2{
   display: inline-block;
   width: 48%;
   padding-right: 4px;
}
.top3{
    width: 243px;
   display: inline-block;
   padding-right: 4px;
   padding-bottom: 8px;
}
.top4{
   display: inline-block;
   padding-right: 4px;   
   padding-bottom: 8px;
}
.top5{
   display: inline-block;
   padding-right: 4px;   
   padding-bottom: 8px;
   width: 366px;
}
.top6{
   width: 920px;
   margin-top: 8px;
}
.picdiv{

    background-color: lightgray;
    height: 200px;
    width: 160px;
    float: left;
    margin-right: 30px;
    margin-top: 26px;

}
.modifybtn{
    margin-left: 819px;
    margin-top: 13px;
}
</style>


</head>
<body>
<c:forEach items="${stuInfo }" var="stu">
<div class="card" style="margin: 10px;">
  <div class="card-header with-border" style="display: flex;border-bottom-width: 3px; border-bottom-color: #2A5F9E">
    <h5 style="display: contents; font-weight: bold;">
       	  학적조회
    </h5>
    <c:if test="${dataMap.status ne '졸업'}">
    	<button type="button" class="btn bg-gradient-gray btn-sm" style="margin-left: 765px;" onclick="OpenWindow('print?id='+${account_no}+'&grade='+${grade },'','730','900');">재학증명서 </button>
    </c:if>
   <!-- 학적상태 '졸업'일때 졸업증명서 출력 -->
    <c:if test="${dataMap.status eq '졸업'}">
   		 <button type="button" class="btn bg-gradient-gray btn-sm" style="margin-left: 765px;" onclick="OpenWindow('gradute?id=${account_no}','','730','900');">졸업증명서 </button>
    </c:if>
  </div>
<div class="card-body">
  
	<div class="form-group">
      <div class="col-12" style="padding-bottom: 8px;">
         <div class="top">
	         <label for="stuNum">학번</label>
	         <input type="text" class="form-control read-only" readonly id="stuNum" value="<c:out value="${dataMap.studentNumber}"/>" >
         </div>
         <div class="top">
	     	 <label for="registdate">입학일자</label>
	         <input type="text" class="form-control" readonly id="registdate" value="<fmt:formatDate value="${stu.registdate }" pattern="yyyy-MM-dd"/>" >
         </div>
         <div class="top">
	         <label for="status">학적상태</label>
	         <input type="text" class="form-control" readonly id="status" value="<c:out value="${dataMap.status}" />" >
         </div>
         <div class="top">
	         <label for="status">학년</label>
	         <input type="text" class="form-control" readonly id="stuYear" value="${grade }" >
         </div>
         <div class="top">
	         <label for="status">이수학기</label>
	         <input type="text" class="form-control" readonly id="status" value="${semester }" >
         </div>
      </div>
      <div class="col-12" style="padding-bottom: 8px;">
     	 <div class="top2" style="padding-bottom: 8px;">
         	<label for="dept2">소속</label>
         	<input type="text" class="form-control" readonly id="dept2" value="<c:out value="${dataMap.dept2}" />" >
      	 </div>
     	 <div class="top2" style="padding-bottom: 8px;">
	         <label for="professor">지도교수</label>
	         <input type="text" class="form-control"  readonly id="professor" value="<c:out value="${dataMap.professor}" />" >
      	 </div>
      <div class="top2">
         <label for="dept">전공</label>
         <input type="text" class="form-control" readonly id="dept" value="<c:out value="${dataMap.dept}" />" >
      </div>
      <div class="top2">
         <label for="gender">복수전공</label>
         <input type="text" class="form-control" readonly id="gender" value="<c:out value="${dataMap.gender}" />" >
      </div>
     </div>
	</div>
</div>


 </div>
</c:forEach>
 
 
 
 <div class="card" style="margin: 10px;">
  <div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
    <h5 style="font-weight: bold;">
         개인정보 조회
    </h5>
  </div>
<div class="card-body">
 <!-- 사진 -->
	<div class="picdiv">
		<c:forEach items="${stuInfo }" var="stu">
  			<img src="<%=request.getContextPath() %>/academic/management_st/getPicture.do?picture=${stu.picture}" onerror="this.src='<%=request.getContextPath() %>/resources/NoImage.gif'" style="width: 160px; height: 200px;">
		</c:forEach>
	</div>
<div>
   
   <div class="top3">  
      <label for="stuNum">이름</label>
       <c:forEach items="${stuInfo }" var="stu">
      <input type="text" class="form-control" readonly id="stuNum" value=" ${stu.name }" >
      </c:forEach>
   </div>
   
   <div class="top3">  
      <label for="registdate">성별</label>
      <input type="text" class="form-control" readonly id="registdate" value="<c:out value="${dataMap.faculty}" />" >
   </div>
   <div class="top3">  
      <label for="status">은행</label>
      <c:if test="${not empty bankInfo }">
      	<c:forEach items="${bankInfo }" var="bank">
      		<input type="text" class="form-control" readonly id="status" value="${bank.acunt_bank }" >
		</c:forEach>
	  </c:if>   
      <c:if test="${empty bankInfo }">
      	<input type="text" class="form-control" readonly id="status" value="" >
	  </c:if>   
   </div>
</div>

   <div>
   <div class="top4" style="width: 242px;">  
      <label for="status">예금주</label>
      <c:if test="${not empty bankInfo }">
         <c:forEach items="${bankInfo }" var="bank">
	      <input type="text" class="form-control" readonly id="status" value="${bank.acunt_nn }" >
      </c:forEach> 
      </c:if>
      <c:if test="${empty bankInfo }">
	      <input type="text" class="form-control" readonly id="status" value="" >
	</c:if>   
   </div>
<div class="top4" style="width: 490px;">  
	<label for="status">계좌번호</label>
	<c:if test="${not empty bankInfo }">
		<c:forEach items="${bankInfo }" var="bank">
			<input type="text" class="form-control" readonly id="status" value="${bank.acunt_no }" >
		</c:forEach> 
	</c:if>
	<c:if test="${empty bankInfo }">
		<input type="text" class="form-control" readonly id="status" value="" >
	</c:if>
</div>
</div>
   <c:forEach items="${stuInfo }" var="stu">
     <div class="top5">  
      <label for="email">이메일</label>
      <input type="text" class="form-control" readonly id="email" value="${stu.email }" >
   </div>
     <div class="top5">  
      <label for="phone">연락처</label>
      <input type="text" class="form-control" readonly id="phone" value="${stu.phone.substring(0,3) }-${stu.phone.substring(3,7) }-${stu.phone.substring(7) }" >
   </div>
  <div class="top6">
      <label for="phone">주소</label>
      <input type="text" class="form-control" readonly id="phone" value="${stu.address }" >
  </div>
      
  <div class="top6">
      <label for="phone">상세주소</label>
      <input type="text" class="form-control" readonly id="phone" value="${stu.detail_add }" >
  </div>
  </c:forEach>
   
	<button type="button" class="btn btnBlue btn-sm text-white" id="modifyBtn" onclick="OpenWindow('modifyForm.do?id=${account_no}','','1000','500');" style="background-color:#2A5F9E; float: right; margin-right: 50px; margin-top: 10px;">개인정보수정</button>

  </div>
</div>
 
</body>

