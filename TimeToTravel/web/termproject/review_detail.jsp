<%@ page import="term.project.repository.ReviewRepository" %>
<%@ page import="term.project.domain.entity.Review" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="term.project.repository.UserRepository" %>
<%@ page import="term.project.domain.entity.User" %>
<%@ page import="term.project.util.FileUtil" %>
<%@ page import="term.project.repository.CommentRepository" %>
<%@ page import="term.project.domain.entity.Comment" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>TIME TO TRAVEL - 리뷰 게시글</title>
</head>
<body>
<%
    String postId = request.getParameter("id");
    String currentPage = request.getParameter("page");
    ReviewRepository reviewRepository = new ReviewRepository();
    UserRepository userRepository = new UserRepository();
    CommentRepository commentRepository = new CommentRepository();

    Review review = null;
    User user = null;
    List<Comment> comments = null;

    try {
        review = reviewRepository.getOneById(postId);
        review.plusViewCount();
        reviewRepository.updateViewCount(review.getPostId(), review.getViewCount());
        comments = commentRepository.getAllByPostId(postId);

        for (Comment comment : comments) {
            User u = userRepository.getOneById(comment.getUserId());
            comment.setUserId(u.getNickname());
        }

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
            <c:choose>
                <c:when test="<%=review.getFileName() != null%>">
                    <div class="form-group">
                        <details>
                            <summary>첨부 사진</summary>
                            <img class="form-control" src="<%=FileUtil.getImageDir() + "/" + review.getFileName()%>">
                        </details>
                    </div>
                </c:when>
            </c:choose>
            <div class="form-group">
                <label for="content">내용</label>
                <pre class="form-control" id="content" style="overflow: auto"><c:out value="<%=review.getDescription()%>"></c:out></pre>
            </div>
            <div class="form-group">
                <label for="content">댓글</label>
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
                                    <div class="col-10">
                                        <input type="hidden" name="type" value="review">
                                        <input type="hidden" name="postId" value="<%=review.getPostId()%>">
                                        <input type="hidden" name="page" value="<%=currentPage%>">
                                        <input type="text" class="form-control" name="comment" placeholder="댓글은 삭제 및 수정이 불가능하니 신중하게 작성해주세요." required="required">
                                    </div>
                                    <div class="col-auto">
                                        <button type="submit" class="btn btn-primary">댓글 등록</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:when>
                </c:choose>
            </div>
            <br><br>
            <a class="btn btn-info" href="/write?type=review&page=<%=currentPage%>&id=<%=postId%>">수정</a>
            <a class="btn btn-warning" onclick="cancel()">삭제</a>
            <a class="btn btn-secondary" href="/review?page=<%=currentPage%>">목록</a>
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
