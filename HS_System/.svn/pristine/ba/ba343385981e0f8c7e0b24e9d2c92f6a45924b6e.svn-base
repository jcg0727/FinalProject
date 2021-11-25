<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>


</style>

<body>
 <div class="card card-outline">
 	<div class="card-header">
		<h3 class="card-title">2021년도 2학기 강의목록</h3>
	</div>
	
		<div class="card-body"> <!-- outline body -->
	
			<div class="card">
				<div class="card-header">
					<h3 class="card-title">강의목록</h3>
					<button type="button" class="btn btn-xs btnGray text-white" id="" onclick="OpenWindow('management_prof/timetable?pro_no=${loginUser.id}','시간표','700','780');" style="float:right; height: 23px; position: ">시간표</button>
				</div>
				
			
			<div class="card-body"> <!-- card body -->

					<div class="row">



					<c:forEach items="${lectureList_prof}" var="list" begin="0" end="2">
							<div class="col-sm-4">
								<div class="position-relative p-3 lectureCard" style="height: 150px; background-color: #f7f7f7;">
									<div class="ribbon-wrapper">
										<div class="ribbon ribbonColor text-white" style="background-color: #2A5F9E;">${list.class_type}</div>
									</div>
									<!-- <h5 class="font-weight:normal;">C++ 프로그래밍</h5> <br><br> -->
									<h5 class="font-weight:normal;">${list.class_name}</h5>
									<br>
									<br> 강의시간 : ${list.class_day}
									<button type="button" class="btn btn-sm btnGray text-white" id="" onclick="lectureDetailGo('${list.class_no}');" style="height: 31px; margin: center; float: right;">수업하기</button>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- row -->

					<br>
					
					<div class="row">


					<c:forEach items="${lectureList_prof}" var="list" begin="3" end="5">
							<div class="col-sm-4">
								<div class="position-relative p-3 lectureCard" style="height: 150px; background-color: #f7f7f7;">
									<div class="ribbon-wrapper">
										<div class="ribbon ribbonColor text-white" style="background-color: #2A5F9E;">${list.class_type}</div>
									</div>
									<!-- <h5 class="font-weight:normal;">C++ 프로그래밍</h5> <br><br> -->
									<h5 class="font-weight:normal;">${list.class_name}</h5>
									<br>
									<br> 강의시간 : ${list.class_day}
									<button type="button" class="btn btn-sm btnGray text-white" onclick="lectureDetailGo('${list.class_no}');"style="height: 31px; margin: center; float: right;">수업하기</button>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- row -->					
                
              </div> <!-- card body -->
					
				
				</div><!-- card -->

			
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">금주 강의 리스트</h3>
					</div>
					<div class="card-body" style="height: 220px;">
				
						<div class="row">
	
							<table id="lectureListOftheWeekTable" class="table" style="text-align: center;">
							
								<thead>
									<colgroup>
										<col width="15%">								
										<col width="23%">								
										<col width="23%">								
										<col width="23%">								
										<col width="15%">								
									</colgroup>
									<tr>
										<th>주</th>
										<th>수업주제</th>
										<th>강의시간</th>
										<th>출석률</th>
										<th>출석</th>
									</tr>
								</thead>
								<tbody class="lectureListOftheWeekTable" style="">
										<tr class="lectureWeekListBody">
											<td colspan="5" style="text-align:center; "><br><i class="fas fa-exclamation-triangle" ></<i><br><br>'수업하기' 버튼을 클릭하세요.</td>
										</tr>							
								</tbody>
							</table>
	
							</div><!-- row -->
					</div> <!-- card-body -->
				</div><!-- card -->	
			
		</div> <!-- card-body -->
	
</div>

 

 <script>

function lectureDetailGo(data) {
	
	var class_no = data
	//alert(class_no);
	
	data = {
			"class_no" : class_no,
			"pro_no" : "${loginUser.id}"
	};
	
	  $.ajax({
			url : '<%=request.getContextPath()%>/lecture/management_prof/lectureDetail',
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8",
			type : 'post',
			dataType : "json",
			success : function(data) {
			printData(data.lectureDetailProf,'.lectureListOftheWeekTable','#lectureWeekList','.lectureWeekListBody');
				
			},
			error : function(error) {
				console.log(error);
			}

		});
}

function lectureDetailByClassNo(){
}
</script>
 
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script id="lectureWeekList" type="text/x-handlebars-template">

{{#if this}}
{{#each .}}
			<tr class="lectureWeekListBody style="text-align: center;">
				<td>12주차</td>
				<td>{{class_content}}</td>
				<td>{{class_day}}</td>
				<td style="vertical-align: inherit;">
						<div class="progress progress-xs">
							<div class="progress-bar progress-bar-danger" style="width: 0%; background-color: #2A5F9E;"></div>
						</div>
				</td>
				<td><button type="button" class="btn btn-sm btnBlue text-white" id="" onclick="OpenWindow('management_prof/attendanceCheckForm?class_no={{'class_no'}}','출석','1000','800');" style="height: 31px; margin: center;">출석</button></td>
			</tr>
{{/each}}
{{else}}
			<tr class="lectureWeekListBody">
				<td colspan="5" style="text-align:center;">'수업하기' 버튼을 클릭하세요.</td>
			</tr>
{{/if}}




</script> 



</body>














