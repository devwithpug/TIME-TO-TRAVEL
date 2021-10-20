<%@ page import="term.project.repository.TravelRootRepository" %>
<%@ page import="term.project.repository.UserRepository" %>
<%@ page import="term.project.domain.TravelRoot" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="term.project.domain.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>TIME TO TRAVEL - 여행 계획</title>
    </head>
	<body>
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
						<%
							TravelRootRepository travelRootRepository = new TravelRootRepository();
							UserRepository userRepository = new UserRepository();
							Integer currentPage = Integer.parseInt(request.getParameter("page"));
							Integer count = travelRootRepository.getAllCount();
						%>
						<div class="container">
							<br><br><br><br>
							<h1>여행 계획</h1>
							<table class="table table-striped table-hover">
								<thead>
								<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th></tr>
								</thead>
								<tbody>
								<%
									List<TravelRoot> roots = null;
									try {
										roots = travelRootRepository.getAllByPaging(10, currentPage * 10);
									} catch (SQLException e) {
									}
									for (TravelRoot root : roots) {
										out.println("<tr>");
										out.println("<td width=5% style='word-break:break-all'>"+root.getPostNum()+"</td>");
										out.println("<td width=58% style='word-break:break-all'><a href='/travel?page=" + currentPage + "&id="+ root.getPostId() + "'>" + root.getTitle()+"</a></td>");
										User user = null;
										try {
											user = userRepository.getOneById(root.getAuthorId());
										} catch (SQLException e) {
										}
										out.println("<td width=10% style='word-break:break-all'>"+user.getNickname()+"</td>");
										out.println("<td width=20% style='word-break:break-all'>"+root.getCreatedAt().toString()+"</td>");
										out.println("<td width=7% style='word-break:break-all'>"+root.getViewCount()+"</td>");
										out.println("</tr>");
									}

								%>
								</tbody>
							</table>
							<hr>
							<a href="/travel?id="></a>
							<c:choose>
								<c:when test="${sessionScope.user != null}">
									<a class="btn btn-secondary pull-right" href="/write?type=travel">글쓰기</a>
								</c:when>
							</c:choose>
							<nav>
								<ul class="pagination justify-content-center">
									<%
										if (count > 0) {
											Integer pageBlock = 5;
											Integer pageCount = count / 10 + (count % 10 == 0 ? 0 : 1);
											Integer startPage = (currentPage / pageBlock) * pageBlock;
											Integer endPage = startPage + pageBlock;

											if (endPage > pageCount) {
												endPage = pageCount;
											}

											if (startPage >= pageBlock) {
												out.println("<li class='page-item'><a class='page-link' href='/travel?page=" + (startPage - pageBlock) + "'>Previous</a></li>");
											} else {
												out.println("<li class='page-item disabled'><a class='page-link'>Previous</a></li>");
											}

											for (int i = startPage; i < endPage; i++) {
												if (i == currentPage) {
													out.println("<li class='page-item disabled'><a class='page-link'>" + i + "</a></li>");
												} else {
													out.println("<li class='page-item'><a class='page-link' href='/travel?page=" + i + "'>" + i + "</a></li>");
												}
											}

											if (endPage < pageCount) {
												out.println("<li class='page-item'><a class='page-link' href='/travel?page=" + (startPage + pageBlock) + "'>Next</a></li>");
											} else {
												out.println("<li class='page-item disabled'><a class='page-link'>Next</a></li>");
											}

										}
									%>
								</ul>
							</nav>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			<jsp:include page="/termproject/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>
