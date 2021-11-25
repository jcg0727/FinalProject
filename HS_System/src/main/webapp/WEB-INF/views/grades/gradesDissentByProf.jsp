<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
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

.form-control{
   text-align: center;
}

#select-statusCd{
   float: right;
   
}

#select-statusCd select{
   text-align: left;
}
</style>
</head>
<body>
   <div class="card">
      <div class="card-header">
         <h4 class="card-title">성적 이의신청</h4>
         <div>
            <button type="button" class="btn btnBlue btn-sm text-white" style="background-color: #2A5F9E;">저장</button>
            <button type="button" class="btn btnRed btn-sm text-white" style="background-color: #B94040;">닫기</button>
         </div>
      </div>
      <div class="card-body">
         <div class="card">
            <div class="card-body">
               <form id="dissent-frorm">
                  <div class="row">
                     <div class="col-3">
                        <label for="">년학기</label>
                        <c:set var="front" value="${fn:substring(detail.grades.lecture_semester,2,4) }" />
                        <c:set var="back" value="${fn:substring(detail.grades.lecture_semester,5,7) }" />
                        <div class="form-control" name="lecture_semester"><c:out value="${front }년도  ${back }학기" /></div>
                     </div>
                     <div class="col-3">
                        <label for="">학수번호</label>
                        <div class="form-control" name="class_no">${detail.grades.class_no }</div>
                     </div>
                     <div class="col-2">
                        <label for="">교수명</label>
                        <div class="form-control" name="pro_name">${detail.proName }</div>
                     </div>
                     <div class="col-2">
                        <label for="">이수구분</label>
                        <div class="form-control" name="class_type">${detail.classType }</div>
                     </div>
                     <div class="col-2">
                        <label for="">성적</label>
                        <div class="form-control" name="grades_cd">${detail.grades.grades_cd }</div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label for="">교과명</label>
                        <div class="form-control" name="class_name">${detail.class_name }</div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label>신청사유</label>
                        <div class="form-control" style="height: 144px;" name="register_reason">${detail.register_reason }</div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label>정정내용</label>
                        <span id="select-statusCd">
                        <select name="statusCd" class="form-control">
                           <option value="" ${detail.status_cd eq 'CCDY003' ? 'selected' : ''}>처리</option>
                           <option value="CCDY001" ${detail.status_cd eq 'CCDY001' ? 'selected' : ''}>승인</option>
                           <option value="CCDY002" ${detail.status_cd eq 'CCDY002' ? 'selected' : ''}>반려</option>
                        </select>
                        </span>
                        <textarea class="form-control" style="height: 144px;" name="guide">${detail.guide }</textarea>
                     </div>
                  </div>
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
      opener.location.href = 'javascript:dissentList();';
   });
   
   document.getElementsByClassName('btnBlue')[0].addEventListener('click',function() {
      
      var data = {
    		   "dissentGradesNo" : '${detail.dissent_grades_no}',
               "statusCd" : $('select[name=statusCd]').val(),
               "guide" : $('textarea[name=guide]').val()
      };
      
      $.ajax({
         url : '<%=request.getContextPath()%>/score/management_st/thisSemester/dissentModify',
         data : JSON.stringify(data),
         contentType : 'application/json; charset=utf-8',
         type : 'POST',
         success : function(data){
            alert('성적이의 신청 답변을 저장하셨습니다');
         },
         error : function(error){
            alert('시스템에러입니다\n관리자에게 문의하세요');
         },
         complete : function(data){
            window.close();
            opener.location.href='javascript:dissentList()';
         }
      });
      
      
   });
}
</script>
</body>