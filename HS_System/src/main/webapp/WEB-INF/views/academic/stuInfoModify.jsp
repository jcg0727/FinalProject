<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set target="${dataMap }" value="dataMap" />
<c:set var="stuInfo" value="${dataMap.stuInfo }" />
<c:set var="bankInfo" value="${dataMap.bankInfo }" />

<title>개인정보 수정 </title>
 

<body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   function kakaopost() {
       new daum.Postcode({
           oncomplete: function(data) {
              document.querySelector("#address").value =  data.address
           }
       }).open();
   }
</script>


   <c:if test="${from eq 'modify' }" >
    <script>
         alert("개인정보가 수정되었습니다.");
      window.opener.location.reload();
      window.close();
   </script>
   </c:if>
   
<c:forEach items="${stuInfo }" var="stu">


  <div class="card" style="margin: 10px;" >
  <div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
        <h5 style="font-weight: bold;">개인정보 수정</h5>              
     </div>

  <div class="card-body">
   <form role="form" class="form-horizontal" action="modify.do" method="post" enctype="multipart/form-data">   
      <div class="form-group row">   
            <div class="col-12 row">               
               <input type="hidden" name="oldPicture"  value="${stu.picture }"/>
               <input type="file" id="inputFile" onchange="changePicture_go();" name="picture" style="display:none" />
               <div class="col-3">
                  <div class="col-2" style="text-align: center;">
                     <div class="" id="pictureView" style="border: 1px solid gray; height: 200px; width: 160px; margin: 0 auto; margin-bottom:5px; background-image:url('<%=request.getContextPath() %>/resources/NoImage.gif'); " ></div>                                          
                     <div class="input-group input-group-sm" style="width: 160px;padding-left: 39px;">
                        <label for="inputFile" class="btn btn-xs btnBlue text-white input-group-addon" style="background-color:#2A5F9E;">사진변경</label>
                        <input id="inputFileName" class="form-control" type="hidden" name="tempPicture" disabled value="${stu.picture.split('\\$\\$')[1] }"/>
                        <input id="picture" class="form-control" type="hidden" name="uploadPicture" />
                     </div>                  
                  </div>                                    
               </div>
              <div class="col-9 row" style="height: 228px;">
            <div class="col-12 row">
            
               <div class="col-6">
               	<label for="acunt_nn" class="col-sm-3 control-label text-center">예금주</label>   
					<c:if test="${not empty bankInfo }">
						<c:forEach items="${bankInfo }" var="bank">
							<input name="acunt_nn" type="text" class="form-control" id="acunt_nn" placeholder="" value="${bank.acunt_nn }">
						</c:forEach>
					</c:if>
					<c:if test="${empty bankInfo }">
						<input name="acunt_nn" type="text" class="form-control" id="acunt_nn" placeholder="" value="">
					</c:if>
           	   </div>
            

               <div class="col-6">
				<label for="acunt_bank" class="col-sm-3 control-label text-center" >은행</label>
					<c:if test="${not empty bankInfo }">
						<c:forEach items="${bankInfo }" var="bank">
							<input name="acunt_bank" type="text" class="form-control" id="acunt_bank" placeholder="" value="${bank.acunt_bank }">
						</c:forEach>	
					</c:if>
					<c:if test="${empty bankInfo }">
						<input name="acunt_bank" type="text" class="form-control" id="acunt_bank" placeholder="" value="">
					</c:if>
				</div>
            
            </div>
            <div class="col-12">
            
				<label for="acunt_no" class="col-sm-3 control-label text-center" style="display: flex;">계좌번호</label>
				<c:if test="${not empty bankInfo }">
					<c:forEach items="${bankInfo }" var="bank">
						<input name="acunt_no" type="text" class="form-control" id="acunt_no" placeholder="" value="${bank.acunt_no }">
					</c:forEach>
				</c:if>
				<c:if test="${empty bankInfo }">
					<input name="acunt_no" type="text" class="form-control" id="acunt_no" placeholder="" value="">
				</c:if>
            </div>
            
            <div class="col-12 row">

				<div class="col-6">
					<label for="email" class="col-sm-3 control-label text-center">이메일</label>
					<input name="email" type="email" class="form-control" id="email" placeholder="example@naver.com" value="${stu.email }">
				</div>
				<div class="col-6">
					<label for="phone" class="col-sm-3 control-label text-center">연락처</label>
					<input name="phone" type="text" class="form-control" id="phone" value="${stu.phone.substring(0,3) }-${stu.phone.substring(3,7) }-${stu.phone.substring(7) }">                   
				</div>  
            </div>
                
                
                
                
              </div>
		</div>
		<div class="col-12" style="margin-top: 6px;">
			<div class="form-group row">
      			<label for="address" class="col-sm-3 control-label text-right" style="padding-right: 21px;padding-top: 8px;">주소</label>
				<div style="display: flex;width: 667px;">
					<input name="address" type="text" class="form-control" id="address" value="${stu.address }" style="margin-right: 12px;">
					<button type="button" style="background-color:#666666;width: 75px;height: 30px;margin-top: 2px;" class="btn btnGray btn-xs text-white" id="modifyBtn"  onclick="kakaopost()" style="width: 93px;height: 33px;">주소검색</button>
        		</div>               
    		</div>  
			
			<div class="form-group" style="display: flex; width: 925px;">
				<label for="detail_add" class="col-sm-3 control-label text-right" style="padding-top: 7px;">상세주소</label>
				<input name="detail_add" type="text" class="form-control" id="detail_add" value="${stu.detail_add }">                   
            </div>  
		</div>  
 
        <div class="col-12" style="margin-top: 0;border-top: none;position: fixed;margin-top: 353px;margin-left: 424px;">                  
			<button type="button" class="btn btnBlue btn-sm text-white" style="background-color:#2A5F9E;" id="modifyBtn"  onclick="modify_go();">확인</button>
			<button type="button" class="btn btnBlue btn-sm text-white" style="background-color:#B94040;" id="cancelBtn" onclick="CloseWindow();">취소</button>
       </div>   
      </div>
   </form>
   
   </div><!-- card body -->
    <!-- biggest -->
  </div>
  
  
<script>
var formData = "";


window.onload=function(){
<%-- 	if(typeof ${stu.picture} !== 'undefined' || ${stu.picture} != null){
     MemberPictureThumb($('#pictureView')[0],'${stu.picture}','<%=request.getContextPath()%>');
	}

 --%>     MemberPictureThumb($('#pictureView')[0],'${stu.picture}','<%=request.getContextPath()%>');

}  

//사용자 사진 출력
function MemberPictureThumb(targetObj, fileName, contextPath){ // (대상, 이미지파일명)
   targetObj.style.backgroundImage="url('"+contextPath+"/academic/management_st/getPicture.do?picture="+fileName+"')";
   targetObj.style.backgroundPosition="center";
   targetObj.style.backgroundRepeat="no-repeat";
   targetObj.style.backgroundSize="cover";
}


</script> 
</c:forEach>

<%@ include file="./js/modify_js.jsp" %>
</body>


