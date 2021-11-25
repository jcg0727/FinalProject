<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 페이지네이션 -->
<style>
.page-link {
	position: relative;
	display: block;
	padding: 0.5 rem 0.75 rem;
	margin-left: -1px;
	line-height: 1.25;
	color: #2A5F9E;
	background-color: #fff;
	border: 1px solid #dee2e6;
}

.page-item.active .page-link {
	z-index: 3;
	color: #fff;
	background-color: #2A5F9E;
	border-color: #2A5F9E;
}

body {
	font-family: 'Nanum Gothic', sans-serif;
}

.card-footer {
	background-color: #fff;
}

.btnBlue {
	background-color: #2A5F9E;
}

.btnRed {
	background-color: #B94040;
}

.btnGray {
	background-color: #666666;
}

.btnWhite {
	color: #2A5F9E;
	background-color: #ffffff;
	border-color: #2A5F9E;
}

.card-title {
	font-weight: bold;
}
</style>
