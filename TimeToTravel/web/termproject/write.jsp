<%@ page import="term.project.repository.ReviewRepository" %>
<%@ page import="term.project.domain.entity.Review" %>
<%@ page import="java.sql.SQLException" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>TIME TO TRAVEL - 글쓰기</title>
    </head>
    <body>
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
                    <c:when test="<%=id != null%>">
                        <%
                            ReviewRepository reviewRepository = new ReviewRepository();
                            Review review = null;
                            try {
                                review = reviewRepository.getOneById(id);
                            } catch (SQLException e) {
                            }
                        %>
                        <br><br><br><br>
                        <div class="container">
                            <h1>글쓰기 (수정) - <%=(type.equals("review")? "여행 후기" : "여행 계획 공유")%></h1>
                            <form method="post" action="/write?page=<%=currentPage%>" enctype="multipart/form-data">
                                <input type="text" class="form-control" name="type" hidden="hidden" value="<%=type%>">
                                <input type="text" class="form-control" name="postId" hidden="hidden" value="<%=id%>">
                                <div class="form-group">
                                    <label for="title2">제목</label>
                                    <input type="text" class="form-control" id="title2" placeholder="제목" name="title" minlength="5" maxlength="100" value="<%=review.getTitle()%>" required="required">
                                </div>
                                <div class="form-group">
                                    <label for="content2">내용</label>
                                    <textarea type="text" class="form-control" rows="5" id="content2" name="description" placeholder="내용" minlength="5" maxlength="2048" required="required"><%=review.getDescription()%></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="image2">사진 첨부</label>
                                    <input type="file" class="form-control" id="image2" name="input">
                                </div>
                                <br><br>
                                <button type="submit" class="btn btn-primary">등록</button>
                                <a class="btn btn-secondary" onclick="cancel()">취소</a>
                            </form>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <br><br><br><br>
                        <div class="container">
                            <h1>글쓰기 - <%=(type.equals("review")? "여행 후기" : "여행 계획 공유")%></h1>
                            <!-- <form method="post" action="/write" enctype="multipart/form-data"> -->
                            <form method="post" action="/write">
                                <input type="text" class="form-control" id="type" name="type" hidden="hidden" value="<%=type%>">
                                <div class="form-group">
                                    <label for="title">제목</label>
                                    <input type="text" class="form-control" id="title" placeholder="제목" name="title" minlength="5" maxlength="100" required="required">
                                </div>
                                <div class="form-group">
                                    <label for="content">내용</label>
                                    <textarea type="text" class="form-control" rows="5" id="content" name="description" placeholder="내용" minlength="5" maxlength="2048" required="required"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="image">사진 첨부</label>
                                    <input type="file" class="form-control" id="image" name="input">
                                </div>
                                <br><br>
                                <button type="submit" class="btn btn-primary">등록</button>
                                <a class="btn btn-secondary" onclick="cancel()">취소</a>
                            </form>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <jsp:include page="/termproject/include/footer.jsp"></jsp:include>
        </div>
    </body>
    <script type="text/javascript">
        function cancel() {
            if(confirm("작성한 내용이 모두 삭제됩니다.\n정말 돌아가시겠습니까?")) {
                location.href="<%=type%>";
            }
        }
    </script>
</html>
