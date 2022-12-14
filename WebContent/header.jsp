<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header>
	<!--  로그인이 된 사람은 로그인정보를 담을 수 있도록 만들어 주겠습니다. -->
	<%
		String userID = null;
		String adminYn = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			adminYn = (String) session.getAttribute("adminYn");
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
			<a class="navbar-brand" href="index.jsp">ForMyPets</a>
		</div>
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">메인</a></li>
				<li><a href="df.jsp">사료 구매</a></li>
				<li><a href="snack.jsp">간식 구매</a></li>
				<li><a href="map.jsp">지도</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
			</ul>

			<%
				//로그인이 되어 있지 않다면
				if (userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
						<li><a href="login.do">로그인</a></li>
						<li><a href="join.do">회원가입</a></li>
					</ul>
		
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
						<li><a href="logout.do">로그아웃</a></li>
						<li><a href="CartView.jsp">장바구니</a></li>
						<%
							if( adminYn == "Y"){
						%>
							<li><a href="adminPage.jsp">회원관리</a></li>
						<%
							}
						%>		
						<li><a hrtf="myPage.jsp">마이페이지</a></li>
					</ul>
			<%
				}
			%>

		</div>
	</nav>
</header>