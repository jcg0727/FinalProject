<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
<style>
select {
	text-align: center;
}
</style>
</head>
<div class="col-12">
	<div class="card">
		<div class="card-header">
			<h3 class="card-title">자퇴신청</h3>
		</div>
		<!-- /.card-header -->
		<div class="card-body">
			<div class="row">
				<div class="form-group col-3">
					<label for="year">신청일자</label>
					<input type="text" class="form-control" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>" readonly="readonly" style="padding-top: 5px; font-size: large;">
				</div>
				<c:forEach items="${acuntList }" var="acunt">
					<div class="form-group col-3">
						<label for="year">학과</label>
						<input type="text" class="form-control" value="${acunt.dept_nm}" readonly="readonly" style="padding-top: 5px;">
					</div>
					<div class="form-group col-3">
						<label for="studentNo">학번</label>
						<input type="text" class="form-control" value="${loginUser.id }" readonly="readonly">
						<c:if test="${empty loginUser.id }">
				    	true
				    </c:if>
					</div>
					<div class="form-group col-3">
						<label for="studentNm">이름</label>
						<input type="text" class="form-control" value="${loginUser.name }" readonly="readonly">
					</div>
			</div>

			<div class="row">

				<div class="form-group col-3">
					<label for="year">환불계좌은행</label>
					<input type="text" class="form-control" value="${acunt.acunt_bank}" readonly="readonly" style="padding-top: 5px;">
				</div>
				<div class="form-group col-3">
					<label for="year">예금주</label>
					<input type="text" class="form-control" value="${acunt.acunt_nn}" readonly="readonly" style="padding-top: 5px;">

				</div>
				<div class="form-group col-3">
					<label for="registerDate">계좌번호</label>
					<input type="text" class="form-control" value="${acunt.acunt_no}" readonly="readonly" style="padding-top: 5px; font-size: large;">
				</div>
				</c:forEach>
			</div>
			<div class="row">
				<div class="form-group col-12">
					<label for="year">신청사유</label>
					<input type="text" class="form-control drop_reason" value="" style="padding-top: 5px; font-size: large;">
				</div>
			</div>


			<!-- card end -->
		</div>
	</div>
</div>
<!-- 신청버튼 -->
<div align="center">
	<button type="button" class="btn btnGray btn-sm text-white" style="width: 120px; background-color:#666666;" onclick="estimatedRefundbtn();">환불예상금액</button>
	<button type="button" class="btn btnBlue btn-sm text-white" style="width: 120px; background-color:#2A5F9E;" onclick="dropRegistbtn();">자퇴신청</button>
</div>

<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->

<div class="col-12 transfer-div">
	<div class="card">
		<div class="card-header">
			<h3 class="card-title">자퇴신청내역</h3>

			<div class="card-tools">
				<div class="input-group input-group-sm" style="width: 150px;">
					<input type="text" name="table_search" class="form-control float-right" placeholder="Search">

					<div class="input-group-append">
						<button type="submit" class="btn btn-default">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</div>
			</div>
		</div>
		<!-- /.card-header -->
		<div class="card-body table-responsive p-0">
			<table class="table table-hover text-nowrap">
				<thead>
					<tr>
						<th>No</th>
						<th>신청일자</th>
						<th colspan="3">신청사유</th>
						<th>처리상태</th>
					</tr>
				</thead>
				<tbody id="drop_tbody">
					<%-- 					<c:forEach items="${dropList }" var="drop"> --%>
					<!-- 						<tr> -->
					<%-- 							<td>${drop.academic_state_no}</td> --%>
					<%-- 							<td><fmt:formatDate value="${drop.register_date}" pattern="yyyy-MM-dd" /></td> --%>
					<%-- 							<td><c:choose> --%>
					<%-- 									<c:when test="${now < oneSemester or now > twoSemester}">1학기</c:when> --%>
					<%-- 									<c:otherwise>2학기</c:otherwise> --%>
					<%-- 								</c:choose></td> --%>
					<%-- 							<td colspan="2">${drop.register_reason }</td> --%>
					<!-- 							<td>상담대기 / -->
					<!-- 								<button type="button" class="btn bg-gradient-danger btn-sm" style="width: 50px;">취소</button> -->
					<!-- 							</td> -->
					<!-- 							<td><button type="button" class="btn bg-gradient-secondary btn-sm">상담실 이동</button></td> -->
					<!-- 						</tr> -->
					<%-- 					</c:forEach> --%>
				</tbody>
			</table>
		</div>
		<!-- /.card-body -->
	</div>
	<!-- /.card -->
</div>

<form id="registAcademicDrop">
	<input type="hidden" name="student_no" value="${loginUser.id }">
	<%-- 	<input type="hidden" name="register_date" value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>"> --%>
	<input type="hidden" name="drop_reason">
	<input type="hidden" value="CCDF001" name="r_status_cd">
</form>

<script>



	// 신청버튼 ajax
	function dropRegistbtn() {
		
		var drop_reason=$('input[name="drop_reason"]').val($('.drop_reason').val());
		
		var form=$('#registAcademicDrop').serialize();
	
		
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/academicState/drop/regist",
			data:form,
			dataType:"json",
			success : function(data) {
				alert(data.message);
				dropList();
			},
			error: function(error) {
				console.log(error);
				alert("error!");
			}
		})
	}
	
	// 신청내역 ajax
	function dropList() {
		$.ajax({
			url: "<%=request.getContextPath()%>/academicState/drop/list",
			data: {"id":${loginUser.id}},
			dataType: "json",
			success: function(data) {
				$.each(data, function(i, v){
					
					const myDate = new Date(v.register_date);
					v.register_date = myDate.toLocaleString();
					
					switch(v.r_status_cd){
						case "CCDF001" :
							v.r_status_cd="신청완료"; break;
						case "CCDF002" :
							v.r_status_cd="상담대기"; break;
						case "CCDF003" :
							v.r_status_cd="상담거절"; break;
						case "CCDF004" :
							v.r_status_cd="지도교수승인"; break;
						case "CCDF005" :
							v.r_status_cd="지원학과교수승인"; break;
						case "CCDF006" :
							v.r_status_cd="소속학과승인"; break;
						case "CCDF007" :
							v.r_status_cd="지원학과승인"; break;
						case "CCDF008" :
							v.r_status_cd="반려"; break;
					}
				})
					printData(data, '#drop_tbody', '#drop_list', '.tdListDrop');
			}, 
			error: function(error) {
				alert('error!')
				console.log(error);
			}
		});
		
	}
	
	// 신청취소(삭제) ajax
	function DropResistCancelBtn(){
		var id = ${loginUser.id};
		$.ajax({
			type : "post",
			url : "<%=request.getContextPath()%>/academicState/drop/remove",
			data : {id:id},
			dataType : "json",
			success : function(url){
				alert("삭제되었습니다");
				dropList();
			},
			error : function(error){
				console.log(error);
				alert("error!");
			}
		})
	}



	// 환불예상금액 계산
	function estimatedRefundbtn() {
		var semester1 = new Date('2021-03-01');
		var semester2 = new Date('2021-09-01');
		var today = new Date();

		var semester1Time = semester1.getTime();
		var semester2Time = semester2.getTime();
		var todayTime = today.getTime();
		var hday1=Math.ceil((todayTime-semester1Time)/24/60/60/1000);
		var hday2=Math.ceil((todayTime-semester2Time)/24/60/60/1000);

		if (today > semester1 && today < semester2) {
			if (hday1 <= 30) {
				alert("금일 기준으로 학기 시작일로부터 30일 경과 전이므로\n등록금의 5/6가 환불될 예정입니다.\n정확한 금액은 교무처 문의 바랍니다.");
			} else if (hday1 > 30 && hday1 <= 60) {
				alert("금일 기준으로 학기 시작일로부터 30일 경과 후 60일 경과전이므로\n등록금의 2/3가 환불될 예정입니다.\n정확한 금액은 교무처 문의 바랍니다.");
			} else if (hday1 > 60 && hday1 <= 90) {
				alert("금일 기준으로 학기 시작일로부터 60일 경과 후 90일 경과전이므로\n등록금의 1/2가 환불될 예정입니다.\n정확한 금액은 교무처 문의 바랍니다.");
			} else {
				alert("금일 기준으로 학기 시작일로부터 90일이 경과했으므로\n환불될 등록금은 없습니다.\n정확한 사항은 교무처 문의 바랍니다.");
			}
		} else {
			if (hday2 <= 30) {
				alert("금일 기준으로 학기 시작일로부터 30일 경과 전이므로\n등록금의 5/6가 환불될 예정입니다.\n정확한 금액은 교무처 문의 바랍니다.");
			} else if (hday2 > 30 && hday2 <= 60) {
				alert("금일 기준으로 학기 시작일로부터 30일 경과 후 60일 경과전이므로\n등록금의 2/3가 환불될 예정입니다.\n정확한 금액은 교무처 문의 바랍니다.");
			} else if (hday2 > 60 && hday2 <= 90) {
				alert("금일 기준으로 학기 시작일로부터 60일 경과 후 90일 경과전이므로\n등록금의 1/2가 환불될 예정입니다.\n정확한 금액은 교무처 문의 바랍니다.");
			} else {
				alert("금일 기준으로 학기 시작일로부터 90일이 경과했으므로\n환불될 등록금은 없습니다.\n정확한 사항은 교무처 문의 바랍니다.");
			}
		}
	}
</script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" ></script> -->
<script id="drop_list" type="text/x-handlebars-template">
	{{#if null}}
		{{#each .}}
			<tr class="tdListDrop">
				<td colspan="10" style="text-align:center;">자퇴신청 내역이 없습니다</td>
			</tr>
		{{/each}}

	{{else}}
		
		{{#each.}}
			<tr class="tdListDrop">
				<td>{{academic_state_no}}</td>
				<td>{{register_date}}</td>
				<td colspan="3">{{register_reason}}</td>
				{{#ifEquals r_status_cd "신청완료"}}
					<td>{{r_status_cd}} /
						<button type="button" onclick="DropResistCancelBtn();" class="btn bg-gradient-danger btn-sm" style="width: 50px;">취소</button>
					</td>
				{{else}}
					<td>{{r_status_cd}}</td>
				{{/ifEquals }}
		</tr>
		{{/each}}

	{{/if}}
</script>

