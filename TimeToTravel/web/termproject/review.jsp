<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<title>TIME TO TRAVEL - 여행 후기</title>
    </head>
	<body>
		<div class="wrapper">
			<jsp:include page="/termproject/include/header.jsp"></jsp:include>
			<div class="main">
				<div class="container">
					<h1>THIS IS REVIEW PAGE</h1>
					<table class="table table-striped table-hover">
						<thead>
						<tr><th>번호</th><th>제목</th><th>작성자</th><th>날짜</th><th>조회수</th></tr>
						</thead>
						<tbody>
						<tr>
							<td>1</td>
							<td>제에목</td>
							<td>최준규</td>
							<td>2021.10.02</td>
							<td>2</td>
						</tr>

						<tr>
							<td>2</td>
							<td>제에목2</td>
							<td>최준규</td>
							<td>2021.10.02</td>
							<td>1</td>
						</tr>

						<tr>
							<td>3</td>
							<td>제에목3</td>
							<td>최준규</td>
							<td>2021.10.02</td>
							<td>0</td>
						</tr>
						</tbody>
					</table>
					<hr>
					<a class="btn btn-secondary pull-right">글쓰기</a>
					<nav>
						<ul class="pagination justify-content-center">
							<li class="page-item disabled">
								<a class="page-link">Previous</a>
							</li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">4</a></li>
							<li class="page-item"><a class="page-link" href="#">5</a></li>
							<li class="page-item">
								<a class="page-link" href="#">Next</a>
							</li>
						</ul>
					</nav>
				</div>
			</div>
			<jsp:include page="/termproject/include/footer.jsp"></jsp:include>
		</div>
	</body>
</html>
