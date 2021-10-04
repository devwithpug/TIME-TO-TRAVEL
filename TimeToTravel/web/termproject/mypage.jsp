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
							<h1>회원 정보 변경</h1>
							<form name="mypage_form" action="profileUpdate.do" method="post" enctype="multipart/form-data">
								<input type="hidden" name="mypage_form" value="${dto.user_id }">
								<div class="mb-3 row">
									<label for="name" class="col-sm-3 col-form-label">이름</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="name" value="${dto.user_name }" readonly="readonly">
									</div>
								</div>

								<div class="mb-3 row">
									<label for="id" class="col-sm-3 col-form-label">아이디</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="id" value="${dto.user_id }" readonly="readonly">
									</div>
								</div>

								<div class="mb-3 row">
									<label for="nickname" class="col-sm-3 col-form-label">닉네임</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="nickname" value="${dto.user_nick }">
									</div>
								</div>

								<div class="mb-3 row">
									<label for="password" class="col-sm-3 col-form-label">기존 비밀번호</label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="password" value="">
									</div>
								</div>
								<div class="mb-3 row">
									<label for="newpassword" class="col-sm-3 col-form-label">신규 비밀번호</label>
									<div class="col-sm-6">
										<input type="password" class="form-control" id="newpassword" value="">
									</div>
								</div>
								<div class="mb-3 row">
									<label for="phone" class="col-sm-3 col-form-label">전화번호</label>
									<div class="col-sm-6">
										<input type="text" class="form-control" id="phone" value="${dto.user_phone }">
									</div>
								</div>
								<div class="btn_group">
									<input type="button" class="btn btn-primary btn-primary"  value="정보수정" onclick="pwChkForm();">
									<button type="button" class="btn btn-primary btn-warning" data-bs-toggle="modal" data-bs-target="#staticBackdrop">회원탈퇴</button>
								</div>
								<br>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
            <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="false">
                 <div class="modal-dialog">
                 <div class="modal-content">
                     <div class="modal-header">
                     <h5 class="modal-title" id="staticBackdropLabel">[경고]회원 탈퇴</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                     </div>
                     <form name="delete_modal">
                     <input type="hidden" value="${dto.user_id }">
                         <div class="modal-body" >
                             <p class="confirm_text">탈퇴하면 모든 정보가 삭제되며 취소할 수 없습니다!</p>
                             <p class="confirm_text">정말 탈퇴하시려면 비밀번호를 입력해주세요.</p>
                             <br>
                             <div class="col-sm-6">
                                 <input type="text" class="form-control" id="leave-pw" name="leave-pw" value="" >
                             </div>
                             <br>
                         </div>
                         <div class="modal-footer">
                             <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                             <button type="button" class="btn btn-warning" id="btnDelete" onclick="userDelete();">회원탈퇴</button>
                         </div>
                     </form>
                 </div>
                 </div>
             </div>



			<jsp:include page="/termproject/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>