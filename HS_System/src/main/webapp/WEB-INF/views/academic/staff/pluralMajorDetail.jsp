<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set target="${dataMap }" value="dataMap" />
<c:set var="stuInfo" value="${dataMap.stuInfo }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
</head>
<body>
<c:forEach items="${stuInfo }" var="stu" >
<br>
	<div class="col-md-12">
	<div class="card">
		<div class="card-header" style="background-color: #2A5F9E; color: white;">
			<div class="card-icon">
				 <h3 class="card-title">지원자 상세보기</h3>
			</div>
		</div>
		
		<div class="card-body" style="height: 250px">
		
		<div class="row">
			  <div class="col-md-2" style='background-image: url("<%=request.getContextPath() %>/academic/management_st/getPicture.do?picture=${stu.picture}"); background-position : center; background-size : cover'>
			  </div>
			<div class="col-md-2">
				<div class="form-group">
					<label class="bmd-label-floating">학번</label>
					<input type="text" class="form-control" value="${plural.student_no }" readonly="readonly" style="background-color: white;">
				</div>
				<div class="form-group">
					<label class="bmd-label-floating">성명</label>
					<input type="text" class="form-control" value="${plural.name }" readonly="readonly" style="background-color: white;">
				</div>
			</div>
			
			<div class="col-md-3">
				<div class="form-group">
					<label class="bmd-label-floating">신청일자</label>
					<input type="text" class="form-control" value="<fmt:formatDate value="${plural.register_date }" pattern="yyyy-MM-dd" />" readonly="readonly" style="background-color: white;">
				</div>
				<div class="form-group">
					<label class="bmd-label-floating">연락처</label>
					<input type="text" class="form-control" value="${plural.phone }" readonly="readonly" style="background-color: white;">
				</div>
			</div>
			
			
			<div class="col-md-2">
				<div class="form-group">
					<label class="bmd-label-floating">신청학년도</label>
					<input type="text" class="form-control" value="<fmt:formatDate value="${plural.register_date }" pattern="yyyy" />" readonly="readonly" style="background-color: white;">
				</div>
				<div class="form-group">
					<label class="bmd-label-floating">평균학점</label>
					<input type="text" class="form-control" value="${plural.grades_avg }" readonly="readonly" style="background-color: white;">
				</div>
			</div>
			
				<div class="col-md-3">
					<div class="form-group">
						<label class="bmd-label-floating">원소속학과</label>
						<input type="text" class="form-control" value="${plural.dept_nm }" readonly="readonly" style="background-color: white;">
					</div>
					<div class="form-group">
						<label class="bmd-label-floating">지원학과</label>
						<input type="text" class="form-control" value="${plural.apply_deptnm }" readonly="readonly" style="background-color: white;">
					</div>
				</div>
		</div>
		</div>
		</div>

	<div class="row">
			<div class="col-12">
            <div class="card">
              <div class="card-header" style="background-color: #2A5F9E; color: white;">
                <h3 class="card-title">승인현황</h3>
              </div>
              <!-- /.card-header -->
              
              <div class="card-body table-responsive p-0">
                <table class="table text-nowrap" style="text-align: center;">
                  <thead>
                    <tr style="background-color: #e3f2fd">
                      <th>원소속학과 지도교수</th>
                      <th>원소속학과</th>
                      <th>지원학과 교수</th>
                      <th>지원학과</th>
                    </tr>
                  </thead>
                  
                  <tbody>
                    <tr>
                      <td><c:if test="${plural.status_nm eq '지도교수승인'}" ><i class="fas fa-check"></i></c:if></td>
                      <td><c:if test="${plural.status_nm eq '소속학과승인'}" ><i class="fas fa-check"></i></c:if></td>
                      <td><c:if test="${plural.status_nm eq '지원학과교수승인'}"><i class="fas fa-check"></i></c:if></td>
                      <td><c:if test="${plural.status_nm eq '지원학과승인'}"><i class="fas fa-check"></i></c:if></td>
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
			<div class="col-12">
            <div class="card">
              <div class="card-header" style="background-color: #2A5F9E;color: white;">
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
                      <td>${plural.name }</td>
                      <td>${plural.pro_nm }</td>
                      <td><fmt:formatDate value="${plural.register_date }" pattern="yyyy-MM-dd"/> </td>
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
				<div class="btn-div">
		         <button type="button" class="btn btn-primary btn-sm" style="width: 50px; margin-left: 320px;" onclick="">저장</button>
		         <button type="button" class="btn btn-secondary btn-sm" id="close">닫기</button>
      			</div>
	</div>

</c:forEach>
 <script>
 
 document.getElementById('close').onclick = function(){
	 window.close();
	 opener.location.href='javascript:pluralMajorOut()'; 
 }

 
</script> 
</body>
</html>
