<%@ page import="term.project.repository.ReviewRepository" %>
<%@ page import="term.project.domain.entity.Review" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="term.project.repository.UserRepository" %>
<%@ page import="term.project.domain.entity.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>TIME TO TRAVEL - 글쓰기</title>
</head>
<body>
<%
    String postId = request.getParameter("id");
    String currentPage = request.getParameter("page");
    ReviewRepository reviewRepository = new ReviewRepository();
    UserRepository userRepository = new UserRepository();
    Review review = null;
    User user = null;
    try {
        review = reviewRepository.getOneById(postId);
        review.plusViewCount();
        reviewRepository.updateViewCount(review.getPostId(), review.getViewCount());

        user = userRepository.getOneById(review.getAuthorId());
    } catch (SQLException e) {
    }
%>
<div class="wrapper">
    <jsp:include page="/termproject/include/header.jsp"></jsp:include>
    <div class="main">

        <br><br><br><br>
        <div class="container">
            <h1>게시글</h1>
            <form>
                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" class="form-control" id="title" name="title" value="<%=review.getTitle()%>" readonly="readonly">
                </div>
                <div class="form-group">
                    <label for="author">작성자</label>
                    <input type="text" class="form-control" id="author" name="author" value="<%=user.getNickname()%>" readonly="readonly">
                </div>
                <div class="form-group">
                    <label for="title">조회수</label>
                    <input type="text" class="form-control" id="viewCount" name="viewCount" value="<%=review.getViewCount()%>" readonly="readonly">
                </div>
                <div class="form-group">
                    <label for="content">내용</label>
                    <pre class="form-control" id="content" style="overflow: auto"><c:out value="<%=review.getDescription()%>"></c:out></pre>
                </div>
                <div class="form-group">
                    <h1 class="form-control">사진</h1>
                </div>
                <br><br>
                <a class="btn btn-info" href="/write?type=review&page=<%=currentPage%>&id=<%=postId%>">수정</a>
                <a class="btn btn-warning" onclick="cancel()">삭제</a>
                <a class="btn btn-secondary" href="/review?page=<%=currentPage%>">목록</a>
            </form>
        </div>
    </div>
    <jsp:include page="/termproject/include/footer.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript">
    function cancel() {
        if(confirm("게시글을 삭제합니다.\n되돌릴 수 없습니다!")) {
            location.href="review?id=<%=postId%>&delete=true";
        }
    }
</script>
</html>
