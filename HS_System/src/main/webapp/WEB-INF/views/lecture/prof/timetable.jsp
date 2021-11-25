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
<meta name="viewport" content="width=device-width,initial-scale=1">
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
   width : 100%;
   height : 100vh;
   margin: 20px auto;
}

/* 행 높이조절 */
.fc .fc-timegrid-slot {
    height: 5em;
    border-bottom: 0 /* each cell owns its top border */;
}

.fc-v-event .fc-event-title {
    top: 0;
    bottom: 0;
    max-height: 100%;
    overflow: hidden;
    right: 19%;
    width: 100px;
    height: 50px;
    vertical-align: middle;
    font-size: 1.4em;
    text-align: center;
    margin: auto;
}

.fc-timegrid-event .fc-event-main {
    padding: 20px 20px 20px 20px;
}

.fc-v-event .fc-event-main-frame {
    height: 100%;
    display: flex;
    flex-direction: column;
    text-align: center;
}

/* 버튼 색 변경 */
.fc-addEventButton5-button {
   background: #6c757d linear-gradient(180deg,#6c757d,#6c757d) repeat-x!important;
   color: #fff;
   border : none;
}


</style>

<script>
const color = [
   '#A26360',
   '#D4A29C',
   '#E8B298',
   '#EDCC8B',
   '#BDD1C5',
   '#9DAAA2'
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
            /* defaultDate: "2021-11-17", //default date, */
           
            initialView: 'timeGridWeek',
            slotMinTime : "09:00:00" ,//하루 시작 시간,
            slotMaxTime : "19:00:00" ,//하루 끝나는 시간,
            themeSystem : 'bootstrap',
            slotDuration : '01:00:00',//시간 출력 기준 = > 1시간별로 출력,
            dayHeaderFormat : {weekday: 'long'},
            hiddenDays: [0,6],
            contentHeight : 'auto',
            allDaySlot: false,
            datesSet : function(dateInfo){
            	console.log(dateInfo.start);
            	console.log(dateInfo.end);
            },
            headerToolbar : {
            	left : '',
            	center : '',
                right : 'addEventButton5'
             },
             customButtons : {
           	  text : {
 	                text : '2022학년 1학기 시간표',
 	             },
           	  addEventButton5 : {
                     text : '닫기',
                     click : function() {
                        window.close();
                     }
                  
               }
	          
             },
            events : [
            	
            <c:if test="${not empty profTimeTableList }">
               <c:forEach var="list" items="${profTimeTableList }" varStatus="vs">
               <c:if test="${vs.count >1 }">,</c:if>
               {
             	  id : '${list.class_no}',
                   title : '${list.title}',
                   start : '<fmt:formatDate value="${list.class_start_day}" pattern="yyyy-MM-dd HH:mm:ss"/>',
                   end : '<fmt:formatDate value="${list.class_end_day}" pattern="yyyy-MM-dd HH:mm:ss"/>',
                   
                  	<c:if test="${id1 eq list.class_no}">  	
                  
                   		backgroundColor : color[ ${bg1} ]
                  		
                  	</c:if>
                  	<c:if test="${id1 ne list.class_no}">
                  		
                  		backgroundColor : color[ ${vs.count%6} ]
                  
                  	</c:if>
     
                    
                    <c:set var="id1" value="${list.class_no}"/>
                    <c:set var="bg1" value="${vs.count%6}"/>
                                        
               }
               </c:forEach>
            </c:if>
            	
 	
                
             ],
             eventBorderColor : "white",
               locale : 'ko', //언어 한글로 바꾸기
//                selectable : true, // 클릭했을때 색변환 드래그
               editable : true,
               droppable : true // this allows things to be dropped onto the calendar
            });
   calendar.setOption('height', 600);
      calendar.render();
      console.log(calendar);
});


</script>


</head>
<body>

			<div style="padding: 20px; text-align: center;">
				<br>
				<h3 class="fc-toolbar-title" id="fc-dom-1" style="font-weight: bold;">2022년도 1학기 시간표</h3>
				<div id='calendar'></div>
			</div>
			


</body>
</html>