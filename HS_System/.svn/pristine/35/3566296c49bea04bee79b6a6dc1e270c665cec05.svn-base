<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces ="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }" />
<c:set var="cri" value="${pageMaker.cri }" />
<c:set var="stuInfoList" value="${dataMap.stuInfoList }" />

<head>
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
      renewURL = "http://localhost/hs/index.do?mCode=M010302&student_no="+student_no+ '&advisor=' + advisor;
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


function OpenWindow2(UrlStr, WinTitle, WinWidth, WinHeight) {
   
      
   UrlStr=UrlStr+"&student_no="+document.getElementById("stuNum").value;
   UrlStr=UrlStr+"&professorYN="+document.getElementById("stuAdvisor").value;

   winleft = (window.screen.width/2) - (WinWidth/2);
   wintop = (window.screen.height/2)- (WinHeight/2);
   var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth +", " 
                     +"height="+ WinHeight +", top="+ wintop +", left=" 
                     + winleft +", resizable=yes, status=yes"  );
   win.focus(); 
         
   
}

</script>

<style>

h5{
	font-weight: bold;
}
</style>


</head>

<title>신입생관리</title>

<body>

    
      <section class="content" style="padding-left: 10px; padding-right: 10px; padding-top: 10px;">
         <div class="card">
            <div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
               <div id="keyword" class="">
                 <h5>${dept_nm }&nbsp;신입생목록</h5>     
                       
               </div>            
            </div>
            <div class="card-body" style="text-align:center; padding-bottom: 0; padding-top: 7px;">
            <div class="row">
                               <div class="input-group row " style="position: unset; padding-left: 550px; padding-bottom: 7px; font-size: 14px;">
                      <!-- search bar -->

                                       
                      <!-- search bar -->
                   <select class="form-control col-md-3" name="searchType" id="searchType" style="font-size: 14px;">
                     <option value=""  ${cri.searchType eq '' ? 'selected':''}>구분</option>
                     <option value="nm"  ${cri.searchType eq 'nm' ? 'selected':''}>성명</option>
                     <option value="nb"  ${cri.searchType eq 'nb' ? 'selected':''}>학번</option>
                     <option value="yn"  ${cri.searchType eq 'yn' ? 'selected':''}>지도교수</option>
                  </select>
                  <!-- keyword -->
                      <input  class="form-control" type="text" name="keyword" 
                              placeholder="검색어를 입력하세요." value="${cri.keyword }" style="font-size: 14px;"/>
                  <span class="input-group-append">
                     <button class="btn btnBlue text-white" type="button" style="background-color:#2A5F9E;"
                           id="searchBtn" data-card-widget="search" onclick="list_go(1);">
                        <i class="fa fa-fw fa-search"></i>
                     </button>
                  </span>
               <!-- end : search bar -->      
                   </div>
                <div class="col-sm-12" style="min-height: 470px;">   
                <table class="table table-hover table-sm" style="font-size: 15px;">
                   <thead>
                   <tr style="height: 40px;">
                      <th>NO</th>
                         <th>학번</th>
                         <th>성명</th>
                         <th>연락처</th>
                         <th>지도교수</th>
                        </tr>
                  </thead>
                  <c:forEach items="${stuInfoList }" var="list">
                          <c:set var="phone" value="${list.phone.replace('-','') }" />
                          <tr onclick="DetailStu('${list.student_no }','${list.professorYN }');">
                           <td style="height: 40px;">${list.num }</td>
                           <td>${list.student_no }</td>
                          <td>${list.name }</td>                          
                          <td>${phone.substring(0,3) }-${phone.substring(3,7) }-${phone.substring(7) }</td>
                          <td>${list.professorYN }</td>
                         </tr>
                        </c:forEach>      
                    
                        
                  </table>
               </div> <!-- col-sm-12 -->
              </div> <!-- row -->
          <div style="padding-bottom: 18px;">
       <%@ include file="/WEB-INF/views/common/pagination.jsp" %>
          </div>
          </div> <!-- card-body -->
          </div>
          
          <div class="card">
            <div class="card-header with-border" style="border-bottom-width: 3px; border-bottom-color: #2A5F9E">
               <div id="keyword" style="display: flex;">
                 <h5>신입생&nbsp;정보조회</h5>        
                 <button type="button" class="btn btnBlue btn-sm text-white" id="advisorChange" onclick="OpenWindow2('advisorList.do?dept_nm=${dept_nm }','','640','618');" style="background-color:#2A5F9E; margin-left: 703px;">지도교수배정</button>         
               </div>            
            </div>
            <!-- 학번 성명 주민번호 성별 소속학과 학적상태 주소 이메일 연락처 지도교수 -->
            <div class="card-body" style="text-align:left; padding-bottom: 0; padding-top: 7px;">
              <div class="form-group row">
              <div class="col-2">  
               <label for="stuNum">학번</label>
               <input type="text" class="form-control" id="stuNum" value="" >
               </div>
               <div class="col-2">  
               <label for="stuNum">성명</label>
               <input type="text" class="form-control" id="stuName" value="" >
               </div>
               <div class="col-1">  
               <label for="stuNum">성별</label>
               <input type="text" class="form-control" id="stuGender" value="" >
               </div>
               <div class="col-2">  
               <label for="stuNum">학적상태</label>
               <input type="text" class="form-control" id="stuStatus" value="" >
               </div>
               <div class="col-2">  
               <label for="stuNum"><span style="color: red;">*</span>지도교수</label>
               <input type="text" class="form-control" id="stuAdvisor" value="" >
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

</body>