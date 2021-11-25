<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="proList" value="${dataMap.proList }" />

<head>
<title>지도교수 목록</title>
<script>
function changeStuAd(pro_no,student_no,professorYN){
	
		confirm("지도교수를 변경하시겠습니까?");		
		$.ajax({
			url : '<%=request.getContextPath()%>/academic/management_as/changeAdvisor',
					data : {
						"pro_no" : pro_no,
						"student_no" : student_no
					},
					dataType : 'json',
					success : function(res) {
						CloseWindow();
					},
					error : function(error) {
						CloseWindow();
					}

				});

	}
</script>
</head>


<body>

	<section class="content" style="padding-left: 10px; padding-right: 10px; padding-top: 10px;">
		<div class="card">
			<div class="card-header with-border">
				<div id="keyword" class="">
					<h5>${dept_nm }&nbsp;교수목록</h5>
				</div>
			</div>
			<div class="card-body" style="text-align: center; padding-bottom: 0; padding-top: 7px;">
				<div class="row">
					<div class="input-group " style="position: unset; padding-bottom: 7px; padding-left: 224px; font-size: 14px; padding-right: 8px;">
						<!-- search bar -->
						<select class="form-control col-md-3" name="searchType" id="searchType" style="font-size: 14px;">
							<option value="" ${cri.searchType eq '' ? 'selected':''}>구분</option>
							<option value="nm" ${cri.searchType eq 'nm' ? 'selected':''}>교수명</option>
							<option value="nb" ${cri.searchType eq 'nb' ? 'selected':''}>교번</option>
						</select>
						<!-- keyword -->
						<input class="form-control" type="text" name="keyword" placeholder="교수명을 입력하세요." value="${cri.keyword }" style="font-size: 14px; width: 150px;" />
						<span class="input-group-append">
							<button class="btn btn-primary" type="button" id="searchBtn" data-card-widget="search" onclick="list_go(1);">
								<i class="fa fa-fw fa-search"></i>
							</button>
						</span>
						<!-- end : search bar -->
					</div>
					<div class="col-sm-12" style="min-height: 386px;">
						<table class="table table-hover table-sm" style="font-size: 15px;">
							<tr style="height: 40px;">
								<th>NO</th>
								<th>교수명</th>
								<th>교번</th>
								<th>담당학생 수</th>
								<th>비고</th>
							</tr>

							<c:forEach items="${proList }" var="list">
								<tr>
									<td>${list.num }</td>
									<td>${list.name }</td>
									<td>${list.pro_no }</td>
									<td>${list.perStu }</td>
									<td>
										<button type="button" class="modifybtn btn bg-gradient-primary btn-xs" id="changeAdvisor" onclick="changeStuAd('${list.pro_no}','${student_no }','${professorYN }');" style="height: 21px;">선택</button>
									</td>
								</tr>
							</c:forEach>


						</table>
					</div>
					<!-- col-sm-12 -->
				</div>
				<!-- row -->
				<div>
					<form id="jobForm">
						<input type='hidden' name="page" value="" />
						<input type='hidden' name="perPageNum" value="${pageMaker.cri.perPageNum }" />
						<input type='hidden' name="searchType" value="" />
						<input type='hidden' name="keyword" value="" />
						<input type='hidden' name="dept_nm" value="${dept_nm }" />
						<input type='hidden' name="student_no" value="${student_no }" />
						<input type='hidden' name="professorYN" value="${professorYN }" />
					</form>
					<!-- pagenation -->
					<nav aria-label="Navigation">
						<ul class="pagination justify-content-center m-0">
							<li class="page-item"><a class="page-link" href="javascript:list_go(1);"> <i class="fas fa-angle-double-left"></i>
							</a></li>
							<li class="page-item"><a class="page-link" href="javascript:list_go('${pageMaker.prev ? pageMaker.startPage-1 : cri.page}');"> <i class="fas fa-angle-left"></i>
							</a></li>
							<c:forEach var="pageNum" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
								<li class="page-item ${pageMaker.cri.page == pageNum?'active':''}"><a class="page-link" href="javascript:list_go('${pageNum}');"> ${pageNum }</a></li>
							</c:forEach>
							<li class="page-item"><a class="page-link" href="javascript:list_go('${pageMaker.next ? pageMaker.endPage+1 :cri.page}');"> <i class="fas fa-angle-right"></i>
							</a></li>
							<li class="page-item"><a class="page-link" href="javascript:list_go('${pageMaker.realEndPage}');"> <i class="fas fa-angle-double-right"></i>
							</a></li>
						</ul>
					</nav>
					<div style="padding-top: 10px; padding-bottom: 10px; float: none;">
						<button type="button" class="modifybtn btn bg-gradient-gray btn-sm" id="cancelBtn" onclick="CloseWindow();">닫기</button>
					</div>
</body>


