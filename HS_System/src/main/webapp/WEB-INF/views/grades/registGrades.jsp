<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<style>
body>.card {
   height: 100%;
   width: 100%;
}

body>.card>.card-body {
   height: 78vh;
}

body .card .card-body .table {
   text-align: center;
}

body .card .card-header {
   vertical-align: middle;
}

body .card .card-header div {
   float: right;
}

body .card .card-header .card-title {
   margin-top: 10px;
}

.modal-body .row{
   margin-bottom: 10px;
}

.modal-body .col-4{
   text-align: center;
}


.modal-body .col-4 .input-div{
   margin-left :40px;
   width : 45%;
   text-align: center;
}

.modal-body .col-4 .input-div .input-group{
   text-align: center;
}
</style>
</head>

<body>
   <div class="card">
      <div class="card-header">
         <h4 class="card-title">${className }의학생목록</h4>
         <div>
         	<button class="btn btn-success" onclick="registTotal('${classNo}','${lectureSemester }');"
         		<c:if test="${studentList.get(0).totalcnt ne studentList.get(0).finalCount}">
         			disabled="disabled"
         		</c:if>
         	>최종성적 일괄입력</button>
            <button class="btn btnRed text-white" onclick="window.close();">닫기</button>
         </div>
      </div>
      <div class="card-body">
         <table class="table">
            <thead>
               <tr>
                  <th>NO</th>
                  <th>소속</th>
                  <th>학번</th>
                  <th>성명</th>
                  <th>성적입력</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach items="${studentList }" var="student">
                  <tr>
                     <td>${student.rnum }</td>
                     <td>${student.dept_nm }</td>
                     <td>${student.student_no }</td>
                     <td>${student.name }</td>
                     <td>
                        <button class="btn btnGray btn-xs text-white btnRegistGrades" student-no="${student.student_no }" class-no="${classNo }" lectureSemester="${lectureSemester }" data-toggle="modal" data-target="#registGradesModal">성적입력</button>
                     </td>
                  </tr>
               </c:forEach>
            </tbody>
         </table>
      </div>
      <div class="card-footer">
		<form id="jobForm">
			<input type='hidden' name="page" value="" />
			<input type='hidden' name="perPageNum" value="${empty pageMaker.cri.perPageNum ? 10 : pageMaker.cri.perPageNum}"/>
			<input type='hidden' name="searchType" value="" />
			<input type='hidden' name="keyword" value="" />
			<input type='hidden' name="class_no" value="${classNo}" />
			<input type='hidden' name="lecture_semester" value="${lectureSemester }" />
		</form>
		<!-- pagenation -->
		<nav aria-label="Navigation">
			<ul class="pagination justify-content-center m-0">
				<li class="page-item">
					<a class="page-link" href="javascript:list_go(1);">
					<i class="fas fa-angle-double-left"></i>
					</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');">
					<i class="fas fa-angle-left"></i>
					</a>
				</li>
				<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }" >
				<li class="page-item ${pageMaker.cri.page == pageNum?'active':''}">
					<a class="page-link" href="javascript:list_go('${pageNum}');" >
					${pageNum }</a>
				</li>
				</c:forEach>
				<li class="page-item">
					<a class="page-link" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :cri.page}');">
					<i class="fas fa-angle-right" ></i>
					</a>
				</li>
				<li class="page-item">
				<a class="page-link" href="javascript:list_go('${pageMaker.realEndPage}');">
					<i class="fas fa-angle-double-right"></i>
				</a>
				</li>	
			</ul>
		</nav>
      </div>
   </div>
   <!-- Modal -->
   <div class="modal fade" id="registGradesModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
         <div class="modal-content">
            <div class="modal-header">
               <h5 class="modal-title" id="exampleModalLongTitle"></h5>
               <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
               </button>
            </div>
               <div class="modal-body">
                  <div class="row">
                     <div class="col-4">
                        <label for="">전체시수</label>
                        <div id="total" class="input-div"></div>
                     </div>
                     <div class="col-4">
                        <label for="">결석시수</label>
                        <div id="absence"  class="input-div"></div>
                     </div>
                     <div class="col-4">
                        <label for  ="">출석점수</label>
                        <div id="attdence"  class="input-div"></div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-4">
                        <label for="">중간점수</label>
                        <div id="middle"  class="input-div"></div>
                     </div>
                     <div class="col-4">
                        <label for="">기말점수</label>
                        <div id="final"  class="input-div"></div>
                     </div>
                     <div class="col-4">
                        <label for="">성적</label>
                        <div id="grades"  class="input-div"></div>
                     </div>
                  </div>
               </div>
            <div class="modal-footer">
               <button type="button" class="btn btnBlue text-white">저장</button>
               <button type="button" class="btn btnGray text-white">수정</button>
               <button type="button" class="btn btnRed text-white" data-dismiss="modal">닫기</button>
            </div>
         </div>
      </div>
   </div>

<script>
var btn = document.getElementsByClassName('btnRegistGrades');
var i = btn.length;
var data = "";
var middleScore = ""; 	
var finalScore = "";
var input = "";

window.onload = function(){
	$('.modal-footer .btnGray').on('click', function(){
		if($('#middle')){
			input = document.createElement('input');
	        input.setAttribute('type', 'text');
	        input.setAttribute('class', 'input-group')
	        input.style.width = '100%';
			middleScore = $('#middle').text();
			$('#middle').text('');
			input.value = middleScore;
			$('#middle').append(input);
		};
		
		if($('#final')){
			input = document.createElement('input');
	        input.setAttribute('type', 'text');
	        input.setAttribute('class', 'input-group')
	        input.style.width = '100%';
			finalScore = $('#final').text();
			$('#final').text('');
			input.value = finalScore;
			$('#final').append(input);
		};
		
		$('.modal-footer > .btnBlue').attr('disabled', false);
		
		$(this).hide();
	});
	
    $('.btnRegistGrades').on('click', function(e){
      $('#exampleModalLongTitle').text($(this).parent().prev().text()+'의 성적입력');
      
      input = document.createElement('input');
      input.setAttribute('type', 'hidden');
      input.setAttribute('id', 'studentNo');
      input.value = $(this).attr('student-no');
      $('.modal-footer').append(input);
      
      var event = e.target;
      data = {"class_no" : event.getAttribute("class-no"), "lecture_semester" : event.getAttribute("lectureSemester"), "studentNo" : event.getAttribute("student-no")};
      $.ajax({
         url : '<%=request.getContextPath()%>/score/management_prof/studentList/studentGrades',
               data : JSON.stringify(data),
               type : 'POST',
               contentType :'application/json; charset=utf-8',
               success : function(data) {
                  $('#total').text(16);
                  if(data.middle_score != '0'){
	                  $('#middle').text(data.middle_score);
                  }
                  if(data.final_score != '0'){
	                  $('#final').text(data.final_score)
                  }
                  
                  if(data.grades_cd != ''){
	                  $('#grades').text(data.grades_cd);
                  }
                  
                  $("#attdence").text(data.attend_score);
                  
                  var absence = ((100-parseFloat(data.attend_score))/(100/16));
                  
                  $('#absence').text(absence);
                  var div = $('.modal-body .input-div');
                  for(var i = 0; i < div.length; i++){
                	  input = document.createElement('input');
                      input.setAttribute('type', 'text');
                      input.setAttribute('class', 'input-group')
                      input.style.width = '100%';  
					
                      if(i == 5) break;
                      
                      if(div[i].innerHTML == ''){
                           $(div[i]).append(input);
                        }
                  }
                   
// 				  if(div[5].innerHTML != ''){
// 					  $('.modal-footer > .btnBlue').attr('disabled', 'disabled');
// 					  $('.modal-footer > .btnGray').attr('disabled', 'disabled');
// 				  }
               },
               error : function(error) {

               }
         });
   });
       
    $('#registGradesModal').on('hide.bs.modal', function(){
         $(this).children('.input-div').text('');
         $('#registGradesModal .input-group').remove();
         $('#studentNo').remove();
         $('.modal-footer > .btnGray').attr('disabled', false);
    });
   
    $('.modal-footer > .btnBlue').on('click', function(e){
    	registGrades(e.target);
 	});
};

function registGrades(e){
 	 
  	 if($('#middle').children('.input-group').length != 0){
  		 middleScore = $('#middle').children('.input-group').val();
  	 }else{
  		 middleScore = $('#middle').text();
  	 }
  	 
  	 if($('#final').children('.input-group') != 0){
  		 finalScore = $('#final').children('.input-group').val();
  	 }else{
  		 finalScore = $('#final').text();
  	 }
  
    data = {
        "studentNo" : $(e).siblings('#studentNo').val(),
        "lecture_semester" : '${lectureSemester}',
        "class_no" : '${classNo}',
        "attendScore" : $('#attdence').text(),
        "middleScore" : middleScore,
        "finalScore" : finalScore,
        "gradesCd" : $('#grades').text()
    };     
    
     if(confirm('위 학생 성적정보를 저장하시겠습니까?')){
           $.ajax({
              url : '<%=request.getContextPath()%>/score/management_prof/studentList/registGrades',
           type : 'POST',
           data : JSON.stringify(data),
           contentType : 'application/json; charset=utf-8',
           success : function(data){
              alert('저장되었습니다');
           },
           error : function(error){
              alert('시스템에러입니다\n관리자에게 문의하세요');
           },
           complete : function(){
              $('#registGradesModal').modal('hide');                
           }
        })
  	};
 	
  	$('.modal-footer .btnGray').show();
};

function registTotal(classNo, lectureSemester){
	data = {"class_no" : classNo, "lecture_semester" : lectureSemester};
	
	$.ajax({
		url : '<%=request.getContextPath()%>/score/management_prof/studentList/registTotal',
		type : 'POST',
		data : JSON.stringify(data),
		contentType:'application/json; charset=utf-8',
		success : function(data){
			alert('최종 성적이 입력되었습니다');
		},
		error : function(error){
			alert('시스템 오류입니다\관리자에게 문의하세요');
		}
	});
}

</script>
</body>