<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<title>Insert title here</title>


</head>
<body>

<section class="content" style="padding-left: 10px; padding-right: 10px; padding-top: 10px;">
<div class="card">
	<div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
		<h5 style="font-weight: bold;">상담신청 상세내역</h5>     
	</div>
	<div class="card-body row" style="text-align:center;padding-top: 5px;">
		<div class="col-sm-12" style="">

		<c:forEach items="${detailList }" var="d">

			<div class="form-group row" style="margin-bottom: 10px;">
				<p style="margin-bottom: 5px; margin-top: 10px; font-weight: bold;">신청내용</p>
				<textarea class="form-control col-12" id="content" name="" rows="" style="height: 150px;">${d.register_content }</textarea>
			</div>
			<c:if test="${not empty d.refuse_content }">
				<div class="form-group row" style="margin-bottom: 10px;">
					<p style="margin-bottom: 5px;  font-weight: bold;">거절사유</p>
					<textarea class="form-control col-12" id="content" name="" rows="" style="">${d.refuse_content }</textarea>
				</div>
			</c:if>
		</c:forEach>               
               
	<div class="form-group row" style="margin-bottom: 0px; display: contents;">
		<button type="button" class="btn btnBlue btn-sm text-white" style="background-color:#2A5F9E;" id="" onclick="CloseWindow();">닫기</button>
    </div>
              
              
              
	</div>
	</div> <!-- card-body -->
</div> <!-- card -->
</section>


</body>
