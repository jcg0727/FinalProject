<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Tell the browser to be responsive to screen width -->
<title><sitemesh:write property="title" /></title>

<jsp:include page="/WEB-INF/views/include/style.jsp" />

<sitemesh:write property="head" />

</head>
<body class="hold-transition sidebar-mini">
	<!-- Site wrapper -->
	<div class="wrapper" style="width: 1280px; margin: 0 auto;">

		<!-- navigation -->
		<%@ include file="/WEB-INF/views/include/navigation.jsp"%>

		<!-- aside -->
		<jsp:include page="/WEB-INF/views/include/aside.jsp" flush="false" />
		
	<sitemesh:write property="body"/>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->

		<!-- Main footer -->
		<footer class="main-footer">
<!-- 			<div class="float-right d-none d-sm-block"> -->
<!-- 				<b>Version</b> 3.0.0 -->
<!-- 			</div> -->
<!-- 			<strong>Copyright &copy; 2021 <a -->
<!-- 				href="http://adminlte.io">H.S System</a>. -->
<!-- 			</strong> All rights reserved. -->
		</footer>
		
	</div>
	<!-- ./wrapper -->
<jsp:include page="/WEB-INF/views/include/js.jsp"></jsp:include>
</body>
</html>