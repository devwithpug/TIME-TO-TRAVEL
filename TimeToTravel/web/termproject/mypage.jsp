<%@ page import="term.project.domain.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>TIME TO TRAVEL - 마이페이지</title>
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
							<c:choose>
								<c:when test="${param.get('error').equals('update')}">
									<div class="alert alert-danger" role="alert">
										회원정보 변경 실패! 비밀번호를 확인해주세요!
									</div>
								</c:when>
								<c:when test="${param.get('error').equals('delete')}">
									<div class="alert alert-danger" role="alert">
										회원탈퇴 실패! 비밀번호를 확인해주세요!
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
									<label for="name" class="col-sm-3 col-form-label">이름</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="name" name="name" value="<%=user.getName()%>" readonly="readonly">
									</div>
								</div>

								<div class="mb-3 row">
									<label for="id" class="col-sm-3 col-form-label">아이디</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="id" name="email" value="<%=user.getEmail()%>" readonly="readonly">
									</div>
								</div>

								<div class="mb-3 row">
									<label for="nickname" class="col-sm-3 col-form-label">닉네임</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="nickname" name="nickname" value="<%=user.getNickname()%>">
									</div>
								</div>

								<div class="mb-3 row">
									<label for="pwd" class="col-sm-3 col-form-label">기존 비밀번호</label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="pwd" name="pwd" value="">
									</div>
								</div>
								<div class="mb-3 row">
									<label for="pwd2" class="col-sm-3 col-form-label">신규 비밀번호</label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="pwd2" name="pwd2" value="">
									</div>
								</div>
								<div class="mb-3 row">
									<label for="phone" class="col-sm-3 col-form-label">전화번호</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="phone" name="phoneNumber" value="<%=user.getPhoneNumber()%>">
									</div>
								</div>
								<div class="btn_group">
									<input type="button" class="btn btn-primary btn-info" onclick="location.href='/mypref'" value="여행타입">
									<input type="submit" class="btn btn-primary btn-primary"  value="정보수정">
									<button type="button" class="btn btn-primary btn-warning" data-bs-toggle="modal" data-bs-target="#staticBackdrop">회원탈퇴</button>
								</div>
								<br>
							</form>

							<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="false">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="staticBackdropLabel">[경고]회원 탈퇴</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<form method="get" action="/mypage" name="delete_modal">
											<input type="hidden" name="delete" value="true">
											<div class="modal-body" >
												<p class="confirm_text">탈퇴하면 모든 정보가 삭제되며 취소할 수 없습니다!</p>
												<p class="confirm_text">정말 탈퇴하시려면 비밀번호를 입력해주세요.</p>
												<br>
												<div class="col-sm-6">
													<input type="text" class="form-control" id="leave-pw" name="deletePwd" value="">
												</div>
												<br>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
												<button type="submit" class="btn btn-warning">회원탈퇴</button>
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