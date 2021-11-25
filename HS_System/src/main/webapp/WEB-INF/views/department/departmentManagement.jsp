<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="departList" value="${dataMap.departList }" />
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js"></script>


</head>
<body>
	<!-- Main content -->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<!-- 학과 목록 조회 -->
				<div class="col-md-12">
					<div class="card">
						<div class="card-header" style="padding-top: 10px;">
							<h6 class="card-title">학과 목록 조회</h6>
						</div>
						<!-- /.card-header -->
						<div class="card-body">

							<div class="row">
								<!-- search bar -->
								<select class="form-control col-md-2" name="searchType" id="searchType" style="font-size: 14px;">
									<option value="gb" ${cri.searchType eq 'gb' ? 'selected':''}>전체</option>
									<option value="hb" ${cri.searchType eq 'hb' ? 'selected':''}>학부명</option>
									<option value="hg" ${cri.searchType eq 'hg' ? 'selected':''}>학과명</option>
								</select>
								<!-- keyword -->
								<input class="form-control col-md-5" onkeyup="enterkey();" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }" style="font-size: 14px;" />
								<span class="input-group-append">
									<button class="btn btn-primary" type="button" id="searchBtn" onclick="list_departSearch(1);" data-card-widget="search">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
								<!-- end : search bar -->
							</div>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>학부명</th>
										<th>학과명</th>
										<th>인원</th>
									</tr>
								</thead>
								<tbody id="depart_tbody">
									<c:forEach items="${departList }" var="list">
										<tr onclick="departDetail('${list.dept_nm}')">
											<td>${list.faculty_nm }</td>
											<td>${list.dept_nm }</td>
											<td>${list.personnel }명</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div>
								<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
							</div>
						</div>
						<!-- /.card-body -->
					</div>


					<!-- 학과 정보 -->
					<div class="row">
						<div class="card col-md-6">
							<div class="card-header" style="padding-top: 10px; padding-bottom: 2px;">
								<h6 class="card-title">학과 정보</h6>
								<form id="modifyDepart">
									<div align="right">
										<button type="button" class="insertBtn btn bg-gradient-primary btn-sm" onclick="modifyDepart(dept_cd);">수정</button>
									</div>
							</div>
							<!-- /.card-header -->
							<div class="card-body">
									<div class="row">
										<div class="form-group col-3">
											<label for="stuNo" style="font-size: 14px;">학부번호</label>
											<input type="text" readonly="readonly" class="form-control" id="hbNo" value="" style="font-size: small; background-color: white; padding-top: 5px;">
										</div>
										<div class="form-group col-3" style="font-size: 14px;">
											<label for="stuNo">학부명</label>
											<input type="text" readonly="readonly" class="form-control" id="hbNm" value="" style="font-size: small; background-color: white; padding-top: 5px;">
										</div>
										<div class="form-group col-3" style="font-size: 14px;">
											<label for="stuNo">학과번호</label>
											<input type="text" readonly="readonly" class="form-control" id="hgNo" name="dept_cd" value="" style="font-size: small; background-color: white; padding-top: 5px;">
										</div>
										<div class="form-group col-3" style="font-size: 14px;">
											<label for="stuNo">학과명</label>
											<input type="text" class="form-control" id="hgNm" value="" name="dept_nm" style="font-size: small; background-color: white; padding-top: 5px;">
										</div>
									</div>
									<div class="row">
										<div class="form-group col-2">
											<label for="stuNo" style="font-size: 14px;">정원</label>
											<input type="text" class="form-control" id="people" value="" name="personnel" style="font-size: small; background-color: white; padding-top: 5px;">
										</div>
										<div class="form-group col-2">
											<label for="stuNo" style="font-size: 14px;">전필학점</label>
											<input type="text" id="jpScore" class="form-control" value="" name="major_required" style="font-size: small; background-color: white; padding-top: 5px;">
										</div>
										<div class="form-group col-2">
											<label for="stuNo" style="font-size: 14px;">전선학점</label>
											<input type="text" id="jsScore" class="form-control" value="" name="major_select" style="font-size: small; background-color: white; padding-top: 5px;">
										</div>
										<div class="form-group col-2">
											<label for="stuNo" style="font-size: 14px;">교필학점</label>
											<input type="text" id="gpScore" class="form-control" value="" name="liberal_arts_required" style="font-size: small; background-color: white; padding-top: 5px;">
										</div>
										<div class="form-group col-2">
											<label for="stuNo" style="font-size: 14px;">교선학점</label>
											<input type="text" id="gsScore" class="form-control" value="" name="liberal_arts_select" style="font-size: small; background-color: white; padding-top: 5px;">
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- /.card-body -->


						<div class="col-md-6">

							<div class="row">
								<!-- 학과 등록 -->
								<form id="registDepart">
									<div class="card">
										<div class="card-header" style="padding-top: 10px; padding-bottom: 2px;">
											<h3 class="card-title">학과 등록</h3>
											<div align="right">
												<button type="button" class="insertBtn btn bg-gradient-primary btn-sm" onclick="registDepart();">등록</button>
											</div>
										</div>
										<!-- /.card-header -->
										<div class="card-body">
											<div class="row">
												<div class="form-group col-5" style="padding-top: 0px;">
													<label for="stuNo" style="font-size: 14px;">학부명</label>
													<button class="btn btn-primary" type="submit" id="searchBtn" onclick="OpenWindow('<%=request.getContextPath()%>/search/faculty','학부검색','700','780');" data-card-widget="search" style="padding: 1.5px;">
														<i class="fa fa-fw fa-search"></i>
													</button>
													<input type="text" readonly="readonly" class="form-control select-fac" id="faculty_nm" style="font-size: small; background-color: white; padding-top: 5px;">
													<input type="hidden" class="form-control select-fac2" name="faculty_cd">
												</div>
												<div class="form-group col-7">
													<label for="stuNo" style="font-size: 14px;">학과명</label>
													<input type="text" class="form-control" name="dept_nm" value="" style="font-size: small; background-color: white; padding-top: 5px;">
												</div>
											</div>
											<div class="row">
												<div class="form-group col-2">
													<label for="stuNo" style="font-size: 14px;">정원</label>
													<input type="text" class="form-control" name="personnel" id="stuGender" value="" style="font-size: small; background-color: white; padding-top: 5px;">
												</div>
												<div class="form-group col-2">
													<label for="stuNo" style="font-size: 14px;">전필학점</label>
													<input type="text" id="stuEmail" name="major_required" class="form-control" value="" style="font-size: small; background-color: white; padding-top: 5px;">
												</div>
												<div class="form-group col-2">
													<label for="stuNo" style="font-size: 14px;">전선학점</label>
													<input type="text" id="stuEmail" name="major_select" class="form-control" value="" style="font-size: small; background-color: white; padding-top: 5px;">
												</div>
												<div class="form-group col-2">
													<label for="stuNo" style="font-size: 14px;">교필학점</label>
													<input type="text" id="stuEmail" name="liberal_arts_required" class="form-control" value="" style="font-size: small; background-color: white; padding-top: 5px;">
												</div>
												<div class="form-group col-2">
													<label for="stuNo" style="font-size: 14px;">교선학점</label>
													<input type="text" id="stuEmail" name="liberal_arts_select" class="form-control" value="" style="font-size: small; background-color: white; padding-top: 5px;">
												</div>
											</div>
								</form>

							</div>
						</div>
						<!-- /.card-body -->
					</div>

				</div>

			</div>

		</div>
	</section>

	<script>

window.onload = function(){
// 	   departList();
	
	   oParams = getUrlParams();
	   
	   var url = parent.location.href;
	   var dept_nm = oParams.dept_nm;
	   
	   

	   
	}
	
	

	// 주소줄 parameter 가져오는 함수
	function getUrlParams() {     
	    var params = {};  
	    
	    window.parent.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, 
	       function(str, key, value) { 
	           params[key] = value; 
	        }
	    );     
	    
	    return params; 
	}
	
	// 학과목록 ajax
// 	function departList(){
// 		$.ajax({
<%-- 			url:"<%=request.getContextPath()%>/major/management/list", --%>
// 			//data: 'json',
// 			dataType:'json',
// 			success: function(data){
// 				printData(data,'#depart_tbody','#depart_list');	
// 			},
// 			error: function (error) {
// 				alert('error!');
// 				console.log(error);
// 			}
// 		})
// 	}


	// 학과목록 검색
	function list_departSearch(page, url) {
		if (!url)
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
	
	// 검색 입력칸 입력후 엔터치면 검색버튼 클릭 효과
	function enterkey() {
        if (window.event.keyCode == 13) {
        	list_departSearch(1);
        }
	}
	
	
	// 학과 상세
	function departDetail(dept_nm) {
		  var renewURL = parent.location.href;
		   // dept_nm가 이미 존재한다면
		   if(renewURL.indexOf("dept_nm") != -1){
		      renewURL = "http://localhost/hs/index.do?mCode=M120100&dept_nm="+dept_nm;
		   }else{ // 없을시 
		   renewURL = renewURL + '&dept_nm='+dept_nm;      
		   }
		   
		   //alert(renewURL);   
		   window.parent.postMessage(renewURL, '*');
		   
		   
		
		$.ajax({
			url : '<%=request.getContextPath()%>/major/management/detail',
					data : {
						"dept_nm" : dept_nm
					},
					dataType : 'json',
					success : function(data) {
						document.getElementById("hbNo").value = data.detail[0].faculty_cd;
						document.getElementById("hbNm").value = data.detail[0].faculty_nm;
						document.getElementById("hgNo").value = data.detail[0].dept_cd;
						document.getElementById("hgNm").value = dept_nm;
						document.getElementById("people").value = data.detail[0].personnel;
						document.getElementById("jpScore").value = data.detail[0].major_required;
						document.getElementById("jsScore").value = data.detail[0].major_select;
						document.getElementById("gpScore").value = data.detail[0].liberal_arts_required;
						document.getElementById("gsScore").value = data.detail[0].liberal_arts_select;

					},
					error : function(error) {
						alert('error!');
						console.log(error);
					}
				});

	}
	
	// 학과 등록
	function registDepart() {
		var form=$('#registDepart').serialize();
		
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/major/management/regist",
				data : form,
				dataType : "json",
				// contentType : "application/json; charset=utf-8",
				success : function(data) {
					alert('학과가 등록되었습니다');
					 list_departSearch(1);
				},
				error : function(error) {
					console.log(error);
				}
			})

		}
	
	// 학과 수정
	function modifyDepart(dept_cd) { 
		var form=$('#modifyDepart').serialize();
		
		$.ajax({
			type:"post",
			url:"<%=request.getContextPath()%>/major/management/modify",
				data : form,
				dataType : "json",
				// contentType : "application/json; charset=utf-8",
				success : function(data) {
					alert('학과가 수정되었습니다');
					departDetail(dept_cd);
				},
				error : function(error) {
					alert('error!');
					console.log(error);
				}
			})

		}
	</script>

	<script id="depart_list" type="text/x-handlebars-template">
{{#each.}}
		<tr onclick="departDetail('{{dept_nm}}')">
			<td>{{faculty_nm}}</td>
			<td>{{dept_nm}}</td>
			<td>{{personnel}}명</td>
		</tr>
{{/each}}
</script>


</body>
