<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="memScheList" value="${dataMap.memScheList }" />
<c:set var="commingScheList" value="${commingDate.commingScheList }" />

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- fullcalendar CDN -->
<link href='<%=request.getContextPath()%>/resources/fullCalendar/lib/main.css' rel='stylesheet' />
<!-- 부트스트랩 -->
<link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
<script src='<%=request.getContextPath()%>/resources/fullCalendar/lib/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script src='<%=request.getContextPath()%>/resources/fullCalendar/lib/locales-all.min.js'></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<style>
@charset "UTF-8";

html, body {
   margin: 0;
   padding: 0;
   font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
   font-size: 14px;
}

.body-card {
   margin: 10px;
}

body {
   width: 100%;
}

#calendar-container {
   position: relative;
   z-index: 1;
   /* margin-left: 200px; */
}

#calendar td.fc-day-sun {
   color: red;
}

#calendar td.fc-day-sat {
   color: blue;
}

#calendar {
   max-width: 1100px;
   margin: 20px auto;
}

.fc-addEventButton1-button {
   background: #007bff linear-gradient(180deg, #268fff, #007bff) repeat-x
      !important;
   color: #fff;
}

.fc-addEventButton1-button:disabled:hover {
   cursor: not-allowed;
}

.fc-addEventButton2-button {
   color: #fff;
   background-color: #dc3545;
   border-color: # dc3545;
   box-shadow: none;
}

.fc-addEventButton2-button:hover {
   color: #fff;
   background-color: #dc3545;
   border-color: #dc3545;
   box-shadow: none;
}

.events-card {
   position: absolute;
   top: 105px;
   left: 30px;
   width: 260px;
}

.list-card {
   width: 260px;
   height: 370px;
   position: absolute;
   top: 250px;
   left: 30px;
   top: 250px;
}

.pro-select-btn {
   height: 18px;
   font-size: 10px;
   color: white;
   padding-top: 1px;
}
</style>

<script>

function insertCounsel(data, pro_no, student_no, register_date){
   	var myDate = new Date(parseInt(register_date));
   	var transferDate = myDate.getFullYear() + '-' +('0' + (myDate.getMonth()+1)).slice(-2)+ '-' +  ('0' + myDate.getDate()).slice(-2) + ' '+myDate.getHours()+ ':'+('0' + (myDate.getMinutes())).slice(-2)

   	var data = {"pro_no": pro_no, "student_no": student_no, "counsel_date" : data, "register_date" : transferDate};
   	$.ajax({
      url : '<%=request.getContextPath()%>/counsel/registCounsel',
      type : 'POST',
      contentType : 'application/json; charset=utf-8',
      data : JSON.stringify(data),
      success:function(data){
         alert('상담 배정이 완료 되었습니다');
         window.close();
         opener.transferInList();
      },
      error:function(error){
         alert('시스템 에러입니다\n관리자에게 문의해주세요');
      }
   });
}


function timestamp(date){ 
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var hour = date.getHours();
    var minute = date.getMinutes();
    var second = date.getSeconds();

    month = month >= 10 ? month : '0' + month;
    day = day >= 10 ? day : '0' + day;
    hour = hour >= 10 ? hour : '0' + hour;
    minute = minute >= 10 ? minute : '0' + minute;
    second = second >= 10 ? second : '0' + second;

    return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
}

const color = [
   '#007bff',
   '#ffc107',
   '#28a745',
   '#dc3545',
   '#6c757d'
];

document.addEventListener('DOMContentLoaded',function() {
   var Calendar = FullCalendar.Calendar;
   var Draggable = FullCalendar.Draggable;
   var calendarEl = document.getElementById('calendar');
   var checkbox = document.getElementById('drop-remove');
   
   // initialize the calendar
   // -----------------------------------------------------------------
   var calendar = new Calendar(
         calendarEl,
         {
            initialView: 'timeGridWeek',
            slotMinTime : "09:00:00",
            slotMaxTime : "19:00:00",
            themeSystem : 'bootstrap',
            eventOverlap : false,
            businessHours: {
                   daysOfWeek: [ 1, 2, 3, 4, 5 ], // Monday, Tuesday, Wednesday
                   startTime: '09:00', // 8am
                   endTime: '19:00', // 7pm
            },
            headerToolbar : {
               left : 'prev,next',
               center : 'title',
               right : 'addEventButton1 addEventButton2 addEventButton3'
            },
            customButtons : {
               addEventButton1 : {
                  text : '신청',
                  click : function(e) {
                     var data = document.getElementById('counsel').value;
                     var student_no = $('input[name=student_no]').val();
                     var register_date = $('input[name=register_date]').val();
                     insertCounsel(data, '${professor.pro_no}', student_no, register_date);
                  }
               },
               addEventButton2 : {
                  text : '닫기',
                  click : function() {
                     window.close();
                  }
               
               },
               addEventButton3 : {
                  text : '새로고침',
                  click : function() {
                     calendar.getEventById('${loginUser.id}').remove();

                     var event = $('<div />')
                      event.css({
                        'background-color': '#28a745',
                        'color': '#fff'
                      }).addClass('external-event')
                      event.text('전과상담');
                      $('#external-events').prepend(event);
                  }
               }
            },
            eventReceive : function(info){
               var startDate = info.event.start;
               var endDate = info.event.end;
               
               if(startDate < new Date){
                  alert('이미지난 날짜입니다. 다시 신청해주세요');
                  info.revert();
                  return;
               }
               
               if(startDate.getDay() == 0 || startDate.getDay() == 6){
                  alert('토요일, 일요일은 상담신청이 불가능합니다');
                  info.revert();
                  return;
               }
               
               if($($('td[data-date='+timestamp(startDate).substring(0,10)+']').get(0)).find('a').length > 0){
                  alert('공휴일은 상담 신청 불가능합니다');
                  info.revert();
                  return;
               }
               
               
               var input = document.createElement("input");
               input.setAttribute('type', 'hidden');
               input.setAttribute('id', 'counsel');
                  
               input.value = timestamp(startDate).substring(0,16);
               
               document.getElementsByTagName('body')[0].append(input);
               document.querySelector('.fc-addEventButton1-button').removeAttribute('disabled');
               info.draggedEl.parentNode.removeChild(info.draggedEl);      

               document.querySelector('.fc-addEventButton3-button').removeAttribute('disabled');
            },
            //이벤트 드랍
            eventDrop: function(info) {
               if(info.id != '${loginUser.id}'){
                  return;
               }
               
               document.getElementById('counsel').value = info.event.start;
            },
               //공휴일
               googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE", // Google API KEY
               eventSources : [
               // 대한민국의 공휴일
               {
                  googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com",
                  className : "koHolidays",
                  color : "#cc0000",
                  textColor : "#FFFFFF"
               } ],
               //일정 등록
               events : [
                  <c:if test="${not empty counselList }">
                     <c:forEach var="counsel" items="${counselList }" varStatus="vs">
                     <c:if test="${vs.count > 1 }">,</c:if>
                     {
                        id : '${counsel.consl_categ_cd}',
                        title : '${counsel.consl_categ_nm}',
                        start : '<fmt:formatDate value="${counsel.counsel_date}" pattern="yyyy-MM-dd HH:mm"/>',
                        end : '',
                        content : '',
                        writer : '${counsel.student_no}',
                        backgroundColor : color[${vs.count%5}],
                        allDay : false
                     }
                     <c:if test="${not empty lectureList}">,</c:if>
                     </c:forEach>
                  </c:if>
                  <c:if test="${not empty lectureList}">
                    	<c:forEach var="lecture" items="${lectureList}" varStatus="vs">	
                    	<c:if test="${vs.count > 1 }">,</c:if>
                     {
                            id : '${lecture.classNo}',
                            title : '${lecture.className}',
                            start : '<fmt:formatDate value="${lecture.startTime}" pattern="yyyy-MM-dd HH:mm"/>',
                            end : '<fmt:formatDate value="${lecture.endTime}" pattern="yyyy-MM-dd HH:mm"/>',
                            content : '',
                            writer : '${lecture.proNo}',
                            backgroundColor : color[${vs.count%5}],
                            allDay : false
                      }                  
                    	</c:forEach>
                    </c:if>
                  ],
               locale : 'ko', //언어 한글로 바꾸기
               selectable : true, // 클릭했을때 색변환 드래그
               editable : false,
               droppable : true // this allows things to be dropped onto the calendar
            });
      calendar.setOption('height', 600);
      var slotMinTime = calendar.getOption('slotMinTime');
      var slotMaxTime = calendar.getOption('slotMaxTime');
      calendar.render();

      var containerEl = document.getElementById('external-events');
      new Draggable(containerEl, {
           itemSelector: '.external-event',
           eventData : function(eventEl){
              return {
                 title : eventEl.innerText,
                 id : '${loginUser.id}',
                 backgroundColor : window.getComputedStyle(eventEl,null).getPropertyValue('background-color'),
                 textColor : 'white',
                 duration : '01:00'
              }
           }
      });
});

window.onload=function(){
//      document.querySelector('.fc-addEventButton1-button').setAttribute('disabled', 'disabled');
//      document.querySelector('.fc-addEventButton3-button').setAttribute('disabled', 'disabled');
     
     $('.pro-select-btn').on('click', function(e){
         $('input[name=proNo]').val($(this).attr('pro_no'));
         list_go();
     });
};

</script>
</head>
<body>
   <div class="card body-card">
      <div class="card-header">
         <h4>
            <c:if test="${not empty professor }">
            ${professor.name }
         </c:if>
          교수님 상담신청
         </h4>
      </div>
      <div class="card-body">
         <div class="row">
            <div class="col-3">
               <div class="card events-card">
                  <div class="card-header">
                     <h4 class="card-title"></h4>
                  </div>
                  <div class="card-body drag-card">
                     <!-- the events -->
                     <div id="external-events">
                        <div class="external-event bg-success ui-draggable" style="position: relative;" id="my-event">전과 상담</div>
                        <div class="checkbox">
                           <label for="drop-remove"> 원하시는 날짜에 드래그 하세요 </label>
                        </div>
                     </div>

                  </div>
                  <!-- /.card-body -->
               </div>
               <!-- search professor -->
               <%--                <c:if test="${empty proList }"> --%>
               <div class="list-card card">
                  <div class="card-header with-border" style="height: 35px;">
                     <div id="keyword" class="">
                        <h5>${cmd.dept_nm }&nbsp;교수목록</h5>
                     </div>
                  </div>
                  <div class="card-body" style="text-align: center; padding-bottom: 0; padding-top: 7px; height: 220px;">
                     <div class="row">
                        <div class="input-group">
                           <!-- search bar -->
                           <!-- keyword -->
                           <input class="form-control" type="text" name="keyword" placeholder="교수명을 입력하세요." value="${cri.keyword }" style="font-size: 12px; margin-left: 80px;" />
                           <span class="input-group-append">
                              <button class="btn btn-sm btn-primary" style="height: 100%;" type="button" id="searchBtn" data-card-widget="search" onclick="list_go(1);">
                                 <i class="fa fa-fw fa-search"></i>
                              </button>
                           </span>
                           <!-- end : search bar -->
                        </div>
                        <div class="col-sm-12" style="padding: 0; margin-top: 10px; height: 240px;">
                           <table class="table table-hover table-sm" style="font-size: 12px; padding: 0;">
                              <tr>
                                 <th>교번</th>
                                 <th>교수명</th>
                                 <th>비고</th>
                              </tr>

                              <c:forEach items="${proList }" var="list">
                                 <tr>
                                    <td>${list.pro_no }</td>
                                    <td>${list.name }</td>
                                    <td>
                                       <button type="button" class="btn bg-gradient-primary btn-xs pro-select-btn" pro_no=${list.pro_no }>선택</button>
                                    </td>
                                 </tr>
                              </c:forEach>
                           </table>
                        </div>
                        <!-- col-sm-12 -->
                     </div>
                     <!-- row -->
                     <div>
                        <form id="jobForm">
                           <input type='hidden' name="page" value="" />
                           <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum }" />
                           <input type='hidden' name="searchType" value="" />
                           <input type='hidden' name="keyword" value="" />
                           <input type='hidden' name="proNo" value="" />
                           <input type='hidden' name="lectureSemester" value="202102" />
                           <input type='hidden' name="register_date" value="${cmd.register_date }" />
                           <input type='hidden' name="student_no" value="${cmd.student_no }" />
                           <input type='hidden' name="dept_nm" value="${cmd.dept_nm }" />
                        </form>
                        <!-- pagenation -->
                        <nav aria-label="Navigation">
                           <ul class="pagination justify-content-center m-0">
                              <li class="page-item">
                                 <a class="page-link" href="javascript:list_go(1);">
                                    <i class="fas fa-angle-double-left"></i>
                                 </a>
                              </li>
                              <li class="page-item">
                                 <a class="page-link" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">
                                    <i class="fas fa-angle-left"></i>
                                 </a>
                              </li>
                              <c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                                 <li class="page-item ${pageMaker.cri.page == pageNum?'active':''}">
                                    <a class="page-link" href="javascript:list_go('${pageNum}');"> ${pageNum }</a>
                                 </li>
                              </c:forEach>
                              <li class="page-item">
                                 <a class="page-link" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">
                                    <i class="fas fa-angle-right"></i>
                                 </a>
                              </li>
                              <li class="page-item">
                                 <a class="page-link" href="javascript:list_go('${pageMaker.realEndPage}');">
                                    <i class="fas fa-angle-double-right"></i>
                                 </a>
                              </li>
                           </ul>
                        </nav>
                     </div>
                  </div>
               </div>
               <%--                </c:if> --%>
            </div>
            <div class="col-9">
               <div id='calendar-container'>
                  <div id='calendar'></div>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
</html>