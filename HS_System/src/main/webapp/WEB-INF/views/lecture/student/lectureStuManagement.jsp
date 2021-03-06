<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/include/style.jsp"></jsp:include>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="lectureList" value="${dataMap.lectureList }" />
<c:set var="dissentList" value="${dataMap2.dissentList }" />
<head>
<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script>
	// 검색 입력칸 입력후 엔터치면 검색버튼 클릭 효과
	function enterkey() {
		if (window.event.keyCode == 13) {
			list_stuSearch(1);
		}
	}

	// 학생목록 검색
	function list_stuSearch(page, url) {
		url = window.location.href;

		var jobForm = $('#jobForm');

		if (!page)
			page = 1;

		jobForm.find("[name='page']").val(page);

		if ($('select[name="perPageNum"]').val()) {
			jobForm.find("[name='perPageNum']").val(
					$('select[name="perPageNum"]').val());
		}

		console.log(jobForm.find("[name='perPageNum']").val());

		jobForm.find("[name='searchType']").val(
				$('select[name="searchType"]').val());
		jobForm.find("[name='keyword']").val($("#keyword").val());

		console.log(jobForm.find("[name='searchType']").val(
				$('select[name="searchType"]').val()));
		console.log(jobForm.find("[name='keyword']").val($("#keyword").val()));

		jobForm.attr({
			action : url,
			method : 'get'
		}).submit();
	}
</script>
<style>
.cardRow {
	margin-left: 10px;
	margin-right: 10px;
	margin-top: 5px;
}
</style>
</head>

<body>
	<section class="content" style="padding-top: 10px;">
		<!-- 		<div class="container-fluid"> -->
		<!-- 			<div class="card"> -->
		<!-- 				<div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E; display: flex; height: 55px; padding-top: 0px;"> -->
		<!-- 					<h5 style="font-weight: bold; padding-top: 13px;">수강내역</h5> -->
		<!-- 					<div class="row" align="right" style="padding-top: 8px; margin-left: 526px;"> -->
		<!-- 						search bar -->
		<!-- 						<select class="form-control col-md-3" name="searchType" id="searchType" style="font-size: 14px;"> -->
		<%-- 							<option value="gb" ${cri.searchType eq 'gb' ? 'selected':''}>전체</option> --%>
		<%-- 							<option value="gm" ${cri.searchType eq 'gm' ? 'selected':''}>교과목명</option> --%>
		<%-- 							<option value="gs" ${cri.searchType eq 'gs' ? 'selected':''}>교수명</option> --%>
		<!-- 						</select> -->
		<!-- 						keyword -->
		<%-- 						<input class="form-control col-md-7" style="width: 200px;" onkeyup="enterkey();" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }" style="font-size: 14px;" /> --%>
		<!-- 						<span class="input-group-append"> -->
		<!-- 							<button class="btn text-white" style="background-color: #2A5F9E" type="button" id="searchBtn" data-card-widget="search" onclick="list_stuSearch(1);"> -->
		<!-- 								<i class="fa fa-fw fa-search" style="background-color: #2A5F9E"></i> -->
		<!-- 							</button> -->
		<!-- 						</span> -->
		<!-- 					</div> -->
		<!-- 					end : search bar -->
		<!-- 				</div> -->
		<!-- 				/.card-header -->
		<!-- 				<div class="card-body table-responsive p-0"> -->
		<!-- 					<table class="table table-hover text-nowrap"> -->
		<!-- 						<thead> -->
		<!-- 							<tr> -->
		<!-- 								<th>NO</th> -->
		<!-- 								<th>년도</th> -->
		<!-- 								<th>학기</th> -->
		<!-- 								<th>이수구분</th> -->
		<!-- 								<th>학수번호</th> -->
		<!-- 								<th>학점</th> -->
		<!-- 								<th>교과목명</th> -->
		<!-- 								<th>담당교수</th> -->
		<!-- 								<th>강의계획서</th> -->
		<!-- 							</tr> -->
		<!-- 						</thead> -->
		<!-- 						<tbody> -->
		<%-- 							<c:if test="${not empty lectureList }"> --%>
		<%-- 								<c:forEach items="${lectureList }" var="lec"> --%>
		<!-- 									<tr> -->
		<%-- 										<td>${lec.rnum }</td> --%>
		<%-- 										<td>${lec.lecture_semester3 }</td> --%>
		<%-- 										<td>${lec.lecture_semester4 }학기</td> --%>
		<%-- 										<td>${lec.class_type }</td> --%>
		<%-- 										<td>${lec.class_no }</td> --%>
		<%-- 										<td>${lec.class_grade }</td> --%>
		<%-- 										<td>${lec.class_name }</td> --%>
		<%-- 										<td>${lec.name }</td> --%>
		<%-- 										<td><a class="btn btnBlue btn-xs" style="color: white;" href="javascript:void(0);" onclick="OpenWindow('<%=request.getContextPath()%>/lecture/management_st/lecturePlan.do?class_no=${lec.class_no}&lecture_semester=${lec.lecture_semester}','강의계획서 조회','700','780');">강의계획서</a></td> --%>
		<!-- 									</tr> -->
		<%-- 								</c:forEach> --%>
		<%-- 							</c:if> --%>

		<!-- 						</tbody> -->
		<!-- 					</table> -->

		<!-- 				</div> -->
		<!-- 				<div style="padding-top: 20px; padding-bottom: 20px;"> -->
		<%-- 					<%@ include file="/WEB-INF/views/common/pagination.jsp"%> --%>
		<!-- 				</div> -->

		<!-- 			</div> -->
		<!-- 		</div> -->

		<div class="container-fluid">
			<div class="card">
				<div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E; display: flex; height: 55px; padding-top: 0px;">
					<h5 style="font-weight: bold; padding-top: 13px;">수강내역</h5>
					<div class="row" align="right" style="padding-top: 8px; margin-left: 526px;">
						<!-- search bar -->
						<select class="form-control col-md-3" name="searchType" id="searchType" style="font-size: 14px;">
							<option value="gb" ${cri.searchType eq 'gb' ? 'selected':''}>전체</option>
							<option value="gm" ${cri.searchType eq 'gm' ? 'selected':''}>교과목명</option>
							<option value="gs" ${cri.searchType eq 'gs' ? 'selected':''}>교수명</option>
						</select>
						<!-- keyword -->
						<input class="form-control col-md-7" style="width: 200px;" onkeyup="enterkey();" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }" style="font-size: 14px;" />
						<span class="input-group-append">
							<button class="btn text-white" style="background-color: #2A5F9E" type="button" id="searchBtn" data-card-widget="search" onclick="list_stuSearch(1);">
								<i class="fa fa-fw fa-search" style="background-color: #2A5F9E"></i>
							</button>
						</span>
					</div>
					<!-- end : search bar -->


				</div>
				<!-- /.card-header -->
				<div class="card-body table-responsive p-0">
					<div class="row cardRow">
						<c:forEach items="${lectureList}" var="lec" begin="0" end="2">
							<div class="col-sm-4">
								<div class="position-relative p-3 lectureCard" style="padding: 5px; height: 150px; background-color: #f7f7f7;">
									<div class="ribbon-wrapper">
										<div class="ribbon ribbonColor text-white" style="background-color: #2A5F9E;">${lec.class_type}</div>
									</div>
									<h5 class="font-weight:normal;">${lec.class_name}</h5>
									<br> <br> 담당교수 : ${lec.name}
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- row -->

					<br>

					<div class="row cardRow">
						<c:forEach items="${lectureList}" var="lec" begin="3" end="5">
							<div class="col-sm-4">
								<div class="position-relative p-3 lectureCard" style="padding: 5px; height: 150px; background-color: #f7f7f7;">
									<div class="ribbon-wrapper">
										<div class="ribbon ribbonColor text-white" style="background-color: #2A5F9E;">${lec.class_type}</div>
									</div>
									<h5 class="font-weight:normal;">${lec.class_name}</h5>
									<br> <br> 담당교수 : ${lec.name} <span> <%-- 									 <a class="btn btn-sm btnGray text-white" id="" href="javascript:void(0);" onclick="OpenWindow('<%=request.getContextPath()%>/lecture/management_st/lecturePlan.do?class_no=${lec.class_no}&lecture_semester=${lec.lecture_semester}','강의계획서 조회','700','780');">강의계획서</a> --%>

									</span>
								</div>
							</div>
						</c:forEach>
					</div>
					<!-- row -->
				</div>
				<div style="padding-top: 20px; padding-bottom: 20px;">
					<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
				</div>

			</div>
		</div>


		<div class="container-fluid">
			<div class="card">
				<div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E; display: flex; height: 55px; padding-top: 0px;">
					<h5 style="font-weight: bold; padding-top: 13px;">출결이의신청내역</h5>
				</div>
				<!-- 				/.card-header -->
				<div class="card-body table-responsive p-0">
					<table class="table table-hover text-nowrap">
						<thead>
							<tr>
								<th>NO</th>
								<th>출석일자</th>
								<th>신청결과</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty dissentList }">
								<c:forEach items="${dissentList }" var="list">
									<tr>
										<td>${list.rnum }</td>
										<td>${list.attend_date }</td>
										<td>${list.status_cd }</td>
									</tr>
								</c:forEach>
							</c:if>

						</tbody>
					</table>

				</div>
				<div style="padding-top: 20px; padding-bottom: 20px;">
					<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
				</div>

			</div>
		</div>


	</section>

</body>
