<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
</head>
<body>
<br>
   <div class="col-12">
	<div class="card" id="counsel" >
              <div class="card-header" style="background-color: #2A5F9E;color: white;">
                <h3 class="card-title">상담일지</h3>
              </div>
              <!-- /.card-header -->
              
              <div class="card-body table-responsive p-0">
                <table class="table text-nowrap" style="text-align: center;">
                  <thead>
                    <tr style="background-color: #e3f2fd">
                      <th style="width: 242px;">학생</th>
                      <th style="width: 242px;">교수</th>
                      <th style="width: 242px;">상담 일자</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>${cmd.name }</td>
                      <td>${loginUser.name }</td>
                      <td>${cmd.counsel_date }</td>
                    </tr>
                  </tbody>
                </table>
                <table class="table text-nowrap" style="text-align: center;">
                  <thead>
                    <tr style="background-color: #e3f2fd">
                      <th>상담내용</th>
                    </tr>
                  </thead>
                  <tbody style="height: 200px;">
                    <tr>
                      <td>${cmd.counsel_content }</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              </div>
	</div>
	<button id="close" onclick="close();" class="btn btnRed btn-sm text-white" style="background-color:#B94040; margin-left: 270px;" >닫기</button>
   
<script>
document.getElementById('close').onclick = function(){
		window.close();
	
}
</script>     
</body>
</html>