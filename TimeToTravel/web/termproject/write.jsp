<%@ page import="term.project.repository.ReviewRepository" %>
<%@ page import="term.project.domain.Review" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="term.project.util.FileUtil" %>
<%@ page import="term.project.repository.TravelRootRepository" %>
<%@ page import="term.project.domain.TravelRoot" %>
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
                        <br><br><br><br>
                        <div class="container">
                            <h1>글쓰기 (수정) - <%=(type.equals("review")? "여행 후기" : "여행 계획")%></h1>
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
                                    <form method="post" action="/write?page=<%=currentPage%>" enctype="multipart/form-data">
                                        <input type="text" class="form-control" name="type" hidden="hidden" value="<%=type%>">
                                        <input type="text" class="form-control" name="postId" hidden="hidden" value="<%=id%>">
                                        <div class="form-group">
                                            <label>제목</label>
                                            <input type="text" class="form-control" placeholder="제목" name="title" minlength="5" maxlength="100" value="<%=review.getTitle()%>" required="required">
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
                                            <label>내용</label>
                                            <textarea type="text" class="form-control" rows="5" name="description" placeholder="내용" minlength="5" maxlength="2048" required="required"><%=review.getDescription()%></textarea>
                                        </div>
                                        <br><br>
                                        <button type="submit" class="btn btn-primary">등록</button>
                                        <a class="btn btn-secondary" onclick="cancel('<%=currentPage%>', '<%=review.getPostId()%>')">취소</a>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <%
                                        TravelRootRepository travelRootRepository = new TravelRootRepository();
                                        TravelRoot root = null;
                                        try {
                                            root = travelRootRepository.getOneById(id);
                                        } catch (SQLException e) {
                                        }
                                        String travelType = root.getTravelType();
                                    %>
                                    <form method="post" action="/write?page=<%=currentPage%>" enctype="multipart/form-data">
                                        <input type="text" class="form-control" name="type" hidden="hidden" value="<%=type%>">
                                        <input type="text" class="form-control" name="postId" hidden="hidden" value="<%=id%>">
                                        <div class="form-group">
                                            <label>제목</label>
                                            <input type="text" class="form-control" placeholder="제목" name="title" minlength="5" maxlength="100" value="<%=root.getTitle()%>" required="required">
                                        </div>
                                        <c:choose>
                                            <c:when test="<%=root.getFileName() != null%>">
                                                <div class="form-group">
                                                    <details>
                                                        <summary>첨부 사진</summary>
                                                        <img class="form-control" src="<%=FileUtil.getImageDir() + "/" + root.getFileName()%>">
                                                    </details>
                                                </div>
                                            </c:when>
                                        </c:choose>
                                        <div class="form-group">
                                            <label>여행지</label>
                                            <input type="text" class="form-control" placeholder="ex) 국내여행, 뉴욕, 동유럽" value="<%=root.getDestination()%>" name="destination" minlength="1" maxlength="50" required="required">
                                        </div>
                                        <div class="form-group">
                                            <label>총 여행일</label>
                                            <input type="number" class="form-control" value="<%=root.getDay()%>" name="day" min="1" max="365" required="required">
                                        </div>
                                        <div class="form-group">
                                            <label>출발일자</label>
                                            <input type="date" class="form-control" value="<%=root.getDepartureDate()%>" name="departureDate" required="required">
                                        </div>
                                        <div class="form-group">
                                            <label>도착일자</label>
                                            <input type="date" class="form-control" value="<%=root.getArrivalDate()%>" name="arrivalDate" required="required">
                                        </div>
                                        <div class="form-group">
                                            <label>여행 경비 (₩)</label>
                                            <input type="number" class="form-control" value="<%=root.getExpense()%>" placeholder="ex) 1000000 (₩)" name="expense" min="1000" max="1000000000" required="required">
                                        </div>
                                        <div class="form-group">
                                            <label>총 인원 (명)</label>
                                            <input type="number" class="form-control" value="<%=root.getPerson()%>" placeholder="ex) 4 (명)" name="person" min="1" max="100" required="required">
                                        </div>
                                        <div class="form-group">
                                            <label>여행 주제</label>
                                            <div class="btn-group mx-auto d-table" role="group">
                                                <input type="radio" class="btn-check" name="travelType" id="modify_travel_type_0" value="normal" autocomplete="off" required <% out.print((travelType.equals("normal")) ? "checked" : "");%>>
                                                <label class="btn btn-outline-primary" for="modify_travel_type_0">일반 여행</label>
                                                <input type="radio" class="btn-check" name="travelType" id="modify_travel_type_1" value="activity" autocomplete="off" <% out.print((travelType.equals("activity")) ? "checked" : "");%>>
                                                <label class="btn btn-outline-primary" for="modify_travel_type_1">액티비티</label>
                                                <input type="radio" class="btn-check" name="travelType" id="modify_travel_type_2" value="backpacking" autocomplete="off" <% out.print((travelType.equals("backpacking")) ? "checked" : "");%>>
                                                <label class="btn btn-outline-primary" for="modify_travel_type_2">배낭 여행</label>
                                                <input type="radio" class="btn-check" name="travelType" id="modify_travel_type_3" value="vacation" autocomplete="off" <% out.print((travelType.equals("vacation")) ? "checked" : "");%>>
                                                <label class="btn btn-outline-primary" for="modify_travel_type_3">호캉스</label>
                                                <input type="radio" class="btn-check" name="travelType" id="modify_travel_type_4" value="package" autocomplete="off" <% out.print((travelType.equals("package")) ? "checked" : "");%>>
                                                <label class="btn btn-outline-primary" for="modify_travel_type_4">패키지 여행</label>
                                                <input type="radio" class="btn-check" name="travelType" id="modify_travel_type_5" value="month" autocomplete="off" <% out.print((travelType.equals("month")) ? "checked" : "");%>>
                                                <label class="btn btn-outline-primary" for="modify_travel_type_5">한달 살기</label>
                                                <input type="radio" class="btn-check" name="travelType" id="modify_travel_type_6" value="cruise" autocomplete="off" <% out.print((travelType.equals("cruise")) ? "checked" : "");%>>
                                                <label class="btn btn-outline-primary" for="modify_travel_type_6">선박 여행</label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>내용</label>
                                            <textarea type="text" class="form-control" rows="5" name="description" placeholder="내용" minlength="5" maxlength="2048" required="required"><%=root.getDescription()%></textarea>
                                        </div>
                                        <br><br>
                                        <button type="submit" class="btn btn-primary">등록</button>
                                        <a class="btn btn-secondary" onclick="cancel('<%=currentPage%>', '<%=root.getPostId()%>')">취소</a>
                                    </form>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:when>
                    <c:when test='<%=type.equals("review")%>'>
                        <br><br><br><br>
                        <div class="container">
                            <h1>글쓰기 - 여행 후기</h1>
                            <form method="post" action="/write" enctype="multipart/form-data" data="multipart">
                                <input type="text" class="form-control" name="type" hidden="hidden" value="<%=type%>">
                                <input type="text" class="form-control" name="path" hidden="hidden" value="<%=application.getRealPath("images")%>">
                                <div class="form-group">
                                    <label>제목</label>
                                    <input type="text" class="form-control" placeholder="제목" name="title" minlength="5" maxlength="100" required="required">
                                </div>
                                <div class="form-group">
                                    <label>내용</label>
                                    <textarea type="text" class="form-control" rows="5" name="description" placeholder="내용" minlength="5" maxlength="2048" required="required"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>사진 첨부</label>
                                    <input type="file" class="form-control" name="input">
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
                            <h1>글쓰기 - 여행 계획</h1>
                            <form method="post" action="/write" enctype="multipart/form-data" data="multipart">
                                <input type="text" class="form-control" name="type" hidden="hidden" value="<%=type%>">
                                <input type="text" class="form-control" name="path" hidden="hidden" value="<%=application.getRealPath("images")%>">
                                <div class="form-group">
                                    <label>제목</label>
                                    <input type="text" class="form-control" placeholder="제목" name="title" minlength="5" maxlength="100" required="required">
                                </div>
                                <div class="form-group">
                                    <label>여행지</label>
                                    <input type="text" class="form-control" placeholder="ex) 국내여행, 뉴욕, 동유럽" name="destination" minlength="1" maxlength="50" required="required">
                                </div>
                                <div class="form-group">
                                    <label>총 여행일</label>
                                    <input type="number" class="form-control" name="day" min="1" max="365" required="required">
                                </div>
                                <div class="form-group">
                                    <label>출발일자</label>
                                    <input type="date" class="form-control" name="departureDate" required="required">
                                </div>
                                <div class="form-group">
                                    <label>도착일자</label>
                                    <input type="date" class="form-control" name="arrivalDate" required="required">
                                </div>
                                <div class="form-group">
                                    <label>여행 경비 (₩)</label>
                                    <input type="number" class="form-control" placeholder="ex) 1000000 (₩)" name="expense" min="1000" max="1000000000" required="required">
                                </div>
                                <div class="form-group">
                                    <label>총 인원 (명)</label>
                                    <input type="number" class="form-control" placeholder="ex) 4 (명)" name="person" min="1" max="100" required="required">
                                </div>
                                <div class="form-group">
                                    <label>여행 주제</label>
                                    <div class="btn-group mx-auto d-table" role="group">
                                        <input type="radio" class="btn-check" name="travelType" id="travel_type_0" value="normal" autocomplete="off" required>
                                        <label class="btn btn-outline-primary" for="travel_type_0">일반 여행</label>
                                        <input type="radio" class="btn-check" name="travelType" id="travel_type_1" value="activity" autocomplete="off">
                                        <label class="btn btn-outline-primary" for="travel_type_1">액티비티</label>
                                        <input type="radio" class="btn-check" name="travelType" id="travel_type_2" value="backpacking" autocomplete="off">
                                        <label class="btn btn-outline-primary" for="travel_type_2">배낭 여행</label>
                                        <input type="radio" class="btn-check" name="travelType" id="travel_type_3" value="vacation" autocomplete="off">
                                        <label class="btn btn-outline-primary" for="travel_type_3">호캉스</label>
                                        <input type="radio" class="btn-check" name="travelType" id="travel_type_4" value="package" autocomplete="off">
                                        <label class="btn btn-outline-primary" for="travel_type_4">패키지 여행</label>
                                        <input type="radio" class="btn-check" name="travelType" id="travel_type_5" value="month" autocomplete="off">
                                        <label class="btn btn-outline-primary" for="travel_type_5">한달 살기</label>
                                        <input type="radio" class="btn-check" name="travelType" id="travel_type_6" value="cruise" autocomplete="off">
                                        <label class="btn btn-outline-primary" for="travel_type_6">선박 여행</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>내용</label>
                                    <textarea type="text" class="form-control" rows="5" name="description" placeholder="내용" minlength="5" maxlength="2048" required="required"></textarea>
                                </div>
                                <div class="form-group">
                                    <label>사진 첨부</label>
                                    <input type="file" class="form-control" name="input">
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
        function cancel(page, postId) {

            if(confirm("작성한 내용이 모두 삭제됩니다.\n정말 돌아가시겠습니까?")) {
                if (page != null && postId != null) {
                    location.href="<%=type%>?page=" + page + "&id=" + postId;
                } else {
                    location.href="<%=type%>?page=0";
                }
            }
        }
    </script>
</html>
