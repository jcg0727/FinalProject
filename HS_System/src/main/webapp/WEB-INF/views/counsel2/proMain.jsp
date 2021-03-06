<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="counselList" value="${dataMap.counselList }" /> 

<head>
<title>Insert title here</title>

<script>
function list_go3(page,url){
	   if(!url) url= window.location.href
	   
	   var jobForm3=$('#jobForm3');
	   
	   if(!page) page=1;

	   jobForm3.find("[name='page']").val(page);

	   if($('select[name="perPageNum"]').val()){
	      jobForm3.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	   }
	   
	   console.log(jobForm3.find("[name='perPageNum']").val());
	      
	   jobForm3.find("[name='searchType']").val($('select[name="searchType"]').val());
	   jobForm3.find("[name='searchType2']").val($('select[name="searchType2"]').val());
	   jobForm3.find("[name='searchType3']").val($('select[name="searchType3"]').val());
	   jobForm3.find("[name='keyword']").val($('div.input-group>input[name="keyword"]').val());
	   
	   jobForm3.attr({
	      action:url,
	      method:'get'
	   }).submit();
	}
</script>

<style>

.page-link{
	height: 34px;
}
label{
	font-size: 14px;
}

</style>

</head>


<body>


<section class="content" style="padding-left: 10px; padding-right: 10px; padding-top: 10px;">
<div class="card">
    <div class="card-header with-border" style="display: flex;border-bottom-width: 3px; border-bottom-color: #2A5F9E">
         <h5 style="font-weight: bold;">상담신청목록</h5>             
    </div>
    <div class="input-group row " style="position: unset;padding-left: 500px;font-size: 14px;padding-top: 10px;padding-right: 18px;">                       
        <!-- search bar -->                       
	    <select class="form-control" name="searchType2" id="searchType2" style="font-size: 14px; width: 60px;">
			<option value=""  ${cri.searchType2 eq '' ? 'selected':''}>상담종류</option>
			<option value="일반상담"  ${cri.searchType2 eq '일반상담' ? 'selected':''}>일반상담</option>
			<option value="전과상담"  ${cri.searchType2 eq '전과상담' ? 'selected':''}>전과상담</option>
			<option value="자퇴상담"  ${cri.searchType2 eq '자퇴상담' ? 'selected':''}>자퇴상담</option>
			<option value="복수전공상담"  ${cri.searchType2 eq '복수전공상담' ? 'selected':''}>복수전공상담</option>
	    </select>

	    <select class="form-control" name="searchType3" id="searchType3" style="font-size: 14px; width: 60px;">
			<option value=""  ${cri.searchType3 eq '' ? 'selected':''}>예약상태</option>
			<option value="수락"  ${cri.searchType3 eq '수락' ? 'selected':''}>수락</option>
			<option value="거절"  ${cri.searchType3 eq '거절' ? 'selected':''}>거절</option>
			<option value="대기"  ${cri.searchType3 eq '대기' ? 'selected':''}>대기</option>
			<option value="완료"  ${cri.searchType3 eq '완료' ? 'selected':''}>완료</option>
	    </select>
	   
	    <select class="form-control" name="searchType" id="searchType" style="font-size: 14px;">
			<option value=""  ${cri.searchType eq '' ? 'selected':''}>구분</option>
			<option value="student_no"  ${cri.searchType eq 'student_no' ? 'selected':''}>학번</option>
			<option value="name"  ${cri.searchType eq 'name' ? 'selected':''}>이름</option>
	    </select>
     
		<!-- keyword -->
        <input  class="form-control" type="text" name="keyword" value="${cri.keyword }" style="font-size: 14px;width: 100px;"/>
		<span class="input-group-append">
		   <button class="btn text-white" type="button" id="searchBtn" data-card-widget="search" onclick="list_go3(1);" style="background-color: #2A5F9E;width: 43px;">
		      <i class="fa fa-fw fa-search"></i>
		   </button>
		</span>
       <!-- end : search bar -->      
	</div>         
    <div class="card-body row" style="text-align:center; padding-bottom: 0; padding-top: 10px;">
    <div class="col-sm-12" style="min-height: 360px;">
    

      
         <div class="col-sm-12" style="min-height: 300px;">   
        <table class="table table-hover table-sm" style="font-size: 15px;">
           
           <thead>
           <tr style="text-align: center;">
<!--                   <th style="width: 55px;">NO</th> -->
                 <th>상담종류</th>
                 <th>학번</th>
                 <th>이름</th>
                 <th>상담일자</th>
                 <th>상담시간</th>
                 <th>예약상태</th>
                 <th>상담실</th>
              </tr>
        </thead>           
             <c:forEach items="${counselList }" var="c">
                  <tr onclick="detail('${c.counsel_no }','${c.consl_categ_nm }','${c.student_no }','${c.name }','<fmt:formatDate value="${c.counsel_date }" pattern="yyyy-MM-dd"/>','<fmt:formatDate value="${c.counsel_date }" pattern="a hh:mm"/>','${c.regist_title }','${c.register_content }');" style="text-align: center; font-size: 14px;">
                  <td>${c.consl_categ_nm }</td>                          
                  <td>${c.student_no }</td>                          
                  <td>${c.name }</td>                          
                  <td>
                  <fmt:formatDate value="${c.counsel_date }" pattern="yyyy-MM-dd"/>
                  </td>
                  <td>
                  <fmt:formatDate value="${c.counsel_date }" pattern="a hh:mm"/>
                  </td>
                  <td>${c.status_nm }</td>  
                  
                  <c:if test="${c.status_nm eq '수락' }"> 
	                  <c:choose>
		                  <c:when test="${c.counsel_content eq null }" >
		                  	<td> <button type="button" class="btn btn-xs btnBlue text-white" style="background-color:#2A5F9E;" onclick="OpenWindow('https://192.168.45.70:9001?counsel_no=${c.counsel_no}','',1000,700);">상담실 입장</button></td>
		                  </c:when>
		                  <c:when test="${c.counsel_content eq ' ' }" >
		                  	<td> <button type="button" class="btn btn-xs btnBlue text-white" style="background-color:#2A5F9E;" onclick="OpenWindow('https://192.168.45.70:9001?counsel_no=${c.counsel_no}','',1000,700);">상담실 입장</button></td>
		                  </c:when>
		                  <c:when test="${c.counsel_content != null }" >
		                <td><button class="btn btnGray btn-xs text-white" style="width: 75px;" onclick="OpenWindow('<%=request.getContextPath() %>/counsel/counselContentDetail?counsel_no=${c.counsel_no }&counsel_content=${c.counsel_content}&name=${c.name }&counsel_date=<fmt:formatDate value="${c.counsel_date }" pattern="yyyy-MM-dd"/>','','600','500')">상담일지</button></td>
		                  </c:when>
	                  </c:choose>
                  </c:if>
                     <c:if test="${c.status_nm eq '거절' }"> 
		                <td>-</td>
                 	 </c:if>	
                     <c:if test="${c.status_nm eq '신청완료' }"> 
		               <td> <button disabled="disabled" type="button" class="btn btn-xs btnBlue text-white" style="background-color:#2A5F9E;" onclick="OpenWindow('https://192.168.45.70:9001?counsel_no=${c.counsel_no}','',1000,700);">상담실 입장</button></td>
                 	 </c:if>	
                     <c:if test="${c.status_nm eq '대기' }"> 
		               <td> <button disabled="disabled" type="button" class="btn btn-xs btnBlue text-white" style="background-color:#2A5F9E;" onclick="OpenWindow('https://192.168.45.70:9001?counsel_no=${c.counsel_no}','',1000,700);">상담실 입장</button></td>
                 	 </c:if>	
                     <c:if test="${c.status_nm eq '완료' }"> 
		                <td><button class="btn btnGray btn-xs text-white" style="width: 75px;" onclick="OpenWindow('<%=request.getContextPath() %>/counsel/counselContentDetail?counsel_no=${c.counsel_no }&counsel_content=${c.counsel_content}&name=${c.name }&counsel_date=<fmt:formatDate value="${c.counsel_date }" pattern="yyyy-MM-dd"/>','','600','500')">상담일지</button></td>
                 	 </c:if>	
                     <c:if test="${c.status_nm eq '지도교수승인' }"> 
		                <td><button class="btn btnGray btn-xs text-white" style="width: 75px;" onclick="OpenWindow('<%=request.getContextPath() %>/counsel/counselContentDetail?counsel_no=${c.counsel_no }&counsel_content=${c.counsel_content}&name=${c.name }&counsel_date=<fmt:formatDate value="${c.counsel_date }" pattern="yyyy-MM-dd"/>','','600','500')">상담일지</button></td>
                 	 </c:if>	
                     <c:if test="${c.status_nm eq '반려' }"> 
		                <td><button class="btn btnGray btn-xs text-white" style="width: 75px;" onclick="OpenWindow('<%=request.getContextPath() %>/counsel/counselContentDetail?counsel_no=${c.counsel_no }&counsel_content=${c.counsel_content}&name=${c.name }&counsel_date=<fmt:formatDate value="${c.counsel_date }" pattern="yyyy-MM-dd"/>','','600','500')">상담일지</button></td>
                 	 </c:if>	
                 </tr>

           </c:forEach>      
            
                
          </table> 
                      </div>      
  <div>              
             <nav aria-label="Navigation" style="display: block;padding-top: 10px;">
  <ul class="pagination justify-content-center m-0">
     <li class="page-item">
        <a class="page-link" href="javascript:list_go3(1);" >
        <i class="fas fa-angle-double-left"></i>
        </a>
     </li>
     <li class="page-item">
        <a class="page-link" href="javascript:list_go3('${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">
        <i class="fas fa-angle-left"></i>
        </a>
     </li>
     <c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
     <li class="page-item ${pageMaker.cri.page == pageNum?'active':''}">
        <a class="page-link" href="javascript:list_go3('${pageNum}');" style="height: 34px;" >
        ${pageNum }</a>
     </li>
     </c:forEach>
     <li class="page-item">
        <a class="page-link" href="javascript:list_go3('${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">
        <i class="fas fa-angle-right" ></i>
        </a>
     </li>
     <li class="page-item">
     <a class="page-link" href="javascript:list_go3('${pageMaker.realEndPage}');">
         <i class="fas fa-angle-double-right"></i>
      </a>
      </li>   
      
   </ul>
</nav>  
</div>
</div>
</div> <!-- col-sm-12 -->
</div> <!-- row -->
      
       
       
       
       
       
       
       
       
<div class="card">
	<div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
    	<h5 style="font-weight: bold;">상담신청 상세보기</h5>     
	</div>
	<div class="card-body row" style="text-align:center;padding-top: 5px;">
		<div class="col-sm-12" style="">
            
            
            <div class="form-group row">
            <div class="col-1"></div>
            <div class="col-11 row" style="padding: 0px;">
            
            
              <div class="col-2">  
               <label for="stuNum">이름</label>
               <input type="text" class="form-control" id="name" value="" >
               </div>
               
               <div class="col-2">  
               <label for="stuNum">학번</label>
               <input type="text" class="form-control" id="student_no" value="" >
               </div>
               
               <div class="col-3">  
               <label for="stuNum">상담일자</label>
               <input type="text" class="form-control" id="counsel_date" value="" >
               </div>
               
               <div class="col-3">  
               <label for="stuNum">상담시간</label>
               <input type="text" class="form-control" id="counsel_time" value="" >
               </div>

               <div class="col-2">  
               <label for="stuNum">상담종류</label>
               <input type="text" class="form-control" id="consl_categ_nm" value="" >
               </div>
			</div>

             </div>
               
                                          
               <div class="form-group row">
	               <label for="stuNum" class="col-1">제목</label>
	               <input type="text" class="form-control col-11" id="title" value="" >
               </div>
               
               
               <div class="form-group row" style="margin-bottom: 10px;">
	               <label for="stuNum" class="col-1">내용</label>
             	   <textarea class="form-control col-11" id="content" name="" rows="3" style="height: 143px;"></textarea>
               </div>
                              
               <div class="form-group row" style="margin-bottom: 0px; display: contents;">
					<button type="button" class="btn btnBlue btn-sm text-white" style="background-color:#2A5F9E;" id="accept" onclick="">수락</button>
					<button type="button" class="btn btnRed btn-sm text-white" style="background-color:#B94040;" id="deny" onclick="">거절</button>
               </div>
               
               
               
    	</div>

	</div> <!-- card-body -->
</div> <!-- card -->



<form id="jobForm3">
	<input type='hidden' name="page" value="" />
	<input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum }"/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="searchType2" value="" />
	<input type='hidden' name="searchType3" value="" />
	<input type='hidden' name="keyword" value="" />
</form> 
                  
</section>



<script>

function accept(counsel_no,name){
	if(confirm(name + '학생의 상담을 승인하시겠습니까?')==true){
		
		$.ajax({
			url : '<%=request.getContextPath()%>/counsel/management_prof/accept',
			data : {"counsel_no" : counsel_no},
			dataType : 'json',
			success : function(data){
				alert('상담이 승인되었습니다.');
				window.location.reload(true);
			},
			error : function(error){
				alert('상담이 승인되었습니다.');
				window.location.reload(true);
			}
		});
	}else{
		return;
	}
};



function detail(counsel_no,consl_categ_nm, student_no, name, counsel_date, counsel_time, title, content){
    document.getElementById("consl_categ_nm").value = consl_categ_nm;
    document.getElementById("student_no").value = student_no;
    document.getElementById("name").value = name;
    document.getElementById("counsel_date").value = counsel_date;
    document.getElementById("counsel_time").value = counsel_time;
    document.getElementById("title").value = title;
    document.getElementById("content").value = content;
    
    document.getElementById("accept").addEventListener('click',function(){
    	accept(counsel_no,name);
    	},{ once : true}); 
    
    document.getElementById("deny").addEventListener('click',function(){
    	OpenWindow('denyForm.do?counsel_no='+counsel_no+'&student_no='+student_no,'거절사유입력',800,400);
    	},{ once : true}); 
}
</script>


</body>
