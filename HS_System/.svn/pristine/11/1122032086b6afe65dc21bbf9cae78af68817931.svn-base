<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <div class="card">
  <div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
        <h5 style="font-weight: bold;">복수전공 신청목록</h5>
      <div class="input-group input-group-sm" style="width:350px;float: right;">
         <select class="form-control" id="selectOut" name="selectOut" >
          <option value="">분류검색</option>
            <option value="신청완료">신청 완료</option>
            <option value="지도교수승인">지도교수승인</option>
            <option value="소속학과승인">소속학과승인</option>
            <option value="반려">반려</option>
           </select>
      <input  class="form-control" type="text" id="keywordOut" name="keywordOut" placeholder="검색어를 입력하세요." style="font-size: 14px;"/>
         <div class="input-group-append" style="float: right;">
            <button type="button" class="btn btnBlue" style="color: white;" onclick="pluralMajorOut();">검색</button>
           </div>
         </div>
  			
   </div>   
   
      
	<div class="card-body" style="height: 250px">
		<table class="table table-hover text-nowrap">
			<thead>
				<tr>
					<th>NO.</th>
					<th>학번</th>
					<th>성명</th>
					<th>지원학과</th>
					<th>처리상태</th>
					<th>상담</th>
				</tr>
			</thead>
			<tbody id="pluralMajorOut">
			</tbody>
		</table>
	</div>
		<div class="card-footer pluralMajorOutFooter"></div>
</div>

<div class="card">
	<div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
		<h5 style="font-weight: bold;">복수전공 접수목록</h5>
		<div class="input-group input-group-sm" style="width:350px;float: right;">
			   <select class="form-control" id="selectIn" name="selectIn" style="padding: 0;" >
		    	<option value="">분류검색</option>
				<option value="신청완료">신청 완료</option>
				<option value="지도교수승인">지도교수승인</option>
				<option value="소속학과승인">소속학과승인</option>
				<option value="반려">반려</option>
      	  </select><input type="text" name="keywordIn" id="keywordIn" class="form-control" placeholder="검색어를 입력하세요">
			<div class="input-group-append">
				<button type="button" class="btn btnBlue" style="color: white;" onclick="pluralMajorIn();">검색</button>
			</div>
		</div>
	</div>

	<!-- /.card-header -->
	<div class="card-body" style="height: 250px">
		<table class="table table-hover text-nowrap">
			<thead>
				<tr>
					<th>No</th>
					<th>학번</th>
					<th>성명</th>
					<th>원소속학과</th>
					<th>처리상태</th>
					<th>상담</th>
				</tr>
			</thead>
			<tbody id="pluralMajorIn">
			</tbody>
		</table>
	</div>
	<!-- /.card-body -->
	<div class="card-footer pluralMajorInFooter"></div>
</div>
<script>
var outListPage = 1;
var inListPage = 1;
var searchType = "";
var keyword = "";
var data = "";

function pluralMajorOut(page){
	outListPage = page;
	if(!page) outListPage = 1;
	
	searchType = $('#selectOut option:selected').val();
	keyword= $('#keywordOut').val();
	
	data = {"dept_nm" : '${staff.dept_nm}', 
			"searchType" : searchType, 
			"keyword" : keyword, 
			"page" : outListPage};
	
	
	$.ajax({
		url : '<%=request.getContextPath()%>/academic/pluralMajor/pluralMajorOut',
		data : JSON.stringify(data),
		type : 'POST',
		contentType : 'application/json; charset=utf-8',
		success : function(data){
			printData(data.pluralList, '#pluralMajorOut', '#pluralMajorOutList', '.pluralMajorOutBody')
			printPagination(data.pageMaker, '.pluralMajorOutFooter', '#plural-paginationOut', '.pagination' )
			console.log(data.pageMaker);
		},
		error : function(error){
			alert("신청ㅜㅜ");
		}
	
	
	});
	
}
function pluralMajorIn(page){
	inListPage = page;
	if(!page) inListPage = 1;
	
	searchType = $('#selectIn option:selected').val();
	keyword= $('#keywordIn').val();
	
	data = {"dept_nm" : '${staff.dept_nm}', 
			"searchType" : searchType, 
			"keyword" : keyword, 
			"page" : inListPage};
	$.ajax({
		url : '<%=request.getContextPath()%>/academic/pluralMajor/pluralMajorIn',
		data : JSON.stringify(data),
		type : 'POST',
		contentType : 'application/json; charset=utf-8',
		success : function(data){
			printData(data.pluralList, '#pluralMajorIn', '#pluralMajorInList', '.pluralMajorInBody')
			printPagination(data.pageMaker, '.pluralMajorInFooter', '#plural-paginationIn', '.pagination' )
		},
		error : function(error){
			alert("접수ㅜㅜ");
		}
	
	
	});
	
}
</script>
<script id="pluralMajorOutList" type="text/x-handlebars-template">
{{#if this}}
{{#each .}}
	<tr class = "pluralMajorOutBody" onclick="OpenWindow('<%=request.getContextPath()%>/academic/pluralMajor/detail?student_no={{student_no}}&id={{account_no}}','',800,700);">
		<td>{{no}}</td>
		<td>{{student_no}}</td>
		<td>{{name}}</td>
		<td>{{apply_deptnm}}</td>
		<td>{{status_nm}}</td>
		<td>{{counsel_status_nm}}</td>
	<tr>
{{/each}}
	{{else}}
			<tr class="pluralMajorOutBody">
				<td colspan="10" style="text-align:center;">내역이 존재하지 않습니다</td>
			</tr>
	{{/if}}
</script>
<script id="pluralMajorInList" type="text/x-handlebars-template">
{{#if this}}
{{#each .}}
	<tr class = "pluralMajorInBody" onclick="OpenWindow('<%=request.getContextPath()%>/academic/pluralMajor/detail?student_no={{student_no}}&id={{account_no}}','',800,700);">
		<td>{{no}}</td>
		<td>{{student_no}}</td>
		<td>{{name}}</td>
		<td>{{dept_nm}}</td>
		<td>{{status_nm}}</td>
		<td>{{counsel_status_nm}}</td>
	<tr>
{{/each}}
	{{else}}
			<tr class="pluralMajorInBody">
				<td colspan="10" style="text-align:center;">내역이 존재하지 않습니다</td>
			</tr>
	{{/if}}
</script>
<script type="text/x-handlebars-template"  id="plural-paginationOut" >
<ul class="pagination pagination-sm justify-content-center m-0">
   <li class="paginate_button page-item">
      <a href="javascript:pluralMajorOut(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-left'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="{{#if prev}}javascript:pluralMajorOut({{prevPageNum}}){{else}}javascript:pluralMajorOut(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-left'></i>
      </a>
   </li>
   {{#each pageNum}}
   <li class="paginate_button page-item {{outSignActive this}} ">
      <a href="javascript:pluralMajorOut({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         {{this}}
      </a>
   </li>
   {{/each}}

   <li class="paginate_button page-item ">
      <a href="{{#if next}}javascript:pluralMajorOut({{nextPageNum}}){{else}}javascript:pluralMajorOut(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-right'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="javascript:pluralMajorOut({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-right'></i>
      </a>
   </li>
</ul>

</script>
<script type="text/x-handlebars-template"  id="plural-paginationIn" >
<ul class="pagination pagination-sm justify-content-center m-0">
   <li class="paginate_button page-item">
      <a href="javascript:pluralMajorIn(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-left'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="{{#if prev}}javascript:pluralMajorIn({{prevPageNum}}){{else}}javascript:pluralMajorIn(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-left'></i>
      </a>
   </li>
   {{#each pageNum}}
   <li class="paginate_button page-item {{outSignActive this}} ">
      <a href="javascript:pluralMajorIn({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         {{this}}
      </a>
   </li>
   {{/each}}

   <li class="paginate_button page-item ">
      <a href="{{#if next}}javascript:pluralMajorIn({{nextPageNum}}){{else}}javascript:pluralMajorIn(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-right'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="javascript:pluralMajorIn({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-right'></i>
      </a>
   </li>
</ul>

</script>













