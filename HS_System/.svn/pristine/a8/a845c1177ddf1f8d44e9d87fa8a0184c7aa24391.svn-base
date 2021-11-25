<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style>
table {
	text-align:center;
	vertical-align:middle;
	font-size: small;
}

th,td {
	vertical-align : middle;
	height: 20px;
	padding: 5px;;
}

body > .card {
	margin: 20px;
}

.search-dept{
	height : 550px;
	margin: 10px;
}
</style>
</head>

<body>
<div style="margin: 15px;">
<div class="card" style="padding-bottom: 20px;">
     <div class="card-header">
       <h3 class="card-title">학부 검색</h3>
       <div class="card-tools">
          	<div class="input-group input-group-sm" style="width: 400px;">
	    		<select class="form-control">
	       			<option>학부명</option>
	       			<option>학과명</option>
	       		</select>
            <input type="text" name="table_search" class="form-control float-right" placeholder="Search" style="width: 50%;">
            <div class="input-group-append">
              <button type="submit" class="btn btn-default">
                <i class="fas fa-search"></i>
              </button>
            </div>
          </div>
        </div>
     </div>
     <!-- /.card-header -->
     <div class="card-body search-dept">
       <table class="table table-bordered">
         <thead>
           <tr style="background: #caced1; height: 10px;">
             <th style="width: 40%;">학부번호</th>
             <th style="width: 50%;">학부명</th>
             <th style="width: 10%;">선택</th>
           </tr>
         </thead>
         <tbody>
		   <c:if test="${not empty facultyList }">
		   	 <c:forEach items="${facultyList }" var="fac">
				<tr>
	             <td>${fac.faculty_cd }</td>
	             <td>${fac.faculty_nm }</td>
	             <td value="${fac.faculty_cd }" name="${fac.faculty_nm }"style="padding: 0px;"><button class="btn btn-primary btn-xs select" style="margin: 8px;">선택</button></td>
	           </tr>		   	 
		   	 </c:forEach>
		   </c:if>
         </tbody>
       </table>
     </div>
     <!-- /.card-body -->
     <div>
		<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
     </div>
</div>
<span>
	<button type="button" class="btn float-right bg-gradient-danger btn-sm" style="width: 60px; margin-top: 20px; " onclick="CloseWindow()">닫기</button>
	</span>
</div>

   <script>
   window.onload = function(){
	   $(document).on('click', '.select', function(){
		   	$(opener.document).find('.select-fac').val($(this).parent().attr('name'));
		   	$(opener.document).find('.select-fac2').val($(this).parent().attr('value'));
		   	window.close();
	   })
   }
   </script>
</body>