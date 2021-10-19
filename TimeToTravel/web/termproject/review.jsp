<%@ page import="term.project.repository.ReviewRepository" %>
<%@ page import="term.project.domain.Review" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="term.project.repository.UserRepository" %>
<%@ page import="term.project.domain.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>TIME TO TRAVEL - 여행 후기</title>
    </head>
	<body>
	<%
		ReviewRepository reviewRepository = new ReviewRepository();
		UserRepository userRepository = new UserRepository();
		Integer currentPage = Integer.parseInt(request.getParameter("page"));
		Integer count = reviewRepository.getAllCount();
	%>
		<div class="wrapper">
			<jsp:include page="/termproject/include/header.jsp"></jsp:include>
			<div class="main">
				<div class="container">
					<br><br><br><br>
					<h1>여행 후기</h1>
					<table class="table table-striped table-hover">
						<thead>
						<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th></tr>
						</thead>
						<tbody>
						<%
							List<Review> reviews = null;
							try {
								reviews = reviewRepository.getAllByPaging(10, currentPage * 10);
							} catch (SQLException e) {
							}
							for (Review review : reviews) {
								out.println("<tr>");
								out.println("<td width=5% style='word-break:break-all'>"+review.getPostNum()+"</td>");
								out.println("<td width=58% style='word-break:break-all'><a href='/review?page=" + currentPage + "&id="+ review.getPostId() + "'>" + review.getTitle()+"</a></td>");
								User user = null;
								try {
									user = userRepository.getOneById(review.getAuthorId());
								} catch (SQLException e) {
								}
								out.println("<td width=10% style='word-break:break-all'>"+user.getNickname()+"</td>");
								out.println("<td width=20% style='word-break:break-all'>"+review.getCreatedAt().toString()+"</td>");
								out.println("<td width=7% style='word-break:break-all'>"+review.getViewCount()+"</td>");
								out.println("</tr>");
							}

						%>
						</tbody>
					</table>
					<hr>
					<a href="/review?id="></a>
					<c:choose>
						<c:when test="${sessionScope.user != null}">
						<a class="btn btn-secondary pull-right" href="/write?type=review">글쓰기</a>
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
										out.println("<li class='page-item'><a class='page-link' href='/review?page=" + (startPage - pageBlock) + "'>Previous</a></li>");
									} else {
										out.println("<li class='page-item disabled'><a class='page-link'>Previous</a></li>");
									}

									for (int i = startPage; i < endPage; i++) {
										if (i == currentPage) {
											out.println("<li class='page-item disabled'><a class='page-link'>" + i + "</a></li>");
										} else {
											out.println("<li class='page-item'><a class='page-link' href='/review?page=" + i + "'>" + i + "</a></li>");
										}
									}

									if (endPage < pageCount) {
										out.println("<li class='page-item'><a class='page-link' href='/review?page=" + (startPage + pageBlock) + "'>Next</a></li>");
									} else {
										out.println("<li class='page-item disabled'><a class='page-link'>Next</a></li>");
									}

								}
							%>
						</ul>
					</nav>
				</div>
			</div>
			<jsp:include page="/termproject/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>
