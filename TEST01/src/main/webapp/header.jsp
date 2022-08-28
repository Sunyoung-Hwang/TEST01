<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
ul{
list-style: none;
width: 100%;
position: fixed;
top: 50px; height: 40px; margin: 0px;
line-height: 40px;
text-align: center;
background-color: skyblue;
}
li{
display: inline-block;
}
.contents{
background-color:lightgrey;
height:100%;
width: 100%;
position: fixed;
top: 100px;
}
</style>
</head>
<body>
<header style=" margin: 0px; position: fixed; background-color: pink; top: 0px; height: 50px; text-align: center; line-height: 50px; width: 100%">
쇼핑몰 회원관리 ver 1.0
</header>
<nav>
	<ul>
	<li><a href="memberJoin.jsp">회원등록</a></li>
	<li><a href="memberList.jsp">회원목록조회/수정</a></li>
	<li><a href="memberMoneyList.jsp">회원매출조회</a></li>
	<li><a href="main.jsp">홈으로</a></li>
	</ul>
</nav>
</body>
</html>