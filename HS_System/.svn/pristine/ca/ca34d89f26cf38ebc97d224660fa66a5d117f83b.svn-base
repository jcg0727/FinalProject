<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${dataMap.pageMaker.cri }" />
<c:set var="proList" value="${dataMap.proList }" />
    
    
<div class="col-12" id="">
	  <br>
	<div class="card"  style="border: 1px solid lightblue">
	  <div class="card-header" styl>
	    <h5 class="card-title m-0">개설 강의 목록</h5>
	  </div>
	  
	  <div class="card-body" style="min-height: 520px;">
	  
	  <table class="table table-hover table-sm" style="font-size: 15px; text-align: center;">
	  		
	  		<div class="input-group row" style="float: right; width: 250px;">
						<select class="form-control col-md-4" name="searchType" id="searchType" >
							<option value="all"  ${cri.searchType eq 'all' ? 'selected':'' }>전체</option>
							<option value="pronm"  ${cri.searchType eq 'pronm' ? 'selected':'' }>교수명</option>
							<option value="prono" ${cri.searchType eq 'prono' ? 'selected':'' }>교 번</option>

						</select>					
						<input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${param.keyword }"/>
						<span class="input-group-append">
							<button class="btn btnBlue" type="button" onclick="list_go(1);" 
							data-card-widget="search" style="color:white;">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
					</div>

		<thead>
			<tr style="height: 40px;">
				<th>No</th>
				<th>교번</th>
				<th>교수명</th>
				<th>선택</th>
			</tr>
		</thead>
		
		<c:forEach items="${ proList}" var="pro">
		<tbody>	
			<tr>
				<td style="height: 40px;">${pro.no }</td>
				<td>${pro.pro_no }</td>
				<td>${pro.pro_name }</td>
				<td name="${pro.pro_name}" pro_no="${pro.pro_no }" class_no="${class_no }"><button type="button" class="btn btnBlue btn-sm selectPro" style="color: white">선택</button></td>
			</tr>    
		</tbody>
			</c:forEach>  
	</table>
	  </div>
	 	 <div class="card-footer">
			<%@ include file="/WEB-INF/views/common/pagination.jsp" %>				
		</div>
	</div>
</div><!-- 목록 -->
<input type="hidden" class="class_no" value="${class_no }">
<script>
	window.onload=function(){
		$(document).on('click', '.selectPro', function(){
			$(opener.document).find('.updateProfessor').val($(this).parent().attr('name'));
			$(opener.document).find('.pro_no').val($(this).parent().attr('pro_no'));
			$(opener.document).find('.class_no').val($(this).parent().attr('class_no'));
			window.close();
		})
	}
</script>