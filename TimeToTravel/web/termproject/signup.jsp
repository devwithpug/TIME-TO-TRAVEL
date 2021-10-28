<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<title>TIME TO TRAVEL</title>
    </head>
	<body>
	<fmt:setLocale value='${sessionScope.lang}' />
	<fmt:setBundle basename="term.project.bundle.mypage" var="mypage" />
	<fmt:setBundle basename="term.project.bundle.signup" var="signup" />
		<div class="wrapper">
			<jsp:include page="/termproject/include/header.jsp"></jsp:include>
			<div class="main">
				<br><br><br><br>
				<div class="container" style="width: 600px">
					<h1><fmt:message bundle="${signup}" key="signUp"/></h1>
					<%
						String error = request.getParameter("error");
						if (error != null) {
							out.println(error);
						}
					%>
					<br>
					<h4><fmt:message bundle="${signup}" key="signUp_1"/></h4>

					<form method="post" action="/signup">
						<div class="mb-3">
							<label for="name" class="form-label"><fmt:message bundle="${mypage}" key="name"/></label>
							<input type="text" class="form-control" id="name" name="name" minlength="1" max="10" required="required">
						</div>
						<div class="mb-3">
							<label for="email" class="form-label"><fmt:message bundle="${signup}" key="email"/></label>
							<input type="email" class="form-control" id="email" name="email" minlength="5" maxlength="36" required="required">
							<div id="emailHelp" class="form-text"><fmt:message bundle="${signup}" key="emailText"/></div>
						</div>
						<div class="mb-3">
							<label for="pwd1" class="form-label"><fmt:message bundle="${signup}" key="pwd"/></label>
							<input type="password" class="form-control" id="pwd1" name="pwd1" minlength="8" maxlength="36" required="required">
						</div>
						<div class="mb-3">
							<label for="pwd2" class="form-label"><fmt:message bundle="${signup}" key="pwdChk"/></label>
							<input type="password" class="form-control" id="pwd2" name="pwd2" minlength="8" maxlength="36" required="required">
						</div>
						<div class="mb-3">
							<label for="nickname" class="form-label"><fmt:message bundle="${mypage}" key="nick"/></label>
							<input type="text" class="form-control" id="nickname" name="nickname" minlength="2" maxlength="10" required="required">
						</div>
						<div class="mb-3">
							<label for="phoneNumber" class="form-label"><fmt:message bundle="${mypage}" key="phoneNum"/></label>
							<input type="text" class="form-control" id="phoneNumber" name="phoneNumber" minlength="11" maxlength="13" required="required">
						</div>
						<h4><fmt:message bundle="${signup}" key="signUp_2"/></h4>
						<p class="form-label"><fmt:message bundle="${mypage}" key="type1"/></p>
						<div class="btn-group mx-auto d-table" role="group">
							<input type="radio" class="btn-check" name="prf1" id="prf1_1" value="romantic" autocomplete="off" required>
							<label class="btn btn-outline-primary" for="prf1_1"><fmt:message bundle="${mypage}" key="type1_1"/></label>
							<input type="radio" class="btn-check" name="prf1" id="prf1_2" value="relaxed" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf1_2"><fmt:message bundle="${mypage}" key="type1_2"/></label>
							<input type="radio" class="btn-check" name="prf1" id="prf1_3" value="explorer" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf1_3"><fmt:message bundle="${mypage}" key="type1_3"/></label>
						</div>
						<br>
						<p class="form-label"><fmt:message bundle="${mypage}" key="type2"/></p>
						<div class="btn-group mx-auto d-table" role="group">
							<input type="radio" class="btn-check" name="prf2" id="prf2_1" value="activity" autocomplete="off" required>
							<label class="btn btn-outline-primary" for="prf2_1"><fmt:message bundle="${mypage}" key="type2_1"/></label>
							<input type="radio" class="btn-check" name="prf2" id="prf2_2" value="backpacking" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf2_2"><fmt:message bundle="${mypage}" key="type2_2"/></label>
							<input type="radio" class="btn-check" name="prf2" id="prf2_3" value="vacation" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf2_3"><fmt:message bundle="${mypage}" key="type2_3"/></label>
						</div>
						<br>
						<p class="form-label"><fmt:message bundle="${mypage}" key="type3"/></p>
						<div class="btn-group mx-auto d-table" role="group">
							<input type="radio" class="btn-check" name="prf3" id="prf3_1" value="direct" autocomplete="off" required>
							<label class="btn btn-outline-primary" for="prf3_1"><fmt:message bundle="${mypage}" key="type3_1"/></label>
							<input type="radio" class="btn-check" name="prf3" id="prf3_2" value="transit" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf3_2"><fmt:message bundle="${mypage}" key="type3_2"/></label>
						</div>
						<br>
						<p class="form-label"><fmt:message bundle="${mypage}" key="type4"/></p>
						<div class="btn-group mx-auto d-table" role="group">
							<input type="radio" class="btn-check" name="prf4" id="prf4_1" value="hotel" autocomplete="off" required>
							<label class="btn btn-outline-primary" for="prf4_1"><fmt:message bundle="${mypage}" key="type4_1"/></label>
							<input type="radio" class="btn-check" name="prf4" id="prf4_2" value="others" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf4_2"><fmt:message bundle="${mypage}" key="type4_2"/></label>
						</div>
						<br>
						<p class="form-label"><fmt:message bundle="${mypage}" key="type5"/></p>
						<div class="btn-group mx-auto d-table" role="group">
							<input type="radio" class="btn-check" name="prf5" id="prf5_1" value="plan" autocomplete="off" required>
							<label class="btn btn-outline-primary" for="prf5_1"><fmt:message bundle="${mypage}" key="type5_1"/></label>
							<input type="radio" class="btn-check" name="prf5" id="prf5_2" value="unplan" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf5_2"><fmt:message bundle="${mypage}" key="type5_2"/></label>
						</div>
						<br>
						<p class="form-label"><fmt:message bundle="${mypage}" key="type6"/></p>
						<div class="btn-group mx-auto d-table" role="group">
							<input type="radio" class="btn-check" name="prf6" id="prf6_1" value="taxi" autocomplete="off" required>
							<label class="btn btn-outline-primary" for="prf6_1"><fmt:message bundle="${mypage}" key="type6_1"/></label>
							<input type="radio" class="btn-check" name="prf6" id="prf6_2" value="transport" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf6_2"><fmt:message bundle="${mypage}" key="type6_2"/></label>
						</div>
						<br>
						<p class="form-label"><fmt:message bundle="${mypage}" key="type7"/></p>
						<div class="btn-group mx-auto d-table" role="group">
							<input type="radio" class="btn-check" name="prf7" id="prf7_1" value="restaurant" autocomplete="off" required>
							<label class="btn btn-outline-primary" for="prf7_1"><fmt:message bundle="${mypage}" key="type7_1"/></label>
							<input type="radio" class="btn-check" name="prf7" id="prf7_2" value="every" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf7_2"><fmt:message bundle="${mypage}" key="type7_2"/></label>
						</div>
						<br>
						<p class="form-label"><fmt:message bundle="${mypage}" key="type8"/></p>
						<div class="btn-group mx-auto d-table" role="group">
							<input type="radio" class="btn-check" name="prf8" id="prf8_1" value="tour" autocomplete="off" required>
							<label class="btn btn-outline-primary" for="prf8_1"><fmt:message bundle="${mypage}" key="type8_1"/></label>
							<input type="radio" class="btn-check" name="prf8" id="prf8_2" value="relax" autocomplete="off">
							<label class="btn btn-outline-primary" for="prf8_2"><fmt:message bundle="${mypage}" key="type8_2"/></label>
						</div>


						<br><br>
						<button type="submit" class="btn btn-primary"><fmt:message bundle="${signup}" key="submit"/></button>
						<br><br>
					</form>
				</div>
			</div>
			<jsp:include page="/termproject/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>
