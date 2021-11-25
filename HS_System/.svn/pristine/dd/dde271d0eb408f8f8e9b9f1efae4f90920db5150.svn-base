<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces ="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/js.jsp"%>
<jsp:include page="/WEB-INF/views/include/style.jsp"></jsp:include>
<c:set var="n" value="${notice }" />
<head>
<title>Insert title here</title>
</head>
<body>
<c:if test="${from eq 'modify' }" >
	<script>
		alert("수정되었습니다.");
		window.opener.location.reload();			
		window.close();
	</script>
</c:if>
<c:if test="${from eq 'remove' }" >
	<script>
		alert("삭제되었습니다.");
		window.opener.location.reload();			
		window.close();
	</script>
</c:if>
<section class="content container-fluid">
		<div class="row">
			<div class="col-md-12" style="padding: 10px;">
				<div class="card">
					<div class="card-header" style="border-bottom-width: 3px;border-bottom-color: #2A5F9E;">
						<h3 class="card-title">상세보기</h3>
					</div>
					<div class="card-body">
						<div class="form-group col-sm-12" style="display: flex;">
							<label for="title" style="width: 60px;padding-top: 4px;">제 목</label>
							<input type="text" class="form-control" id="title" value="${n.title }" />							
						</div>	
							<div class="col-sm-12 row">	
							
							<div class="form-group col-sm-2" style="display: flex;">
								<label for="regDate" style="width: 117px; padding-top: 4px;">대 상</label>
								<input type="text"  class="form-control" id="regDate" value="${n.target }">
							</div>	
							<div class="form-group col-sm-3" style="display: flex;">
								<label for="regDate" style="width: 75px; padding-top: 4px;">작성일</label>

								<input type="text" class="form-control" id="regDate" value="<fmt:formatDate value="${n.regist_date }" pattern="yyyy-MM-dd"/>" style="">
							</div>	
							<div class="form-group col-sm-2" style="display: flex;">
								<label for="viewcnt" style="width: 113px; padding-top: 4px;">조회수</label>
								<input type="text" class="form-control" id="viewcnt" value="${n.count }">
							</div>	

						</div>
						<div class="form-group col-sm-12">
						<div class="card">
							<div class="card-body" style="min-height: 350px;border-style: solid;border-color: lightgrey;border-width: 1px;border-radius: 4px;">${n.content }</div>
								</div>
								<%-- <div class="card-footer">
									<div class="row">
										<c:forEach items="${pds.attachList }" var="attach">
											<div class="col-md-4 col-sm-4 col-xs-12"  style="cursor:pointer;"
												 onclick="location.href='<%=request.getContextPath()%>/pds/getFile.do?ano=${attach.ano }';">
												<div class="info-box">	
												 	<span class="info-box-icon bg-yellow">
														<i class="fa fa-copy"></i>
													</span>
													<div class="info-box-content">
														<span class ="info-box-text">
															<fmt:formatDate value="${attach.regDate }" pattern="yyyy-MM-dd" />	
														</span>
														<span class ="info-box-number">${attach.fileName }</span>
													</div>
												</div>
											 </div>							
										</c:forEach>
									</div>
								</div>	 --%>			
												</div>
												
												
						<c:if test="${not empty attachList }">
							<c:forEach items="${attachList }" var="attach">						
								<div class="form-group" style="margin-bottom: 1px;">
									<a href="<%=request.getContextPath() %>/getFile?attach_no=${attach.attach_no}"><button class="btn btnBlue btn-xs text-white" style="background-color:#2A5F9E;margin-left: 10px;margin-right: 10px;">첨부파일</button></a>
									<label for="viewcnt" style="padding-top: 4px;font-weight: normal;font-size: 14px;"><c:if test="${empty attach.orginal_nm }">첨부된 파일이 없습니다.</c:if> ${attach.orginal_nm }</label>
								</div>
							</c:forEach>
						</c:if>
						
					<c:set var="a" value="${n.account_no }" />
					
					<c:if test="${account_no eq a }">
						<div class="card-footer" style="padding: 0px;padding-left: 345px;">
							<button type="button" id="modifyBtn" class="btn btnBlue btn-sm text-white" style="background-color:#2A5F9E;" onclick="submit_go('modifyForm.do','${n.notice_no}');">수정</button>						
						   	<button type="button" id="removeBtn" class="btn btnBlue btn-sm text-white" style="background-color:#B94040;" onclick="submit_go('remove.do','${n.notice_no}');">삭제</button>
						    <button type="button" id="listBtn" class="btn btnBlue btn-sm text-white" style="background-color:#B94040;" onclick="CloseWindow();">닫기 </button>
						</div>									
					</c:if>
					
					<c:if test="${account_no ne a }">
						<div class="card-footer" style="padding: 0px;padding-left: 405px;">
						    <button type="button" id="listBtn" class="btn btnBlue btn-sm text-white" style="background-color:#B94040;" onclick="CloseWindow();">닫기 </button>
						</div>	
					</c:if>
					
					
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row  -->		
		
    </section>

<script>
function submit_go(url,notice_no){
	location.href=url+"?notice_no="+notice_no;
}
</script>
</body>
