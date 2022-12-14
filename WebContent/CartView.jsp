<%@page import="java.text.DecimalFormat"%>
<%@page import="cart.CartDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
ArrayList<CartDTO> cart = null;
 
Object obj = session.getAttribute("cart");	//세션 객체에서 cart 값을 가져온다.
 
if(obj == null) {	//세션 정보가 없으면 배열을 생성 : 주문한 제품이 없다
	cart = new ArrayList<CartDTO>();	
} else {			//세션 정보가 있으면 강제로 캐스팅 : 주문한 제품이 있다
	cart = (ArrayList<CartDTO>) obj;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<style type="text/css">
	a, a:hover{
	color: #000000;
	text-decoration: none;}
</style>
 
<script type="text/javascript">
 
 
function fnPay(){
	alert("결제 기능을 지원하지 않습니다.");
}
 
function fnClear(){
	if(confirm("장바구니를 비우시겠습니까?")) {
		location.href = "CartClear.jsp";	
	}
}
 
function fnGo(){
	location.href = "main.jsp";
}
</script>
</head>
<body>
	<header>
		<%@ include file="header.jsp" %>
	</header>
<div align="center">
	<h2>장바구니 보기</h2><br><br>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>상품이름</th>
			<th>단가</th>
			<th>주문 수량</th>
			<th>가격</th>
		</tr>
<%
		if(cart.size() == 0) {
%>
		<tr align='center'>
			<td colspan= '5'>
				장바구니에 담긴 상품이 없습니다.
				<a href= 'main.jsp'>주문하기</a>
			</td>
		</tr>
<%
		} else {
			int totalSum = 0, total = 0;
			DecimalFormat df = new DecimalFormat("￦#,##0");
			for(int i = 0; i < cart.size(); i++) {
				CartDTO dto = cart.get(i);
		%>
		<tr align= 'center'>
			<td><%=(i + 1) %></td>
			<td><%=dto.getName() %></td>
			<td><%=df.format(dto.getPrice()) %></td>
			<td><%=dto.getCnt() %></td>
			<% 
				total = dto.getPrice() * dto.getCnt();
			%>
			<td><%=df.format(total) %></td>
		</tr>
		<% 
			totalSum += total;
		}
		%>
		<tr align = 'center'>
			<td colspan= '4'>
				<input type='button' value='결제하기' onclick='fnPay()' />
				<input type='button' value='장바구니 비우기' onclick='fnClear()' />
				<input type='button' value='쇼핑 계속하기' onclick='fnGo()' />
			</td>
		<td>
		 <%=df.format(totalSum) %>
		 </td>
			</tr>
		<% 
			}//if else
		%>
	</table>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>