<%@ page import="term.project.repository.ReviewRepository" %>
<%@ page import="term.project.domain.Review" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="term.project.util.FileUtil" %>
<%@ page import="term.project.repository.TravelRouteRepository" %>
<%@ page import="term.project.domain.TravelRoute" %>
<%@ page import="term.project.repository.TravelRouteRepository" %>
<%@ page import="term.project.util.DBUtil" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <title>TIME TO TRAVEL</title>
    </head>
    <body>
    <fmt:setLocale value='${sessionScope.lang}' />
    <fmt:setBundle basename="term.project.bundle.home" var="home" />
    <fmt:setBundle basename="term.project.bundle.post" var="post" />
        <%
            String type = request.getParameter("type");
            String currentPage = request.getParameter("page");
            String id = request.getParameter("id");
        %>
        <div class="wrapper">
            <jsp:include page="/termproject/include/header.jsp"></jsp:include>
            <div class="main">
                <c:choose>
                    <c:when test="${sessionScope.user == null}">
                        <br><br><br><br>
                        <div class="container" style="width: 600px">
                            <h1><fmt:message bundle="${home}" key="memberOnly1"/></h1>
                            <marquee scrollamount=10>
                                <h1><fmt:message bundle="${home}" key="memberOnly2"/></h1>
                            </marquee>
                            <img src="/termproject/resources/img/pug_move.gif">
                        </div>
                    </c:when>
                    <c:when test="<%=id != null%>">
                        <br><br><br><br>
                        <div class="container">
                            <c:choose>
                                <c:when test='<%=type.equals("review")%>'>
                                    <%
                                        ReviewRepository reviewRepository = new ReviewRepository();
                                        Review review = null;
                                        try {
                                            review = reviewRepository.getOneById(id);
                                        } catch (SQLException e) {
                                        }
                                    %>
                                    <h1><fmt:message bundle="${post}" key="updateReview"/></h1>
                                    <form method="post" action="/write?page=<%=currentPage%>" enctype="multipart/form-data">
                                        <input type="text" class="form-control" name="type" hidden="hidden" value="<%=type%>">
                                        <input type="text" class="form-control" name="postId" hidden="hidden" value="<%=id%>">
                                        <div class="form-group">
                                            <label><fmt:message bundle="${post}" key="postTitle"/></label>
                                            <input type="text" class="form-control" placeholder='<fmt:message bundle="${post}" key="postTitle"/>' name="title" minlength="5" maxlength="100" value="<%=review.getTitle()%>" required="required">
                                        </div>
                                        <c:choose>
                                            <c:when test="<%=review.getFileName() != null%>">
                                                <div class="form-group">
                                                    <details>
                                                        <summary><fmt:message bundle="${post}" key="image"/></summary>
                                                        <img class="form-control" src="<%=FileUtil.getImageDir() + "/" + review.getFileName()%>">
                                                    </details>
                                                </div>
                                            </c:when>
                                        </c:choose>
                                        <div class="form-group">
                                            <label><fmt:message bundle="${post}" key="description"/></label>
                                            <textarea type="text" class="form-control" rows="5" name="description" placeholder='<fmt:message bundle="${post}" key="description"/>' minlength="5" maxlength="2048" required="required"><%=review.getDescription()%></textarea>
                                        </div>
                                        <br><br>
                                        <button type="submit" class="btn btn-primary"><fmt:message bundle="${post}" key="submit"/></button>
                                        <a class="btn btn-secondary" onclick="cancel('<%=currentPage%>', '<%=review.getPostId()%>')"><fmt:message bundle="${post}" key="cancel"/></a>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <%
                                        TravelRouteRepository travelRouteRepository = new TravelRouteRepository();
                                        TravelRoute route = null;
                                        try {
                                            route = travelRouteRepository.getOneById(id);
                                        } catch (SQLException e) {
                                        }
                                        String travelType = route.getTravelType();
                                    %>
                                    <h1><fmt:message bundle="${post}" key="updateTravelRoute"/></h1>
                                    <form method="post" action="/write?page=<%=currentPage%>" enctype="multipart/form-data">
                                        <input type="text" class="form-control" name="type" hidden="hidden" value="<%=type%>">
                                        <input type="text" class="form-control" name="postId" hidden="hidden" value="<%=id%>">
                                        <div class="form-group">
                                            <label><fmt:message bundle="${post}" key="postTitle"/></label>
                                            <input type="text" class="form-control" placeholder='<fmt:message bundle="${post}" key="postTitle"/>' name="title" minlength="5" maxlength="100" value="<%=route.getTitle()%>" required="required">
                                        </div>
                                        <c:choose>
                                            <c:when test="<%=route.getFileName() != null%>">
                                                <div class="form-group">
                                                    <details>
                                                        <summary><fmt:message bundle="${post}" key="image"/></summary>
                                                        <img class="form-control" src="<%=FileUtil.getImageDir() + "/" + route.getFileName()%>">
                                                    </details>
                                                </div>
                                            </c:when>
                                        </c:choose>
                                        <div class="form-group">
                                            <label><fmt:message bundle="${post}" key="destination"/></label>
                                            <input type="text" class="form-control" placeholder='<fmt:message bundle="${post}" key="destinationExample"/>' value="<%=route.getDestination()%>" name="destination" minlength="1" maxlength="50" required="required">
                                        </div>
                                        <div class="form-group">
                                            <label><fmt:message bundle="${post}" key="day"/></label>
                                            <input type="number" class="form-control" value="<%=route.getDay()%>" name="day" min="1" max="365" required="required">
                                        </div>
                                        <div class="form-group">
                                            <label><fmt:message bundle="${post}" key="departureDate"/></label>
                                            <input type="date" class="form-control" value="<%=route.getDepartureDate()%>" name="departureDate" required="required">
                                        </div>
                                        <div class="form-group">
                                            <label><fmt:message bundle="${post}" key="arrivalDate"/></label>
                                            <input type="date" class="form-control" value="<%=route.getArrivalDate()%>" name="arrivalDate" required="required">
                                        </div>
                                        <div class="form-group">
                                            <label><fmt:message bundle="${post}" key="expense"/></label>
                                            <input type="number" class="form-control" value="<%=route.getExpense()%>" placeholder="ex) 1000000 (₩)" name="expense" min="1000" max="1000000000" required="required">
                                        </div>
                                        <div class="form-group">
                                            <label><fmt:message bundle="${post}" key="person"/></label>
                                            <input type="number" class="form-control" value="<%=route.getPerson()%>" name="person" min="1" max="100" required="required">
                                        </div>
                                        <div class="form-group">
                                            <label><fmt:message bundle="${post}" key="travelType"/></label>
                                            <div class="btn-group mx-auto d-table" role="group">
                                                <input type="radio" class="btn-check" name="travelType" id="modify_travel_type_0" value="normal" autocomplete="off" required <% out.print((travelType.equals("normal")) ? "checked" : "");%>>
                                                <label class="btn btn-outline-primary" for="modify_travel_type_0"><fmt:message bundle="${post}" key="t1"/></label>
                                                <input type="radio" class="btn-check" name="travelType" id="modify_travel_type_1" value="activity" autocomplete="off" <% out.print((travelType.equals("activity")) ? "checked" : "");%>>
                                                <label class="btn btn-outline-primary" for="modify_travel_type_1"><fmt:message bundle="${post}" key="t2"/></label>
                                                <input type="radio" class="btn-check" name="travelType" id="modify_travel_type_2" value="backpacking" autocomplete="off" <% out.print((travelType.equals("backpacking")) ? "checked" : "");%>>
                                                <label class="btn btn-outline-primary" for="modify_travel_type_2"><fmt:message bundle="${post}" key="t3"/></label>
                                                <input type="radio" class="btn-check" name="travelType" id="modify_travel_type_3" value="vacation" autocomplete="off" <% out.print((travelType.equals("vacation")) ? "checked" : "");%>>
                                                <label class="btn btn-outline-primary" for="modify_travel_type_3"><fmt:message bundle="${post}" key="t4"/></label>
                                                <input type="radio" class="btn-check" name="travelType" id="modify_travel_type_4" value="package" autocomplete="off" <% out.print((travelType.equals("package")) ? "checked" : "");%>>
                                                <label class="btn btn-outline-primary" for="modify_travel_type_4"><fmt:message bundle="${post}" key="t5"/></label>
                                                <input type="radio" class="btn-check" name="travelType" id="modify_travel_type_5" value="month" autocomplete="off" <% out.print((travelType.equals("month")) ? "checked" : "");%>>
                                                <label class="btn btn-outline-primary" for="modify_travel_type_5"><fmt:message bundle="${post}" key="t6"/></label>
                                                <input type="radio" class="btn-check" name="travelType" id="modify_travel_type_6" value="cruise" autocomplete="off" <% out.print((travelType.equals("cruise")) ? "checked" : "");%>>
                                                <label class="btn btn-outline-primary" for="modify_travel_type_6"><fmt:message bundle="${post}" key="t7"/></label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label><fmt:message bundle="${post}" key="description"/></label>
                                            <textarea type="text" class="form-control" rows="5" name="description" placeholder='<fmt:message bundle="${post}" key="description"/>' minlength="5" maxlength="2048" required="required"><%=route.getDescription()%></textarea>
                                        </div>
                                        <br><br>
                                        <button type="submit" class="btn btn-primary"><fmt:message bundle="${post}" key="submit"/></button>
                                        <a class="btn btn-secondary" onclick="cancel('<%=currentPage%>', '<%=route.getPostId()%>')"><fmt:message bundle="${post}" key="cancel"/></a>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:when>
                    <c:when test='<%=type.equals("review")%>'>
                        <br><br><br><br>
                        <div class="container">
                            <h1><fmt:message bundle="${post}" key="writeReview"/></h1>
                            <form method="post" action="/write" enctype="multipart/form-data" data="multipart">
                                <input type="text" class="form-control" name="type" hidden="hidden" value="<%=type%>">
                                <input type="text" class="form-control" name="path" hidden="hidden" value="<%=application.getRealPath("images")%>">
                                <div class="form-group">
                                    <label><fmt:message bundle="${post}" key="postTitle"/></label>
                                    <input type="text" class="form-control" placeholder='<fmt:message bundle="${post}" key="postTitle"/>' name="title" minlength="5" maxlength="100" required="required">
                                </div>
                                <div class="form-group">
                                    <label><fmt:message bundle="${post}" key="description"/></label>
                                    <textarea type="text" class="form-control" rows="5" name="description" placeholder='<fmt:message bundle="${post}" key="description"/>' minlength="5" maxlength="2048" required="required"></textarea>
                                </div>
                                <div class="form-group">
                                    <label><fmt:message bundle="${post}" key="image"/></label>
                                    <input type="file" class="form-control" name="input">
                                </div>
                                <br><br>
                                <button type="submit" class="btn btn-primary"><fmt:message bundle="${post}" key="submit"/></button>
                                <a class="btn btn-secondary" onclick="cancel()"><fmt:message bundle="${post}" key="cancel"/></a>
                            </form>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <br><br><br><br>
                        <div class="container">
                            <h1><fmt:message bundle="${post}" key="writeTravelRoute"/></h1>
                            <form method="post" action="/write" enctype="multipart/form-data" data="multipart">
                                <input type="text" class="form-control" name="type" hidden="hidden" value="<%=type%>">
                                <input type="text" class="form-control" name="path" hidden="hidden" value="<%=application.getRealPath("images")%>">
                                <div class="form-group">
                                    <label><fmt:message bundle="${post}" key="postTitle"/></label>
                                    <input type="text" class="form-control" placeholder='<fmt:message bundle="${post}" key="postTitle"/>' name="title" minlength="5" maxlength="100" required="required">
                                </div>
                                <div class="form-group">
                                    <label><fmt:message bundle="${post}" key="destination"/></label>
                                    <input type="text" class="form-control" placeholder='<fmt:message bundle="${post}" key="destinationExample"/>' name="destination" minlength="1" maxlength="50" required="required">
                                </div>
                                <div class="form-group">
                                    <label><fmt:message bundle="${post}" key="day"/></label>
                                    <input type="number" class="form-control" name="day" min="1" max="365" required="required">
                                </div>
                                <div class="form-group">
                                    <label><fmt:message bundle="${post}" key="departureDate"/></label>
                                    <input type="date" class="form-control" name="departureDate" required="required">
                                </div>
                                <div class="form-group">
                                    <label><fmt:message bundle="${post}" key="arrivalDate"/></label>
                                    <input type="date" class="form-control" name="arrivalDate" required="required">
                                </div>
                                <div class="form-group">
                                    <label><fmt:message bundle="${post}" key="expense"/></label>
                                    <input type="number" class="form-control" placeholder="ex) 1000000 (₩)" name="expense" min="1000" max="1000000000" required="required">
                                </div>
                                <div class="form-group">
                                    <label><fmt:message bundle="${post}" key="person"/></label>
                                    <input type="number" class="form-control" name="person" min="1" max="100" required="required">
                                </div>
                                <div class="form-group">
                                    <label><fmt:message bundle="${post}" key="travelType"/></label>
                                    <div class="btn-group mx-auto d-table" role="group">
                                        <input type="radio" class="btn-check" name="travelType" id="travel_type_0" value="normal" autocomplete="off" required>
                                        <label class="btn btn-outline-primary" for="travel_type_0"><fmt:message bundle="${post}" key="t1"/></label>
                                        <input type="radio" class="btn-check" name="travelType" id="travel_type_1" value="activity" autocomplete="off">
                                        <label class="btn btn-outline-primary" for="travel_type_1"><fmt:message bundle="${post}" key="t2"/></label>
                                        <input type="radio" class="btn-check" name="travelType" id="travel_type_2" value="backpacking" autocomplete="off">
                                        <label class="btn btn-outline-primary" for="travel_type_2"><fmt:message bundle="${post}" key="t3"/></label>
                                        <input type="radio" class="btn-check" name="travelType" id="travel_type_3" value="vacation" autocomplete="off">
                                        <label class="btn btn-outline-primary" for="travel_type_3"><fmt:message bundle="${post}" key="t4"/></label>
                                        <input type="radio" class="btn-check" name="travelType" id="travel_type_4" value="package" autocomplete="off">
                                        <label class="btn btn-outline-primary" for="travel_type_4"><fmt:message bundle="${post}" key="t5"/></label>
                                        <input type="radio" class="btn-check" name="travelType" id="travel_type_5" value="month" autocomplete="off">
                                        <label class="btn btn-outline-primary" for="travel_type_5"><fmt:message bundle="${post}" key="t6"/></label>
                                        <input type="radio" class="btn-check" name="travelType" id="travel_type_6" value="cruise" autocomplete="off">
                                        <label class="btn btn-outline-primary" for="travel_type_6"><fmt:message bundle="${post}" key="t7"/></label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label><fmt:message bundle="${post}" key="description"/></label>
                                    <textarea type="text" class="form-control" rows="5" name="description" placeholder='<fmt:message bundle="${post}" key="description"/>' minlength="5" maxlength="2048" required="required"></textarea>
                                </div>
                                <div class="form-group">
                                    <label><fmt:message bundle="${post}" key="image"/></label>
                                    <input type="file" class="form-control" name="input">
                                </div>
                                <br><br>
                                <button type="submit" class="btn btn-primary"><fmt:message bundle="${post}" key="submit"/></button>
                                <a class="btn btn-secondary" onclick="cancel()"><fmt:message bundle="${post}" key="cancel"/></a>
                            </form>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <jsp:include page="/termproject/include/footer.jsp"></jsp:include>
        </div>
    <%
        try {
            DBUtil.close();
        } catch (SQLException e) {
            System.out.println("err = " + e);
        }
    %>
    </body>
    <script type="text/javascript">
        function cancel(page, postId) {

            if(confirm('<fmt:message bundle="${post}" key="writeCancelWarn"/>')) {
                if (page != null && postId != null) {
                    location.href="<%=type%>?page=" + page + "&id=" + postId;
                } else {
                    location.href="<%=type%>?page=0";
                }
            }
        }
    </script>
</html>
