<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>footer</title>
	</head>
	<body>
         <footer class="footer item">
             <div class="footer_info">
                 <div class="inner_wrap">
                     <div class="footer_nav">
                         <a href="home?user_id=${sessionScope.user_id}" style="text-decoration: none !important"><li style="color:#868697">Home</li></a>
                         <a href="review?user_id=${sessionScope.user_id}" style="text-decoration: none !important"><li style="color:#868697">여행 후기</li></a>
                         <a href="travelroot?user_id=${sessionScope.user_id}" style="text-decoration: none !important"><li style="color:#868697">여행 루트 공유</li></a>
                         <a href="mypage?user_id=${sessionScope.user_id}" style="text-decoration: none !important"><li style="color:#868697">마이페이지</li></a>
                         <a href="http://ncov.mohw.go.kr/" target="_blank" style="text-decoration: none !important"><li style="color:#868697">코로나 현황</li></a>
                     </div>
                 </div>
             </div>
             <div class="footer_info"><a href="#">경기대학교 2021-2 지능웹설계 텀프로젝트 201714042 최준규</a></div>
         </footer>
	</body>
</html>
