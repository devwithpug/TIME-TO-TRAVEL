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
					<h1> 회원가입</h1>

					<form>
						<div class="mb-3">
							<label for="name" class="form-label">이름</label>
							<input type="text" class="form-control" id="name">
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">이메일</label>
							<input type="email" class="form-control" id="email">
							<div id="emailHelp" class="form-text">회원가입시 입력한 이메일로 로그인이 가능합니다.</div>
						</div>
						<div class="mb-3">
							<label for="pwd1" class="form-label">비밀번호</label>
							<input type="password" class="form-control" id="pwd1">
						</div>
						<div class="mb-3">
							<label for="pwd2" class="form-label">비밀번호 확인</label>
							<input type="password" class="form-control" id="pwd2">
						</div>
						<div class="mb-3">
							<label for="nickname" class="form-label">닉네임</label>
							<input type="text" class="form-control" id="nickname">
						</div>
						<div class="mb-3">
							<label for="phoneNumber" class="form-label">전화번호</label>
							<input type="text" class="form-control" id="phoneNumber">
						</div>
						<button type="submit" class="btn btn-primary">등록</button>
					</form>
				</div>
			</div>
			<jsp:include page="/termproject/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>