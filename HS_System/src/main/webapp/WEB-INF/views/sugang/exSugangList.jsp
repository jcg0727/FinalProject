<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces ="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<meta name="viewport" content="width=device-width,initial-scale=1">


<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="sugangList" value="${dataMap.sugangList }" />
<c:set var="yearList" value="${dataMap.yearList }" />

<head>

<title>Insert title here</title>
<style>

</style>

<script>


function list_go2(page,url){
	if(!url) url= window.location.href;
	
	var jobForm2=$('#jobForm2');
	
	if(!page) page=1;

	jobForm2.find("[name='page']").val(page);

	if($('select[name="perPageNum"]').val()){
		jobForm2.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
	}
	
	console.log(jobForm2.find("[name='perPageNum']").val());
		
	jobForm2.find("[name='searchType']").val($('select[name="searchType"]').val());
	jobForm2.find("[name='searchType2']").val($('select[name="searchType2"]').val());
	
	jobForm2.attr({
		action:url,
		method:'get'
	}).submit();
}

</script>

</head>
<body>

<div class="card" style="margin: 10px;">
  <div class="card-header" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
    <h3 class="card-title" style="font-weight:bold;">사용자 정보조회</h3>
  </div>
  <!-- /.card-header -->
  <div class="card-body">
     <div class="form-group row">
     <c:set var="student_no" value="" />
     <c:forEach items="${infoList }" var="list">
     <c:set var="student_no" value="${list.student_no }" />
     		<div class="col-2">  
       		<label for="stuNum">학번</label>
    		<input type="text" class="form-control" id="stuNum" value="${list.student_no }" >
       		</div>
		    <div class="col-2">  
		    <label for="stuNum">성명</label>
		    <input type="text" class="form-control" id="stuName" value="${list.name }" >
		    </div>
		    <div class="col-1">  
		    <label for="stuNum">학년</label>
		    <input type="text" class="form-control" id="stuYear" value="${grade }" >
		    </div>
		    <div class="col-3">  
		    <label for="stuNum">소속</label>
		    <input type="text" class="form-control" id="stuStatus" value="${list.dept_nm }" >
		    </div>
		    <div class="col-2">  
		    <label for="stuNum">연도/학기</label>
		    <input type="text" class="form-control" id="stuAdvisor" value="${year}년  ${semester2 }학기" >
		    </div>
		    <div class="col-2">  
		    <label for="stuNum"><span style="color: red;">*</span>신청학점</label>
		    <input type="text" class="form-control" id="stuPhone" value="${list.lectureCount }  /  21" >
		    </div>
	</c:forEach>
	</div>
  </div>
  <!-- /.card-body -->
</div>


<div class="card" style="margin: 10px;">
  <div class="card-header" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
    <h3 class="card-title" style="font-weight:bold;">학기별 수강이력</h3>

  </div>
  <!-- /.card-header -->
  <div class="card-body" style="padding-top: 5px;">

       <div style="padding-bottom: 5px; padding-left: 653px;">
               <!-- search bar -->
        <div style="float: right; display: inline-flex; padding: 2px; padding-bottom: 5px;	">
        <select class="form-control" name="searchType" id="searchType" style="font-size: 14px; width: 100px; height:33px; margin-right: 5px;">
          <option value=""  ${cri.searchType eq '' ? 'selected':''}>연도</option>
          <c:forEach items="${yearList }" var="list">
          <option value="${list.year }"  ${cri.searchType eq list.year ? 'selected':''}>${list.year }년</option>
          </c:forEach>
       </select>

        <select class="form-control" name="searchType2" id="searchType2" style="font-size: 14px; width: 90px; height:33px; margin-right: 5px;">
          <option value=""  ${cri.searchType2 eq '' ? 'selected':''}>학기</option>
          <option value="1"  ${cri.searchType2 eq '1' ? 'selected':''}>1학기</option>
          <option value="2"  ${cri.searchType2 eq '2' ? 'selected':''}>2학기</option>
       </select>
       
        <button class="btn btnBlue btn-sm text-white" type="button" id="searchBtn" onclick="list_go2(1);" style="height: 31px; font-size: 14px; background-color:#2A5F9E;" >
		검색
       </button>
       </div>
       </div>
     <div class="" style="min-height: 235.11px;">
   		<table class="table table-hover table-sm" id="sugangTable">
   		<thead>
   			<tr style="max-height: 37px;">
   				<th style="width:39.66px;">NO</th>
               	<th style="width:52.89px;">연도</th>
               	<th style="width:52.89px;">학기</th>
               	<th style="width:93.58px;">이수구분</th>
               	<th style="width:93.58px;">학수번호</th>
               	<th style="width:324.77px; text-align: center;">교과목명</th>
               	<th style="width:52.89px;">학점</th>
               	<th style="width:52.89px;">성적</th>
               	<th style="width:93.58px;">개설여부</th>
               	<th style="width:73.28px;">재수강</th>
            </tr>
           </thead>
           
			<c:forEach items="${sugangList }" var="list">
            <tr id="grade${list.class_no }" style="<c:if test="${list.grades_cd eq 'C' || list.grades_cd eq 'D' }" >background:lightyellow; max-height:37px;</c:if>">
           		
            	<td>${list.no }</td>
            	<td>${list.year }</td>
           		<td>${list.seme }</td>		              		
           		<td>${list.class_type }</td>
           		<td>${list.class_no }</td>
           		<td>${list.class_name }</td>
           		<td>${list.class_grade }</td>
           		<td>${list.grades_cd }</td>
           		<td>
           		
           		<c:set var="btnSet" value="N"/>
           		<c:set var="btnSet2" value="개설"/>
		  		<c:forEach items="${openList }" var="open">
						<c:if test="${open.class_no eq list.class_no}">
		           			<c:set var="btnSet" value="Y"/>
							<c:out value="${btnSet2 }" />
							<c:set var="btnSet2" value=""/>	
						</c:if> 
              	</c:forEach>   	
           		</td>
           		
           		<td id="take${list.class_no }">
				<c:choose>  
           		<c:when test="${(list.grades_cd eq 'C' || list.grades_cd eq 'D')&& btnSet eq 'Y'}" >
           			<button type="button" class="btn btn-xs btnBlue text-white" style="background-color:#2A5F9E;" onclick="registBoguanList('${list.class_no }');">담기</button>
           		</c:when>
           		<%-- <c:when test="${btnSet eq 'n'}" >
           			<button type="button" class="modifybtn btn bg-gradient-gray btn-xs" disabled="disabled">담기</button>
           		</c:when> --%>
           		<c:when test="${(list.grades_cd ne 'C' || list.grades_cd ne 'D')}" >
           			<button type="button" class="btn btn-xs btnBlue text-white" disabled="disabled">담기</button>
           		</c:when>
				</c:choose>          		
           		
           		</td>

            </tr>
              	</c:forEach>   	
             
              	
           </table>
	</div>
<form id="jobForm2">
    <input type='hidden' name="page" value="" />
    <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum }"/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="searchType2" value="" />
</form> 
	<!-- pagenation -->
<nav aria-label="Navigation">
	<ul class="pagination justify-content-center m-0">
		<li class="page-item">
			<a class="page-link" href="javascript:list_go2(1);">
			<i class="fas fa-angle-double-left"></i>
			</a>
		</li>
		<li class="page-item">
			<a class="page-link" href="javascript:list_go2('${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">
			<i class="fas fa-angle-left"></i>
			</a>
		</li>
		<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
		<li class="page-item ${pageMaker.cri.page == pageNum?'active':''}">
			<a class="page-link" href="javascript:list_go2('${pageNum}');" >
			${pageNum }</a>
		</li>
		</c:forEach>
		<li class="page-item">
			<a class="page-link" href="javascript:list_go2('${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">
			<i class="fas fa-angle-right" ></i>
			</a>
		</li>
		<li class="page-item">
		<a class="page-link" href="javascript:list_go2('${pageMaker.realEndPage}');">
			<i class="fas fa-angle-double-right"></i>
		</a>
		</li>	
	</ul>
</nav>
  </div>
  <!-- /.card-body -->
</div>
	<div style="padding-top: 10px; padding-bottom: 10px; text-align: center;">
		<button type="button" class="btn btnRed btn-sm text-white" id="cancelBtn" onclick="CloseWindow();" style="background-color:#666666;">닫기</button>
	</div>

<script>
function registBoguanList(param){
	data = 	{	
				"student_no" : ${student_no},
				"class_no" : param
			};
	
	  $.ajax({
			url : '<%=request.getContextPath()%>/sugang/registBoguan',
			data : JSON.stringify(data),
			contentType : "application/json; charset=UTF-8",
			type : 'post',
			dataType : "json",
			success : function(data) {
				
				alert(' '+data.message);
				gaesulSearchList(1); 
				boguanList(1);
	            opener.parent.location.reload(); 
			},
			error : function(error) {
				console.log(error);
	            opener.parent.location.reload(); 
			}

		});
}
</script>


</body>




