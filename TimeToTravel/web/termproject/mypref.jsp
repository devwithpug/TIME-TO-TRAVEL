<%@ page import="term.project.domain.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>TIME TO TRAVEL</title>
		<link href="/termproject/resources/css/mypage/mypage_main.css" rel="stylesheet" type="text/css" />
		<script src="/termproject/resources/js/mypage/mypageupdate.js" type="text/javascript"></script>
	</head>
	<body>
	<fmt:setLocale value='${sessionScope.lang}' />
	<fmt:setBundle basename="term.project.bundle.mypage" var="mypage" />
	<fmt:setBundle basename="term.project.bundle.home" var="home" />
		<div class="wrapper">
			<jsp:include page="/termproject/include/header.jsp"></jsp:include>
			<div class="main">
				<br><br><br><br>
				<div class="container" style="width: 600px">
					<c:choose>
						<c:when test="${sessionScope.user == null}">
							<h1><fmt:message bundle="${home}" key="memberOnly1"/></h1>
							<marquee scrollamount=10>
								<h1><fmt:message bundle="${home}" key="memberOnly2"/></h1>
							</marquee>
							<img src="/termproject/resources/img/pug_move.gif">
						</c:when>
						<c:otherwise>
							<h1><fmt:message bundle="${mypage}" key="type"/></h1>
							<br>
							<form name="mypage_form" action="/mypref" method="post">
								<%
									User user = (User) session.getAttribute("user");
								%>
								<div class="mb-3 row">
									<label for="name" class="col-sm-3 col-form-label"><fmt:message bundle="${mypage}" key="name"/></label>
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


								<p class="form-label"><fmt:message bundle="${mypage}" key="type1"/></p>
								<div class="btn-group mx-auto d-table" role="group">
									<input type="radio" class="btn-check" name="prf1" id="prf1_1" value="romantic" autocomplete="off" <% out.print((prefType.equals("romantic")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf1_1"><fmt:message bundle="${mypage}" key="type1_1"/></label>
									<input type="radio" class="btn-check" name="prf1" id="prf1_2" value="relaxed" autocomplete="off" <% out.print((prefType.equals("relaxed")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf1_2"><fmt:message bundle="${mypage}" key="type1_2"/></label>
									<input type="radio" class="btn-check" name="prf1" id="prf1_3" value="explorer" autocomplete="off" <% out.print((prefType.equals("explorer")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf1_3"><fmt:message bundle="${mypage}" key="type1_3"/></label>
								</div>
								<br>
								<p class="form-label"><fmt:message bundle="${mypage}" key="type2"/></p>
								<div class="btn-group mx-auto d-table" role="group">
									<input type="radio" class="btn-check" name="prf2" id="prf2_1" value="activity" autocomplete="off" <% out.print((prefPreference.equals("activity")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf2_1"><fmt:message bundle="${mypage}" key="type2_1"/></label>
									<input type="radio" class="btn-check" name="prf2" id="prf2_2" value="backpacking" autocomplete="off" <% out.print((prefPreference.equals("backpacking")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf2_2"><fmt:message bundle="${mypage}" key="type2_2"/></label>
									<input type="radio" class="btn-check" name="prf2" id="prf2_3" value="vacation" autocomplete="off" <% out.print((prefPreference.equals("vacation")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf2_3"><fmt:message bundle="${mypage}" key="type2_3"/></label>
								</div>
								<br>
								<p class="form-label"><fmt:message bundle="${mypage}" key="type3"/></p>
								<div class="btn-group mx-auto d-table" role="group">
									<input type="radio" class="btn-check" name="prf3" id="prf3_1" value="direct" autocomplete="off" <% out.print((prefFlight.equals("direct")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf3_1"><fmt:message bundle="${mypage}" key="type3_1"/></label>
									<input type="radio" class="btn-check" name="prf3" id="prf3_2" value="transit" autocomplete="off" <% out.print((prefFlight.equals("transit")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf3_2"><fmt:message bundle="${mypage}" key="type3_2"/></label>
								</div>
								<br>
								<p class="form-label"><fmt:message bundle="${mypage}" key="type4"/></p>
								<div class="btn-group mx-auto d-table" role="group">
									<input type="radio" class="btn-check" name="prf4" id="prf4_1" value="hotel" autocomplete="off" <% out.print((prefRoom.equals("hotel")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf4_1"><fmt:message bundle="${mypage}" key="type4_1"/></label>
									<input type="radio" class="btn-check" name="prf4" id="prf4_2" value="others" autocomplete="off" <% out.print((prefRoom.equals("others")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf4_2"><fmt:message bundle="${mypage}" key="type4_2"/></label>
								</div>
								<br>
								<p class="form-label"><fmt:message bundle="${mypage}" key="type5"/></p>
								<div class="btn-group mx-auto d-table" role="group">
									<input type="radio" class="btn-check" name="prf5" id="prf5_1" value="plan" autocomplete="off" <% out.print((plan.equals("plan")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf5_1"><fmt:message bundle="${mypage}" key="type5_1"/></label>
									<input type="radio" class="btn-check" name="prf5" id="prf5_2" value="unplan" autocomplete="off" <% out.print((plan.equals("unplan")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf5_2"><fmt:message bundle="${mypage}" key="type5_2"/></label>
								</div>
								<br>
								<p class="form-label"><fmt:message bundle="${mypage}" key="type6"/></p>
								<div class="btn-group mx-auto d-table" role="group">
									<input type="radio" class="btn-check" name="prf6" id="prf6_1" value="taxi" autocomplete="off" <% out.print((prefTransport.equals("taxi")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf6_1"><fmt:message bundle="${mypage}" key="type6_1"/></label>
									<input type="radio" class="btn-check" name="prf6" id="prf6_2" value="transport" autocomplete="off" <% out.print((prefTransport.equals("transport")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf6_2"><fmt:message bundle="${mypage}" key="type6_2"/></label>
								</div>
								<br>
								<p class="form-label"><fmt:message bundle="${mypage}" key="type7"/></p>
								<div class="btn-group mx-auto d-table" role="group">
									<input type="radio" class="btn-check" name="prf7" id="prf7_1" value="restaurant" autocomplete="off" <% out.print((prefMeal.equals("restaurant")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf7_1"><fmt:message bundle="${mypage}" key="type7_1"/></label>
									<input type="radio" class="btn-check" name="prf7" id="prf7_2" value="every" autocomplete="off" <% out.print((prefMeal.equals("every")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf7_2"><fmt:message bundle="${mypage}" key="type7_2"/></label>
								</div>
								<br>
								<p class="form-label"><fmt:message bundle="${mypage}" key="type8"/></p>
								<div class="btn-group mx-auto d-table" role="group">
									<input type="radio" class="btn-check" name="prf8" id="prf8_1" value="tour" autocomplete="off" <% out.print((prefTendency.equals("tour")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf8_1"><fmt:message bundle="${mypage}" key="type8_1"/></label>
									<input type="radio" class="btn-check" name="prf8" id="prf8_2" value="relax" autocomplete="off" <% out.print((prefTendency.equals("relax")) ? "checked" : "");%>>
									<label class="btn btn-outline-primary" for="prf8_2"><fmt:message bundle="${mypage}" key="type8_2"/></label>
								</div>

								<div class="btn_group">
									<input type="submit" class="btn btn-primary btn-primary"  value='<fmt:message bundle="${mypage}" key="updateBtn"/>'>
									<input type="button" class="btn btn-primary btn-secondary" onclick="location.href='/mypage'" value='<fmt:message bundle="${mypage}" key="cancel"/>'>
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