<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
#custom-tabs-three-transfer .card{
   height: 40vh;
}

#custom-tabs-three-transfer .In-card {
	margin : 0;
}
</style>

<div class="card">
   <div class="card-header with-border transferOut-card" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
      <h5 style="font-weight: bold;">전출 신청 내역</h5>
      <div class="input-group input-group-sm">
         <select class="form-control" id="transferOut-select" name="transferOut-select">
            <option value="">분류검색</option>
            <option value="CCDH001">신청 완료</option>
            <option value="CCDH002">지도교수 승인</option>
            <option value="CCDH003">소속학과 승인</option>
            <option value="CCDH006">반려</option>
         </select>
         <input type="text" name="table_search" class="form-control" placeholder="학생명을 입력하세요" id="transferOut-keyword">
         <div class="input-group-append">
            <button type="button" class="btn btnBlue btn-sm text-white" style="background-color:#2A5F9E;" id="search-transfer-btn" onclick="transferOutList();">검색</button>
         </div>
      </div>
   </div>

   <!-- /.card-header -->
   <div class="card-body transferOut-card-body table-responsive p-0">
      <table class="table table-hover text-nowrap transferOut-table">
         <thead>
            <tr>
               <th>No</th>
               <th>학번</th>
               <th>성명</th>
               <th>원소속학과</th>
               <th>지원학과</th>
               <th>상태</th>
            </tr>
         </thead>
         <tbody id="transferOut-table-body">
         </tbody>
      </table>
   </div>
   <!-- /.card-body -->
   <div class="card-footer transferOut-footer clearfix"></div>
</div>
<div class="card In-card">
   <div class="card-header transferIn-card with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
      <h5 style="font-weight: bold;">전입 신청 내역</h5>
      <div class="input-group input-group-sm">
         <select class="form-control" id="transferIn-select" name="transferIn-select">
            <option value="">분류검색</option>
            <option value="CCDH003">소속학과 승인</option>
            <option value="CCDH004">지원학과 교수승인</option>
            <option value="CCDH005">지원학과 승인</option>
            <option value="CCDH006">반려</option>
         </select>
         <input type="text" name="table_search" class="form-control" placeholder="학생명을 입력하세요" id="transferIn-keyword">
         <div class="input-group-append">
            <button type="button" class="btn btnBlue btn-sm text-white" style="background-color:#2A5F9E;" onclick="transferInList();">검색</button>
         </div>
      </div>
   </div>
   <!-- /.card-header -->
   <div class="card-body transferIn-card-body table-responsive p-0">
      <table class="table table-hover text-nowrap transferIn-table">
         <thead>
            <tr>
               <th>No</th>
               <th>학번</th>
               <th>성명</th>
               <th>원소속학과</th>
               <th>지원학과</th>
               <th>상태</th>
               <th style="width: 106.8px;">비고</th>
            </tr>
         </thead>
         <tbody id="transferIn-table-body">
         </tbody>
      </table>
   </div>
   <!-- /.card-body -->
   <div class="card-footer transferIn-footer clearfix"></div>
</div>

<script>
var outListPage = 1;
var inListPage = 1;
var searchType = "";
var keyword = "";
var data = "";

var register_date = "";
var dept_nm = ""; 
var student_no = "";

function transferInList(page){
   inListPage = page;
   
   if(!page) inListPage = 1;  
   
   searchType = $('#transferIn-select option:selected').val();
   keyword = $('#transferIn-keyword').val();
      
   data = {"dept_cd" : '${staff.dept_cd}', "searchType" : searchType, "keyword" : keyword, "page" : inListPage};
   
   $.ajax({
      url : '<%=request.getContextPath()%>/academic/transferIn/list',
      data : JSON.stringify(data),
      type : 'POST',
      contentType: 'application/json; charset=utf-8',
      success: function(data){
         printData(data.deptChangeList, '#transferIn-table-body', '#department-transferIn-list', '.transferIn-body')
         printPagination(data.pageMaker, '.transferIn-footer', '#transferIn-pagination-template', '.pagination')
      },
      error : function(request,status,error){
         alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
      }
   })
}
function transferOutList(page){
   
   outListPage = page;
   
   if(!page) outListPage = 1; 
   
   searchType = $('#transferOut-select option:selected').val();
   keyword = $('#transferOut-keyword').val();
      
   data = {"dept_cd" : '${staff.dept_cd}', "searchType" : searchType, "keyword" : keyword, "page" : outListPage};
   
   
   $.ajax({
      url : '<%=request.getContextPath()%>/academic/transferOut/list',
      data : JSON.stringify(data),
      type : 'POST',
      contentType: 'application/json; charset=utf-8',
      success: function(data){
         printData(data.deptChangeList, '#transferOut-table-body', '#department-transferOut-list', '.transferOut-body')
         printPagination(data.pageMaker, '.transferOut-footer', '#transferOut-pagination-template', '.pagination')
      },
      error:function(request,status,error){
           alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
   })
}
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>
<script id="department-transferOut-list" type="text/x-handlebars-template">
{{#each .}}
   <tr class = "transferOut-body" onclick="OpenWindow('<%=request.getContextPath()%>/academic/transfer/detail?student_no={{student_no}}&register_date={{register_date}}','전출신청내역','800','700')">
      <td>{{no}}</td>
      <td>{{student_no}}</td>
      <td>{{student_nm}}</td>
      <td>{{belong_dept_nm}}</td>
      <td>{{apply_dept_nm}}</td>
      <td>{{status_nm}}</td>
   <tr>
{{/each}}
</script>

<script id="department-transferIn-list" type="text/x-handlebars-template">
{{#each .}}
   <tr class = "transferIn-body" student_no={{student_no}} register_date={{register_date}}>
      <td>{{no}}</td>
      <td>{{student_no}}</td>
      <td>{{student_nm}}</td>
      <td>{{belong_dept_nm}}</td>
      <td>{{apply_dept_nm}}</td>
      <td>{{status_nm}}</td>
      <td>
      {{#ifEquals status_nm "소속학과승인"}}
         {{#ifEquals counsel_status_nm "완료"}}
			<button type="button" class="counsel-set btn bg-gradient-primary btn-xs" style="height: 21px;" dept_nm={{apply_dept_nm}} student_no={{student_no}} register_date={{register_date}}>상담배정</button>
         {{else ifEquals counsel_status_nm "대기"}}
			<button type="button" class="btn bg-gradient-secondary btn-xs" style="height: 21px;">상담진행</button>
         {{else ifEquals counsel_status_nm "수락"}}
			<button type="button" class="btn bg-gradient-secondary btn-xs" style="height: 21px;">상담진행</button>
         {{else ifEquals counsel_status_nm "거절"}}
			<button type="button" class="counsel-set btn bg-gradient-danger btn-xs" style="height: 21px;">상담재배정</button>
         {{/ifEquals}}
      {{else ifEquals status_nm "지원학과교수승인"}}
         {{#ifEquals counsel_status_nm "완료"}}
			<button type="button" class="btn bg-gradient-success btn-xs" style="height: 21px;">상담완료</button>
         {{/ifEquals}}        
      {{else ifEquals status_nm "지원학과승인"}}
			<button type="button" class="advisor-set btn bg-gradient-info btn-xs" style="height: 21px;" dept_nm="{{apply_dept_nm}}" student_no="{{student_no}}">지도교수배정</button>
      {{/ifEquals}}
      </td>
   <tr>
{{/each}}
</script>

<script type="text/x-handlebars-template" id="transferOut-pagination-template">
<ul class="pagination pagination-sm justify-content-center m-0">
   <li class="paginate_button page-item">
      <a href="javascript:transferOutList(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-left'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="{{#if prev}}javascript:transferOutList({{prevPageNum}}){{else}}javascript:transferOutList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-left'></i>
      </a>
   </li>
   {{#each pageNum}}
   <li class="paginate_button page-item {{outSignActive this}} ">
      <a href="javascript:transferOutList({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         {{this}}
      </a>
   </li>
   {{/each}}

   <li class="paginate_button page-item ">
      <a href="{{#if next}}javascript:transferOutList({{nextPageNum}}){{else}}javascript:transferOutList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-right'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="javascript:transferOutList({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-right'></i>
      </a>
   </li>
</ul>
</script>
<script type="text/x-handlebars-template" id="transferIn-pagination-template">
<ul class="pagination pagination-sm justify-content-center m-0">
   <li class="paginate_button page-item">
      <a href="javascript:transferInList(1)" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-left'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="{{#if prev}}javascript:transferInList({{prevPageNum}}){{else}}javascript:transferInList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-left'></i>
      </a>
   </li>
   {{#each pageNum}}
   <li class="paginate_button page-item {{inSignActive this}} ">
      <a href="javascript:transferInList({{this}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         {{this}}
      </a>
   </li>
   {{/each}}

   <li class="paginate_button page-item ">
      <a href="{{#if next}}javascript:transferInList({{nextPageNum}}){{else}}javascript:transferInList(1){{/if}}" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-right'></i>
      </a>
   </li>
   <li class="paginate_button page-item">
      <a href="javascript:transferInList({{realEndPage}})" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">
         <i class='fas fa-angle-double-right'></i>
      </a>
   </li>
</ul>
</script>
<%@include file="../../include/js.jsp"%>

