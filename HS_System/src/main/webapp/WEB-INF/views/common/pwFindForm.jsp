<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/js.jsp"%>
<jsp:include page="/WEB-INF/views/include/style.jsp"></jsp:include>
<head>
<script>
	$(function() {
		$("#pwFindBtn").click(function() {
			$.ajax({
				url : "<%=request.getContextPath()%>/pwFind",
				type : "POST",
				data : {
					id : $("#id").val(),
					email : $("#email").val(),
					gubun : $("#gubun").val()
				},
				success : function(result) {
					alert(result);
				},
				error : function(error) {
					alert('error!');
					console.log(error);
				}
			})
		});
	})
</script>
<style type="text/css">
.card-primary:not(.card-outline)>.card-header {
	background-color: #2A5F9E;
}
</style>
<title>비밀번호 찾기</title>
</head>
<body>

	<section class="content">
		<div class="card card-primary">
			<div class="card-header">
				<h3 class="card-title">비밀번호 찾기</h3>
			</div>
		</div>
		<div class="card-body" style="padding-top:0px;padding-bottom:0px">
			<div class="form-group">
				<select class="form-control" name="gubun" id="gubun">
					<option value="1">학생</option>
					<option value="2">교직원</option>
					<option value="3">교수</option>
				</select> <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" id="id" name="student_no" placeholder="아이디를 입력하세요.">
				<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요(형식: aaa@bbb.com)">
				<span class="glyphicon glyphicon-envelope form-control-feedback"></span>
			</div>

			<div class="form-group" align="center">
				<input type="button" class="btn btnBlue text-white" id="pwFindBtn" value="비밀번호 찾기" />
			</div>
		</div>
	</section>

</body>
