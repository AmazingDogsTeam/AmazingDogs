<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.BbsDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>bbs</title>
<style type="text/css">
	a, a:hover{
	color: #000000;
	text-decoration: none;}
</style>
</head>
<body>
	<header>
		<%@ include file="header.jsp" %>
	</header>
	<%
			//1은 기본 페이지를 의미하고 현재 몇번째 페이지인지 알려주기 위함
			int pageNumber = 1;
			if (request.getParameter("pageNumber") != null) {
		// 파라미터는 모두 정수형으로 바꿔주는 pareInt란 함수를 이용해야 합니다.
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}
	%>
	<div class="container">
		<div class="row">
			<!--  홀수와 짝수로 색상이 변경됨 -->
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<!-- thead : 테이블의 제목부분 각각의 속성들을 알려주는 역할을 합니다. -->
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
		
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>안뇬</td>
						<td>헤헤</td>
						<td>2022-04-07</td>
					
					</tr>
					<%

						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<BbsDTO> list = bbsDAO.getList(pageNumber);
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getBbsID() %></td>
						<!-- 글 제목을 선택하면 상세 내용으로 이동 -->
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID() %>"> <%=list.get(i).getBbsTitle() %></a></td>
						<td><%=list.get(i).getUserID() %></td>
						<td><%=list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13)+"시"+list.get(i).getBbsDate().substring(14, 16)+"분" %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<%
				if(pageNumber != 1){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				}if(bbsDAO.nextPage(pageNumber + 1)){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1 %>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
			
			<!-- 회원만넘어가도록 -->
			<%
			//if logined userID라는 변수에 해당 아이디가 담기고 if not null
				if (session.getAttribute("userID") != null) {
			%>
				<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
			<%
				} else {
			%>
				<button class="btn btn-primary pull-right" onclick="if(confirm('로그인 하세요'))location.href='login.jsp';" type="button" >글쓰기</button>
			<% 
				}
			%>		



		</div>

	</div>
				
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-1.11.3.js"
		integrity="sha256-IGWuzKD7mwVnNY01LtXxq3L84Tm/RJtNCYBfXZw3Je0="
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
		integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
		crossorigin="anonymous"></script>
		<%@ include file="footer.jsp" %>
</body>
</html>