<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="studentList" value="${dataMap.studentList }" />
<c:set var="stuInfoList" value="${dataMap.stuInfoList }" />
<head>
<script>

window.onload = function(){
	   oParams = getUrlParams();
	   
	   var url = parent.location.href;
	   var student_no = oParams.student_no;

	   
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
	
	// 검색 입력칸 입력후 엔터치면 검색버튼 클릭 효과
	function enterkey() {
        if (window.event.keyCode == 13) {
        	list_stuSearch(1);
        }
	}

	
	// 학생목록 검색
	function list_stuSearch(page,url){
		if(!url) url= window.location.href;
		
		var jobForm=$('#jobForm');
		
		if(!page) page=1;

		jobForm.find("[name='page']").val(page);

		if($('select[name="perPageNum"]').val()){
			jobForm.find("[name='perPageNum']").val($('select[name="perPageNum"]').val());
		}
		
		console.log(jobForm.find("[name='perPageNum']").val());
		
		jobForm.find("[name='searchType']").val($('select[name="searchType"]').val());
		jobForm.find("[name='keyword']").val($("#keyword").val());
		
		console.log(jobForm.find("[name='searchType']").val($('select[name="searchType"]').val()));
		console.log(jobForm.find("[name='keyword']").val($("#keyword").val()));
		
		
		jobForm.attr({
			action:url,
			method:'get'
		}).submit();
	}


	Date.prototype.YYYYMMDDHHMMSS = function(){
		var yyyy = this.getFullYear().toString();
		var MM = pad(this.getMonth() + 1,2);
		var dd = pad(this.getDate(),2);
		var hh = pad(this.getHours(),2);
		var mm = pad(this.getMinutes(),2);
		var ss = pad(this.getSeconds(),2);
		
		return yyyy+"/"+MM+"/"+dd;
	};
	
	function studentDetail(student_no) {
		
		  var renewURL = parent.location.href;
		   // student_no가 이미 존재한다면
		   if(renewURL.indexOf("student_no") != -1){
		      renewURL = "http://localhost/hs/index.do?mCode=M010100&student_no="+student_no;
		   }else{ // 없을시 
		   renewURL = renewURL + '&student_no='+student_no;      
		   }
		   
		   //alert(renewURL);   
		   window.parent.postMessage(renewURL, '*');
		   
		   
		
		$.ajax({
			url : '<%=request.getContextPath()%>/academic/management_as/detail',
					data : {
						"student_no" : student_no
					},
					dataType : 'json',
					success : function(data) {
						console.log(data.prof[0].pro_name);
						// 				$(data).each(function() {
						document.getElementById("stuNo").value = student_no;
						document.getElementById("stuNm").value = data.student[0].name;
						document.getElementById("stuGender").value = data.student[0].gender;
						document.getElementById("stuDept").value = data.student[0].dept_nm;
						document.getElementById("stuEmail").value = data.student[0].email;
						document.getElementById("stuPhone").value = data.student[0].phone
								.substring(0, 3)
								+ "-"
								+ data.student[0].phone.substring(3, 7)
								+ "-" + data.student[0].phone.substring(7);
						document.getElementById("stuAddr1").value = data.student[0].address;
						document.getElementById("stuAddr2").value = data.student[0].detail_add;
						document.getElementById("professor").value = data.prof[0].pro_name;
						// 					 document.getElementById("stuRegist").value = data.student[0].registDate;

						var transferDate = new Date(parseInt(
								data.student[0].registdate, 10));
						transferDate = transferDate.YYYYMMDDHHMMSS();
						document.getElementById("stuRegist").value = transferDate;

						switch (data.student[0].status_cd) {
						case "CCDA001":
							document.getElementById("stuStatus").value = "재학";
							break;

						case "CCDA002":
							document.getElementById("stuStatus").value = "휴학";
							break;

						case "CCDA003":
							document.getElementById("stuStatus").value = "자퇴";
							break;

						case "CCDA004":
							document.getElementById("stuStatus").value = "제적";
							break;

						case "CCDA005":
							document.getElementById("stuStatus").value = "졸업";
							break;

						}
						// 				});

					},
					error : function(error) {
						alert('error!');
						console.log(error);
					}
				});

	}
	
	// 지도교수 변경 팝업창
	function OpenWindow2(UrlStr, WinTitle, WinWidth, WinHeight) {
		   
			UrlStr=UrlStr+"dept_nm="+document.getElementById("stuDept").value;
		   UrlStr=UrlStr+"&student_no="+document.getElementById("stuNo").value;
		   UrlStr=UrlStr+"&professorYN="+document.getElementById("professor").value;

		   winleft = (window.screen.width/2) - (WinWidth/2);
		   wintop = (window.screen.height/2)- (WinHeight/2);
		   var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
		                     +"height="+ WinHeight +", top="+ wintop +", left=" 
		                     + winleft +", resizable=yes, status=yes"  );
		   win.focus(); 
		         
		   
		}

</script>
</head>
<body>
	<!-- Main content -->
	<section class="content" style="padding-top: 10px;">
		<div class="container-fluid">
			<div class="row">
				<!-- 학생 목록 조회 -->
				<div class="col-md-6">
					<div class="card">
 						 <div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
							<h5 style="font-weight: bold;">학생 목록 조회</h5>
						</div>
						<!-- /.card-header -->
						<div class="card-body">
							<!-- 							<div class="row" style="margin-left: 0; margin-bottom: 7px"> -->
							<!-- search bar -->
							<!-- keyword -->
							<!-- 								<span class="input-group-append"> -->
							<%-- 									<button class="btn btn-primary" type="button" id="searchBtn" data-card-widget="search" onclick="OpenWindow('<%=request.getContextPath()%>/search/department','학과검색','700','780');" style="padding: 0; padding-left: 7px; padding-right: 7px; height: 100%;">학과검색</button> --%>
							<!-- 								</span> -->
							<!-- 								<input class="form-control col-md-9" type="text" id="keywordDept" name="keyword" value="" style="font-size: 14px;" /> -->
							<!-- end : search bar -->
							<!-- 							</div> -->
							<div class="row" style="margin-left: 0; margin-bottom: 7px">
								<!-- search bar -->
								<select class="form-control col-md-3" name="searchType" id="searchType" style="font-size: 14px;">
									<option value="gb" ${cri.searchType eq 'gb' ? 'selected':''}>전체</option>
									<option value="nb" ${cri.searchType eq 'nb' ? 'selected':''}>학번</option>
									<option value="dt" ${cri.searchType eq 'dt' ? 'selected':''}>학과</option>
									<option value="nm" ${cri.searchType eq 'nm' ? 'selected':''}>이름</option>
								</select>
								<!-- keyword -->
								<input class="form-control col-md-7" onkeyup="enterkey();" type="text" id="keyword" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }" style="font-size: 14px;" />
								<span class="input-group-append">
									<button class="btn text-white" style="background-color:#2A5F9E;" type="button" id="searchBtn" data-card-widget="search" onclick="list_stuSearch(1);">
										<i class="fa fa-fw fa-search"></i>
									</button>
								</span>
								<!-- end : search bar -->
							</div>
							<table class="table table-hover">
								<thead>
									<tr>
										<th>학번</th>
										<th>학과</th>
										<th>이름</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${studentList }" var="list">
										<tr onclick="studentDetail('${list.student_no }')">
											<td>${list.student_no }</td>
											<td>${list.dept_nm }</td>
											<td>${list.name }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div style="padding-top: 30px; padding-bottom: 50px;">
								<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
							</div>
						</div>
						<!-- /.card-body -->
					</div>
				</div>


				<!-- 학생 상세 조회 -->
				<div class="col-md-6">
					<div class="card">
 						 <div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
							<h5 style="font-weight: bold;">학생 상세 조회</h5>
						</div>
						<!-- /.card-header -->
						<div class="card-body" style="min-height: 742px;">
							<div class="row">
								<div class="form-group col-6">
									<label for="stuNo">학번</label>
									<input type="text" readonly="readonly" class="form-control" id="stuNo" value="" style="background-color: white; padding-top: 5px;">
								</div>
								<div class="form-group col-6">
									<label for="stuNo">성명</label>
									<input type="text" readonly="readonly" class="form-control" id="stuNm" value="" style="background-color: white; padding-top: 5px;">
								</div>

							</div>
							<div class="row">
								<div class="form-group col-6">
									<label for="stuNo">성별</label>
									<input type="text" readonly="readonly" class="form-control" id="stuGender" value="" style="background-color: white; padding-top: 5px;">
								</div>
								<div class="form-group col-6">
									<label for="stuNo">학과</label>
									<input type="text" readonly="readonly" class="form-control" id="stuDept" value="" style="background-color: white; padding-top: 5px;">
								</div>
								<div class="form-group col-6">
									<label for="stuNo">지도교수</label>
									<button type="button" class="btn btn-xs btnBlue text-white" style="background-color:#2A5F9E;" onclick="OpenWindow2('management_as/studentProList.do?','','640','618');">변경</button>
									<input type="text" readonly="readonly" class="form-control" id="professor" value="" style="background-color: white; padding-top: 5px;">
								</div>
								<div class="form-group col-6">
									<label for="stuNo">입학일자</label>
									<input type="text" readonly="readonly" class="form-control" id="stuRegist" value="" style="background-color: white; padding-top: 5px;">
								</div>
							<div class="form-group row col-12">
								<div class="col-3">
									<label for="stuNo">학적상태</label>
									<input type="text" readonly="readonly" class="form-control" id="stuStatus" value="" style="background-color: white; padding-top: 5px;">
								</div>
								<div class="col-9">
									<label for="stuNo">연락처</label>
									<input type="text" readonly="readonly" id="stuPhone" class="form-control" value="" style="background-color: white; padding-top: 5px;">
								</div>
								
							</div>
							</div>
							<div class="row">
								<div class="form-group col-12">
									<label for="stuNo">이메일</label>
									<input type="text" readonly="readonly" id="stuEmail" class="form-control" value="" style="background-color: white; padding-top: 5px;">
								</div>
								<div class="form-group col-12">
									<label for="stuNo">주소</label>
									<input type="text" readonly="readonly" id="stuAddr1" class="form-control" value="" style="background-color: white; backpadding-top: 5px;">
									<input type="text" readonly="readonly" id="stuAddr2" class="form-control" value="" style="background-color: white; adding-top: 5px; margin-top: 10px;">
								</div>
							</div>
						</div>
					</div>
					<!-- /.card-body -->
				</div>
			</div>
		</div>
	</section>
</body>
