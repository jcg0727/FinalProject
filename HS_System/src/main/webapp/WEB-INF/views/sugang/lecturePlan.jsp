<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	

<div class="card">
	<div class="card-header">
		<h3 class="card-title">강의정보</h3>
	</div>
	<div class="card-body">
	
		<div class="row">
			<div class="form-group col-4">
				<label for="">연도</label>
				<input type="text" name="" id="" value="${list.lecture_year}" class="form-control read-only" readonly readonly="readonly">
			</div>
			<div class="form-group col-4">
				<label for="">학기</label>
				<input type="text" name="" id="" value="${list.lecture_semester}" class="form-control read-only" readonly readonly="readonly">
			</div>
			<div class="form-group col-4">
				<label for="">개설학과</label>
				<input type="text" name="" id="" value="${list.dept_nm}" class="form-control read-only" readonly readonly="readonly">
			</div>
		</div><!-- row -->
		
		<div class="row">
			<div class="form-group col-4">
				<label for="">학수번호</label>
				<input type="text" name="" id="" value="${list.class_no}" class="form-control read-only" readonly readonly="readonly">
			</div>
			<div class="form-group col-4">
				<label for="">교과목명</label>
				<input type="text" name="" id="" value="${list.class_name}" class="form-control read-only" readonly readonly="readonly">
			</div>
			<div class="form-group col-4">
				<label for="">이수구분</label>
				<input type="text" name="" id="" value="${list.class_type}" class="form-control read-only" readonly readonly="readonly">
			</div>
		</div><!-- row -->
		
		<div class="row">
			<div class="form-group col-4">
				<label for="">담당교수</label>
				<input type="text" name="" id="" value="${list.name}" class="form-control read-only" readonly readonly="readonly">
			</div>
			<div class="form-group col-4">
				<label for="">이메일</label>
				<input type="text" name="" id="" value="${list.email}" class="form-control read-only" readonly readonly="readonly">
			</div>
			<div class="form-group col-4">
				<label for="">전화번호</label>
				<input type="text" name="" id="" value="${list.phone}" class="form-control read-only" readonly readonly="readonly">
			</div>
		</div><!-- row -->	
		
		<div class="row">
			<label for="">강의개요</label>
			<textarea class="form-control col-12 read-only" readOnly name="" placeholder="${list.lecture_summary}" rows="4" ></textarea>
		</div>
		<br>
		<div class="row">
			<label for="">강의목표</label>
			<textarea class="form-control col-12 read-only" readOnly name="" placeholder="${list.lecture_goal}" rows="4" ></textarea>
		</div>	
				
	</div> <!-- card-body -->
</div><!-- card -->
		
<div class="card">
	<div class="card-header">
		<h3 class="card-title">평가방법</h3>
	</div>
	<div class="card-body">
	
		<div class="row">
			<div class="form-group col-3">
				<label for="">중간고사</label>
				<input type="text" name="" id="" value="25%" class="form-control read-only" readonly readonly="readonly">
			</div>
			<div class="form-group col-3">
				<label for="">기말고사</label>
				<input type="text" name="" id="" value="25%" class="form-control read-only" readonly readonly="readonly">
			</div>
			<div class="form-group col-3">
				<label for="">과제제출</label>
				<input type="text" name="" id="" value="25%" class="form-control read-only" readonly readonly="readonly">
			</div>
			<div class="form-group col-3">
				<label for="">출석</label>
				<input type="text" name="" id="" value="25%" class="form-control read-only" readonly readonly="readonly">
			</div>			
		</div><!-- row -->
				
	</div> <!-- card-body -->
</div><!-- card -->		


<div class="card">
	<div class="card-header">
		<h3 class="card-title">교재 및 참고자료</h3>
	</div>
	<div class="card-body">
	
		<div class="row">
			<div class="form-group col-6">
				<label for="">주교재</label>
				<input type="text" name="" id="" value="${list.textbook_main}" class="form-control read-only" readonly readonly="readonly">
			</div>
			<div class="form-group col-6">
				<label for="">부교재</label>
				<input type="text" name="" id="" value="${list.textbook_sub}" class="form-control read-only" readonly readonly="readonly">
			</div>
		</div><!-- row -->
				
	</div> <!-- card-body -->
</div><!-- card -->	
		
			
<div class="card">
	<div class="card-header">
		<h3 class="card-title">수업내용</h3>
	</div>
	<div class="card-body">
			<table class="table table-bordered class_content">
				<thead>
					<tr class="text-white" style="text-align:center; background-color: #2A5F9E">
						<th style="t">주</th>
						<th style="width: 83%">수업 내용</th>
					</tr>
					
				</thead>
				<tbody style="text-align:center;">
					<tr class="">
						 <td class="">1주차</td>	
						 <td style="">
						 	<textarea class="form-control col-12" name="" placeholder="${list.week_1}"></textarea>
						 </td>	
					</tr>
					<tr class="">
						 <td class="">2주차</td>	
						 <td style="">
						 	<textarea class="form-control col-12" name="" placeholder="${list.week_2}"></textarea>
						 </td>	
					</tr>
					<tr class="">
						 <td class="">3주차</td>	
						 <td style="">
						 	<textarea class="form-control col-12" name="" placeholder="${list.week_3}"></textarea>
						 </td>	
					</tr>
					<tr class="">
						 <td class="">4주차</td>	
						 <td style="">
						 	<textarea class="form-control col-12" name="" placeholder="${list.week_4}"></textarea>
						 </td>	
					</tr>
					<tr class="">
						 <td class="">5주차</td>	
						 <td style="">
						 	<textarea class="form-control col-12" name="" placeholder="${list.week_5}"></textarea>
						 </td>	
					</tr>
					<tr class="">
						 <td class="">6주차</td>	
						 <td style="">
						 	<textarea class="form-control col-12" name="" placeholder="${list.week_6}"></textarea>
						 </td>	
					</tr>
					<tr class="">
						 <td class="">7주차</td>	
						 <td style="">
						 	<textarea class="form-control col-12" name="" placeholder="${list.week_7}"></textarea>
						 </td>	
					</tr>
					<tr class="">
						 <td class="">8주차</td>	
						 <td style="">
						 	<textarea class="form-control col-12" name="" placeholder="${list.week_8}"></textarea>
						 </td>	
					</tr>
					<tr class="">
						 <td class="">9주차</td>	
						 <td style="">
						 	<textarea class="form-control col-12" name="" placeholder="${list.week_9}"></textarea>
						 </td>	
					</tr>
					<tr class="">
						 <td class="">10주차</td>	
						 <td style="">
						 	<textarea class="form-control col-12" name="" placeholder="${list.week_10}"></textarea>
						 </td>	
					</tr>					
				</tbody>
			</table>			
	
				
	</div> <!-- card-body -->
</div><!-- card -->	

<div style="text-align: center;">	
<button type="button" class="btn btn-sm btnGray text-white" id="" onclick="window.close();" style="height: 31px; margin: center;">닫기</button>		
</div>	
		
		
		
		
		