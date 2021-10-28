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
    <fmt:setBundle basename="term.project.bundle.home" var="home" />
		<div class="wrapper">
			<jsp:include page="/termproject/include/header.jsp"></jsp:include>
			<div class="main">
				<div id="main-img" class="main-img">
                    <div class="main-img-text"></div>
                </div>

                <br><br><br><br><br><br>
                <div class="main-text">
                    <h3><fmt:message bundle="${home}" key="mainText1"/></h3>
                    <h3><fmt:message bundle="${home}" key="mainText2"/></h3>
                    <br>
                    <p><fmt:message bundle="${home}" key="mainText3"/></p>
                </div>
                <br><br><br><br><br><br>
                <div class="main-text">
                    <h3>HOT PLACE</h3>
                    <p><fmt:message bundle="${home}" key="hotPlace"/></p>
                </div>
                <br>
                
                    <div class="slide_wrapper">
                        <ul class="slides">
                            <li onclick="location.href='#'">
                                <img src="http://placehold.it/200x200" alt="">
                                <div class="hotpl-title">핫플레이스 제목</div>
                            </li>
                            <li onclick="location.href='#'">
                                <img src="http://placehold.it/200x200" alt="">
                                <div class="hotpl-title">핫플레이스 제목</div>
                            </li>
                            <li onclick="location.href='#'">
                                <img src="http://placehold.it/200x200" alt="">
                                <div class="hotpl-title">핫플레이스 제목</div>
                            </li>
                            <li onclick="location.href='#'">
                                <img src="http://placehold.it/200x200" alt="">
                                <div class="hotpl-title">핫플레이스 제목</div>
                            </li>
                            <li nclick="location.href='#'">
                                <img src="http://placehold.it/200x200" alt="">
                                <div class="hotpl-title">핫플레이스 제목</div>
                            </li>
                            <li onclick="location.href='#'">
                                <img src="http://placehold.it/200x200" alt="">
                                <div class="hotpl-title">핫플레이스 제목</div>
                            </li>
                            <li onclick="location.href='#'">
                                <img src="http://placehold.it/200x200" alt="">
                                <div class="hotpl-title">핫플레이스 제목</div>
                            </li>
                            <li onclick="location.href='#'">
                                <img src="http://placehold.it/200x200" alt="">
                                <div class="hotpl-title">핫플레이스 제목</div>
                            </li>
                            <li onclick="location.href='#'">
                                <img src="http://placehold.it/200x200" alt="">
                                <div class="hotpl-title">핫플레이스 제목</div>
                            </li>
                            <li onclick="location.href='#'">
                                <img src="http://placehold.it/200x200" alt="">
                                <div class="hotpl-title">핫플레이스 제목</div>
                            </li>
                        </ul>
                    </div>
                    <p class="controls">
                        <span class="prev"><i class="fa fa-angle-double-left"></i></span>
                        <span class="next"><i class="fa fa-angle-double-right"></i></span>
                    </p>
                <br><br><br><br>
			</div>
			<jsp:include page="/termproject/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>
