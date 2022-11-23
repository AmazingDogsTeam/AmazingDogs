<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/footer.css">
<title>Rodin login</title>
	<style>
			img { display: block; margin: 0px auto; }
	</style>
</head>
<body>
	<header>
		<%@ include file="header.jsp" %>
	</header>
	
	<!-- 일반적으로 웹사이트를 소개하는 영역이 있는데 부트스랩에서 jumbotron이라고 사용을 합니다. -->
	<div class="container">
		<div class="jumbotron">
			<div class="container">
				<h3>내 아이들에게 좋은것만 선물해주세요 !</h3>
				<p> 좋은 성분의 제품만을 보여드리는 저희 웹페이지에 오신 것을 환영합니다. </p>
				<!-- 보통 웹페이지에 버튼이 하나씩 있는게 이뻐서 하나 넣어보았습니다. -->
				<p><a class="btn btn-primary btn-pull" href="#" role="button">좋은 성분 제품 보러가기</a></p>
			</div>
		</div>
	</div>
	
	<!-- carousel은 사진첩 같은거라고 생각 하시면 됩니다. -->
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			
			
		<!-- <div class="carousel-inner"> 이게 있으면 사진 슬라이드가 되는데 사진 크기 조정이 안되는데요,, -->
			<div class="carousel-inner">
				<div class="item active" > <!-- active 현재 선택 -->
					<img src="img/1.png" width="500px;" height="auto;" />
				</div>
				<div class="item">
					<img src="img/2.jpg" width="500px;" height="auto;"/>
				</div>
				<div class="item">
					<img src="img/3.jpg" width="500px;" height="auto;"/>
				</div>
			</div>
			
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
			<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
			<span class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<br> <br> <!-- 유튜브 -->
			<p align="middle">
			<iframe width="1100" height="500" 
			src="https://www.youtube.com/embed/EoCHFUIT14Q" title="YouTube video player" 
			frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
			allowfullscreen></iframe>
			</p>
	
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