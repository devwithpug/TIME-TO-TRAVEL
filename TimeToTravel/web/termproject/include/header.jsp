<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>header</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
        <link href="/termproject/resources/css/navi.css" rel="stylesheet" type="text/css" />
        <link href="/termproject/resources/css/index.css" rel="stylesheet" type="text/css" />
        <link href="/termproject/resources/css/footer.css" rel="stylesheet" type="text/css" />
        <%--        home--%>
        <script src="/termproject/resources/js/index.js" rel="script" type="text/javascript"></script>
	</head>
	<body>
       <div class="logo item">
           <a href="home"><img class="logo" src="/termproject/resources/img/logo.png"></a>
       </div>
       <div class="header item">
           <div class="headerbtn">
           <c:choose>
	           	<c:when test="${sessionScope.user != null}">
                    <button type="button"class="btn btn-info">${sessionScope.user.nickname}(${sessionScope.user.name})님, 환영합니다!</button>
                    <button type="button"class="btn btn-info" onclick="logout();">로그아웃</button>
	           	</c:when>
               <c:otherwise>
                   <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalSignin">로그인</button>
               </c:otherwise>
           </c:choose>
           </div>
       </div>
       <div class="nav item">
           <ul class="navi">
               <li><a href="home">Home</a></li>
               <li><a href="review?page=0">여행 후기</a></li>
               <li><a href="travelroot?page=0">여행 계획 공유</a></li>
               <li><a href="mypage">마이페이지</a></li>
               <li><a href="http://ncov.mohw.go.kr/" target="_blank">코로나 현황</a></li>
           </ul>
       </div>
	</body>

    <div class="modal fade modal-signin" tabindex="-1" role="dialog" id="modalSignin">
        <div class="modal-dialog" role="document">
            <div class="modal-content rounded-5 shadow">
                <div class="modal-header p-5 pb-4 border-bottom-0">
                    <h2 class="fw-bold mb-0">TIME TO TRAVEL</h2>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body p-5 pt-0">
                    <form method="post" action="/login">
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control rounded-4" id="floatingInput" name="id">
                            <label for="floatingInput">아이디</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control rounded-4" id="pwd" name="pwd">
                            <label for="pwd">비밀번호</label>
                        </div>
                        <button class="w-100 mb-2 btn btn-lg rounded-4 btn-primary" type="submit">로그인</button>
                        <hr class="my-4">
                        <button class="w-100 py-2 mb-2 btn btn-outline-dark rounded-4" type="button" onclick="location.href = 'signup'">
                            회원 가입
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
	<script type="text/javascript">
		function logout() {
			if(confirm("정말 로그아웃 하시겠습니까?")) {
				alert("정상적으로 로그아웃 되었습니다.");
				location.href="login";
			}
		}
	</script>
</html>
