<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Rodin login</title>
</head>
<body>
	<header>
		<%@ include file="header.jsp" %>
	</header>

	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
				<!--  홀수와 짝수로 색상이 변경됨 -->
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<!-- thead : 테이블의 제목부분 각각의 속성들을 알려주는 역할을 합니다. -->
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
						</tr>

						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>

					</tbody>

				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">

			</form>
		</div>
	</div>	



	


	<%@ include file="footer.jsp" %>
	<script src="https://code.jquery.com/jquery-1.11.3.js"
		integrity="sha256-IGWuzKD7mwVnNY01LtXxq3L84Tm/RJtNCYBfXZw3Je0="
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>
</body>
</html>