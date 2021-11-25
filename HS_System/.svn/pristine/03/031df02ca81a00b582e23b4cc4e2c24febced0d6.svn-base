<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:parseNumber var="q1" type="number" value="${list2.q1}"/>
<fmt:parseNumber var="q2" type="number" value="${list2.q2}"/>
<fmt:parseNumber var="q3" type="number" value="${list2.q3}"/>
<fmt:parseNumber var="q4" type="number" value="${list2.q4}"/>
<fmt:parseNumber var="q5" type="number" value="${list2.q5}"/>

<style>
.munhang{
	text-align: left;
}
.hangmock{
	text-align: center;
}
.average{
	text-align: center;
}
.direct-chat-warning .right>.direct-chat-text::after, .direct-chat-warning .right>.direct-chat-text::before {
    border-left-color: #2A5F9E;
}
.direct-chat-warning .right>.direct-chat-text {
    background-color: #2A5F9E;
    border-color: #2A5F9E;
    color: #ffffff;



</style>

<div class="card">
	<div class="card-header">
		<h3 class="card-title">강의정보</h3>
	</div>
	<div class="card-body">

		<div class="row">
			<div class="form-group col-3">
				<label for="">교과목명</label>
				<input type="text" name="" id="" value="${list.class_name}" class="form-control read-only" readonly readonly="readonly">
			</div>
			<div class="form-group col-3">
				<label for="">이수구분</label>
				<input type="text" name="" id="" value="${list.class_type}" class="form-control read-only" readonly readonly="readonly">
			</div>
			<div class="form-group col-3">
				<label for="">담당교수</label>
				<input type="text" name="" id="" value="${list.name}" class="form-control read-only" readonly readonly="readonly">
			</div>
			<div class="form-group col-3">
				<label for="">강의평가 점수</label>
				<input type="text" name="" id="" value="${(q1+q2+q3+q4+p5)/5} / 5" class="form-control read-only" readonly readonly="readonly"/>
				
				
			</div>			
		</div><!-- row -->
	</div> <!-- card-body -->
</div><!-- card -->

<div class="card">
	<div class="card-header">
		<h3 class="card-title">강의평가</h3>
	</div>
	<div class="card-body">

		<table class="table table-bordered class_content">
			<thead>
				<tr class="text-white" style="text-align: center; background-color: #2A5F9E">
					<th>항목</th>
					<th>문항</th>
					<th>평균</th>
				</tr>

			</thead>
			<tbody>
				<tr>
					<td class="hangmock">1</td>
					<td class="mnuhang">강의 내용이 명확하고 간결했다.</td> 
					<td class="average">${list2.q1}</td> 
				</tr>
				<tr>
					<td class="hangmock">2</td>
					<td class="mnuhang">강의자료는 충분했다.</td> 
					<td class="average">${list2.q2}</td> 
				</tr>
				<tr>
					<td class="hangmock">3</td>
					<td class="mnuhang">교수는 수업에 성실히 임했다.</td> 
					<td class="average">${list2.q3}</td> 
				</tr>
				<tr>
					<td class="hangmock">4</td>
					<td class="mnuhang">평가는 공정하게 이루어졌다.</td> 
					<td class="average">${list2.q4}</td> 
				</tr>
				<tr>
					<td class="hangmock">5</td>
					<td class="mnuhang">본 강의에 만족하며 다른 학생에게 추천할 의향이 있다.</td> 
					<td class="average">${list2.q5}</td> 
				</tr>
				<tr>
					<td class="hangmock">6</td>
					<td colspan="2">
						건의사항을 작성해주세요.<br><br>
						<!-- <textarea class="form-control col-12 read-only munhang" readOnly name="" placeholder="" rows="4" > -->
						

							<div class="card direct-chat direct-chat-warning">
								<div class="card-body">
									<!-- Conversations are loaded here -->
									<div class="direct-chat-messages" style="height: 310px;">
									
										<c:forEach items="${list3}" var="list">
											<!-- Message. Default to the left -->
											<div class="direct-chat-msg">
												<div class="direct-chat-infos clearfix">
													<span class="direct-chat-name float-left">학생</span>
												</div>
												<!-- /.direct-chat-infos -->
												<div class="direct-chat-text">${list}</div>
												<!-- /.direct-chat-text -->
											</div>
											<!-- /.direct-chat-msg -->
	
											<!-- Message to the right -->
											<div class="direct-chat-msg right">
												<div class="direct-chat-infos clearfix">
													<span class="direct-chat-name float-right text-white"><span style="color: #000000">학생</span></span>
												</div>
												<!-- /.direct-chat-infos -->
												<div class="direct-chat-text">${list}</div>
												<!-- /.direct-chat-text -->
											</div>
											<!-- /.direct-chat-msg -->
										</c:forEach>
									</div>
									<!--/.direct-chat-messages-->
									<!-- /.direct-chat-pane -->
								</div>
								<!-- /.card-body -->
								
							</div>
					
					
					</td> 
					
				</tr>																					
			</tbody>
		</table>
	</div> <!-- card-body -->
</div><!-- card -->	
	
<div style="text-align: center;">	
<button type="button" class="btn btn-sm btnGray text-white" id="" onclick="window.close();" style="height: 31px; margin: center;">닫기</button>		
</div>	
		