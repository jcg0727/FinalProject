<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/include/js.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/style.jsp"></jsp:include>
<!-- jQuery -->
<head>
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	// 폼 전송

	function modify_go() {
		$("form[role='form']").submit();
	}
</script>
<style>
.card-primary:not(.card-outline)>.card-header {
	background-color: #2A5F9E;
}
</style>

</head>
<body>
	<section class="content">
		<div class="card card-primary">
			<div class="card-header">
				<h3 class="card-title">비밀번호 수정</h3>
			</div>
		</div>
		<!-- ./card header -->
		<!--  form start -->
		<div class="card-body">
			<form action="modifyPw" method="post">
				<div class="form-group">
					<div class="form-group">
						<label for="exampleInputPassword1">현재 비밀번호</label>
						<input type="password" class="form-control" id="nowPwd" name="nowPwd" placeholder="현재 비밀번호를 입력하세요.">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">수정 비밀번호</label>
						<input type="password" class="form-control" name="newPwd" id="newPwd" placeholder="수정할 비밀번호를 입력하세요.">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">수정 비밀번호 확인</label>
						<input type="password" class="form-control" id="newPwd2" name="newPwd2" placeholder="수정할 비밀번호를 다시 입력하세요.">
					</div>
				</div>
				<!-- ./card body -->
				<div align="center">
					<button type="submit" class="btn btnBlue text-white" onclick="modify_go();">비밀번호 수정</button>
				</div>
			</form>
		</div>
	</section>



</body>
