<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String[] img ={"img1.png", "img2.png", "img3.png", "img4.png", "img5.png", "img6.png", "img7.png", "img8.png", "img9.png"};
String[] name = {"폴카독 베이커리 대구 껍질 크런치 스틱", "지위픽 소고기 트릿", "지위픽 램이어 구강간식", "베어랜더랫 요거트", "포틀랜드 펫푸드 습식 토퍼", "더본즈앤코 케피어 산양유", "올박스 파머스니블스", "워프 비프 그린트라이프 동결건조 트릿", "코코테라피 블루베리 트레이닝 트릿"};
String[] price = {"17,850", "9,700", "16,500", "26,000", "11,000", "25,000", "12,900", "10,400", "14,200"};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Insert title here</title>
<style type="text/css">
	a, a:hover{
	color: #000000;
	text-decoration: none;}
</style>
<script type="text/javascript">
 
function fnCart(name, price) {
	//alert("Name : " + name + "\nPrice : " + price);
	if(confirm("장바구니에 담으시겠습니까?")) {
		location.href = "CartPro.jsp?name=" + name + "&price=" + price;
	}
}
 
function fnView() {
	if(confirm("장바구니를 보시겠습니까?")){
		location.href = "CartView.jsp";
	}
}
</script>	
</head>
<body>
<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">Rodin Web Site</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="df.jsp">사료</a></li>
				<li class="active"><a href="snack.jsp">간식</a></li>
				<li><a href="map.jsp">지도</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>

			<%
				//로그인이 되어 있지 않다면
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
		
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
						<li><a href="CartView.jsp">장바구니</a></li>
						<li><a hrtf="myPage.jsp">마이페이지</a></li>
					</ul>
			<%
				}
			%>

		</div>
	</nav>
<div align="center">
	<h2>Delicious Dog Snack</h2><br>
	<table border="1">
		<tr align="right">
			<td colspan="3">
				<input type="button" value="장바구니 보기" onclick="fnView()" />
			</td>
		</tr>
		<%
		for(int i = 0; i < img.length; i++) {
			if(i % 3 == 0) { 
				out.println("<tr align='center'>");
			}
			out.println("<td>");
				out.println("<table>");
					out.println("<tr align='center'>");
						out.println("<td>");
							out.println("<img src = 'snackImg/" + img[i] + "' width='250' height='250' />");
						out.println("</td>");
					out.println("</tr>");
					
					out.println("<tr align='center'>");
						out.println("<td>");
							out.println("<b>" + name[i] + "</b>");
						out.println("</td>");
					out.println("</tr>");
					
					out.println("<tr align='center'>");
						out.println("<td>");
							out.println("<b>￦" + price[i] + "원</b>");
						out.println("</td>");
					out.println("</tr>");
					
					out.println("<tr align='center'>");
						out.println("<td>");
							//한 줄로 쓰기
							//out.println("<input type='button' value='장바구니 담기'onclick='fnCart(\"" + name[i] + "\", \"" + price[i] + "\")' />");
							//두 줄로 쓰기, 닫는 큰 따옴표와 괄호 옆의 띄어쓰기 필수
							out.println("<input type='button' value='장바구니 담기' ");
							out.println("onclick='fnCart(\"" + name[i] + "\", \"" + price[i] + "\")' />");
						out.println("</td>");
					out.println("</tr>");
				out.println("</table>");
			out.println("</td>");
			if(i % 3 == 2) {
				out.println("</tr>");
			}
		}
		%>	
		</table>
		<%@ include file="footer.jsp" %>
</body>
</html>