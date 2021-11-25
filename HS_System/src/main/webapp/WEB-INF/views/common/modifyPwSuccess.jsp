<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script>
	alert("비밀번호가 수정되었습니다. 다시 로그인하세요");
	opener.parent.location="<%=request.getContextPath()%>/";
	window.close();
</script>