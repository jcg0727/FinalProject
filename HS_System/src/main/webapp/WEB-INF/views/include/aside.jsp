<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script>
	function logout() {
		if (!confirm("로그아웃 하시겠습니까?")) {
		} else {
			location.href="<%=request.getContextPath()%>/commons/logout.do";
		}
	}
</script>



<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-light-lightgray elevation-4">
	<!-- Brand Logo -->
	<a href="<%=request.getContextPath()%>/" class="brand-link" style="color: #fff; background-color: #2A5F9E;"> <%-- <img src="<%=request.getContextPath()%>/resources/image/hsLogo.png" alt="H.S.System logo" class="brand-image img-circle elevation-3" style="opacity: .8"> --%> <span class="brand-text font-weight-bold" style="padding-left: 60px;">H.S.System</span>
	</a>


	<div class="sidebar">
		<!-- Sidebar user (optional) -->
		<div class="user-panel mt-3 pb-3 mb-3 d-flex" style="height: 100px;">
			<div class="image" style="padding-right: 9px;margin-top: 15px;">
				<!-- UI확인을 위한 임시 이미지(루피)... 용도맞춰 변경하심됩니다 - 은주 -->
				<img src="<%=request.getContextPath()%>/resources/dddddddd.jpg" class="" alt="User Image">
			</div>
			<div class="info">
				<a href="#" class="d-block" style="padding-bottom: 10px;"> <c:choose>
						<c:when test="${loginUser.length eq 10}">
						학생
					</c:when>
						<c:when test="${loginUser.length eq 11}">
						교직원
					</c:when>
						<c:when test="${loginUser.length eq 8}">
						교수
					</c:when>
					</c:choose> ${loginUser.name } 님
				</a>
				<!-- 비밀번호 수정 버튼 -->
				<a class="btn btnBlue btn-xs" style="color: white;" href="javascript:void(0);" onclick="OpenWindow('<%=request.getContextPath()%>/modifyPwForm','비밀번호수정','600','400');">비밀번호수정</a>
				<!-- 로그아웃 -->
				<a onclick="logout();" class="btn btnBlue btn-xs" style="color: white;" href="javascript:void(0);">로그아웃</a> <br>

			</div>
		</div>


		<!-- Sidebar Menu -->
		<nav class="mt-2 shadow-sm">

			<ul class="nav nav-pills nav-sidebar nav-child-indent flex-column" data-widget="treeview" role="menu" data-accordion="false">
				<!-- Add icons to the links using the .nav-icon class
            	with font-awesome or any other icon font library -->
				<c:if test="${not empty menuList }">
					<c:forEach items="${menuList }" var="menu">
						<c:if test="${'M000000' ne menu.mcode}">
							<!-- One Depth -->
							<li class="nav-item has-treeview ${menu.mcode }"><a href="javascript:goPage('${menu.url}', '${menu.mcode }');" class="nav-link"> <i class="nav-icon fas ${menu.micon }"></i>
									<p>
										${menu.mname }
										<c:if test="${not empty menu.subMenuList }">
											<i class="right fas fa-angle-left"></i>
										</c:if>
									</p>
							</a> <c:if test="${not empty menu.subMenuList }">
									<c:forEach items="${menu.subMenuList }" var="subMenu">
										<!-- two Depth -->
										<ul class="nav nav-item nav-treeview">
											<li class="nav-item  ${subMenu.mcode }" upcode="${subMenu.upcode }"><a href="javascript:goPage('${subMenu.url}','${subMenu.mcode }');" class="nav-link">  <i class="nav-icon fas ${subMenu.micon }"></i>
													<p>
														${subMenu.mname }
														<c:if test="${not empty subMenu.subMenuList }">
															<i class="right fas fa-angle-left"></i>
														</c:if>
													</p>
											</a> <c:if test="${not empty subMenu.subMenuList }">
													<c:forEach items="${subMenu.subMenuList}" var="twoDepth">
														<ul class="nav nav-item nav-treeview">
															<li class="nav-item ${twoDepth.mcode }" upcode="${twoDepth.upcode }"><a href="javascript:goPage('${twoDepth.url}','${twoDepth.mcode }');" class="nav-link"> <i class="nav-icon fas ${twoDepth.micon }"></i>
																	<p>${twoDepth.mname }</p>
															</a></li>
														</ul>
													</c:forEach>
												</c:if></li>
										</ul>
									</c:forEach>
								</c:if></li>
						</c:if>
					</c:forEach>
				</c:if>
			</ul>
		</nav>
		<!-- /.sidebar-menu -->
	</div>
	<!-- /.sidebar -->
</aside>




