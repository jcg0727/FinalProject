<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces ="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/js.jsp"%>
<jsp:include page="/WEB-INF/views/include/style.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/resources/fullCalendar/lib/mainCalender.css" rel='stylesheet' />
<script src='<%=request.getContextPath()%>/resources/fullCalendar/lib/mainCalender.js'></script>
<script src='<%=request.getContextPath()%>/resources/fullCalendar/lib/locales-all.js'></script>


<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="noticeList" value="${dataMap.noticeList }" /> 
<c:set var="YList" value="${YList }" />

<head>
<title>Insert title here</title>
<style>
#calendar {
   width: 100%;
   /* margin: 20px auto; */
}

.fc-event-title-container {
   opacity: 100%;
}

.fc-scrollgrid-sync-inner {
   opacity: 80%;
}

.fc .fc-button-primary {
   background-color: #2a5f9e;
   border-color: #2a5f9e;
}

.fc .fc-button-primary:disabled {
   background-color: #396ba7;
   border-color: #396ba7;
}

.fc-daygrid-day-number, .fc-col-header-cell-cushion {
   color: black;
}
.nav-tabs > li > a {
  color: gray;
  font-weight: bold;
}
.nav-tabs > li.active > a {
  color: black;
  font-weight: bold;
}
.fc .fc-toolbar-title {
    font-size: 17.9px;
    margin: 0;
}
.fc .fc-toolbar.fc-header-toolbar {
    margin-bottom: 0.5em;
    padding-top: 0;
    padding-bottom: 0;
}
.fc .fc-button-primary {
    background-color: #396ba7;
    border-color: #396ba7;
    height: 29px;
    font-size: 14px;
}
.card-primary.card-outline-tabs>.card-header a.active {
    border-top: 3px solid #2A5F9E;
}
</style>
<script>
document.addEventListener(
'DOMContentLoaded',
function() {
   var calendarEl = document.getElementById('calendar');

   var calendar = new FullCalendar.Calendar(
         calendarEl,
         {
            aspectRatio : 2.2,
            locale : "ko",
            titleFormat : function(date) { // title ??????
               return date.date.year + "??? "
                     + (date.date.month + 1) + "???";
            },
            googleCalendarApiKey : 'AIzaSyCc8lxvvtyvHfa6dAfIr8kEVFxgVHpOT2A',
            eventSources : [
                  {
                     googleCalendarId : 'o4s268iinvl21sr93kbbotpqoc@group.calendar.google.com',
                     className : '????????????' ,
                     color : '#97c783',  //rgb,#ffffff ?????? ???????????? ??? ??? ?????????.
                  //textColor: 'black' 
                  },

                  {
                     googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com',
                     className : '??????????????? ?????????',
                     color : '#2A5F9E', //rgb,#ffffff ?????? ???????????? ??? ??? ?????????.

                  },

                  {
                     googleCalendarId : 'cjnfjrq1gdo37vjeosjivkl6jc@group.calendar.google.com',
                     className : '2?????? ????????????',
                     color : '#c0c0c0',
                     //textColor: 'black'
                  },
                  {
                     googleCalendarId : '6jc0nr7682989gd939hqpqmn78@group.calendar.google.com',
                     className : '????????????',
                     color : '#2A5F9E',
                  },
                  {
                     googleCalendarId : 'fjf8g2c41r967nmdcgt0sumd7k@group.calendar.google.com',
                     className : '????????????',
                     color : '#2A5F9E',
                  },

            ],
            eventClick : function(info) {
               info.jsEvent.stopPropagation();
               info.jsEvent.preventDefault();
            }
         });
   calendar.render();
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

function Select2(target){   
   document.getElementById("searchType2").value = target;
   list_go3(1);
   
}




</script>
</head>
<body>
<%-- <c:forEach items="${YList }" var="y">
<p>${y.title }</p>
</c:forEach>
<c:forEach items="${noticeList }" var="n">
<p>${n.title }</p>
</c:forEach> --%>



   <section class="content" style="padding-left: 10px; padding-right: 10px; padding-top: 10px;">
  <div class="card">
     <div class="card-header with-border" style="display: flex; height: 50px; padding-top: 0px;">
        <div id="keyword" class="">
          <h5 style="width: 100px; padding-top: 11px; font-weight: bold;">????????????</h5>     
        </div>   
         <div class="input-group row " style="position: unset;padding-left: 550px;padding-bottom: 7px;font-size: 14px;padding-top: 7px;">
                                
               <!-- search bar -->               
         
            <select class="form-control col-md-3" name="searchType2" id="searchType2" style="font-size: 14px;" hidden="true" >
              <option value=""  ${cri.searchType2 eq '' ? 'selected':''}>??????</option>
              <option value="??????"  ${cri.searchType2 eq '??????' ? 'selected':''}>??????</option>
              <option value="??????"  ${cri.searchType2 eq '??????' ? 'selected':''}>??????</option>
              <option value="?????????"  ${cri.searchType2 eq '?????????' ? 'selected':''}>?????????</option>
           </select>
            <select class="form-control col-md-3" name="searchType" id="searchType" style="font-size: 14px;height: 35px;">
              <option value=""  ${cri.searchType eq '' ? 'selected':''}>??????</option>
              <option value="title"  ${cri.searchType eq 'title' ? 'selected':''}>??????</option>
              <option value="con"  ${cri.searchType eq 'con' ? 'selected':''}>??????</option>
           </select>
           <!-- keyword -->
               <input  class="form-control" type="text" name="keyword" 
                       placeholder="???????????? ???????????????." value="${cri.keyword }" style="font-size: 14px;height: 35px;"/>
           <span class="input-group-append">
              <button class="btn text-white" type="button" 
                    id="searchBtn" data-card-widget="search" onclick="list_go3(1);" style="background-color: #2A5F9E;width: 43px;">
                 <i class="fa fa-fw fa-search"></i>
              </button>
           </span>
        <!-- end : search bar -->      
            </div>         
     </div>
     <div class="card-body row" style="text-align:center; padding-bottom: 0; padding-top: 10px;">
     <div class="col-sm-12" style="height: 283px;">
     
     
     

<div class="card card-primary card-outline card-outline-tabs">
        <div class="card-header p-0 border-bottom-0">
          <ul class="nav nav-tabs" id="custom-tabs-three-tab" role="tablist" style="font-size: 15px;">
            <li class="nav-item">
              <a class="nav-link ${target eq '' ? 'active':'' }" id="??????" data-toggle="pill" onclick="Select2('');"  role="tab" aria-controls="custom-tabs-three-profile" aria-selected="false">??????</a>
            </li>
            <li class="nav-item">
              <a class="nav-link ${target eq '??????' ? 'active':'' }" id="??????" data-toggle="pill" onclick="Select2('??????');" role="tab" aria-controls="custom-tabs-three-profile" aria-selected="false">??????</a>
            </li>
            <li class="nav-item">
              <a class="nav-link ${target eq '??????' ? 'active':'' }" id="??????" data-toggle="pill" href="" onclick="Select2('??????');"  role="tab" aria-controls="custom-tabs-three-messages" aria-selected="false">??????</a>
            </li>
            <li class="nav-item">
              <a class="nav-link ${target eq '?????????' ? 'active':'' }" id="?????????" data-toggle="pill" href="" onclick="Select2('?????????');" role="tab" aria-controls="custom-tabs-three-settings" aria-selected="false">?????????</a>
            </li>
          </ul>
        </div>
        
              
       
       
          <div class="col-sm-12" style="min-height: 247.75px;">   
         <table class="table table-hover table-sm" style="font-size: 15px;">
            
            <thead>
            <tr style="text-align: center;">
                    <th style="width: 55px;">NO</th>
                  <th>??????</th>
                  <th>?????????</th>
                  <th>?????????</th>
               </tr>
         </thead>           
              <c:forEach items="${YList }" var="y">
                   <tr onclick="OpenWindow('detail.do?notice_no=${y.notice_no}&from=list','????????????',950,630);" style="text-align: center; font-size: 14px; font-weight: bold;">
                   <td><i class="fas fa-exclamation-circle" style="color: red;"></i></td>
                   <td style="text-align: left;padding-left: 30px;">${y.title }</td>
                   <td>${y.count }</td> 
                   <td><fmt:formatDate value="${y.regist_date }" pattern="yyyy-MM-dd"/></td>
                  </tr>
            </c:forEach>      
              <c:forEach items="${noticeList }" var="n">
                   <tr onclick="OpenWindow('detail.do?notice_no=${n.notice_no}&from=list','????????????',950,630);" style="text-align: center; font-size: 14px;">
                   <td>${n.num }</td>
                   <td style="text-align: left;padding-left: 30px;">${n.title }</td>
                   <td>${n.count }</td>                          
                   <td><fmt:formatDate value="${n.regist_date }" pattern="yyyy-MM-dd"/></td>
                  </tr>
            </c:forEach>      
             
                 
           </table>       
              
              
            </div>
            
            </div>
     
     
     
            

        </div> <!-- col-sm-12 -->
       </div> <!-- row -->
   <div style="padding-bottom: 10px;">
<form id="jobForm3">
    <input type='hidden' name="page" value="" />
    <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum }"/>
   <input type='hidden' name="searchType" value="" />
   <input type='hidden' name="searchType2" value="" />
   <input type='hidden' name="keyword" value="" />
</form> 
   <!-- pagenation -->
<nav aria-label="Navigation" style="display: flex;">
   <ul class="pagination justify-content-center m-0" style="padding-left: 360px;">
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
   	<c:if test="${authority eq 'ROLE_ACADEMIC' }">
      <button type="button" class="btn btnBlue btn-sm text-white" style="background-color:#2A5F9E; margin-left: 300px;" onclick="OpenWindow('registForm.do','?????????',950,660);">??????</button>
     </c:if>
</nav>                              
   </div>
   
   
   
   </div> <!-- card-body -->
</section>


   <div class="card-body" style="padding-bottom: 0px;padding-left: 10px;padding-right: 10px;padding-top: 0px;">
      <div class="card">
         <div class="card-header" style="height: 50px;">
            <h5 class="" style="font-weight: bold;">????????????</h5>
         </div>
         <div id='calendar' style="height: 350px;"></div>
      </div>
   </div>

</body>