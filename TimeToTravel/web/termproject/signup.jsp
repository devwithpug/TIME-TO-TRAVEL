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
						<button type="submit" class="btn btn-primary">등록</button>
					</form>
				</div>
			</div>
			<jsp:include page="/termproject/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>
