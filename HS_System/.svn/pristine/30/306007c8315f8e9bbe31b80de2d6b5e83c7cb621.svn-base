<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${student.name }의신청내역</title>
<style>
.btn-div {
	margin-bottom: 10px;
}

body input[type=text] {
	text-align: center;
}

tr:hover {
	background: white;
}

body, .row, .btn-div {
	padding: 10px;
}

.col-md-12 {
	padding: 0;
}

#Student-Image {
	z-index: 6000;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
   <div class="card">
      <div class="card-header" style="background-color: #2A5F9E; color: white;">
         <div class="card-icon">
            <h3 class="card-title">지원자 상세보기</h3>
         </div>
      </div>

      <div class="card-body">
            <a href="<%=request.getContextPath() %>/getFile?attach_no=${deptChange.attach_no}" class="badge badge-secondary" style="position: relative;left: 660px;"><button>첨부파일</button></a>
         <div class="row">
            <div class="col-md-2" id="Student-Image" style='background-image: url("<%=request.getContextPath() %>/academic/management_st/getPicture.do?picture=${student.picture}")'></div>
            <div class="col-md-2">
               <div class="form-group">
                  <label class="bmd-label-floating">학번</label>
                  <input type="text" class="form-control" value="${student.student_no }" readonly="readonly" style="background-color: white;">
               </div>
               <div class="form-group">
                  <label class="bmd-label-floating">성명</label>
                  <input type="text" class="form-control" value="${student.name }" readonly="readonly" style="background-color: white;">
               </div>
            </div>

            <div class="col-md-3">
               <div class="form-group">
                  <label class="bmd-label-floating">신청일자</label>
                  <input type="text" class="form-control" value="<fmt:formatDate value="${deptChange.register_date }" pattern="yyyy-MM-dd" />" readonly="readonly" style="background-color: white;">
               </div>
               <div class="form-group">
                  <label class="bmd-label-floating">연락처</label>
                  <input type="text" class="form-control" value="${student.phone }" readonly="readonly" style="background-color: white;">
               </div>
            </div>


            <div class="col-md-2">
               <div class="form-group">
                  <label class="bmd-label-floating">신청학년도</label>
                  <input type="text" class="form-control" value="<fmt:formatDate value="${deptChange.register_date }" pattern="yyyy" />" readonly="readonly" style="background-color: white;">
               </div>
               <div class="form-group">

                  <label class="bmd-label-floating">평균학점</label>
                  <input type="text" class="form-control" value="${grades }" readonly="readonly" style="background-color: white;">
               </div>
            </div>

            <div class="col-md-3">
               <div class="form-group">
                  <label class="bmd-label-floating">원소속학과</label>
                  <input type="text" class="form-control" value="${deptChange.belong_dept_nm}" readonly="readonly" style="background-color: white;">
               </div>
               <div class="form-group">
                  <label class="bmd-label-floating">지원학과</label>
                  <input type="text" class="form-control" value="${deptChange.apply_dept_nm}" readonly="readonly" style="background-color: white;">
               </div>
            </div>
         </div>
         <br>
      </div>
   </div>
   <div class="row">
      <div class="col-md-12">
         <div class="card">
            <div class="card-header" style="background-color: #2A5F9E; color: white;">
               <h3 class="card-title">승인현황</h3>
            </div>
            <!-- /.card-header -->

            <div class="card-body table-responsive p-0">
               <table class="table text-nowrap" style="text-align: center;">
                  <thead>
                     <tr style="background-color: #e3f2fd">
                        <th>지도교수</th>
                        <th>소속학과</th>
                        <th>지원학과 교수</th>
                        <th>지원학과</th>
                     </tr>
                  </thead>

                  <tbody>
                     <tr style="height: 49px;">
                        <c:choose>
                           <c:when test="${deptChange.status_cd eq 'CCDH006' }">
                              <td colspan="4">
                                 반려된 신청입니다
                              </td>
                           </c:when>
                           <c:otherwise>
                              <td>
                                 <c:if test="${(deptChange.status_cd eq 'CCDH002') or (deptChange.status_cd eq 'CCDH003') or (deptChange.status_cd eq 'CCDH004') or (deptChange.status_cd eq 'CCDH005')}">
                                    <i class="fas fa-check"></i>
                                 </c:if>
                              
                              <td>
                                 <c:if test="${(deptChange.status_cd eq 'CCDH003') or (deptChange.status_cd eq 'CCDH004') or (deptChange.status_cd eq 'CCDH005')}">
                                    <i class="fas fa-check"></i>
                                 </c:if>
                                 <c:if test="${deptChange.status_cd eq 'CCDH002'}">
                                    <div class="form-check">
                                       <input class="form-check-input" type="radio" name="flexCheckDefault" id="flexCheckDefault1" value="CCDH003">
                                       <label class="form-check-label" for="flexRadioDefault1" style="margin-right: 20px;">승인</label>
                                       <input class="form-check-input" type="radio" name="flexCheckDefault" id="flexCheckDefault2" value="CCDH006">
                                       <label class="form-check-label" for="flexRadioDefault2">반려 </label>
                                    </div>
                                 </c:if>
                              </td>
                              <td>
                                 <c:if test="${(deptChange.status_cd eq 'CCDH004') or (deptChange.status_cd eq 'CCDH005')}">
                                    <i class="fas fa-check"></i>
                                 </c:if>
                              </td>
                              <td>
                                 <c:if test="${deptChange.status_cd eq 'CCDH005'}">
                                    <i class="fas fa-check"></i>
                                 </c:if>
                                 <c:if test="${deptChange.status_cd eq 'CCDH004'}">
                                    <div class="form-check">
                                       <input class="form-check-input" type="radio" name="flexCheckDefault" id="flexCheckDefault1" value="CCDH005">
                                       <label class="form-check-label" for="flexRadioDefault1" style="margin-right: 20px;">승인</label>
                                       <input class="form-check-input" type="radio" name="flexCheckDefault" id="flexCheckDefault2" value="CCDH006">
                                       <label class="form-check-label" for="flexRadioDefault2">반려 </label>
                                    </div>
                                 </c:if>
                              </td>
                           </c:otherwise>
                        </c:choose>
                     </tr>
                  </tbody>
               </table>
            </div>
            <!-- /.card-body -->
         </div>
         <!-- /.card -->
      </div>
   </div>
   <div class="row">
      <div class="col-md-12">
         <div class="card">
            <div class="card-header" style="background-color: #2A5F9E; color: white;">
               <h3 class="card-title">지도교수 상담일지</h3>
            </div>
            <!-- /.card-header -->

            <div class="card-body table-responsive p-0">
               <table class="table text-nowrap" style="text-align: center;">
                  <thead>
                     <tr style="background-color: #e3f2fd">
                        <th style="width: 242px;">학생</th>
                        <th style="width: 242px;">교수</th>
                        <th style="width: 242px;">상담 일자</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td>${student.name }</td>
                        <td>${professor.name}</td>
                        <td>${counsel.counsel_date }</td>
                     </tr>
                  </tbody>
               </table>
               <table class="table text-nowrap" style="text-align: center;">
                  <thead>
                     <tr style="background-color: #e3f2fd">
                        <th>상담내용</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <td style="height: auto; text-align: left;"></td>
                     </tr>
                  </tbody>
               </table>
            </div>
            <!-- /.card-body -->
         </div>
         <!-- /.card -->
      </div>
   </div>
   <div>
      <div class="btn-div">
         <button type="button" class="btn btn-primary btn-sm" style="width: 50px; margin-left: 320px;" onclick="javascript:updateDepartmentTransfer();">저장</button>
         <button type="button" class="btn btn-secondary btn-sm" onclick="closeTransferPopUp();">닫기</button>
      </div>
   </div>

  <script>
var select = "";
var student_no = '${student_no}';
var register_date = '${register_date}';
var data = "";
var message = "";
function updateDepartmentTransfer(){
	select = document.querySelector('.form-check-input:checked').value;
	data = {"student_no" : student_no, "register_date" : register_date, "status_cd" : select};

	alert(register_date);
	if(select == 'CCDH005' || select == 'CCDH003'){
		message = "승인";
	}else{
		message = "반려";
	}
	
	$.ajax({
		url : '<%=request.getContextPath()%>/academic/transfer/modify',
		type : 'POST',
		contentType : 'application/json; charset=utf8',
		data : JSON.stringify(data),
		success : function(data){
			alert(message + '처리가 완료되었습니다');
			location.href = '<%=request.getContextPath()%>/academic/transfer/detail?student_no='+student_no+'&register_date='+register_date
		},
		error : function(error) {
			alert('시스템 에러입니다\n관리자에게 문의 부탁드립니다');
		}
	});
}

function closeTransferPopUp() {
	window.close();
	opener.location.href='javascript:transferInList()';
}
</script>
</body>
</html>
