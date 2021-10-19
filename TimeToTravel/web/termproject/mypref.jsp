<%@ page import="term.project.domain.entity.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>TIME TO TRAVEL - 마이페이지 (여행 성향)</title>
		<link href="/termproject/resources/css/mypage/mypage_main.css" rel="stylesheet" type="text/css" />
		<script src="/termproject/resources/js/mypage/mypageupdate.js" type="text/javascript"></script>
	</head>
	<body>
		<div class="wrapper">
			<jsp:include page="/termproject/include/header.jsp"></jsp:include>
			<div class="main">
				<br><br><br><br>
				<div class="container" style="width: 600px">
					<c:choose>
						<c:when test="${sessionScope.user == null}">
							<h1>이곳은 회원 전용 페이지 입니다!</h1>
							<marquee scrollamount=10>
								<h1>
									TIME TO TRAVEL의 새로운 회원이 되는 것은 어떠신가요?
									여행을 좋아하는 다른 분들과 함께 귀중한 정보들을 공유해보세요!!!
								</h1>
							</marquee>
							<img src="/termproject/resources/img/pug_move.gif">
						</c:when>
						<c:otherwise>
							<h1>여행 타입 변경</h1>
							<br>
							<form name="mypage_form" action="/mypref" method="post">
								<%
									User user = (User) session.getAttribute("user");
								%>
								<div class="mb-3 row">
									<label for="name" class="col-sm-3 col-form-label">이름</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="name" name="name" value="<%=user.getName()%>" readonly="readonly">
									</div>
								</div>

								<%
									String prefType = user.getPrefType();
									String prefPreference = user.getPrefPreference();
									String prefFlight = user.getPrefFlight();
									String prefRoom = user.getPrefRoom();
									String plan = user.getPrefPlan();
									String prefTransport = user.getPrefTransport();
									String prefMeal = user.getPrefMeal();
									String prefTendency = user.getPrefTendency();
								%>


								<p class="form-label">내가 생각하는 나의 여행 성향은?</p>
								<div class="btn-group mx-auto d-table" role="group">
									<input type="radio" class="btn-check" name="prf1" id="prf1_1" value="romantic" autocomplete="off" <% out.print((prefType.equals("romantic")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf1_1">로맨틱 여행자 형</label>
									<input type="radio" class="btn-check" name="prf1" id="prf1_2" value="relaxed" autocomplete="off" <% out.print((prefType.equals("relaxed")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf1_2">느긋한 휴양자 형</label>
									<input type="radio" class="btn-check" name="prf1" id="prf1_3" value="explorer" autocomplete="off" <% out.print((prefType.equals("explorer")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf1_3">열혈 탐험가 형</label>
								</div>
								<br>
								<p class="form-label">다음 중 내가 선호하는 여행은?</p>
								<div class="btn-group mx-auto d-table" role="group">
									<input type="radio" class="btn-check" name="prf2" id="prf2_1" value="activity" autocomplete="off" <% out.print((prefPreference.equals("activity")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf2_1">액티비티</label>
									<input type="radio" class="btn-check" name="prf2" id="prf2_2" value="backpacking" autocomplete="off" <% out.print((prefPreference.equals("backpacking")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf2_2">배낭 여행</label>
									<input type="radio" class="btn-check" name="prf2" id="prf2_3" value="vacation" autocomplete="off" <% out.print((prefPreference.equals("vacation")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf2_3">호캉스</label>
								</div>
								<br>
								<p class="form-label">항공 : 직항 vs 경유</p>
								<div class="btn-group mx-auto d-table" role="group">
									<input type="radio" class="btn-check" name="prf3" id="prf3_1" value="direct" autocomplete="off" <% out.print((prefFlight.equals("direct")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf3_1">직항</label>
									<input type="radio" class="btn-check" name="prf3" id="prf3_2" value="transit" autocomplete="off" <% out.print((prefFlight.equals("transit")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf3_2">경유</label>
								</div>
								<br>
								<p class="form-label">숙박 : 호텔 vs 그 외</p>
								<div class="btn-group mx-auto d-table" role="group">
									<input type="radio" class="btn-check" name="prf4" id="prf4_1" value="hotel" autocomplete="off" <% out.print((prefRoom.equals("hotel")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf4_1">호텔</label>
									<input type="radio" class="btn-check" name="prf4" id="prf4_2" value="others" autocomplete="off" <% out.print((prefRoom.equals("others")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf4_2">그 외</label>
								</div>
								<br>
								<p class="form-label">계획 : 계획적 vs 무계획</p>
								<div class="btn-group mx-auto d-table" role="group">
									<input type="radio" class="btn-check" name="prf5" id="prf5_1" value="plan" autocomplete="off" <% out.print((plan.equals("plan")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf5_1">계획적</label>
									<input type="radio" class="btn-check" name="prf5" id="prf5_2" value="unplan" autocomplete="off" <% out.print((plan.equals("unplan")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf5_2">무계획</label>
								</div>
								<br>
								<p class="form-label">교통 : 택시 vs 대중교통</p>
								<div class="btn-group mx-auto d-table" role="group">
									<input type="radio" class="btn-check" name="prf6" id="prf6_1" value="taxi" autocomplete="off" <% out.print((prefTransport.equals("taxi")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf6_1">택시</label>
									<input type="radio" class="btn-check" name="prf6" id="prf6_2" value="transport" autocomplete="off" <% out.print((prefTransport.equals("transport")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf6_2">대중교통</label>
								</div>
								<br>
								<p class="form-label">식사 : 맛집 vs 상관없음</p>
								<div class="btn-group mx-auto d-table" role="group">
									<input type="radio" class="btn-check" name="prf7" id="prf7_1" value="restaurant" autocomplete="off" <% out.print((prefMeal.equals("restaurant")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf7_1">맛집</label>
									<input type="radio" class="btn-check" name="prf7" id="prf7_2" value="every" autocomplete="off" <% out.print((prefMeal.equals("every")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf7_2">상관없음</label>
								</div>
								<br>
								<p class="form-label">성향 : 관광 vs 휴양</p>
								<div class="btn-group mx-auto d-table" role="group">
									<input type="radio" class="btn-check" name="prf8" id="prf8_1" value="tour" autocomplete="off" <% out.print((prefTendency.equals("tour")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf8_1">관광</label>
									<input type="radio" class="btn-check" name="prf8" id="prf8_2" value="relaxed" autocomplete="off" <% out.print((prefTendency.equals("relaxed")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf8_2">휴양</label>
								</div>

								<div class="btn_group">
									<input type="submit" class="btn btn-primary btn-primary"  value="정보수정">
									<input type="button" class="btn btn-primary btn-secondary" onclick="location.href='/mypage'" value="뒤로가기">
								</div>
								<br>
							</form>

						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<jsp:include page="/termproject/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>