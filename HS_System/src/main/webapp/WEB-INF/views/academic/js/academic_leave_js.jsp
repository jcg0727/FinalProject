<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <script>
<!-- 휴학 -->
//휴학유형 select바 아이디 값 가져오기
var target = document.getElementById('leave_type');
var target2 = document.getElementById('applySemesterAmmount');

//select 바의 값이 바뀌었을때,
target.addEventListener('change', function() {

	var select_val = target.options[target.selectedIndex].value;
	
	if(select_val=="일반휴학" ){
		alert("일반휴학 신청기간이 지났습니다.");
		document.getElementById('leave_start_date').value = ""
		document.getElementById('leave_end_date').value = "";
		document.getElementById('leaveApplyBtn').disabled="disabled";
		
	}
	
	if(select_val=="군휴학") {
		//alert('군휴학!');
		document.getElementById('applySemesterAmmount').value = "4학기"
		document.getElementById('leave_start_date').value = "2021-09-01"
		document.getElementById('leave_end_date').value = "2023-06-30";
		document.getElementById('leaveApplyBtn').disabled="";
	
	} else {
		document.getElementById('applySemesterAmmount').value = ""
		document.getElementById('leave_start_date').value = ""
		document.getElementById('leave_end_date').value = "";
	}
	document.getElementById('input_leave_type').value = select_val;
})


target2.addEventListener('change', function(){
	
	document.getElementById('leave_start_date').value = "2022-03-01"
	
	var semester = target2.options[target2.selectedIndex].value;
	if(semester=="1학기") document.getElementById('leave_end_date').value = "2022-06-30";
	if(semester=="2학기") document.getElementById('leave_end_date').value = "2022-12-15";
	if(semester=="3학기") document.getElementById('leave_end_date').value = "2023-06-30";
	if(semester=="4학기") document.getElementById('leave_end_date').value = "2023-12-15";
})
</script>


