<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces ="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/js.jsp"%>
<jsp:include page="/WEB-INF/views/include/style.jsp"></jsp:include>
<head>
<title>Insert title here</title>
 <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/plugins/summernote/summernote-bs4.css">
</head>
<body>

	<c:if test="${from eq 'regist' }" >
		<script>
			alert("등록되었습니다.");
			window.opener.location.reload();			
			window.close();
		</script>
	</c:if>

	 
  <!-- Main content -->
    <section class="content container-fluid" style="padding-top: 10px;">
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header"  style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
						<h3 class="card-title p-1">공지사항 등록</h3>

					</div><!--end card-header  -->

					<div class="card-body pad" style="padding-top: 15px;">
					<form role="form" method="post" action="regist.do" name="registForm" enctype="multipart/form-data">
                     
					<div class="" style="display: flex;">
						<label for="title" style="width: 60px; margin-top: 3px;">제 목</label> 
						<input type="text" id="title" name="title" class="form-control" placeholder="">
					</div>
							
					<div class="form-group row" style="margin-bottom: 0px;margin-left: -66px;padding-top: 10px;">
					<label for="custom-control custom-radio" style="width: 60px;margin-top: 5px;margin-left: 65px;">중요도</label>
					<div class="form-group row col-2" style="padding-top: 5px; margin-right: 50px;">
                        <div class="custom-control custom-radio" style="width: 65px;">
                          <input class="custom-control-input" type="radio" id="customRadio1" name="importance" value="Y">
                          <label for="customRadio1" class="custom-control-label">중요</label>
                        </div>
                        <div class="custom-control custom-radio">
                          <input class="custom-control-input" type="radio" id="customRadio2" name="importance" value="N" checked="">
                          <label for="customRadio2" class="custom-control-label">일반</label>
                        </div>
                      </div>
                    
                    <label for="custom-control custom-radio" style="width: 44px;margin-top: 5px;">대상</label>
					<div class="form-group row col-5" style="padding-top: 5px;">
                        <div class="custom-control custom-radio" style="padding-right: 10px;">
                          <input class="custom-control-input" type="radio" id="customRadi1" name="target" value="학생" checked="">
                          <label for="customRadi1" class="custom-control-label">학생</label>
                        </div>
                        <div class="custom-control custom-radio" style="padding-right: 10px;">
                          <input class="custom-control-input" type="radio" id="customRadi2" name="target" value="교수">
                          <label for="customRadi2" class="custom-control-label">교수</label>
                        </div>
                        <div class="custom-control custom-radio">
                          <input class="custom-control-input" type="radio" id="customRadi3" name="target" value="교직원">
                          <label for="customRadi3" class="custom-control-label">교직원</label>
                        </div>
                      </div>						
                      </div>						


							<div class="form-group">
								<label for="content"></label>
								<textarea class="textarea" name="content" id="content" rows="20"
									placeholder="" style="display: none;"></textarea>
							</div>
							<div class="form-group">								
								<div class="card">
									<div class="card-header"style="padding-top: 0px; padding-bottom: 0px;">
										<p style="display:inline;line-height:40px;font-size: 15;">첨부파일  </p>
										&nbsp;&nbsp;<button class="btn btnBlue btn-xs text-white" style=" background-color:#2A5F9E;"
										onclick="addFile_go();"	type="button" id="addFileBtn">Add File</button>
									</div>									
									<div class="card-footer fileInput">
									</div>
								</div>
							</div>
							
						</form>
					</div>


					<div class="card-footer" style="display:none">
					
					</div><!--end card-footer  -->
				</div><!-- end card -->				
			</div><!-- end col-md-12 -->
		</div><!-- end row -->
			<div class ="" style=" padding-left: 385px; padding-bottom: 10px;">
		<button type="button" class="btn btnBlue btn-sm text-white" style="background-color:#2A5F9E;" id="registBtn" onclick="regist_go();">등 록</button>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<button type="button" class="btn btnRed btn-sm text-white" style="background-color:#B94040;" id="cancelBtn" onclick="CloseWindow();" >취 소</button>
	</div>
    </section>
    <!-- /.content -->

    
<script>
window.onload=function(){
	Summernote_start($('#content')); 

 	$('.fileInput').on('change','input[type="file"]',function(event){
 		if(this.files[0].size>1024*1024*40){
 			alert("파일 용량이 40MB를 초과하였습니다.");
 			this.value="";
 			$(this).click();		 			
 			return false;
 		} 
	});
	
	$('div.fileInput').on('click','div.inputRow > button',function(event){
 		$(this).parent('div.inputRow').remove();
 	});
}


</script>

<%@ include file="/WEB-INF/views/common/summernote.jsp" %>

<script>
	function addFile_go(){
		
		var input=$('<input>').attr({"type":"file","name":"uploadFile"})
			.css({"display": "inline", "font-size": "13px"}); 
		var div=$('<div>').addClass("inputRow");
		div.append(input).append("<button style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");    		   		
		$('.fileInput').append(div);
	}



	function regist_go(){
		var file = $('input[name="uploadFile"]');
			console.log(file.name+" : "+file.value);
			if(file.value==""){
				alert("파일을 선택하세요.");
				file.focus();
				file.click();
				return;
			}
		
		if($("input[name='title']").val()==""){ //form.title.value
			alert("제목은 필수입니다.");
			$("input[name='title']").focus();
			return;
		}
	
		document.registForm.submit();	
	}

</script>

</body>
