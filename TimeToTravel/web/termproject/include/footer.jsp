<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value='${sessionScope.lang}' />
<fmt:setBundle basename="term.project.bundle.home" var="home" />
 <footer class="footer item">
     <div class="footer_info">
         <div class="inner_wrap">
             <div class="footer_nav">
                 <a href="home" style="text-decoration: none !important"><li style="color:#868697"><fmt:message bundle="${home}" key="home"/></li></a>
                 <a href="review?page=0" style="text-decoration: none !important"><li style="color:#868697"><fmt:message bundle="${home}" key="review"/></li></a>
                 <a href="travel?page=0" style="text-decoration: none !important"><li style="color:#868697"><fmt:message bundle="${home}" key="travelRoute"/></li></a>
                 <a href="mypage" style="text-decoration: none !important"><li style="color:#868697"><fmt:message bundle="${home}" key="mypage"/></li></a>
                 <a href="http://ncov.mohw.go.kr/" target="_blank" style="text-decoration: none !important"><li style="color:#868697"><fmt:message bundle="${home}" key="covid"/></li></a>
             </div>
         </div>
     </div>
     <div class="footer_info">
         <a href="#"><fmt:message bundle="${home}" key="footer"/> </a>/
         <a href="https://github.com/devwithpug/TIME-TO-TRAVEL" target="_blank"><fmt:message bundle="${home}" key="madeBy"/></a>
         <br>
         <a href="?language=ko">Korean</a>/<a href="?language=en">English</a>
     </div>
 </footer>