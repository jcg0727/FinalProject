<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach items="${acuntList }" var="acunt">
<div class="col-12">
	<div class="card">

	<!-- /.card-header -->
		<div class="card-body">
		    <div class="row">
			    <div class="form-group col-3">
				    <label for="student_no">학번</label>
				    <input type="text" class="form-control" id="student_no" value="${loginUser.id }" readonly="readonly" name="student_no"/>
		        </div>
		        
			    <div class="form-group col-3">
				    <label for="">이름</label>
		    		<input type="text" class="form-control" id="" value="${loginUser.name}" readonly="readonly" />
	    		</div>
			    <div class="form-group col-3">
				    <label for="">성별</label>
		    		<input type="text" class="form-control" id="" value="${loginUser.gender}" readonly="readonly" />
	    		</div>

<!--            </div> -->

			
<!-- 			<div class="row"> -->
				<div class="col-3 from-group">
					<label for="status_cd">학적상태</label>
                   <input type="text" class="form-control" id="status_cd" value="재학" readonly="readonly" style="text-align: left;" name="status_cd"/>
                </div>
			     </div>
			     <div class="row">
				<div class="form-group col-3">
				    <label for="dept_nm">전공</label>
			        <input type="text" id="dept_nm" class="form-control" value="${acunt.dept_nm }" readonly="readonly" name="dept_nm"/>
			     </div>
			      <div class="form-group col-4" >
				    <label for="">전공학점(이수학점/기준학점)</label>
				    <input type="text" class="form-control" id="" value="42 / 39"/>
		        </div>
			    <div class="form-group col-4">
				    <label for="">성적평점(평점/기준평점)</label>
		    		<input type="text" class="form-control" id="" value="3.5 / 2.0"/>
	    		</div>
			     
             </div><!-- row끝 -->
             
		</div>
	</div>
</div>
			     


<div class="col-12" >
	<div class="card">
		<div class="card-header">
		  <h3 class="card-title">복수전공신청</h3>
		</div>
	<!-- /.card-header -->

		<div class="card-body">
		<form id="regist">
		<input type="hidden" value=${loginUser.id } name="student_no"/>
		<input type="hidden" value=${acunt.dept_nm } name="dept_nm"/>
		<input type="hidden" value="0" name="register_reason" />
		    <div class="row">
			    <div class="form-group col-2">
				    <label for="year">신청학년도</label>
				    <input type="text" class="form-control"  readonly="readonly" style="background-color: white;" id="year" 
				         value="<c:choose><c:when test="${now > twoSemester }"><c:set var="nextYear" value="<%=new Date(new Date().getTime() + ((long)(1000 * 60 * 60 * 24) * (long)365))%>"/><fmt:formatDate value="${nextYear}" pattern="yyyy"/>
			        		</c:when>
		        			<c:otherwise><fmt:formatDate value="${now}" pattern="yyyy"/></c:otherwise>
		        		</c:choose>"
		        		/>
		        </div> <!-- 신청학년도 -->
		        
			    <div class="form-group col-2">
				    <label for="semester">신청학기</label>
		    		<input type="text" class="form-control" id="semester"  readonly="readonly" style="background-color: white;"
		    			value="<c:choose><c:when test="${now < oneSemester or now > twoSemester}">1학기</c:when><c:otherwise>2학기</c:otherwise></c:choose>">
	    		</div> <!-- 신청 학기 -->
	    		
    			<div class="form-group col-2">
				    <label for="register_date">신청일자</label>
				    <input type="text" class="form-control" id="regisregister_dateterDate"  readonly="readonly" style="background-color: white;"
				    	value="<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/>" >
			    </div> <!-- 신청일자 -->
			    
    			

			

			<div class="col-3 from-group">
					<label for="apply_deptnm">신청학과</label>
					<div class="row">
					<div class="col-10 select-transefer-dept">
                    	<input type="text" class="form-control select-dept" id="apply_deptnm" name="apply_deptnm"/>
                    </div>
                    <div class="col-2 select-transefer-dept-btn">
	                    <button type="button" class="btn btn-default" onclick="OpenWindow('<%=request.getContextPath()%>/search/department','학과검색','700','780');">
	                      <i class="fas fa-search"></i>
	                    </button>
                    </div>
                    </div>
                </div>	

				<div class="form-group col-3">
				    <label for="transfer_counsel">상담신청</label>
	    	    	<div class="row" id="transfer_counsel">
		        		<div class="col-10 select-transefer-dept">
			        		<input type="text" id="transfer_counsel" class="form-control" name="transfer_counsel">
			        	</div>
		        		<div class="col-2 select-transefer-dept-btn">
				        	<button type="button" class="btn btn-default" onclick="OpenWindow('<%=request.getContextPath()%>/counsel/regist?pro_no=${advisor.pro_no}','상담신청','1300','800');">
		              			<i class="fas fa-search">
		              			</i>
		              		</button>
             			</div>
			    	</div>
				</div>
		</div>
			<div align="center">
			<button type="button" class="btn btnBlue btn-sm" style="width: 60px; color: white;" onclick="registPlural();" id="regist">신청</button>
			</div>
			</form>
		</div>
	</div>
</div>
</c:forEach>
	
	
<div class="col-12 transfer-div">
  <div class="card">
    <div class="card-header">
      <h3 class="card-title">복수전공신청내역</h3> &nbsp&nbsp<button type="button" class="btn btnGray btn-sm text-white" onclick="OpenWindow('<%=request.getContextPath()%>/academic/pluralMajor/pdf?student_no=${loginUser.id }&id=${loginUser.account_no }','복수전공 증명서','700','900');" disabled="disabled">복수전공 증명서</button>
      <div class="card-tools">
      </div>
    </div>
    <!-- /.card-header -->
    <div class="card-body table-responsive p-0">
      <table class="table table-hover text-nowrap table" style="text-align: center;">
        <thead>
          <tr>
            <th>No.</th>
            <th>학번</th>
            <th>지원학과</th>
            <th>신청일자</th>
            <th>처리상태</th>
            <th>상담</th>
            <th>취소</th>
          </tr>
        </thead>
        
        <tbody id="plural-body">

        </tbody>
      </table>
    </div>
    <!-- /.card-body -->
  </div>
  <!-- /.card -->
</div>

<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>
<script>
function showGrade(){
	 document.getElementById('show').style.visibility = "visible"; 
}

function registPlural(){
	
	var form = $('#regist').serialize();
	$.ajax({
		type : "post",
		url : "<%=request.getContextPath()%>/academic/pluralMajor/regist",
		data : form,
		dataType : "json",
		success : function(data){
			alert("신청되었습니다");
			pluralMajorList();
		},
		error : function(error){
			alert(error);
		}
	})
	
}

function remove(){
	if(!confirm("정말 취소하시겠습니까?")){
	return false;		
	}
		var id = ${loginUser.id};
	$.ajax({
		type : "post",
		url : "<%=request.getContextPath()%>/academic/pluralMajor/remove",
		data : {id:id},
		dataType : "json",
		success : function(url){
			alert("삭제되었습니다");
				pluralMajorList();
		},
		error : function(error){
			console.log(error);
		}
	})


}


function pluralMajorList(){
	$.ajax({
		url : "<%=request.getContextPath()%>/academic/pluralMajor/list",
		data : {"id":${loginUser.id}},
		dataType:"json",
		success : function(data){
			console.log(data);
			$.each(data, function(i, v){
			/* 	
				const myDate = new Date(v.register_date);
				v.register_date = myDate.toLocaleString(); */
				
				switch(v.status_cd){
					case "CCDH001" :
						v.status_cd="신청완료"; break;
					case "CCDH002" :
						v.status_cd="상담대기";  break;
					case "CCDH003" :
						v.status_cd="상담거절";  break;
					case "CCDH004" :
						v.status_cd="지도교수승인"; break;
					case "CCDH005" :
						v.status_cd="지원학과교수승인"; break;
					case "CCDH006" :
						v.status_cd="소속학과승인"; break;
					case "CCDH007" :
						v.status_cd="지원학과승인"; break;
					case "CCDH008" :
						v.status_cd="반려"; break;
						
				}
				console.log(i, v);
			})
			
			
			printData(data, '#plural-body','#plural-transfer-list','.transfer-plural');
		},
		error : function(error){
			console.log(error);
		}
 	});
};
</script>
<script id="plural-transfer-list" type="text/x-handlebars-template">
{{#if this}}
{{#each.}}
<tr class = "transfer-plural">
	<td>{{no}}</td>
	<td>{{student_no}}</td>
	<td>{{apply_deptnm}}</td>
	<td>{{registDate register_date}}</td>
	<td>{{status_nm}}</td>
<td>
	{{#ifEquals counsel_status_nm "대기"}}
		<button type="button" class="btn btn-secondary btn-xs">상담 대기</button>
	{{else ifEquals counsel_status_nm "수락"}}
		<button type="button" class="btn btn-primary btn-xs" onclick="javascript:goPage('<%=request.getContextPath()%>/counsel/management_st');">상담실 이동</button>
	{{else ifEquals counsel_status_nm "거절"}}
		<button type="button" class="btn btn-danger btn-xs">상담 재신청</button>
	{{else ifEquals counsel_status_nm "완료"}}
		<button type="button" class="btn btn-success btn-xs">상담 완료</button>
	{{/ifEquals }}
	</td>
	<td>
	{{#ifEquals status_nm "신청완료"}}
		<button type="button" class="btn btn-danger btn-xs" onclick="remove('{{student_no}}')">취소</button>
	{{else}}
		<button type="button" class="btn btn-danger btn-xs" disabled>취소</button>
	{{/ifEquals}}
	</td>

</tr>
{{/each}}
{{else}}
	<tr class="transfer-plural">
		<td colspan="10" style="text-align:center;">신청 내역이 없습니다</td>
	</tr>

{{/if}}

</script>
