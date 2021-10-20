<%@ page import="java.sql.SQLException" %>
<%@ page import="term.project.repository.UserRepository" %>
<%@ page import="term.project.domain.User" %>
<%@ page import="term.project.util.FileUtil" %>
<%@ page import="term.project.repository.CommentRepository" %>
<%@ page import="term.project.domain.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="term.project.repository.TravelRootRepository" %>
<%@ page import="term.project.domain.TravelRoot" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>TIME TO TRAVEL - 여행 계획 게시글</title>
</head>
<body>
<%
    String postId = request.getParameter("id");
    String currentPage = request.getParameter("page");
    TravelRootRepository travelRootRepository = new TravelRootRepository();
    UserRepository userRepository = new UserRepository();
    CommentRepository commentRepository = new CommentRepository();

    TravelRoot root = null;
    User author = null;
    User user = null;
    List<Comment> comments = null;

    if (session.getAttribute("user") != null) {
        user = (User) session.getAttribute("user");
    }

    try {
        root = travelRootRepository.getOneById(postId);
        root.plusViewCount();
        travelRootRepository.updateViewCount(root.getPostId(), root.getViewCount());
        comments = commentRepository.getAllByPostId(postId);

        for (Comment comment : comments) {
            User u = userRepository.getOneById(comment.getUserId());
            comment.setUserId(u.getNickname());
        }

        author = userRepository.getOneById(root.getAuthorId());
    } catch (SQLException e) {
    }
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
            <c:otherwise>
                <br><br><br><br>
                <div class="container">
                    <h1>게시글</h1>
                    <div class="form-group">
                        <label for="title">제목</label>
                        <input type="text" class="form-control" id="title" name="title" value="<%=root.getTitle()%>" readonly="readonly">
                    </div>
                    <div class="form-group">
                        <label for="author">작성자</label>
                        <input type="text" class="form-control" id="author" name="author" value="<%=author.getNickname()%>" readonly="readonly">
                    </div>
                    <details>
                        <summary>여행 타입</summary>
                        <%
                            String prefType = author.getPrefType();
                            String prefPreference = author.getPrefPreference();
                            String prefFlight = author.getPrefFlight();
                            String prefRoom = author.getPrefRoom();
                            String plan = author.getPrefPlan();
                            String prefTransport = author.getPrefTransport();
                            String prefMeal = author.getPrefMeal();
                            String prefTendency = author.getPrefTendency();
                            String travelType = root.getTravelType();
                        %>

                        <div class="form-control">
                            <p class="form-label">내가 생각하는 나의 여행 성향은?</p>
                            <div class="btn-group mx-auto d-table" role="group">
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf1" id="prf1_1" value="romantic" autocomplete="off" <% out.print((prefType.equals("romantic")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf1_1">로맨틱 여행자 형</label>
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf1" id="prf1_2" value="relaxed" autocomplete="off" <% out.print((prefType.equals("relaxed")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf1_2">느긋한 휴양자 형</label>
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf1" id="prf1_3" value="explorer" autocomplete="off" <% out.print((prefType.equals("explorer")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf1_3">열혈 탐험가 형</label>
                            </div>
                            <br>
                            <p class="form-label">다음 중 내가 선호하는 여행은?</p>
                            <div class="btn-group mx-auto d-table" role="group">
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf2" id="prf2_1" value="activity" autocomplete="off" <% out.print((prefPreference.equals("activity")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf2_1">액티비티</label>
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf2" id="prf2_2" value="backpacking" autocomplete="off" <% out.print((prefPreference.equals("backpacking")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf2_2">배낭 여행</label>
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf2" id="prf2_3" value="vacation" autocomplete="off" <% out.print((prefPreference.equals("vacation")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf2_3">호캉스</label>
                            </div>
                            <br>
                            <p class="form-label">항공 : 직항 vs 경유</p>
                            <div class="btn-group mx-auto d-table" role="group">
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf3" id="prf3_1" value="direct" autocomplete="off" <% out.print((prefFlight.equals("direct")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf3_1">직항</label>
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf3" id="prf3_2" value="transit" autocomplete="off" <% out.print((prefFlight.equals("transit")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf3_2">경유</label>
                            </div>
                            <br>
                            <p class="form-label">숙박 : 호텔 vs 그 외</p>
                            <div class="btn-group mx-auto d-table" role="group">
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf4" id="prf4_1" value="hotel" autocomplete="off" <% out.print((prefRoom.equals("hotel")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf4_1">호텔</label>
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf4" id="prf4_2" value="others" autocomplete="off" <% out.print((prefRoom.equals("others")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf4_2">그 외</label>
                            </div>
                            <br>
                            <p class="form-label">계획 : 계획적 vs 무계획</p>
                            <div class="btn-group mx-auto d-table" role="group">
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf5" id="prf5_1" value="plan" autocomplete="off" <% out.print((plan.equals("plan")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf5_1">계획적</label>
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf5" id="prf5_2" value="unplan" autocomplete="off" <% out.print((plan.equals("unplan")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf5_2">무계획</label>
                            </div>
                            <br>
                            <p class="form-label">교통 : 택시 vs 대중교통</p>
                            <div class="btn-group mx-auto d-table" role="group">
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf6" id="prf6_1" value="taxi" autocomplete="off" <% out.print((prefTransport.equals("taxi")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf6_1">택시</label>
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf6" id="prf6_2" value="transport" autocomplete="off" <% out.print((prefTransport.equals("transport")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf6_2">대중교통</label>
                            </div>
                            <br>
                            <p class="form-label">식사 : 맛집 vs 상관없음</p>
                            <div class="btn-group mx-auto d-table" role="group">
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf7" id="prf7_1" value="restaurant" autocomplete="off" <% out.print((prefMeal.equals("restaurant")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf7_1">맛집</label>
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf7" id="prf7_2" value="every" autocomplete="off" <% out.print((prefMeal.equals("every")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf7_2">상관없음</label>
                            </div>
                            <br>
                            <p class="form-label">성향 : 관광 vs 휴양</p>
                            <div class="btn-group mx-auto d-table" role="group">
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf8" id="prf8_1" value="tour" autocomplete="off" <% out.print((prefTendency.equals("tour")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf8_1">관광</label>
                                <input onclick="return(false);" type="radio" class="btn-check" name="prf8" id="prf8_2" value="relax" autocomplete="off" <% out.print((prefTendency.equals("relax")) ? "checked" : "");%>>
                                <label class="btn btn-outline-primary" for="prf8_2">휴양</label>
                            </div>
                        </div>

                    </details>
                    <div class="form-group">
                        <label for="title">조회수</label>
                        <input type="text" class="form-control" id="viewCount" name="viewCount" value="<%=root.getViewCount()%>" readonly="readonly">
                    </div>

                    <div class="form-group">
                        <label>여행지</label>
                        <input type="text" class="form-control" name="destination" value="<%=root.getDestination()%>" readonly>
                    </div>
                    <div class="form-group">
                        <label>총 여행일</label>
                        <input type="number" class="form-control" name="day" value="<%=root.getDay()%>" readonly>
                    </div>
                    <div class="form-group">
                        <label>출발일자</label>
                        <input type="date" class="form-control" name="departureDate" value="<%=root.getDepartureDate()%>" readonly>
                    </div>
                    <div class="form-group">
                        <label>도착일자</label>
                        <input type="date" class="form-control" name="arrivalDate" value="<%=root.getArrivalDate()%>" readonly>
                    </div>
                    <div class="form-group">
                        <label>여행 경비 (₩)</label>
                        <input type="number" class="form-control" name="expense" value="<%=root.getExpense()%>" readonly>
                    </div>
                    <div class="form-group">
                        <label>총 인원 (명)</label>
                        <input type="number" class="form-control" name="person" value="<%=root.getPerson()%>" readonly>
                    </div>
                    <label>여행 주제</label>
                    <div class="form-control">
                        <div class="btn-group mx-auto d-table" role="group">
                            <input onclick="return(false);" type="radio" class="btn-check" name="travelType" id="travel_type_0" <% out.print((travelType.equals("normal")) ? "checked" : "");%>>
                            <label class="btn btn-outline-primary" for="travel_type_0">일반 여행</label>
                            <input onclick="return(false);" type="radio" class="btn-check" name="travelType" id="travel_type_1" <% out.print((travelType.equals("activity")) ? "checked" : "");%>>
                            <label class="btn btn-outline-primary" for="travel_type_1">액티비티</label>
                            <input onclick="return(false);" type="radio" class="btn-check" name="travelType" id="travel_type_2" <% out.print((travelType.equals("backpacking")) ? "checked" : "");%>>
                            <label class="btn btn-outline-primary" for="travel_type_2">배낭 여행</label>
                            <input onclick="return(false);" type="radio" class="btn-check" name="travelType" id="travel_type_3" <% out.print((travelType.equals("vacation")) ? "checked" : "");%>>
                            <label class="btn btn-outline-primary" for="travel_type_3">호캉스</label>
                            <input onclick="return(false);" type="radio" class="btn-check" name="travelType" id="travel_type_4" <% out.print((travelType.equals("package")) ? "checked" : "");%>>
                            <label class="btn btn-outline-primary" for="travel_type_4">패키지 여행</label>
                            <input onclick="return(false);" type="radio" class="btn-check" name="travelType" id="travel_type_5" <% out.print((travelType.equals("month")) ? "checked" : "");%>>
                            <label class="btn btn-outline-primary" for="travel_type_5">한달 살기</label>
                            <input onclick="return(false);" type="radio" class="btn-check" name="travelType" id="travel_type_6"<% out.print((travelType.equals("cruise")) ? "checked" : "");%> >
                            <label class="btn btn-outline-primary" for="travel_type_6">선박 여행</label>
                        </div>
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
                        <label for="content">내용</label>
                        <pre class="form-control" id="content" style="overflow: auto"><c:out value="<%=root.getDescription()%>"></c:out></pre>
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
                                            <div class="col-auto">
                                                <small class="font-weight-bold text-primary"><%=user.getNickname()%></small>
                                            </div>
                                            <div class="col-10">
                                                <input type="hidden" name="type" value="travel">
                                                <input type="hidden" name="postId" value="<%=root.getPostId()%>">
                                                <input type="hidden" name="page" value="<%=currentPage%>">
                                                <input type="text" class="form-control" name="comment" placeholder="댓글은 삭제 및 수정이 불가능하니 신중하게 작성해주세요." required="required" minlength="2" maxlength="256">
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
                    <c:choose>
                        <c:when test="${sessionScope != null}">
                            <%
                                pageContext.setAttribute("user", user);
                                pageContext.setAttribute("authorId", root.getAuthorId());
                            %>
                            <c:choose>
                                <c:when test="${user.userId == authorId}">
                                    <a class="btn btn-info" href="/write?type=travel&page=<%=currentPage%>&id=<%=postId%>">수정</a>
                                    <a class="btn btn-warning" onclick="cancel()">삭제</a>
                                </c:when>
                            </c:choose>
                        </c:when>
                    </c:choose>
                    <a class="btn btn-secondary" href="/travel?page=<%=currentPage%>">목록</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
    <jsp:include page="/termproject/include/footer.jsp"></jsp:include>
</div>
</body>
<script type="text/javascript">
    function cancel() {
        if(confirm("게시글을 삭제합니다.\n되돌릴 수 없습니다!")) {
            location.href="travel?id=<%=postId%>&delete=true";
        }
    }
</script>
</html>
