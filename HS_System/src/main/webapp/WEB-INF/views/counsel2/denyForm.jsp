<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<head>
<title>Insert title here</title>


</head>
<body>

<section class="content" style="padding-left: 10px; padding-right: 10px; padding-top: 10px;">
<div class="card">
	<div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
    	<h5 style="font-weight: bold;">상담 거절사유</h5>     
	</div>
	<div class="card-body row" style="text-align:center;padding-top: 5px;">
		<div class="col-sm-12">
        	<div class="form-group row" style="margin-bottom: 10px;">
				<p>* 상담 거절시 필히 사유를 작성해야합니다.</p>
            </div>
               
               
            <div class="form-group row" style="margin-bottom: 10px;">
          		<textarea class="form-control col-12" id="content" name="" rows="3" style="height: 198px;"></textarea>
            </div>
                              
            <div class="form-group row" style="margin-bottom: 0px; display: contents;">
				<button type="button" class="btn btnRed btn-sm text-white" style="background-color:#B94040;" id="" onclick="deny('${counsel_no}','${param.student_no }')">확인</button>
				<button type="button" class="btn btnBlue btn-sm text-white" style="background-color:#2A5F9E;" id="" onclick="CloseWindow();">취소</button>
            </div>
    	</div>

	</div> <!-- card-body -->
</div> <!-- card -->
</section>


<script>

function deny(counsel_no, student_no){
    var refuse_content = document.getElementById("content").value;	
	
 	if(confirm('상담을 거절하시겠습니까?')==true){
		
		$.ajax({
			url : '<%=request.getContextPath()%>/counsel/management_prof/deny',
			data : {"counsel_no" : counsel_no, "refuse_content" : refuse_content, "student_no" : student_no},
			dataType : 'json',
			success : function(data){
				alert('상담이 거절되었습니다.');
				window.opener.location.reload();
				window.close();
			},
			error : function(error){
				alert('상담이 거절되었습니다.');
				window.opener.location.reload();
				window.close();
			}
		});
	}else{
		return;
	}
};

</script>

</body>
