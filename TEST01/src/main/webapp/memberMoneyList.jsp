<%@page import="java.sql.*"%>
<%@page import="DBPKG.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String sql="SELECT MEM.CUSTNO,MEM.CUSTNAME,MEM.GRADE,MON.TOTALPRICE " +
				"FROM MEMBER_TBL_02 MEM, "+
				"(SELECT CUSTNO, SUM(PRICE)AS TOTALPRICE FROM MONEY_TBL_02 GROUP BY CUSTNO)MON " +
				"WHERE MEM.CUSTNO = MON.CUSTNO ORDER BY MON.TOTALPRICE DESC ";

	Connection con = DBConnect.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberMoneyList</title>
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
	<h2 style="text-align: center;">회원 매출 조회</h2>
	<table>
	<tr>
	<th>회원번호</th>
	<th>회원성명</th>
	<th>고객등급</th>
	<th>매출</th>
	</tr>
	<%while(rs.next()){
		String grade ="";
		if(rs.getString(3).equals("A")){
			grade="VIP";
		}else if(rs.getString(3).equals("B")){
			grade="일반";
		}else if(rs.getString(3).equals("C")){
			grade="직원";
		}
		%>
	<tr>
	<td><%=rs.getInt(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=grade %></td>
	<td><%=rs.getString(4) %></td>
	</tr>
	</table>
	<%} %>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>