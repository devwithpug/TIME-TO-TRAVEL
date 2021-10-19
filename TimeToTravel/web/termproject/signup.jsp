<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>TIME TO TRAVEL - 여행 루트 공유</title>
    </head>
	<body>
		<div class="wrapper">
			<jsp:include page="/termproject/include/header.jsp"></jsp:include>
			<div class="main">
				<br><br><br><br>
				<div class="container" style="width: 400px">
					<h1>회원가입</h1>
					<%
						String error = request.getParameter("error");
						if (error != null) {
							out.println(error);
						}
					%>
					<br>
					<h4>1. 회원님의 개인정보를 입력해주세요</h4>

					<form method="post" action="/signup">
						<div class="mb-3">
							<label for="name" class="form-label">이름</label>
							<input type="text" class="form-control" id="name" name="name" minlength="1" max="10" required="required">
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">이메일</label>
							<input type="email" class="form-control" id="email" name="email" minlength="5" maxlength="36" required="required">
							<div id="emailHelp" class="form-text">회원가입시 입력한 이메일로 로그인이 가능합니다.</div>
						</div>
						<div class="mb-3">
							<label for="pwd1" class="form-label">비밀번호</label>
							<input type="password" class="form-control" id="pwd1" name="pwd1" minlength="8" maxlength="36" required="required">
						</div>
						<div class="mb-3">
							<label for="pwd2" class="form-label">비밀번호 확인</label>
							<input type="password" class="form-control" id="pwd2" name="pwd2" minlength="8" maxlength="36" required="required">
						</div>
						<div class="mb-3">
							<label for="nickname" class="form-label">닉네임</label>
							<input type="text" class="form-control" id="nickname" name="nickname" minlength="2" maxlength="10" required="required">
						</div>
						<div class="mb-3">
							<label for="phoneNumber" class="form-label">전화번호</label>
							<input type="text" class="form-control" id="phoneNumber" name="phoneNumber" minlength="11" maxlength="13" required="required">
						</div>
						<h4>2. 회원님의 여행 성향을 알려주세요</h4>
						<p class="form-label">내가 생각하는 나의 여행 성향은?</p>
						<div class="btn-group mx-auto d-table" role="group">
							<input type="radio" class="btn-check" name="prf1" id="prf1_1" value="romantic" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf1_1">로맨틱 여행자 형</label>
							<input type="radio" class="btn-check" name="prf1" id="prf1_2" value="relaxed" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf1_2">느긋한 휴양자 형</label>
							<input type="radio" class="btn-check" name="prf1" id="prf1_3" value="explorer" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf1_3">열혈 탐험가 형</label>
						</div>
						<br>
						<p class="form-label">다음 중 내가 선호하는 여행은?</p>
						<div class="btn-group mx-auto d-table" role="group">
							<input type="radio" class="btn-check" name="prf2" id="prf2_1" value="activity" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf2_1">액티비티</label>
							<input type="radio" class="btn-check" name="prf2" id="prf2_2" value="backpacking" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf2_2">배낭 여행</label>
							<input type="radio" class="btn-check" name="prf2" id="prf2_3" value="vacation" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf2_3">호캉스</label>
						</div>
						<br>
						<p class="form-label">항공 : 직항 vs 경유</p>
						<div class="btn-group mx-auto d-table" role="group">
							<input type="radio" class="btn-check" name="prf3" id="prf3_1" value="direct" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf3_1">직항</label>
							<input type="radio" class="btn-check" name="prf3" id="prf3_2" value="transit" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf3_2">경유</label>
						</div>
						<br>
						<p class="form-label">숙박 : 호텔 vs 그 외</p>
						<div class="btn-group mx-auto d-table" role="group">
							<input type="radio" class="btn-check" name="prf4" id="prf4_1" value="hotel" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf4_1">호텔</label>
							<input type="radio" class="btn-check" name="prf4" id="prf4_2" value="others" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf4_2">그 외</label>
						</div>
						<br>
						<p class="form-label">계획 : 계획적 vs 무계획</p>
						<div class="btn-group mx-auto d-table" role="group">
							<input type="radio" class="btn-check" name="prf5" id="prf5_1" value="plan" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf5_1">계획적</label>
							<input type="radio" class="btn-check" name="prf5" id="prf5_2" value="unplan" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf5_2">무계획</label>
						</div>
						<br>
						<p class="form-label">교통 : 택시 vs 대중교통</p>
						<div class="btn-group mx-auto d-table" role="group">
							<input type="radio" class="btn-check" name="prf6" id="prf6_1" value="taxi" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf6_1">택시</label>
							<input type="radio" class="btn-check" name="prf6" id="prf6_2" value="transport" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf6_2">대중교통</label>
						</div>
						<br>
						<p class="form-label">식사 : 맛집 vs 상관없음</p>
						<div class="btn-group mx-auto d-table" role="group">
							<input type="radio" class="btn-check" name="prf7" id="prf7_1" value="restaurant" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf7_1">맛집</label>
							<input type="radio" class="btn-check" name="prf7" id="prf7_2" value="every" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf7_2">상관없음</label>
						</div>
						<br>
						<p class="form-label">성향 : 관광 vs 휴양</p>
						<div class="btn-group mx-auto d-table" role="group">
							<input type="radio" class="btn-check" name="prf8" id="prf8_1" value="tour" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf8_1">관광</label>
							<input type="radio" class="btn-check" name="prf8" id="prf8_2" value="relax" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf8_2">휴양</label>
						</div>


						<br><br>
						<button type="submit" class="btn btn-primary">등록</button>
						<br><br>
					</form>
				</div>
			</div>
			<jsp:include page="/termproject/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>
