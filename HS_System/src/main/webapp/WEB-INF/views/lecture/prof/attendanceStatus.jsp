<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
#chart-body {
	height: 100%;
}

.chart-div {
	margin: 0px auto;
	width: 100%;
	height: 50%;
	text-align: center;
}

.chart-body:first-child {
	margin-bottom: 20px;
}

.chart-div:nth-child(2) {
	margin-top: 40px;
}

.chart-div .col-12 {
	height: 100%;
}
</style>

<div id="chart-body">
   <div class="row chart-div">
      <div class="col-4">
         <label for="#lastWeek">저번주 출석 현황(%)</label>
         <canvas id="lastWeek"></canvas>
      </div>
      <div class="col-4">
         <label for="#thisWeek">금주 출석 현황(%)</label>
         <canvas id="thisWeek"></canvas>
      </div>
      <div class="col-4">
         <label for="#thisSemester">금학기 출석 현황(%)</label>
         <canvas id="thisSemester"></canvas>
      </div>
   </div>
   <div class="row chart-div">
      <div class="col-12">
         <label for="#attendRate">2021년 2학기 출석률(%)</label>
         <canvas id="attendRate"></canvas>
      </div>
   </div>
</div>
<script>
var target = "";
var dataset = "";
var ctx = "";
var myChart = "";
var data = "";
var arr = "";
var labels = "";
var labels2 = [];
var backgroundsColor = "";

function drawChart(){
	getAttendanceStatus();
};

function getAttendanceStatus(){
   data = {'classNo' : '${class_no}' , 'lectureSemester' : '202102'};
   
   $.ajax({
	   url : '<%=request.getContextPath()%>/professor/attendanceStatus',
		data : JSON.stringify(data),
		contentType : "application/json; charset=UTF-8",
		type : 'POST',
		success : function(data) {
      		labels = [ '결석', '출석', '지각' ];
      
      		backgroundsColor = [ '#FFBEBE', '#AFDDFA', '#FFEAD8' ]
      
      		arr = parseArray(data.thisSemester);
      		printChart(arr, 'thisSemester', 'doughnut', labels,backgroundsColor);
      
      		arr = parseArray(data.thisWeek);
      		alert(data.thisWeek.todayCount+'\n'+ data.thisWeek.attenCount+'\n'+data.thisWeek.tardyCount)
      		printChart(arr, 'thisWeek', 'doughnut', labels,backgroundsColor);
      
      		arr = parseArray(data.lastWeek);
      		printChart(arr, 'lastWeek', 'doughnut', labels, backgroundsColor);
      
      		data = data.attendRate;
      
      		var arrData = [];
      
      		var length = parseInt(data[0].todayCount);
      
      		for (var i = 0; i < length; i++) {
      			labels2[i] = data[i].week + '주차';
      			arrData[i] = data[i].attenCount;
      		}
      
      		backgroundsColor = '#007bff;';
      		printChart(arrData, 'attendRate', 'line', labels2, backgroundsColor);
      	},
      	error : function(error) {

		}
	});
};

function parseArray(data) {
	JSON.stringify(data);
	var total = parseInt(data.totalCount);
	var today = parseInt(data.todayCount);
	var atten = parseInt(data.attenCount);
	var tardy = parseInt(data.tardyCount);
	
	var parseArr = [ calcPercent(today, (today - atten)),calcPercent(today, (atten - tardy)), calcPercent(today, tardy) ]

	return parseArr;
}

function calcPercent(total, data) {
	return Math.floor(data / total * 100);
}

function printChart(data, target, type, labels, backgroundsColor) {
	var canvas = document.getElementById(target);
	var ctx = canvas.getContext('2d');

	dataset = {
		labels : labels,
		datasets : [ {
			label : '출석',
			data : data,
			backgroundColor : backgroundsColor,
			hoverOffset : 4
		} ],
		maintainAspectRatio : false
	};

	myChart = new Chart(ctx, {
		type : type,
		data : dataset,
		options : {
			plugins : {
				legend : {
					display : true,
					labels : {
						boxWidth : 20
					}
				}
			}
		}
	});
};
</script>