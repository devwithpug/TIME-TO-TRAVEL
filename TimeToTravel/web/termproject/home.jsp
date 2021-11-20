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
                <c:choose>
                    <c:when test="${param.get('error').equals('not_found')}">
                        <br>
                        <div class="container">
                            <div class="alert alert-danger" role="alert">
                                <fmt:message bundle="${home}" key="notFoundErr"/>
                            </div>
                        </div>
                    </c:when>
                </c:choose>

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
                
			</div>
			<jsp:include page="/termproject/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>
