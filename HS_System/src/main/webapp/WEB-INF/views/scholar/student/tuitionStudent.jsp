<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@page import="java.util.Date"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="scList" value="${dataMap2.scList }" />

<div class="card-body">
	<div class="card">
		<div class="card-header with-border" style="height: 50px; border-bottom-width: 3px; border-bottom-color: #2A5F9E;">
			<h5 style="font-weight: bold; padding-top: 5px;">등록내역/고지서</h5>
		</div>
		<div class="card-body" style="text-align: left; padding-bottom: 0; padding-top: 7px;">

			<div class="row" style="padding: 0 10px 0 10px;">
				<table class="table table-hover table-sm" style="font-size: 17px; text-align: center;">
					<thead>
						<tr>
							<th>년도</th>
							<th>학기</th>
							<th>등록금액</th>
							<th>장학금액</th>
							<th>납부금액</th>
							<th>납부일자</th>
							<th>고지서/납입증명서</th>
						</tr>
					</thead>

					<c:forEach items="${tuitionList}" var="list">
						<c:set var="TextValue" value="${list.semester }" />
						<tr onclick="DetailtutStu('${list.student_no}', '${fn:substring(TextValue,0,4)}' ,'${fn:substring(TextValue,5,6)}')";>
							<td>${fn:substring(TextValue,0,4)}</td>
							<td>${fn:substring(TextValue,5,6)}학기</td>
							<td><fmt:formatNumber value='${list.tuition_amount}' type="number" /></td>
							<td>
								<c:choose>
									<c:when test="${empty list.scholar_amount}">-</c:when>
									<c:when test="${not empty list.scholar_amount}"><fmt:formatNumber value='${list.scholar_amount}' type="number" /></c:when>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${empty list.payment_amount}">-</c:when>
									<c:when test="${not empty list.payment_amount}"><fmt:formatNumber value='${list.payment_amount}' type="number" />
									</c:when>
								</c:choose>
							</td>
							<td><c:choose>
									<c:when test="${empty list.payment_date}">-</c:when>
									<c:when test="${not empty list.payment_date}">
										<fmt:formatDate value="${list.payment_date}" pattern="yyyy-MM-dd" />
									</c:when>
								</c:choose></td>
							<td><c:if test="${empty list.payment_date}">
									<button type="button" class="btn bg-gradient-gray btn-sm" style="width: 110px;" onclick="OpenWindow('printBill?student_no='+${list.student_no}+'&semester='+${list.semester},'','916','903');">등록금고지서</button>
								</c:if> <c:if test="${not empty list.payment_date}">
									<button type="button" class="btn bg-gradient-gray btn-sm" style="width: 110px;" onclick="OpenWindow('printCheck?student_no='+${list.student_no}+'&semester='+${list.semester},'','916','903');">납입증명서</button>
								</c:if></td>
						</tr>
					</c:forEach>

				</table>
			</div>

		</div>
		<!-- /.card-->
	</div>
</div>
</body>


<!--  ///////////////////// 장학수혜내역 /////////////////////// -->

<div class="card-body">
	<div class="card">
		<div class="card-header" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
			<h5 style="font-weight: bold;">장학수혜내역</h5>
		</div>
		<!-- /.card-header -->
		<div class="card-body" style="height: 270px;">
			<table class="table table-hover table-sm" style="font-size: 17px; text-align: center;">
				<thead>
					<tr>
						<th>년도</th>
						<th>학기</th>
						<th>장학금액</th>
						<th>지급일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${scList }" var="list2">
						<tr>
							<td>${list2.year }년</td>
							<td>${list2.semester }학기</td>
							<td><fmt:formatNumber value='${list2.scholar_amount}' type="number" /></td>
							<td><fmt:formatDate value="${list2.recommend_date}" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>

	</div>
	<!-- /.card-->
</div>

