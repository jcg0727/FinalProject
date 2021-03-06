<%@page import="kr.ac.hs.dto.AccountVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
</head>

<body>

<form action="securityModify.do" method="post">
<br><br>
<div class="col-md-6">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title" style="margin-left: 200px" >${loginUser.name} 님의 보안레벨 ${loginUser.security_level}</h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body p-0">
                <table class="table table-striped" style="text-align: center;">
                  <thead>
                    <tr>
                      <th style="width: 40px;">보안레벨</th>
                      <th style="width: 80px;">보안내용</th>
                      <th style="width: 50px">선택</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>아이디 + 패스워드</td>
                      <td><span class="badge bg-danger"><input type="radio" name="chk_info" value="1"></span></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>아이디 + 패스워드 + 문자인증</td>
                      <td><span class="badge bg-warning"><input type="radio" name="chk_info" value="2"></span></td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>아이디 + 패스워드 + 얼굴인증</td>
                      <td><span class="badge bg-primary"><input type="radio" name="chk_info" value="3"></span></td>
                    </tr>

                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>


<button type="submit" class="btn btn-block btn-primary" style="width: 150px; margin-left: 230px">설 정</button>

  </form>



<jsp:include page="/WEB-INF/views/include/js.jsp"></jsp:include> 
<jsp:include page="/WEB-INF/views/include/style.jsp"></jsp:include> 


</body>

