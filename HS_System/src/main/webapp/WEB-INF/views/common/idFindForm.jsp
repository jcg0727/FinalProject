<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/js.jsp"%>
<jsp:include page="/WEB-INF/views/include/style.jsp"></jsp:include>
<html>
<head>
<style>
.card-primary:not(.card-outline)>.card-header {
	background-color: #2A5F9E;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="content">
		<div class="card card-primary">
			<div class="card-header">
				<h3 class="card-title">아이디 찾기</h3>
			</div>
			<form id="idFindForm" name="idFindForm" method="post" action="<%=request.getContextPath()%>/idFind.do">
				<div class="card-body">
					<div class="form-group has-feedback">
						<select class="form-control" name="gubun" id="gubun">
							<option value="1">학생</option>
							<option value="2">교직원</option>
							<option value="3">교수</option>
						</select> <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력하세요.">
						<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback">
						<input type="text" class="form-control" id="reg_no" name="reg_no" placeholder="생년월일 6자리를 입력하세요.(ex)930610">
						<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>

					<div class="form-group" align="center">
						<input type="submit" class="btn btnBlue text-white" id="idFindBtn" value="아이디 찾기" />
					</div>



					<!-- 이름과 전화번호가 일치하지 않을 때-->
					<c:if test="${check == 1}">
						<script>
							opener.document.idFindForm.name.value = "";
							opener.document.idFindForm.reg_no.value = "";
							alert('일치하는 정보가 존재하지 않습니다');
						</script>
					</c:if>

					<!-- 이름과 비밀번호가 일치할때 -->
					<c:if test="${check == 0 }">
						<script>
							var userId = ${userId};
							alert('아이디는 \" ' + userId + ' \" 입니다');
							CloseWindow();
						</script>
					</c:if>


				</div>
			</form>
		</div>
	</section>

</body>
</html>
