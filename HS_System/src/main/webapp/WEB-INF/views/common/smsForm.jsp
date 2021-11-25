<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <div class="form-group">
  
  </div>   
   <form id="sms" name="sms" class="form-signin" action="message" method="POST" style="margin-left: 170px">
      <h2 class="form-findId-heading">문자 인증</h2>
      
      <label for="name" class="">이름</label>
      <input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력해주세요." style="width: 230px" required autofocus >
      <br>
      
      <label for="phoneNum" class="">핸드폰 번호</label>
      <input type="text" id="phoneNum" name="phoneNum" class="form-control" placeholder="핸드폰 번호를 입력해 주세요" style="width: 230px" required autofocus>
      <button class="btn btn-default" type="button" onclick="javascript:fn_serialNum();">인증번호 받기</button> 
      
      <br><br>
      <label for="phoneNum" class="">인증번호 확인</label>
      <input type="text" id="phoneNumCheck" name="phoneNumCheck" class="form-control" placeholder="인증 번호를 입력해 주세요"  style="width: 230px" readonly="readonly">
      <button class="btn btn-default" type="button" onclick="javascript:fn_serialNumCheck();">인증번호 확인</button> <input type="text" class="timer" style="border: none; color: red;">

      
      <br><br>
      <button class="btn btn-lg btn-info" type="button" onclick="javascript:fn_main();" style="margin-left: 70px;">확인</button>
      
   </form>
</div><!-- /container -->

<jsp:include page="/WEB-INF/views/include/js.jsp"></jsp:include> 
<jsp:include page="/WEB-INF/views/include/style.jsp"></jsp:include> 
<!-- jQuery -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script>
	var num = 60 * 3; // 몇분을 설정할지의 대한 변수 선언
    var myVar;
    function time(){
        myVar = setInterval(alertFunc, 1000); 
    }
    function alertFunc() {
        var min = num / 60; 
        min = Math.floor(min);
         
        var sec = num - (60 * min);
        console.log(min)
        console.log(sec)

        var $input = $('.timer').val(min + ':' + sec);

        if(num == 0){
            clearInterval(myVar)
        }
        num--;
    }
var checkNum ="";   
var form = document.sms;
var phoneTrue = false;
function fn_serialNum() {
    time();
	alertFunc();
	   $("#phoneNumCheck").attr('readonly', false); // 버튼 누르면 리드온리 취소
	   
	      
	   var phoneNum = document.getElementById('phoneNum').value;   
	      //alert(phoneNum)
	      
	      $.ajax({
	         type: "POST",
	         url: "<%=request.getContextPath()%>/message",
	         data: { phoneNum: phoneNum },
	         success: function(res) {
		         alert(phoneNum + " 로 인증번호가 발송되었습니다")
		         checkNum = res;   
	         }
	      });

	   }

//인증번호 확인 버튼
function fn_serialNumCheck() {
   if(form.phoneNumCheck.value==checkNum){
      alert("인증 번호 일치");   
      phoneTrue = true;
      $("#phoneNumCheck").attr('readonly', true); // 버튼 누르면 리드온리 취소

   }else{
      alert("인증번호 불일치");
   }

}

function fn_main() {
    	opener.parent.loginForm();
   		 window.close();
<%-- 	   window.location.href = '<%=request.getContextPath()%>/index.do' --%>
}
</script>	
</body>
</html>
  




