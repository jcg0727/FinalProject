<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<script  src='<%=request.getContextPath()%>/resources/fullCalendar/lib/locales-all.min.js'></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>  
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js" ></script>
<style>
@charset "UTF-8";

html, body {
   margin: 0;
   padding: 0;
   font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
   font-size: 14px;
}

body{
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
   background: #007bff linear-gradient(180deg,#268fff,#007bff) repeat-x!important;
    color: #fff;
}

.fc-addEventButton1-button:disabled:hover{
   cursor: not-allowed;
}

.fc-addEventButton2-button {
    color: #fff;
    background-color: #dc3545;
    border-color: #dc3545;
    box-shadow: none;
}

.fc-addEventButton2-button:hover {
    color: #fff;
    background-color: #dc3545;
    border-color: #dc3545;
    box-shadow: none;
}

.events-card{
    position: absolute;
    top: 105px;
    left: 30px;
    width: 240px;
}

.fc-addEventButton3-button{
   
}
</style>

<script>

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
	 '#A26360',
	 '#D4A29C',
     '#E8B298',
     '#EDCC8B',
     '#BDD1C5'
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
                  click : function() {
                     var data = document.getElementById('counsel').value;
                     $(opener.document).find('#transfer_counsel-date').val(data);
                        window.close();
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
               if(startDate < new Date){
                  alert('신청불가능한 날짜입니다. 다시 신청해주세요');
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
               console.log(timestamp(startDate).substring(0,16));
               
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
                     <c:if test="${vs.count >1 }">,</c:if>
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
                     </c:forEach>
                  </c:if>
                  
                  <c:if test="${not empty lectureList}">
                  	<c:forEach var="lecture" items="${lectureList}" varStatus="vs">	
                   ,{
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
               droppable : true, // this allows things to be dropped onto the calendar
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
     document.querySelector('.fc-addEventButton1-button').setAttribute('disabled', 'disabled');
     document.querySelector('.fc-addEventButton3-button').setAttribute('disabled', 'disabled');
}


</script>
</head>
<body>
<div class="card">
   <div class="card-header">
      <h4>지도교수 상담신청</h4>
   </div>
   <div class="card-body">
   <div class="row">
   <div class="col-3">
      <div class="card events-card">
           <div class="card-header">
             <h4 class="card-title"></h4>
           </div>
           <div class="card-body">
             <!-- the events -->
             <div id="external-events">
            <div class="external-event bg-success ui-draggable" style="position: relative;" id="my-event">전과 상담</div>
               <div class="checkbox">
                 <label for="drop-remove">
                   원하시는 날짜에 드래그 하세요
                 </label>
               </div>
             </div>
           </div>
          <!-- /.card-body -->
        </div>
      
   </div>
   <div class="col-9">
      <div id='calendar-container'>
         <div id='calendar'>
         </div>
      </div>
   </div>
   </div>
   </div>
</div>
</body>
</html>