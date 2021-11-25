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
       <h3 class="card-title">학과 검색</h3>
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
             <th style="width: 40%;">학부명</th>
             <th style="width: 50%;">학과명</th>
             <th style="width: 10%;">선택</th>
           </tr>
         </thead>
         <tbody>
		   <c:if test="${not empty deptList }">
		   	 <c:forEach items="${deptList }" var="dept">
				<tr>
	             <td>${dept.faculty_nm }</td>
	             <td>${dept.dept_nm }</td>
	             <td value="${dept.dept_cd }" name="${dept.dept_nm }" dept_cd="${dept.dept_cd }" style="padding: 0px;"><button class="btn btnBlue btn-xs select text-white" style="margin: 8px;">선택</button></td>
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
<div style="text-align: center;">
	<button type="button" class="btn btnGray btn-sm text-white" style="width: 60px; margin-top: 20px; " onclick="CloseWindow()">닫기</button>
	</div>
</div>

<script>
window.onload = function(){
   $(document).on('click', '.select', function(){
	   	$(opener.document).find('.select-dept').val($(this).parent().attr('name'));
	   	if($(opener.document).find('#hidden-dept_cd')){
	   		$(opener.document).find('#hidden-dept-cd').val($(this).parent().attr('dept_cd'));
	   	}
	   	window.close();
   })
}
</script>
</body>