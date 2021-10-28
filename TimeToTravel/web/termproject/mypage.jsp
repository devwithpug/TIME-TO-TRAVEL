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
							<c:choose>
								<c:when test="${param.get('error').equals('update')}">
									<div class="alert alert-danger" role="alert">
										<fmt:message bundle="${mypage}" key="updateErr"/>
									</div>
								</c:when>
								<c:when test="${param.get('error').equals('delete')}">
									<div class="alert alert-danger" role="alert">
										<fmt:message bundle="${mypage}" key="deleteErr"/>
									</div>
								</c:when>
							</c:choose>
							<h1>회원 정보 변경</h1>
							<br>
							<form name="mypage_form" action="/mypage" method="post">
								<%
									User user = (User) session.getAttribute("user");
								%>
								<div class="mb-3 row">
									<label for="name" class="col-sm-3 col-form-label"><fmt:message bundle="${mypage}" key="name"/></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="name" name="name" value="<%=user.getName()%>" readonly="readonly">
									</div>
								</div>

								<div class="mb-3 row">
									<label for="id" class="col-sm-3 col-form-label"><fmt:message bundle="${mypage}" key="email"/></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="id" name="email" value="<%=user.getEmail()%>" readonly="readonly">
									</div>
								</div>

								<div class="mb-3 row">
									<label for="nickname" class="col-sm-3 col-form-label"><fmt:message bundle="${mypage}" key="nick"/></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="nickname" name="nickname" value="<%=user.getNickname()%>">
									</div>
								</div>

								<div class="mb-3 row">
									<label for="pwd" class="col-sm-3 col-form-label"><fmt:message bundle="${mypage}" key="oldPwd"/></label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="pwd" name="pwd" value="">
									</div>
								</div>
								<div class="mb-3 row">
									<label for="pwd2" class="col-sm-3 col-form-label"><fmt:message bundle="${mypage}" key="newPwd"/></label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="pwd2" name="pwd2" value="">
									</div>
								</div>
								<div class="mb-3 row">
									<label for="phone" class="col-sm-3 col-form-label"><fmt:message bundle="${mypage}" key="phoneNum"/></label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="phone" name="phoneNumber" value="<%=user.getPhoneNumber()%>">
									</div>
								</div>
								<div class="btn_group">
									<input type="button" class="btn btn-primary btn-info" onclick="location.href='/mypref'" value='<fmt:message bundle="${mypage}" key="typeBtn"/>'>
									<input type="submit" class="btn btn-primary btn-primary"  value='<fmt:message bundle="${mypage}" key="updateBtn"/>'>
									<button type="button" class="btn btn-primary btn-warning" data-bs-toggle="modal" data-bs-target="#staticBackdrop"><fmt:message bundle="${mypage}" key="deleteAcc"/></button>
								</div>
								<br>
							</form>

							<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="false">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="staticBackdropLabel"><fmt:message bundle="${mypage}" key="deleteWarn1"/></h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<form method="get" action="/mypage" name="delete_modal">
											<input type="hidden" name="delete" value="true">
											<div class="modal-body" >
												<p class="confirm_text"><fmt:message bundle="${mypage}" key="deleteWarn2"/></p>
												<p class="confirm_text"><fmt:message bundle="${mypage}" key="deleteWarn3"/></p>
												<br>
												<div class="col-sm-6">
													<input type="text" class="form-control" id="leave-pw" name="deletePwd" value="">
												</div>
												<br>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><fmt:message bundle="${mypage}" key="cancel"/></button>
												<button type="submit" class="btn btn-warning"><fmt:message bundle="${mypage}" key="deleteAcc"/></button>
											</div>
										</form>
									</div>
								</div>
							</div>

						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<jsp:include page="/termproject/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>