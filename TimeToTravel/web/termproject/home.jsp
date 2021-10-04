<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>TIME TO TRAVEL</title>
    </head>
	<body>
		<div class="wrapper">
			<jsp:include page="/termproject/include/header.jsp"></jsp:include>
			<div class="main">
				<div id="main-img" class="main-img">
                    <div class="main-img-text"></div>
                </div>

                <br><br><br><br><br><br>
                <div class="main-text">
                    <h3>TIME TO TRAVEL은 여행을 꿈꾸는 사람들이</h3>
                    <h3>자신만의 특별한 여행 루트들을 공유 할수 있는 웹 서비스 입니다</h3>
                    <br>
                    <p>여행 후기, 맛집, 일정 공유, 나만의 여행 계획을 회원들과 함께 공유해 보세요</p>
                </div>
                <br><br><br><br><br><br>
                <div class="main-text">
                    <h3>HOT PLACE</h3>
                    <p>추천이 가장 많은 인기 장소 10곳을 소개합니다.</p>
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
