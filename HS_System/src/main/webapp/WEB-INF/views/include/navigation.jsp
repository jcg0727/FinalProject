<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>

var tid;
var cnt = parseInt(1799);//초기값(초단위)
function counter_init() {
	tid = setInterval("counter_run()", 1000);
}

function counter_reset() {
	clearInterval(tid);
	cnt = parseInt(1799);
	counter_init();
}

function counter_run() {
	document.all.counter.innerText = time_format(cnt);
	cnt--;
	if (cnt < 0) {
		if (!confirm("세션이 만료되었습니다. 연장하시겠습니까?")) {
			clearInterval(tid);
			self.location = "<%=request.getContextPath()%>/commons/logout.do";
			} else {
				counter_reset();
			}
		}
	}
	function time_format(s) {
		var nHour = 0;
		var nMin = 0;
		var nSec = 0;
		if (s > 0) {
			nMin = parseInt(s / 60);
			nSec = s % 60;

			if (nMin > 60) {
				nHour = parseInt(nMin / 60);
				nMin = nMin % 60;
			}
		}
		if (nSec < 10)
			nSec = "0" + nSec;
		if (nMin < 10)
			nMin = "0" + nMin;

		return nMin + ":" + nSec;
	}
</script>
<style>
#counter {
	color: white;
	font-weight: bold;
	font-size: medium;
	margin-right: -10px;
	margin-top: 7px;
}
</style>

<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-hsblue navbar-light " style="background-color: #2A5F9E;">
   <!-- Left navbar links -->
   <ul class="navbar-nav">
      <li class="nav-item">
         <a class="nav-link" data-widget="pushmenu" href="#">
            <i class="fas fa-bars text-white"></i>
         </a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
         <a href="<%=request.getContextPath()%>/resources/bootstrap/index3.html" class="nav-link"></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
         <a href="javascript:void(0);" class="nav-link"></a>
      </li>
   </ul>



   <!-- Right navbar links -->
   <ul class="navbar-nav ml-auto">
      <li>
         <div id="counter"></div>
      </li>
      <li class="nav-item">
         <a onclick="counter_reset();" class="nav-link" style="color: white; font-size: small; text-decoration: underline;" href="javascript:void(0);">연장</a>
      </li>
      <li class="nav-item">
         <a onclick="logout();" title="로그아웃" href="javascript:void(0);" class="nav-link">
            <i class="fas fa-sign-out-alt text-white"></i>
         </a>
      </li>

      <!-- Messages Dropdown Menu -->
      <li>
         <a class="nav-link" title="보안레벨설정" data-toggle="dropdown" onclick="OpenWindow('securityModifyForm','보안레벨설정','630','400');">
            <i class="fas fa-lock text-white"></i>
            <span class="badge badge-danger navbar-badge"></span>
         </a>
         <!--         <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right"> -->
         <!--           <a href="#" class="dropdown-item"> -->
         <!--             Message Start -->
         <!--             <div class="media"> -->
         <%--               <img src="<%=request.getContextPath() %>/resources/bootstrap/dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 mr-3 img-circle"> --%>
         <!--               <div class="media-body"> -->
         <!--                 <h3 class="dropdown-item-title"> -->
         <!--                   Brad Diesel -->
         <!--                   <span class="float-right text-sm text-danger"><i class="fas fa-star"></i></span> -->
         <!--                 </h3> -->
         <!--                 <p class="text-sm">Call me whenever you can...</p> -->
         <!--                 <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p> -->
         <!--               </div> -->
         <!--             </div> -->
         <!--             Message End -->
         <!--           </a> -->
         <!--           <div class="dropdown-divider"></div> -->
         <!--           <a href="#" class="dropdown-item"> -->
         <!--             Message Start -->
         <!--             <div class="media"> -->
         <%--               <img src="<%=request.getContextPath() %>/resources/bootstrap/dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3"> --%>
         <!--               <div class="media-body"> -->
         <!--                 <h3 class="dropdown-item-title"> -->
         <!--                   John Pierce -->
         <!--                   <span class="float-right text-sm text-muted"><i class="fas fa-star"></i></span> -->
         <!--                 </h3> -->
         <!--                 <p class="text-sm">I got your message bro</p> -->
         <!--                 <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p> -->
         <!--               </div> -->
         <!--             </div> -->
         <!--             Message End -->
         <!--           </a> -->
         <!--           <div class="dropdown-divider"></div> -->
         <!--           <a href="#" class="dropdown-item"> -->
         <!--             Message Start -->
         <!--             <div class="media"> -->
         <%--               <img src="<%=request.getContextPath() %>/resources/bootstrap/dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle mr-3"> --%>
         <!--               <div class="media-body"> -->
         <!--                 <h3 class="dropdown-item-title"> -->
         <!--                   Nora Silvester -->
         <!--                   <span class="float-right text-sm text-warning"><i class="fas fa-star"></i></span> -->
         <!--                 </h3> -->
         <!--                 <p class="text-sm">The subject goes here</p> -->
         <!--                 <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> 4 Hours Ago</p> -->
         <!--               </div> -->
         <!--             </div> -->
         <!--             Message End -->
         <!--           </a> -->
         <!--           <div class="dropdown-divider"></div> -->
         <!--           <a href="#" class="dropdown-item dropdown-footer">See All Messages</a> -->
         <!--         </div> -->
      </li>
      <!-- Notifications Dropdown Menu -->
      <li class="nav-item dropdown">
         <a class="nav-link" data-toggle="dropdown" href="#" title="알림">
            <i class="far fa-bell text-white"></i>
            <span class="badge badge-warning navbar-badge">${count }</span>
         </a>
         <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
            <span class="dropdown-item dropdown-header" style="font-size: 15px;">새알림 목록</span>

            <c:if test="${empty announceList }">
               <div class="dropdown-divider text-white"></div>
               <i class="fas fa-envelope mr-2" style="padding-left: 15px;"></i>
               <span>새로운 알림이 없습니다.</span>
            </c:if>

            <c:if test="${not empty announceList }">
               <c:forEach items="${announceList }" var="list">
                  <div class="dropdown-divider text-white"></div>
                  <a href="/hs/index.do?mCode=${list.mcode }" class="dropdown-item" style="font-size: 14px;" onclick="RemoveAlram('${list.anno_no}');">
                     <i class="fas fa-envelope mr-2"></i>
                     ${list.anno_content }
                  </a>
               </c:forEach>
            </c:if>
         </div>
      </li>
      <!-- 		<li class="nav-item"><a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#"> <i class="fas fa-th-large text-white"></i> -->
      <!-- 		</a></li> -->
   </ul>
</nav>
<!-- /.navbar -->

<script>
setInterval(IntervalAnnounce, 5000);
counter_init();


function IntervalAnnounce(){
  	if(!$('li.dropdown').hasClass('show')){
	   	$.ajax({
         url : '<%=request.getContextPath()%>/intervalAnnounce',
         contentType :'application/json; charset=utf-8',
         type : 'POST',
         success : function(data){
            printData2(data.announceList,'.dropdown-menu-right','#announce-list-template');
    	        $('li.dropdown a.nav-link span.badge').text(data.count);
         },
         error : function(error){}
      }) 
  	}
}

function printData2(data,target,templateObject,removeClass){
	var template=Handlebars.compile($(templateObject).html());
	
	var html = template(data);
// 	$(removeClass).empty();
	$(target).html(html);
}

function RemoveAlram(anno_no){
   $.ajax({
       url : '<%=request.getContextPath()%>/updateToY',
         data : {
            "anno_no" : anno_no
         },
         dataType : 'json',
         success : function(data) {
         },
         error : function(error) {
         }
      });
}

</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script id="announce-list-template" type="text/x-handlebars-template">

	<span class="dropdown-item dropdown-header" style="font-size: 15px;">새알림 목록</span>
{{#if this}}
	{{#each .}}
        <div class="dropdown-divider text-white"></div>
        <a href="/hs/index.do?mCode={{mcode}}" class="dropdown-item" style="font-size: 14px;" onclick="RemoveAlram('{{anno_no}}');">
        <i class="fas fa-envelope mr-2"></i>
              {{anno_content}}
        </a>
	{{/each}}
{{else}}
        <div class="dropdown-divider text-white"></div>
        <i class="fas fa-envelope mr-2" style="padding-left: 15px;"></i>
        <span>새로운 알림이 없습니다.</span>
{{/if}}
</script>
