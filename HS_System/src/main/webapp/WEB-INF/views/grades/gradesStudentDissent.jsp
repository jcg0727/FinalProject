<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style>
.card-body .card-body .row {
	margin: 10px 0;
}

.card-header {
	text-align: center;
}

.card-header .card-title {
	padding: 5px 0 0 0;
}

.card-header div {
	float: right;
}

textarea {
	resize: none;
}
</style>
</head>
<body>
   <div class="card">
      <div class="card-header">
         <h4 class="card-title">
            성적 이의신청
            <c:if test="${not empty detail }">
                     결과 
         </c:if>
         </h4>
         <div>
            <c:if test="${empty detail }">
               <button type="button" class="btn btnBlue btn-sm text-white" style="background-color: #2A5F9E;">신청</button>
            </c:if>
            <button type="button" class="btn btnRed btn-sm text-white" style="background-color: #B94040;">닫기</button>
         </div>
      </div>
      <div class="card-body">
         <div class="card">
            <div class="card-body">
               <form id="dissent-frorm">
                  <div class="row">
                     <div class="col-4">
                        <label for="">년학기</label>
                        <div class="form-control" name="lecture_semester">${cmd.lecture_semester }</div>
                     </div>
                     <div class="col-4">
                        <label for="">학수번호</label>
                        <div class="form-control" name="class_no">${cmd.class_no }</div>
                     </div>
                     <div class="col-4">
                        <label for="">교과명</label>
                        <div class="form-control" name="class_name">${cmd.class_name }</div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-4">
                        <label for="">이수구분</label>
                        <div class="form-control" name="class_type">${cmd.class_type }</div>
                     </div>
                     <div class="col-4">
                        <label for="">교수명</label>
                        <div class="form-control" name="pro_name">${cmd.pro_name }</div>
                     </div>
                     <div class="col-4">
                        <label for="">성적</label>
                        <div class="form-control" name="grades_cd">${cmd.grades_cd }</div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label>신청사유</label>
                        <c:if test="${empty detail}">
                           <textarea name="register_reason" class="form-control" rows="6" required></textarea>
                        </c:if>
                        <c:if test="${not empty detail }">
                           <div class="form-control" style="height: 144px;">${detail.register_reason }</div>
                        </c:if>
                     </div>
                  </div>
               <c:if test="${not empty detail }">
                  <div class="row">
                     <div class="col-12">                     
                        <label>정정내용</label>
                        <div class="form-control" style="height: 144px;">${detail.guide }</div>
                     </div>
                  </div>
               </c:if>
               </form>
            </div>
            <div class="card-footer"></div>
         </div>
      </div>
      <div class="card-footer"></div>
   </div>

<script>
window.onload = function() {
   document.getElementsByClassName('btnRed')[0].addEventListener('click',function() {
      window.close();
      opener.location.href = 'javascript:thisSemesterList();';
   });
   
   document.getElementsByClassName('btnBlue')[0].addEventListener('click',function() {
      
      var data = {"lecture_semester" : $('div[name=lecture_semester]').text(), 
               "class_no" : $('div[name=class_no]').text(),
               "class_name" : $('div[name=class_name]').text(),
               "class_type" : $('div[name=class_type]').text(),
               "pro_name" : $('div[name=pro_name]').text(),
               "grades_cd" : $('div[name=grades_cd]').text(),
               "register_reason" : $('textarea[name=register_reason]').val()             
      };
      
      $.ajax({
         url : '<%=request.getContextPath()%>/score/management_st/thisSemester/dissentRegist',
         data : JSON.stringify(data),
         contentType : 'application/json; charset=utf-8',
         type : 'POST',
         success : function(data){
            alert('성적이의 신청을 등록하셨습니다');
         },
         error : function(error){
            alert('시스템에러입니다\n관리자에게 문의하세요');
         },
         complete : function(data){
            window.close();
            opener.location.href='javascript:thisSemesterList()';
         }
      });
      
      
   });
}
</script>
</body>