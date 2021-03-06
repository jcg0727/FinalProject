<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="StaffRecommendList" value="${dataMap.StaffRecommendList }" />

<head>
<%@include file="./scholarStyle.jsp" %>
</head>

<head>
<style>

.form-control:disabled, .form-control[readonly] {
    background-color: white;
    opacity: 1;
}

.card-header select {
    padding-left: 2px;
    text-align: left;
    margin: 0px 5px;
}
	
</style>
</head>
<script>

function DetailStu(dept_nm, grade, student_no, name, rank, grades_avg, reScore, recommend_date, status_cd){
				
				document.getElementById("confirm").style.display = "inline";
				document.getElementById("refer").style.display = "inline";
				
				document.getElementById("Dept").value = dept_nm;
				document.getElementById("Grade").value = grade;
				document.getElementById("StuNo").value = student_no;
				document.getElementById("Name").value = name;
				document.getElementById("Rank").value = rank;
				document.getElementById("Grades").value = grades_avg;				
				document.getElementById("score").value = reScore;
				document.getElementById("dateReI").value = recommend_date;
				
				if(status_cd == 'CCDW002') {
					document.getElementById("confirm").style.display = "none";
				}else if(status_cd == ''){
					document.getElementById("confirm").style.display = "none";
					document.getElementById("refer").style.display = "none";
				}else{
					document.getElementById("confirm").style.display = "inline";
					document.getElementById("refer").style.display = "inline";
				}
				
				
}
</script>

<script>
function confirm_c(){
	
	var student_no = $('#StuNo').val().trim();
	var rank = $('#Rank').val().trim();
	var recommend_date = $('#dateReI').val().trim();
	
	var scholar_amount;
	var semester;
	
	console.log(student_no);
	console.log(rank);
	console.log(recommend_date);
	
	if(rank == '1'){
		//scholar_amount = '4150550'
		scholar_amount = '450'
	}else if(rank == '2'){
		scholar_amount = '2075275'
	}else if(rank == '3'){
		scholar_amount = '1245165'
	}
	console.log(scholar_amount);
	
	console.log(recommend_date.substring(0,4)); 
	console.log(recommend_date.substring(5,7)); 
	
	if(recommend_date.substring(5,7) == '02'){
		semester = recommend_date.substring(0,4) + "01";
	}else{
		semester = recommend_date.substring(0,4) + "02";
	}
	console.log(semester);
	
	$.ajax({
			url : '<%=request.getContextPath()%>/tuition/management/recommendScholarStaff',
			data : {"student_no" : student_no, "scholar_amount" : scholar_amount, "recommend_date":recommend_date, "semester":semester},
			//dataType : 'json',
			success: function(data){
					alert("?????????????????????.");
					window.location.reload();
			},
			error : function(error){
				console.log(error);
	 			alert("?????? ??????");
			}
		});

	
}

function refer_b(){
	
	var student_no = $('#StuNo').val().trim();
	var recommend_date = $('#dateReI').val();
//	var recommend_date = $('input[name="dateReN"]').val($('#dateReI').val());
	console.log(student_no);
	console.log(recommend_date);
	
	//data = {"student_no":student_no, "recommend_date":recommend_date};
	
	$.ajax({
			url : '<%=request.getContextPath()%>/tuition/management/removeScholarStaff',
			data : {"student_no":student_no, "recommend_date":recommend_date},
			//dataType : 'json',
			success: function(data){
					alert("?????????????????????.");
					window.location.reload();
			},
			error : function(error){
				console.log(error);
	 			alert("?????? ??????");
			}
		});

	
}
</script>


<form id="ScholarStaffSearch">
    <input type='hidden' name="page" value="" />
    <input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum }"/>
	<input type='hidden' name="searchType" value="" />
	<input type='hidden' name="searchType2" value="" />
	<input type='hidden' name="keyword" value="" />
</form> 


<div class="card">
   <div class="card-header row" style="padding-right: 0px; height: 45px;">
      <h5 class="col-4">?????????????????????</h5>
    
         <select class="form-control"  id="grade-select"  name="searchType" style="margin-left: 240px;width: 80px; height: 35px;">
            	<option value=""   ${cri.searchType eq '' ? 'selected':''}>??????</option>
	            <option value="1"  ${cri.searchType eq '1' ? 'selected':''}>1??????</option>
	            <option value="2"  ${cri.searchType eq '2' ? 'selected':''}>2??????</option>
	            <option value="3"  ${cri.searchType eq '3' ? 'selected':''}>3??????</option>
	            <option value="4"  ${cri.searchType eq '4' ? 'selected':''}>4??????</option>
         </select>

         <select class="form-control" id="class-type-select"  name="searchType2" style="margin-left: 3px; margin-right: 8px; width: 110px; height: 35px;">
            <option value=""         ${cri.searchType2 eq ''        ? 'selected' : ''}>????????????</option>
            <option value="CCDW001"  ${cri.searchType2 eq 'CCDW001' ? 'selected' : ''}>????????????</option>
            <option value="CCDW002"  ${cri.searchType2 eq 'CCDO002' ? 'selected' : ''}>???????????????</option>
            <option value="CCDW003"  ${cri.searchType2 eq 'CCDO003' ? 'selected' : ''}>??????</option>
         </select>

        
            <input type="text" name="keyword"  id="keywordStuNo" class="form-control float-right" placeholder="????????? ???????????????" value="${cri.keyword }" style="height: 35px; width: 170px">
            <div class="input-group-append" style="height: 100%;">
               <button type="submit" class="btn btnBlue text-white" onclick="list_goScholar(1);" style="border-radius: 0.2rem; height: 35px;">
                  <i class="fas fa-search" aria-hidden="true"></i>
               </button>
            <!-- <button style="margin-left: 20px; color: white; height: 100%;" class="btn btnBlue btn-sm" onclick="registscholarOpen();">??????</button> -->
      </div>
   </div>
   
   <div class="card-body scholar-list-card-body" >
      <table class="table table-hover table-sm" style="font-size: 15px; text-align: center;">
         <thead>
            <tr>
            	<th>No</th>
            	<th>??????</th>
            	<th>??????</th>
            	<th>??????</th>
            	<th>??????</th>
            	<th>??????????????????</th>
            	<th>??????</th>
            	<th>????????????</th>
            	<th>????????????</th>
            	<th>????????????</th>
            </tr>
         </thead>
         
         <c:set value="1" var="count"/>
          <c:forEach items="${StaffRecommendList}" var="list" >
	        	 <tr onclick="DetailStu(' ${list.dept_nm}', ' ${list.grade}', ' ${list.student_no}', ' ${list.name}', ' ${list.rank}', ' ${list.grades_avg}', ' ${list.reScore}', '<fmt:formatDate value="${list.recommend_date}" pattern="yyyy-MM-dd"/>', '${list.status_cd}');" >
	         	 	<td>${list.rnum}</td>
	        	 	<td>${list.dept_nm}</td>
	        	 	<td>${list.grade}</td>
	        	 	<td>${list.student_no}</td>
	        	 	<td>${list.name}</td>
	        	 	<td>${list.grades_avg}</td>
	        	 	<td>${list.rank}</td>
	        	 	<td><fmt:formatDate value="${list.recommend_date}" pattern="yyyy-MM-dd"/></td> 
	        	 	<td>
	        	 		<c:choose>
	        	 			<c:when test="${list.status_cd eq 'CCDW001'}">????????????</c:when>
	        	 			<c:when test="${list.status_cd eq 'CCDW002'}">???????????????</c:when>
	        	 			<c:when test="${list.status_cd eq 'CCDW003'}">??????</c:when>
	        	 			<c:when test="${empty list.status_cd}">-</c:when>
	        	 		</c:choose>
        	 		</td>
        	 		<td>
        	 			<c:choose>
        	 				<c:when test="${empty list.scholar_amount}">-</c:when>
        	 				<c:when test="${not empty list.scholar_amount}"><fmt:formatNumber value='${list.scholar_amount}' type="number"/></c:when>
        	 			</c:choose>
       	 			</td>
	        	 </tr>
	       	 </c:forEach>
         
      </table>
      
   </div>
   
   <div class="card-footer clearfix">
		<nav aria-label="Navigation">
			<ul class="pagination justify-content-center m-0">
				<li class="page-item">
					<a class="page-link" href="javascript:list_goScholar(1);">
					<i class="fas fa-angle-double-left"></i>
					</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="javascript:list_goScholar('${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">
					<i class="fas fa-angle-left"></i>
					</a>
				</li>
				<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
				<li class="page-item ${pageMaker.cri.page == pageNum?'active':''}">
					<a class="page-link" href="javascript:list_goScholar('${pageNum}');" >
					${pageNum }</a>
				</li>
				</c:forEach>
				<li class="page-item">
					<a class="page-link" href="javascript:list_goScholar('${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">
					<i class="fas fa-angle-right" ></i>
					</a>
				</li>
				<li class="page-item">
				<a class="page-link" href="javascript:list_goScholar('${pageMaker.realEndPage}');">
					<i class="fas fa-angle-double-right"></i>
				</a>
				</li>	
			</ul>
		</nav>
	</div>
	
</div>


<div class="card">
  <div class="card-header"><h5 style="font-weight: bold;">???????????? ????????????</h5></div>
    <div class="card-body" style="text-align:left; padding-bottom: 0; padding-top: 7px;">
	 
		<div class="row" style="padding: 0 10px 0 10px;">

			<div class="form-group col-3">
		      <label for="dept">??????</label>
		      <input type="text" class="form-control" id="Dept" value=""   readonly style="background-color: white; text-align: left; ">
		   </div>                                     
		                                              
		   <div class="form-group col-3">             
		      <label for="grade">??????</label>         
		      <input type="text" class="form-control" id="Grade" value=""  readonly style="background-color: white; text-align: left;">
		   </div>                                     
		                                              
		    <div class="form-group col-3">            
		      <label for="No">??????</label>            
		      <input type="text" class="form-control"  id="StuNo" value=""  readonly style="background-color: white; text-align: left;">
		   </div>                                     
                                                      
		    <div class="form-group col-3">            
		      <label for="Nm">??????</label>            
		      <input type="text" class="form-control"  id="Name" value=""  readonly style="background-color: white; text-align: left;">
		   </div>
		   
		</div>
	 
		<div class="row" style="padding: 0 10px 0 10px;">
			<div class="form-group col-3">
		      <label for="rank">??????</label>
		      <input type="text" class="form-control"  id="Rank" value=""   readonly style="background-color: white; text-align: left;">
		   </div>
		
		    <div class="form-group col-3">
		      <label for="grades">??????????????????</label>
		      <input type="text" class="form-control"  id="Grades" value="" readonly style="background-color: white; text-align: left;">
		   </div>
		   
		    <div class="form-group col-3">
		      <label for="score">???????????? ??????</label>
		      <input type="text" class="form-control"  id="score" value=""  readonly style="background-color: white; text-align: left;">
		   </div>
		   
		   	<form>
		   		<input type="hidden" id="dateReI" class="dateReI" name="dateReN" value= ""  style="background-color: white; text-align: left;">
			</form>
			
			<div class="form-group col-3" style="padding:33px 10px 5px 10px;">
				<button type="button" id="confirm" class="btn btnBlue btn-sm text-white"  onclick="confirm_c();" style="height:35px;">??????</button>
				<button type="button" id="refer" class="btn btnRed btn-sm text-white" onclick="refer_b();" style="height:35px;">??????</button>
			</div>
		</div>
		
   </div>
</div> <!-- card-body -->

