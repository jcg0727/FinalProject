<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces ="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="thesisList" value="${dataMap.thesisList }" />


<head>
<title>Insert title here</title>


<script>
window.onload = function(){
	   oParams = getUrlParams();
	   
	   var url = parent.location.href;
	   var student_no = oParams.student_no;
	   var advisor = oParams.advisor;

	   // decode해줘야 아스키코드 --> 한글값으로 제대로 출력됨
	   DetailStu(student_no,decodeURIComponent(advisor));
	   
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
	
function DetailStu(student_no,advisor) {
	   
	   var renewURL = parent.location.href;
	   // student_no가 이미 존재한다면
	   if(renewURL.indexOf("student_no") != -1){
	      renewURL = "http://localhost/hs/index.do?mCode=M080100&student_no="+student_no+ '&advisor=' + advisor;
	   }else{ // 없을시 
	   renewURL = renewURL + '&student_no='+student_no + '&advisor=' + advisor;      
	   }
	   
	   //alert(renewURL);   
	   window.parent.postMessage(renewURL, '*');
	   
	   
	   $.ajax({
	      url : '<%=request.getContextPath()%>/academic/admission/freshmen/detail',
	      data : {"student_no":student_no,"advisor":advisor},
	      dataType : 'json',
	      success: function(data){
	         $(data).each(function(){
	            document.getElementById("stuName").value = this.name;
	            document.getElementById("stuGender").value = this.gender;
	            document.getElementById("stuStatus").value = this.status_nm;
	            document.getElementById("stuEmail").value = this.email;
	            document.getElementById("stuPhone").value = this.phone.substring(0,3)+"-"+this.phone.substring(3,7)+"-"+this.phone.substring(7);
	            document.getElementById("stuAddress").value = this.address + " "+ this.detail_add;
	            document.getElementById("stuNum").value = student_no;
	            document.getElementById("advisorChange").value = student_no;
	            document.getElementById("stuAdvisor").value = advisor;
	            });
	      },
	      error : function(error){
	         //alert(error);
	      }
	   });


	}
</script>
</head>
<body>
<section class="content" style="padding-left: 10px; padding-right: 10px; padding-top: 5px;">
   <div class="card">
      <div class="card-header with-border" style="height: 55px;border-bottom-width: 3px;border-bottom-color: #2A5F9E;">
         <div id="keyword" class="">
           <h5 style="font-weight: bold;">지도학생 미검토 논문목록</h5>     
                 
         </div>            
      </div>
      <div class="card-body" style="text-align:center; padding-bottom: 0; padding-top: 7px;">
      <div class="row">
             <div class="input-group row " style="position: unset; padding-left: 550px; padding-bottom: 7px; font-size: 14px;">
                <!-- search bar -->
             <select class="form-control col-md-3" name="searchType" id="searchType" style="font-size: 14px;">
               <option value=""  ${cri.searchType eq '' ? 'selected':''}>구분</option>
               <option value="nm"  ${cri.searchType eq 'nm' ? 'selected':''}>성명</option>
               <option value="no"  ${cri.searchType eq 'no' ? 'selected':''}>학번</option>
               <option value="th"  ${cri.searchType eq 'th' ? 'selected':''}>논문명</option>
             </select>
            <!-- keyword -->
            <input  class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword }" style="font-size: 14px;"/>
           <span class="input-group-append">
              <button class="btn text-white" type="button" id="searchBtn" data-card-widget="search" onclick="list_go(1);" style="background-color:#2A5F9E;">
                 <i class="fa fa-fw fa-search"></i>
              </button>
           </span>
         <!-- end : search bar -->      
             </div>
             
          <div class="col-sm-12" style="min-height: 460px;">   
          <table class="table table-hover table-sm" style="font-size: 15px;">
          <thead>
             <tr style="height: 40px;">
                <th>NO</th>
                <th>학번</th>
                <th>성명</th>
                <th>논문명</th>
                <th>첨부파일</th>
                <th>승인/반려</th>
             </tr>
          </thead>
            
            <c:forEach items="${thesisList }" var="list">
              <tr onclick="DetailStu('${list.student_no }','${pro_name }');">
              	<td style="height: 40px;">${list.num }</td>
             	<td>${list.student_no }</td>
             	<td>${list.name }</td>                          
             	<td style="text-align: left;">${list.orginal_nm }</td>
             	
             	<td>
<!--              	<button type="button" class="btn btn-xs btnBlue text-white" style="background-color:#2A5F9E;">첨부파일</button> -->
             	<a href="<%=request.getContextPath() %>/getFile?attach_no=${list.attach_no}"><button class="btn btnBlue btn-xs text-white" style="background-color:#2A5F9E;">첨부파일</button></a>
             	</td>
             	
             	<td>
             	<button type="button" class="btn btn-xs btnBlue text-white" style="background-color:#2A5F9E;" onclick="Confirm('${list.student_no }');">승인</button>
             	<button type="button" class="btn btn-xs btnBlue text-white" style="background-color:#B94040;" onclick="Cancel('${list.student_no}','${list.attach_no }');">반려</button>
             	</td>
             </tr>
                  </c:forEach>                        
            </table>
         </div> <!-- col-sm-12 -->
        </div> <!-- row -->
    <div>
 <%@ include file="/WEB-INF/views/common/pagination.jsp" %>
    </div>
    </div> <!-- card-body -->
    </div>
    
    <div class="card">
      <div class="card-header with-border" style="height: 55px;border-bottom-width: 3px;border-bottom-color: #2A5F9E;">
         <div id="keyword" style="display: flex;">
           <h5 style="font-weight: bold;">지도학생&nbsp;정보조회</h5>        
         </div>            
         </div>
         <!-- 학번 성명 주민번호 성별 소속학과 학적상태 주소 이메일 연락처 지도교수 -->
         <div class="card-body" style="text-align:left; padding-bottom: 0; padding-top: 7px;">
           <div class="form-group row">
            <div class="col-3">  
            	<label for="stuNum">학번</label>
            	<input type="text" class="form-control" id="stuNum" value="" >
            </div>
            <div class="col-2">  
            	<label for="stuNum">성명</label>
            	<input type="text" class="form-control" id="stuName" value="" >
            </div>
            <div class="col-2">  
            	<label for="stuNum">성별</label>
            	<input type="text" class="form-control" id="stuGender" value="" >
            </div>
            <div class="col-2">  
            	<label for="stuNum">학적상태</label>
            	<input type="text" class="form-control" id="stuStatus" value="" >
            </div>
            <div class="col-3">  
            	<label for="stuNum">연락처</label>
            	<input type="text" class="form-control" id="stuPhone" value="" >
            </div>
            </div>
            <div class="form-group row">
	            <div class="col-4">  
	            	<label for="stuNum">이메일</label>
	            	<input type="text" class="form-control" id="stuEmail" value="" >
	            </div>
	            <div class="col-8">  
	            	<label for="stuNum">주소</label>
	            	<input type="text" class="form-control" id="stuAddress" value="" >
	            </div>
            </div>
       </div> <!-- card-body -->
    </div>
</section>

<script>
function Confirm(student_no){
	if(confirm('승인처리를 하시겠습니까?')==true){

	$.ajax({
      url : '<%=request.getContextPath()%>/graduation/management_prof/confirm',
      data : {"student_no": student_no },
      dataType : 'json',
      success: function(data){
		alert('졸업논문 승인이 완료되었습니다.');
   	    window.location.reload(true);		
      },
      error : function(error){
		alert('졸업논문 승인이 완료되었습니다.');
   	    window.location.reload(true);
      }
      
	});
	
	}else{
		
		return;
	}
	
}

function Cancel(student_no, attach_no){
	if(confirm('반려처리를 하시겠습니까?')==true){
		
	$.ajax({
	      url : '<%=request.getContextPath()%>/graduation/management_prof/cancel',
	      data : {"student_no": student_no, "attach_no": attach_no },
	      dataType : 'json',
	      success: function(data){
			alert('졸업논문 반려처리 되었습니다.');
	   	    window.location.reload(true);		
	      },
	      error : function(error){
			alert('졸업논문 반려처리 되었습니다.');
	   	    window.location.reload(true);
	      }
	      
		});
	
	}else{
		
		return;
	}
}

</script>

</body>
