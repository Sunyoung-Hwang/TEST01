<%@page import="java.sql.*"%>
<%@page import="DBPKG.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql = "SELECT CUSTNO,CUSTNAME,PHONE ,ADDRESS ,TO_CHAR(JOINDATE,'YYYY-MM-DD'),GRADE,CITY FROM member_tbl_02";
	Connection con = DBConnect.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberList</title>
<style type="text/css">
table{
margin: 0 auto;
}
table,tr,td,th{
border: 1px black solid;
border-collapse: collapse;

}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="contents">
	<h2 style="text-align: center;">회원목록조회/수정</h2>
	<p>
	<table>
	<tr>
	<th>회원번호</th>
	<th>회원성명</th>
	<th>전화번호</th>
	<th>주소</th>
	<th>가입일자</th>
	<th>고객등급</th>
	<th>거주지역</th>
	</tr>
	<% while(rs.next()){
		String grade = rs.getString(6);
		if(grade.equals("A")){
			grade = "VIP";
		}else if(grade.equals("B")){
			grade = "일반";
		}else if(grade.equals("C")){
			grade = "직원";
		}
		%>
	<tr>
	<td><a href="memberModify.jsp?custno=<%=rs.getInt(1) %>"><%=rs.getInt(1) %></a></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getString(4) %></td>
	<td><%=rs.getDate(5) %></td>
	<td><%=grade %></td>
	<td><%=rs.getString(7) %></td>
	</tr>
	<%} %>
	</table>
	</p>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>