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
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<script>
$(function () {
 

  //Timepicker
  $('#timepicker').datetimepicker({
    format: 'LT'
  })
  

})
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

.ui-timepicker-standard {
	height: 100px;
    font-family: Verdana,Arial,sans-serif;
    font-size: 0.9em;
    background-color: white;
    border: 1px solid lightgray;
    border-radius: 4px;
    color: #222;
    margin: 0;
}
 .ui-timepicker-container {
    position: absolute;
    overflow: hidden;
    box-sizing: border-box;
}

.ui-timepicker {
    box-sizing: content-box;
    display: block;
    height: 150px;
    list-style: none outside none;
    margin: 0;
    text-align: center;
}

.ui-timepicker-viewport {
    box-sizing: content-box;
    display: block;
    height: 150px;
    margin: 0;
    padding: 0;
    overflow: auto;
    overflow-x: hidden; /* IE */
}

.ui-timepicker-standard {
    /* overwrites .ui-widget */
    font-family: Verdana,Arial,sans-serif;
    font-size: 0.9em;
    /* overwrites .ui-widget-content */
    background-color: #FFF;
    border: 1px solid #D8D8D8;
    color: #222;
    /* overwrites .ui-menu */
    margin: 0;
    padding: 2px;
}
.ui-timepicker-standard a {
    color: #222;
    display: block;
    text-decoration: none;
}
.ui-timepicker-standard .ui-state-hover {
    /* overwrites .ui-state-hover */
    background-color: #E0ECF8;
    font-weight: normal;
    color: #212121;
    border: none;
}
.ui-timepicker-standard .ui-menu-item {
    /* overwrites .ui-menu and .ui-menu-item */
    /*clear: left;
    float: left;*/
    margin: 0;
    padding: 0;
}

.ui-timepicker-corners,
.ui-timepicker-corners .ui-corner-all {
    -moz-border-radius: 4px;
    -webkit-border-radius: 4px;
    border-radius: 4px;
}

.ui-timepicker-hidden {
    /* overwrites .ui-helper-hidden */
    display: none;
}

.ui-timepicker-no-scrollbar .ui-timepicker {
    border: none;
}

</style>
</head>
<body>


<c:if test="${from eq 'regist' }" >
	<script>
		alert("??????????????? ?????????????????????.");
		window.location.reload();			
	</script>
</c:if>


 <section class="content" style="padding-left: 10px; padding-right: 10px; padding-top: 10px;">
  <div class="card">
     <div class="card-header with-border" style="display: flex; height: 50px; padding-top: 0px; border-bottom-width: 3px; border-bottom-color: #2A5F9E">
          <h5 style="padding-top: 11px; font-weight: bold;">??????????????????</h5>     
<%--           <button type="button" class="btn btn-xs btnBlue text-white" style="background-color:#2A5F9E;margin-left: 750px;margin-top: 10px;margin-bottom: -3px;"onclick="OpenWindow('https://192.168.45.58:9001/?counsel_no=${c.counsel_no}#1','',900,700);" >????????? ??????</button> --%>
     </div>
         <div class="input-group row " style="position: unset;padding-left: 718px;font-size: 14px;padding-top: 10px;padding-right: 18px;">
                                
               <!-- search bar -->               
         
            <select class="form-control" name="searchType" id="searchType" style="font-size: 14px; width: 60px;">
              <option value=""  ${cri.searchType eq '' ? 'selected':''}>????????????</option>
              <option value="????????????"  ${cri.searchType eq '????????????' ? 'selected':''}>????????????</option>
              <option value="????????????"  ${cri.searchType eq '????????????' ? 'selected':''}>????????????</option>
              <option value="????????????"  ${cri.searchType eq '????????????' ? 'selected':''}>????????????</option>
              <option value="??????????????????"  ${cri.searchType eq '??????????????????' ? 'selected':''}>??????????????????</option>
           </select>
            <select class="form-control" name="searchType2" id="searchType2" style="font-size: 14px;">
              <option value=""  ${cri.searchType2 eq '' ? 'selected':''}>??????</option>
              <option value="??????"  ${cri.searchType2 eq '??????' ? 'selected':''}>??????</option>
              <option value="??????"  ${cri.searchType2 eq '??????' ? 'selected':''}>??????</option>
              <option value="??????"  ${cri.searchType2 eq '??????' ? 'selected':''}>??????</option>
              <option value="??????"  ${cri.searchType2 eq '??????' ? 'selected':''}>??????</option>
           </select>
           
           <!-- keyword -->
           <span class="input-group-append">
              <button class="btn text-white" type="button" 
                    id="searchBtn" data-card-widget="search" onclick="list_go3(1);" style="background-color: #2A5F9E;width: 43px;">
                 <i class="fa fa-fw fa-search"></i>
              </button>
           </span>
        <!-- end : search bar -->      
            </div>         
     <div class="card-body row" style="text-align:center; padding-bottom: 0; padding-top: 10px;">
     <div class="col-sm-12" style="height: 283px;">
     

       
          <div class="col-sm-12" style="min-height: 220.56px;">   
         <table class="table table-hover table-sm" style="font-size: 15px;">
            
            <thead>
            <tr style="text-align: center;">
<!--                   <th style="width: 55px;">NO</th> -->
                  <th>????????????</th>
                  <th style="min-width: 429.3px;">??????</th>
                  <th>????????????</th>
                  <th>??????</th>
                  <th>????????????</th>
                  <th>?????????</th>
               </tr>
         </thead>           
              <c:forEach items="${counselList }" var="c">
                   <tr onclick="OpenWindow('detail.do?counsel_no=${c.counsel_no}','????????????',800,400);" style="text-align: center; font-size: 14px;">
                   	<td>${c.consl_categ_nm }</td>                          
                   	
                   	<td style="text-align: left;">
	                   <c:if test="${empty c.regist_title }">
    		               ${c.register_content }
            	       </c:if>
                	   <c:if test="${not empty c.regist_title }">
                   			${c.regist_title }
                   	   </c:if>
                   </td>
                   <td>
	                   <fmt:formatDate value="${c.counsel_date }" pattern="yyyy-MM-dd"/>
    	               <span> / </span>
        	           <fmt:formatDate value="${c.counsel_date }" pattern="a hh:mm"/>
                   </td>
                   <td>${c.status_nm }</td>                          
                   <td>${c.name }</td>   
                   <c:if test="${c.status_nm eq '??????' }"> 
                   <td> <button type="button" class="btn btn-xs btnBlue text-white" style="background-color:#2A5F9E;" onclick="OpenWindow('https://192.168.45.70:9001?counsel_no=${c.counsel_no}#1','',1000,700);">????????? ??????</button></td>                      
                  	</c:if>
                   <c:if test="${c.status_nm eq '????????????' }"> 
                   <td> <button disabled="disabled" type="button" class="btn btn-xs btnBlue text-white" style="background-color:#2A5F9E;" onclick="OpenWindow('https://192.168.45.70:9001?counsel_no=${c.counsel_no}#1','',1000,700);">????????? ??????</button></td>                      
                  	</c:if>
                   <c:if test="${c.status_nm eq '??????' }"> 
                   <td> <button disabled="disabled" type="button" class="btn btn-xs btnBlue text-white" style="background-color:#2A5F9E;" onclick="OpenWindow('https://192.168.45.58:9001?counsel_no=${c.counsel_no}#1','',1000,700);">????????? ??????</button></td>                      
                  	</c:if>
                 </tr>
            </c:forEach>      
             
                 
           </table> 
      </div>      
   <div>              
	 <nav aria-label="Navigation" style="padding-top: 10px;">
	   <ul class="pagination justify-content-center m-0"..>
	      <li class="page-item">
	         <a class="page-link" href="javascript:list_go3(1);">
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
	<div class="card-header with-border" style="display: flex; height: 50px; padding-top: 0px; border-bottom-width: 3px; border-bottom-color: #2A5F9E">
    	<h5 style="padding-top: 11px; font-weight: bold;">????????????</h5>     
    </div>
                                
     <div class="card-body row" style="text-align:center;padding-bottom: 0;padding-top: 10px;padding-left: 60px;">
	 <form role="form" name="registForm" id="registForm" action="management_st/modify" method="post">

     <div class="col-sm-12 row" style="padding-bottom: 10px;">
     
         <div class="col-sm-9 row">
	         <label for="regist_title">??????</label>
	         <input type="text" class="form-control" name="regist_title" id="regist_title" value="" >
         </div>
         
         <div class="col-sm-3 row" style="padding-left: 20px;">
	         <label for="consl_categ_nm">????????????</label>
        <select class="form-control" name="consl_categ_nm" id="consl_categ_nm" style="font-size: 14p;">
          <option value="">??????</option>
          <option value="????????????">????????????</option>
          <option value="????????????">????????????</option>
          <option value="????????????">????????????</option>
          <option value="??????????????????">??????????????????</option>
        </select>
         </div>                
     </div>

     <div class="col-sm-12 row" style="padding-bottom: 20px;">
     
         <div class="col-sm-9 row">
	         <label for="register_content">????????????</label>
			<textarea class="form-control" id="register_content" name="register_content" rows="3" style="height: 300px;"></textarea>
         </div>
         
         <div class="col-sm-3 row" style="padding-top: 30px; padding-left: 20px; padding-bottom: 10px; height: 140px;">
         
            <label for="">????????????</label>
        	<input class="form-control date" type="date" name="date1">
         
	     <!--  <label for="searchType" style="padding-top: 20px;">????????? ??????</label> -->
                <div class="bootstrap-timepicker">
                  <div class="">
                    <label  style="float: left; padding-top: 10px;">????????????</label>
				
				        <div class="input-group bootstrap-timepicker timepicker">
				            <input id="timepicker1" type="text" class="form-control input-small" name="time1" style="border-radius: 4px;" autocomplete="off">
				            <p class="help-block text-danger"></p>
				        </div>
                    <!-- /.input group -->
                  </div>
                  <!-- /.form group -->
                </div>

        
         <button type="button" onclick="Register();" class="btn btn-sm btnBlue text-white" style="background-color:#2A5F9E;margin-left: 70px;margin-top: 20px;">????????????</button>              
         </div>  
     </div>
  
      </form>
     </div> 
  </div> <!-- card -->

<form id="jobForm3">
   <input type='hidden' name="page" value="" />
   <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum }"/>
   <input type='hidden' name="searchType" value="" />
   <input type='hidden' name="searchType2" value="" />
   <input type='hidden' name="keyword" value="" />
</form> 
                

   
</section>



<script>
function Register(){
	var form = document.registForm;
	console.log(form);
	if(form.regist_title.value==""){
		alert("????????? ???????????????.");
		return;
	}
	
	form.submit();
}


</script>
<script>
$('#timepicker1').timepicker({
    defaultTime: 'current',
    minTime: '09:00:00', // 11:45:00 AM,
    maxHour: 17,
    maxMinutes: 30,
    minuteStep: 1
    
});


</script>

</body>
