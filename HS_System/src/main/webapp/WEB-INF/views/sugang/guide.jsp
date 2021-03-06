<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<style>
div.card {
	width: 100%;
}

body div {
	width: 100%;
}

div.card div.row:first-child {
	height: auto;
}

div.card div.row div.card-body {
	padding: 5px;
}

div.card div.row:last-child {
	height: auto;
}

div.card div.card-body {
	height: 100%;
}

div.card-body table.table {
	height: 100%;
	text-align: center;
}

div.card-body table.table thead tr th {
	padding: 5px;
}

div.card-body table.table tbody tr td {
	padding: 3px;
	vertical-align: middle;
}

#day {
	width: 25%;
}

.card-header {
	display: flex;
	border-bottom-width: 3px;
	border-bottom-color: #2A5F9E;
}

div.card div.row:first-child div.card-body {
	border: 1px solid black;
}

div.card div.row:last-child div.card{
	height: 100%;
}
</style>
</head>
<body>
	<div class="card">
		<div class="card-body">
			<div class="row">
				<div class="card col-12">
					<div class="card-header">
						<h4 class="card-title">수강신청 안내문</h4>
					</div>
					<div class="card-body">
						<pre>
1. 지원자격 : 소속대학교 총장의 추천을 받은 자
2. 수학신청자 추천 기한 : 2019. 7. 4.(목)
3. 선발결과공지 : 2019. 7. 23.(화), 소속 대학으로 선발결과 및 교류학생용 학번 안내 예정
   ※ 선발학생 이메일로 학번, 수강신청 임시비밀번호 발송. 이메일 주소 정확히 기재하여 제출
   ※ oo대학교 교류 경험이 있는 학생들은 기존 학번을 사용하므로 기존학번 확인 필수
4. 수강신청 안내
  ∙ 수업기간 : 2019. 9. 2.(월) ~ 12. 13.(금)
  ∙ 개설교과목 열람 : 2019. 7. 1.(월) 이후 수강신청사이트(http://sugang.snu.ac.kr) 강좌검색
  ∙ 수강신청 가능 학점 수 : 원 소속대학 기준을 따름
  ∙ 수강신청기간(교류학생)
    - 기간 : 2019. 8. 5.(월) 07:00~16:00, 8. 6.(화) ~ 8. 7.(수) 09:00~16:00
    - 방법 : 수강신청 사이트(http://sugang.snu.ac.kr)에 접속하여 수강신청 메뉴에서 직접 신청
      (교류학생용으로 부여된 학번(ID), 비밀번호로 로그인)
    ※ 학사과정생이 대학원 과정의 교과목을 수강하고자 할 경우, 해당 교과목 담당교수의 허가를 득한 후 수강신청을 하여야 함
    ※ 정원이 초과된 강좌는 수강신청기간 마감 후 개설학과에 수강 가능여부를 문의한 뒤  수강신청정정요청서(초안지)를
   작성하여 교과목  개설 학과에 제출
  ∙ 수강변경 : 2019. 9. 2.(월) ~ 9. 6.(금) 09:00~18:00, 수강신청 사이트에서 직접 변경
  ∙ 수강취소 : 2019. 9. 7.(토) ~ 10. 25.(금)</pre>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-4">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">수업교시 안내</h4>
						</div>
						<div class="card-body">
							<table class="table">
								<thead>
									<tr>
										<th>구분</th>
										<th>시간</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1교시</td>
										<td>09:00 ~ 09:50</td>
									</tr>
									<tr>
										<td>2교시</td>
										<td>10:00 ~ 10:50</td>
									</tr>
									<tr>
										<td>3교시</td>
										<td>11:00 ~ 11:50</td>
									</tr>
									<tr>
										<td>4교시</td>
										<td>13:00 ~ 13:50</td>
									</tr>
									<tr>
										<td>5교시</td>
										<td>14:00 ~ 14:50</td>
									</tr>
									<tr>
										<td>6교시</td>
										<td>15:00 ~ 15:50</td>
									</tr>
									<tr>
										<td>7교시</td>
										<td>16:00 ~ 16:50</td>
									</tr>
									<tr>
										<td>8교시</td>
										<td>17:00 ~ 17:50</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="col-8">
					<div class="card">
						<div class="card-header">
							<h4 class="card-title">수강신청 기간 안내</h4>
						</div>
						<div class="card-body">
							<table class="table">
								<thead>
									<tr>
										<th>수강신청구분</th>
										<th id="day">일자</th>
										<th>시간</th>
										<th>대상</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>수강신청 준비기간</td>
										<td>2022-02-07(월) ~ 2022-02-12(금)</td>
										<td>09:00 ~ 18:00</td>
										<td>재*휴학생 전체</td>
									</tr>
									<tr>
										<td>수강신청</td>
										<td>2022-02-15(월) ~ 2022-02-19(금)</td>
										<td>09:00 ~ 18:00</td>
										<td>재*휴학생 전체</td>
									</tr>
									<tr>
										<td>추가신청 및 정정기간</td>
										<td>2022-02-22(월) ~ 2022-02-26(금)</td>
										<td>09:00 ~ 18:00</td>
										<td>재*휴학생 전체</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>