<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<meta name="viewport" content="width=device-width,initial-scale=1">

<c:set target="${dataMap }" value="dataMap" />
<c:set var="stuInfo" value="${dataMap.stuInfo }" />
<c:set var="semester" value="${semester }" />

<head>
<style>

.callout.callout-info {
    border-left-color:#2A5F9E;;
}

.cardShadow{
box-shadow: 3px 3px 6px grey;
}

.table-responsive {
    display: block;
    height: 230px;
    width: 100%;
    overflow-x: auto;
    -webkit-overflow-scrolling: touch;
}
</style>
</head>


<title >수강신청</title>

<body>
<div class="card card-outline">
	<div class="card-header">
		<h5 style="font-weight: bold; display: inline-block;">수강신청</h5>
		<button type="button" class="btn btn-sm btnBlue text-white" id="" onclick="OpenWindow('list/exSugangList','','990','640');" style="float:right; height: 31px;">수강이력</button>
	</div>
	
	<div class="card-body">

		<div class="row">
			<div class="form-group col-10">
				<div class="callout callout-info">
					<div class="row" style="height: 72px;">

						<div class="form-group col-3">
							<label for="">개설학과</label>
							<div class="row">
								<div class="input-group input-group-mb-3" style="width: 250px;">
									<input id="searchDept" value="${dataMap.dept}" type="text" name="table_search searchDept" class="form-control float-right select-dept" placeholder="Search">
									<div class="input-group-append">
										<button type="submit" class="btn btn-default" onclick="OpenWindow('<%=request.getContextPath()%>/search/department','학과검색','700','780');">
											<i class="fas fa-search" aria-hidden="true"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group col-2">
							<label for="">학년</label>
							<select class="form-control" name="searchYear" id="searchYear">
								<option value="" ${cmd.searchYear eq '' ? 'selected' : ''}>학년</option>
								<option value="1" ${cmd.searchYear eq '1' ? 'selected' : ''}>1학년</option>
								<option value="2" ${cmd.searchYear eq '2' ? 'selected' : ''}>2학년</option>
								<option value="3" ${cmd.searchYear eq '3' ? 'selected' : ''}>3학년</option>
								<option value="4" ${cmd.searchYear eq '4' ? 'selected' : ''}>4학년</option>
							</select>
						</div>
						<div class="form-group col-2">
							<label for="">이수구분</label>
							<!-- <input type="text" class="form-control read-only" readOnly value=""/> -->
							<select class="form-control" name="searchClassType" id="searchClassType">
								<option value="" ${cmd.searchClassType eq '' ? 'selected' : ''}>구분</option>
								<option value="mn" ${cmd.searchClassType eq 'mn' ? 'selected' : ''}>전필</option>
								<option value="mc" ${cmd.searchClassType eq 'mc' ? 'selected' : ''}>전선</option>
								<option value="cn" ${cmd.searchClassType eq 'cn' ? 'selected' : ''}>교필</option>
								<option value="cc" ${cmd.searchClassType eq 'cc' ? 'selected' : ''}>교선</option>
							</select>
						</div>

						<div class="form-group col-3">
							<label for="">교과목명</label>
							<div class="row">
								<div class="input-group input-group-mb-3" name="searchClassName" style="width: 250px;">
									<input id="searchClassName" value="" type="text" name="table_search" class="form-control float-right" placeholder="Search">
								</div>
							</div>
						</div>

						<div class="form-group col-2">
							<label for="">&nbsp;</label>
							<div class="row">
								<button id="leaveApplyBtn" type="button" class="btn btn-sm text-white" style="background-color:#2A5F9E; width: 110px; height:38px; margin: auto;" onclick="gaesulSearchList(1);">검색</button>
							</div>
						</div>

					</div>

				</div>
			</div>

			<div class="form-group col-2">
				<div class="callout callout-info ">
					<span style="font-weight: bold;">2022년도 1학기</span>

					<h3>
						<span style="color: #2A5F9E; font-weight:bold; " id="score"></span> /21학점
					</h3>
				</div>
			</div>
		</div> <!-- row -->
      
      
		
		<div class="card">
			<div class="card-header" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
					<h3 class="card-title">개설강의 리스트</h3>
					<button type="button" class="btn btn-xs btnBlue text-white" id="" onclick="gaesulSearchList2(1);" style="float:right; width:28px; height: 24px;  "><i class="fas fa-redo"></i></button>
				<div class="card-tools">
				</div>
			</div>
			<!-- /.card-header -->
			<div class="card-body table-responsive p-0">
				<table class="table table-hover table-sm" style="font-size: 15px;">
					<thead>
						<tr style="text-align: center;">
							<th>학수번호</th>
							<th style="width:25%">교과목명</th>
							<th>이수구분</th>
							<th>학년</th>
							<th>학점</th>
							<th>강의시간</th>
							<th>신청인원/정원</th>
							<th>강의상세</th>
							<th>수강신청</th>
							<th>보관함</th>
						</tr>
					</thead>
					<tbody class="gaesul_total_table" style="text-align: center;">

					</tbody>
				</table>
			</div>
			<!-- /.card-body -->
			<div class="card-footer gaesul_total_table-footer clearfix" style="background-color: #fff;"></div>
		
		</div><!-- card -->
		
		
			<div class=row>
			
				<div class="form-group col-6" style="margin-top:15px;">
					<div class="card" style="height: 320px;">
						<div class="card-header" style="border-bottom-width: 3px; height:48px; border-bottom-color: #2A5F9E">
							<h3 class="card-title">보관함</h3>
						</div>
						<!-- /.card-header -->
						<div class="card-body table-responsive p-0">
							<table class="table table-hover table-sm">
								<thead>
									<colgroup>
										<col width="40%">								
										<col width="15%">								
										<col width="15%">								
										<col width="15%">								
										<col width="15%">								
									</colgroup>
									<tr style="text-align: center;">
										<th>교과목명</th>
										<th>강의시간</th>
										<th>신청인원</th>
										<th>수강신청</th>
										<th>취소</th>
									</tr>
								</thead>
								<tbody class="gaesul_boguan_table">
								
								</tbody>
							</table>
						</div>
						<!-- /.card-body -->
						<div class="card-footer boguan_table-footer clearfix" style="background-color: #fff;"></div>
					</div>
				</div>

				<div class="form-group col-6" style="margin-top:15px;">
					<div class="card" style="height: 320px;">
						<div class="card-header" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E; ">
							<h3 class="card-title">수강신청내역</h3>
							<button type="button" class="btn btn-xs btnGray text-white" id="" onclick="OpenWindow('list/timeTable2?student_no=${loginUser.id}','시간표','700','780');" style="float:right; height: 23px; position: ">시간표</button>
						</div>
						<!-- /.card-header -->
						<div class="card-body table-responsive p-0">
							<table class="table table-hover table-sm"">
								<thead>
									<colgroup>
										<col width="40%">								
										<col width="20%">								
										<col width="20%">								
										<col width="15">								
									</colgroup>
									<tr style="text-align: center;">
										<th>교과목명</th>
										<th>강의시간</th>
										<th>신청인원</th>
										<th>취소</th>
									</tr>
								</thead>
								<tbody class="sugangApplySuccess_table">

								</tbody>
							</table>
						</div>
						<!-- /.card-body -->
						<div class="card-footer sugangApplySuccess-footer btnBlue text-white" style="background-color: #fff;"></div>
					</div>
				</div>
			</div><!-- row -->
			
			
			

	</div><!-- card body -->
</div><!-- card-outline -->



<script>
var outListPage = 1;

var searchType = "";
var keyword = "";
var data = "";

var searchDept = "" 
var searchYear = ""    
var searchClassType = ""
var searchClassName = ""

var gaesulPage = "";
var boguanPage ="";
var sugangApplyPage = "";

function gaesulSearchList2(page,searchYear){
	
	gaesulPage = page;
	if(!page) gaesulPage = 1;
	
	document.getElementById('searchDept').value = '멀티미디어학과';
	document.getElementById('searchYear').value = "";
	document.getElementById('searchClassType').value = "";
	document.getElementById('searchClassName').value = "";
	searchDept = "멀티미디어학과";
	
	/* alert(dept_no);
	alert(searchYear);
	alert(searchClassType);
	alert(searchClassName); */
	
	data = {"page" : gaesulPage , "searchDept" : searchDept , "searchYear" : searchYear, 
			"searchClassType" : searchClassType, "searchClassName" : searchClassName,
	};
	
	  $.ajax({
			url : '<%=request.getContextPath()%>/sugang/list_search',
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8",
			type : 'post',
			dataType : "json",
			success : function(data) {
				printData(data.lectureList, '.gaesul_total_table','#gaesul_total_list', '.gaesul_total_body');
				printPagination(data.pageMaker, '.gaesul_total_table-footer','#gaesulTotal-pagination-template', '.pagination');
			},
			error : function(error) {
				console.log(error);
			}

		});
}


function gaesulSearchList(page,searchYear){
	
	gaesulPage = page;
	if(!page) gaesulPage = 1;
	
	searchDept = document.getElementById('searchDept').value;
	searchYear = document.getElementById('searchYear').value;
	searchClassType = document.getElementById('searchClassType').value;
	searchClassName = document.getElementById('searchClassName').value;
	
	/* alert(dept_no);
	alert(searchYear);
	alert(searchClassType);
	alert(searchClassName); */
	
	data = {"page" : gaesulPage , "searchDept" : searchDept , "searchYear" : searchYear, 
			"searchClassType" : searchClassType, "searchClassName" : searchClassName,
	};
	
	  $.ajax({
			url : '<%=request.getContextPath()%>/sugang/list_search',
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8",
			type : 'post',
			dataType : "json",
			success : function(data) {
				printData(data.lectureList, '.gaesul_total_table','#gaesul_total_list', '.gaesul_total_body');
				printPagination(data.pageMaker, '.gaesul_total_table-footer','#gaesulTotal-pagination-template', '.pagination');
			},
			error : function(error) {
				console.log(error);
			}

		});
}

function boguanList(page){
	
	boguanPage = page;
	if(!page) boguanPage = 1;
	
	data={"page" : boguanPage};

	  $.ajax({
			url : '<%=request.getContextPath()%>/sugang/boguanList',
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8",
			type : 'post',
			dataType : "json",
			success : function(data) {
				console.log(data);
				printData(data.boguanList, '.gaesul_boguan_table','#boguan_list', '.boguan_list_body');
				printPagination(data.pageMaker, '.boguan_table-footer','#boguan-pagination-template', '.pagination');
				
			},
			error : function(error) {
				console.log(error);
			}

		});
}

function sugangApplySuccessList(page){
	sugangApplyPage = page;
	if(!page) sugangApplyPage = 1;
	
	data={"page" : sugangApplyPage};
	
	  $.ajax({
			url : '<%=request.getContextPath()%>/sugang/sugangApplySuccessList',
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8",
			type : 'post',
			dataType : "json",
			success : function(data) {
				printData(data.sugangList, '.sugangApplySuccess_table','#sugangApplySuccess_list', '.sugangApplySuccess_list_body');
				printPagination(data.pageMaker, '.sugangApplySuccess-footer','#sugangApplySuccess-pagination-template', '.pagination');
				
				
				// 수강신청학점 계산
				$('#score').text(data.applyGrade);
			},
			error : function(error) {
				console.log(error);
			}
		});
}

function registLectureList(param, apply_li){
	
	apply_li = apply_li.substring(2);
	
	data = 	{	
				"student_no" : ${loginUser.id},
				"class_no" : param,
				"personnel"	: apply_li
			};
	
	  $.ajax({
			url : '<%=request.getContextPath()%>/sugang/registLecture',
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8",
			type : 'post',
			dataType : "json",
			success : function(data) {
				confirm(' '+data.message);
				
				if(data.check == "OK") {
					gaesulSearchList(); 
					sugangApplySuccessList();
				}
				
				
			},
			error : function(error) {
				console.log(error);
			}

		});
}

function updateBoguanToSugangSuccess(param, apply_situation){
	apply_situation = apply_situation.substring(2);
	data = 	{	
				"student_no" : ${loginUser.id},
				"class_no" : param,
				"personnel" : apply_situation
			};
	
	  $.ajax({
			url : '<%=request.getContextPath()%>/sugang/updateBoguanToSugangSuccess',
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8",
			type : 'post',
			dataType : "json",
			success : function(data) {
				
				confirm(' '+data.message);
				gaesulSearchList(gaesulPage); 
				sugangApplySuccessList(sugangApplyPage)
				boguanList(boguanPage);
			},
			error : function(error) {
				console.log(error);
			}

		});
}

function registBoguanList(param){
	data = 	{	
				"student_no" : ${loginUser.id},
				"class_no" : param
			};
	
	  $.ajax({
			url : '<%=request.getContextPath()%>/sugang/registBoguan',
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8",
			type : 'post',
			dataType : "json",
			success : function(data) {
				
				confirm(' '+data.message);
				gaesulSearchList(gaesulPage); 
				boguanList();
			},
			error : function(error) {
				console.log(error);
			}

		});
}

function removeBoguan(param){
	data = 	{	
				"student_no" : ${loginUser.id},
				"class_no" : param
			};
	
	  $.ajax({
			url : '<%=request.getContextPath()%>/sugang/removeBoguan',
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8",
			type : 'post',
			dataType : "json",
			success : function(data) {
				alert(' '+data.message);
				gaesulSearchList(gaesulPage); 
				boguanList(boguanPage);
			},
			error : function(error) {
				console.log(error);
			}

		});
}


function removeSugangSuccess(param){
	data = 	{	
				"student_no" : ${loginUser.id},
				"class_no" : param
			};

	if(confirm("정말 취소하시겠습니까?")) {

	  $.ajax({
			url : '<%=request.getContextPath()%>/sugang/removeSugangSuccess',
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8",
			type : 'post',
			dataType : "json",
			success : function(data) {
				alert(' '+data.message);
				gaesulSearchList(1); 
				boguanList(1);
				sugangApplySuccessList();
				
			},
			error : function(error) {
				console.log(error);
			}

		});
	  
	} else {
		return;
	}
	
}

</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script id="gaesul_total_list" type="text/x-handlebars-template">
{{#each .}}
			<tr class="gaesul_total_body" style="text-align: center;">
				<td>{{class_no_li}}</td>
				<td>{{class_name_li}}</td>
				<td>{{class_type_li}}</td>
				<td>{{class_year_li}}</td>
				<td>{{class_grade_li}}</td>
				<td>{{class_day_li}}</td>
				<td>{{class_apply_li}}</td>
				<td><button type="button" onclick="OpenWindow('list/lectureDetail?class_no={{class_no_li}}','상세보기','700','780');" class="btn btn-xs text-white" style="background-color:#666666;">상세보기</button></td>
				<td><button type="button" onclick="registLectureList('{{class_no_li}}', '{{class_apply_li}}');" class="btn btnblue btn-xs text-white" style="background-color:#2A5F9E;">신청</button></td>
				<td><button type="button" onclick="registBoguanList('{{class_no_li}}');" class="btn btn-xs text-white" style="background-color:#005c42;">담기</button></td>
			</tr>
{{/each}}
</script>

<script id="boguan_list" type="text/x-handlebars-template">

{{#if this}}
	{{#each .}}
				<tr class="boguan_list_body" style="text-align: center;">
					<td>{{class_name}}</td>
					<td>{{class_day}}</td>
					<td>{{apply_situation}}</td>
					<td><button type="button" onclick="updateBoguanToSugangSuccess('{{class_no}}','{{apply_situation}}');" class="btn btn-xs text-white" style="background-color:#2A5F9E;">신청</button></td>
					<td><button type="button" onclick="removeBoguan('{{class_no}}');" class="btn btnRed btn-xs text-white" style="background-color:#B94040;">취소</button></td>
				</tr>
	{{/each}}
{{else}}
				<tr class="boguan_list_body">
					<td colspan="5" style="text-align:center; "><br><i class="fas fa-exclamation-triangle" ></<i><br><br>담은 강의가 없습니다.</td>
				</tr>
{{/if}}

</script>

<script id="sugangApplySuccess_list" type="text/x-handlebars-template">

{{#if this}}
	{{#each .}}
				<tr class="sugangApplySuccess_list_body" style="text-align: center;">
					<td>{{class_name}}</td>
					<td>{{class_day}}</td>
					<td>{{apply_situation}}</td>
					<td><button type="button" onclick="removeSugangSuccess('{{class_no}}');" class="modifybtn btn btnRed text-white btn-xs" style="height: 21px;">취소</button></td>
				</tr>
	{{/each}}
{{else}}
				<tr class="sugangApplySuccess_list_body">
					<td colspan="5" style="text-align:center; "><br><i class="fas fa-exclamation-triangle" ></<i><br><br>수강신청 내역이 없습니다.</td>
				</tr>
{{/if}}

</script>


<script type="text/x-handlebars-template" id="gaesulTotal-pagination-template">
<ul class="pagination pagination-sm justify-content-center m-0">
   <li class="paginate_button page-item">
      <a href="javascript:gaesulSearchList(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-left'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="{{#if prev}}javascript:gaesulSearchList({{prevPageNum}}){{else}}javascript:gaesulSearchList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-left'></i>
      </a>
   </li>

   {{#each pageNum}}
   <li class="paginate_button page-item {{gaesulPageActive this}} ">
      <a href="javascript:gaesulSearchList({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         {{this}}
      </a>
   </li>
   {{/each}}

   <li class="paginate_button page-item ">
      <a href="{{#if next}}javascript:gaesulSearchList({{nextPageNum}}){{else}}javascript:gaesulSearchList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-right'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="javascript:gaesulSearchList({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-right'></i>
      </a>
   </li>
</ul>
</script>

<script type="text/x-handlebars-template" id="boguan-pagination-template">
<ul class="pagination pagination-sm justify-content-center m-0">
   <li class="paginate_button page-item">
      <a href="javascript:boguanList(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-left'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="{{#if prev}}javascript:boguanList({{prevPageNum}}){{else}}javascript:boguanList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-left'></i>
      </a>
   </li>

   {{#each pageNum}}
   <li class="paginate_button page-item {{boguanPageActive this}} ">
      <a href="javascript:boguanList({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         {{this}}
      </a>
   </li>
   {{/each}}

   <li class="paginate_button page-item ">
      <a href="{{#if next}}javascript:boguanList({{nextPageNum}}){{else}}javascript:boguanList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-right'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="javascript:boguanList({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-right'></i>
      </a>
   </li>
</ul>
</script>

<script type="text/x-handlebars-template" id="sugangApplySuccess-pagination-template">
<ul class="pagination pagination-sm justify-content-center m-0">
   <li class="paginate_button page-item">
      <a href="javascript:sugangApplySuccessList(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-left'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="{{#if prev}}javascript:sugangApplySuccessList({{prevPageNum}}){{else}}javascript:sugangApplySuccessList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-left'></i>
      </a>
   </li>

   {{#each pageNum}}
   <li class="paginate_button page-item {{sugangApplyPageActive this}} ">
      <a href="javascript:sugangApplySuccessList({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         {{this}}
      </a>
   </li>
   {{/each}}

   <li class="paginate_button page-item ">
      <a href="{{#if next}}javascript:sugangApplySuccessList({{nextPageNum}}){{else}}javascript:sugangApplySuccessList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-right'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="javascript:sugangApplySuccessList({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-right'></i>
      </a>
   </li>
</ul>
</script>
<script>
 	window.onload = function() {

 		gaesulSearchList();
	 	boguanList(boguanPage);
		sugangApplySuccessList(sugangApplyPage);	 
 		
	} 
 	

 	Handlebars.registerHelper("gaesulPageActive", function(value, options){
 		if(value == gaesulPage) {
 			return "active";
 		}
 		
 	})
 	Handlebars.registerHelper("boguanPageActive", function(value, options){
 		if(value == boguanPage) {
 			return "active";
 		}
 		
 	})
 	Handlebars.registerHelper("sugangApplyPageActive", function(value, options){
 		if(value == sugangApplyPage) {
 			return "active";
 		}
 		
 	})

</script>




</body>



































