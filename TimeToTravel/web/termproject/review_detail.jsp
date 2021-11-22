<%@ page import="term.project.repository.ReviewRepository" %>
<%@ page import="term.project.domain.Review" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="term.project.repository.UserRepository" %>
<%@ page import="term.project.domain.User" %>
<%@ page import="term.project.util.FileUtil" %>
<%@ page import="term.project.repository.CommentRepository" %>
<%@ page import="term.project.domain.Comment" %>
<%@ page import="java.util.List" %>
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
<fmt:setBundle basename="term.project.bundle.mypage" var="mypage" />
<fmt:setBundle basename="term.project.bundle.post" var="post" />
<%
    String postId = request.getParameter("id");
    String currentPage = request.getParameter("page");
    ReviewRepository reviewRepository = new ReviewRepository();
    UserRepository userRepository = new UserRepository();
    CommentRepository commentRepository = new CommentRepository();

    Review review = null;
    User author = null;
    User user = null;
    List<Comment> comments = null;

    if (session.getAttribute("user") != null) {
        user = (User) session.getAttribute("user");
    }

    try {
        review = reviewRepository.getOneById(postId);
        review.plusViewCount();
        reviewRepository.updateViewCount(review.getPostId(), review.getViewCount());
        comments = commentRepository.getAllByPostId(postId);

        for (Comment comment : comments) {
            User u = userRepository.getOneById(comment.getUserId());
            comment.setUserId(u.getNickname());
        }

        author = userRepository.getOneById(review.getAuthorId());
    } catch (SQLException e) {
    }
%>
<div class="wrapper">
    <jsp:include page="/termproject/include/header.jsp"></jsp:include>
    <div class="main">

        <br><br><br><br>
        <div class="container">
            <h1><fmt:message bundle="${post}" key="post"/></h1>
            <div class="form-group">
                <label for="title"><fmt:message bundle="${post}" key="postTitle"/></label>
                <input type="text" class="form-control" id="title" name="title" value="<%=review.getTitle()%>" readonly="readonly">
            </div>
            <div class="form-group">
                <label for="author"><fmt:message bundle="${post}" key="author"/></label>
                <input type="text" class="form-control" id="author" name="author" value="<%=author.getNickname()%>" readonly="readonly">
            </div>
            <details>
                <summary><fmt:message bundle="${post}" key="userType"/></summary>
                <%
                    String prefType = author.getPrefType();
                    String prefPreference = author.getPrefPreference();
                    String prefFlight = author.getPrefFlight();
                    String prefRoom = author.getPrefRoom();
                    String plan = author.getPrefPlan();
                    String prefTransport = author.getPrefTransport();
                    String prefMeal = author.getPrefMeal();
                    String prefTendency = author.getPrefTendency();
                %>

                <div class="form-control">
                    <p class="form-label"><fmt:message bundle="${mypage}" key="type1"/></p>
                    <div class="btn-group mx-auto d-table" role="group">
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf1" id="prf1_1" value="romantic" autocomplete="off" <% out.print((prefType.equals("romantic")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf1_1"><fmt:message bundle="${mypage}" key="type1_1"/></label>
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf1" id="prf1_2" value="relaxed" autocomplete="off" <% out.print((prefType.equals("relaxed")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf1_2"><fmt:message bundle="${mypage}" key="type1_2"/></label>
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf1" id="prf1_3" value="explorer" autocomplete="off" <% out.print((prefType.equals("explorer")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf1_3"><fmt:message bundle="${mypage}" key="type1_3"/></label>
                    </div>
                    <br>
                    <p class="form-label"><fmt:message bundle="${mypage}" key="type2"/></p>
                    <div class="btn-group mx-auto d-table" role="group">
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf2" id="prf2_1" value="activity" autocomplete="off" <% out.print((prefPreference.equals("activity")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf2_1"><fmt:message bundle="${mypage}" key="type2_1"/></label>
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf2" id="prf2_2" value="backpacking" autocomplete="off" <% out.print((prefPreference.equals("backpacking")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf2_2"><fmt:message bundle="${mypage}" key="type2_2"/></label>
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf2" id="prf2_3" value="vacation" autocomplete="off" <% out.print((prefPreference.equals("vacation")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf2_3"><fmt:message bundle="${mypage}" key="type2_3"/></label>
                    </div>
                    <br>
                    <p class="form-label"><fmt:message bundle="${mypage}" key="type3"/></p>
                    <div class="btn-group mx-auto d-table" role="group">
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf3" id="prf3_1" value="direct" autocomplete="off" <% out.print((prefFlight.equals("direct")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf3_1"><fmt:message bundle="${mypage}" key="type3_1"/></label>
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf3" id="prf3_2" value="transit" autocomplete="off" <% out.print((prefFlight.equals("transit")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf3_2"><fmt:message bundle="${mypage}" key="type3_2"/></label>
                    </div>
                    <br>
                    <p class="form-label"><fmt:message bundle="${mypage}" key="type4"/></p>
                    <div class="btn-group mx-auto d-table" role="group">
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf4" id="prf4_1" value="hotel" autocomplete="off" <% out.print((prefRoom.equals("hotel")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf4_1"><fmt:message bundle="${mypage}" key="type4_1"/></label>
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf4" id="prf4_2" value="others" autocomplete="off" <% out.print((prefRoom.equals("others")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf4_2"><fmt:message bundle="${mypage}" key="type4_2"/></label>
                    </div>
                    <br>
                    <p class="form-label"><fmt:message bundle="${mypage}" key="type5"/></p>
                    <div class="btn-group mx-auto d-table" role="group">
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf5" id="prf5_1" value="plan" autocomplete="off" <% out.print((plan.equals("plan")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf5_1"><fmt:message bundle="${mypage}" key="type5_1"/></label>
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf5" id="prf5_2" value="unplan" autocomplete="off" <% out.print((plan.equals("unplan")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf5_2"><fmt:message bundle="${mypage}" key="type5_2"/></label>
                    </div>
                    <br>
                    <p class="form-label"><fmt:message bundle="${mypage}" key="type6"/></p>
                    <div class="btn-group mx-auto d-table" role="group">
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf6" id="prf6_1" value="taxi" autocomplete="off" <% out.print((prefTransport.equals("taxi")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf6_1"><fmt:message bundle="${mypage}" key="type6_1"/></label>
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf6" id="prf6_2" value="transport" autocomplete="off" <% out.print((prefTransport.equals("transport")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf6_2"><fmt:message bundle="${mypage}" key="type6_2"/></label>
                    </div>
                    <br>
                    <p class="form-label"><fmt:message bundle="${mypage}" key="type7"/></p>
                    <div class="btn-group mx-auto d-table" role="group">
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf7" id="prf7_1" value="restaurant" autocomplete="off" <% out.print((prefMeal.equals("restaurant")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf7_1"><fmt:message bundle="${mypage}" key="type7_1"/></label>
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf7" id="prf7_2" value="every" autocomplete="off" <% out.print((prefMeal.equals("every")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf7_2"><fmt:message bundle="${mypage}" key="type7_2"/></label>
                    </div>
                    <br>
                    <p class="form-label"><fmt:message bundle="${mypage}" key="type8"/></p>
                    <div class="btn-group mx-auto d-table" role="group">
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf8" id="prf8_1" value="tour" autocomplete="off" <% out.print((prefTendency.equals("tour")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf8_1"><fmt:message bundle="${mypage}" key="type8_1"/></label>
                        <input onclick="return(false);" type="radio" class="btn-check" name="prf8" id="prf8_2" value="relax" autocomplete="off" <% out.print((prefTendency.equals("relax")) ? "checked" : "");%>>
                        <label class="btn btn-outline-primary" for="prf8_2"><fmt:message bundle="${mypage}" key="type8_2"/></label>
                    </div>
                </div>

            </details>
            <div class="form-group">
                <label for="title"><fmt:message bundle="${post}" key="views"/></label>
                <input type="text" class="form-control" id="viewCount" name="viewCount" value="<%=review.getViewCount()%>" readonly="readonly">
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
                <label for="content"><fmt:message bundle="${post}" key="description"/></label>
                <pre class="form-control" id="content" style="overflow: auto"><c:out value="<%=review.getDescription()%>"></c:out></pre>
            </div>
            <div class="form-group">
                <label for="content"><fmt:message bundle="${post}" key="comment"/></label>
                <c:forEach var="comment" items="<%=comments%>" varStatus="status">
                    <div class="card p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="user d-flex flex-row align-items-center">
                                <small class="font-weight-bold text-primary">${comment.userId}</small>&nbsp;&nbsp;
                                <small class="font-weight-bold">${comment.description}</small>
                            </div>
                            <small>${comment.createdAt}</small>
                        </div>
                    </div>
                </c:forEach>
                <c:choose>
                    <c:when test="${sessionScope.user != null}">
                        <div class="card p-3">
                            <form method="post" action="/comment">
                                <div class="row align-items-center">
                                    <div class="col-auto">
                                        <small class="font-weight-bold text-primary"><%=user.getNickname()%></small>
                                    </div>
                                    <div class="col-10">
                                        <input type="hidden" name="type" value="review">
                                        <input type="hidden" name="postId" value="<%=review.getPostId()%>">
                                        <input type="hidden" name="page" value="<%=currentPage%>">
                                        <input type="text" class="form-control" name="comment" placeholder='<fmt:message bundle="${post}" key='commentText'/>' required="required" minlength="2" maxlength="256">
                                    </div>
                                    <div class="col-auto">
                                        <button type="submit" class="btn btn-primary"><fmt:message bundle="${post}" key="commentBtn"/></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:when>
                </c:choose>
            </div>
            <br><br>
            <c:choose>
                <c:when test="${sessionScope != null}">
                    <%
                        pageContext.setAttribute("user", user);
                        pageContext.setAttribute("authorId", review.getAuthorId());
                    %>
                    <c:choose>
                        <c:when test="${user.userId == authorId}">
                            <a class="btn btn-info" href="/write?type=review&page=<%=currentPage%>&id=<%=postId%>"><fmt:message bundle="${post}" key="postUpdateBtn"/></a>
                            <a class="btn btn-warning" onclick="cancel()"><fmt:message bundle="${post}" key="postDeleteBtn"/></a>
                        </c:when>
                    </c:choose>
                </c:when>
            </c:choose>
            <a class="btn btn-secondary" href="/review?page=<%=currentPage%>"><fmt:message bundle="${post}" key="postListBtn"/></a>
        </div>
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
    function cancel() {
        if(confirm('<fmt:message bundle="${post}" key="postDeleteWarn"/>')) {
            location.href="review?id=<%=postId%>&delete=true";
        }
    }
</script>
</html>
