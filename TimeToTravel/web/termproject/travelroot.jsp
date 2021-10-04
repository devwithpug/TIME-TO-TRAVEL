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
				<c:choose>
					<c:when test="${sessionScope.user == null}">
						<br><br><br><br>
						<div class="container" style="width: 600px">
							<h1>이곳은 회원 전용 페이지 입니다!</h1>
							<marquee scrollamount=10>
								<h1>
									TIME TO TRAVEL의 새로운 회원이 되는 것은 어떠신가요?
									여행을 좋아하는 다른 분들과 함께 귀중한 정보들을 공유해보세요!!!
								</h1>
							</marquee>
							<img src="/termproject/resources/img/pug_move.gif">
						</div>
					</c:when>
					<c:otherwise>
						<div class="container">
							<h1> THIS IS TRAVEL ROOT PAGE</h1>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<jsp:include page="/termproject/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>
