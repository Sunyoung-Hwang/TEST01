<%@page import="java.sql.*"%>
<%@page import="DBPKG.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql ="SELECT CUSTNO,CUSTNAME,PHONE ,ADDRESS ,TO_CHAR(JOINDATE,'YYYY-MM-DD'),GRADE,CITY FROM member_tbl_02 WHERE CUSTNO=?";
	Connection con = DBConnect.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("custno"));
	ResultSet rs = pstmt.executeQuery();
	int custno =0;
	String custname ="";
	String phone ="";
	String address ="";
	String joindate ="";
	String grade ="";
	String city ="";
	if(rs.next()){
		custno = rs.getInt(1);
		custname = rs.getString(2);
		phone = rs.getString(3);
		address = rs.getString(4);
		joindate = rs.getString(5);
		grade = rs.getString(6);
		city = rs.getString(7);
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberModify</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="contents">
	<h2 style="text-align: center;">회원정보수정</h2>
	<form action="memberUpdate.jsp" method="post" name="memberModifyForm">
	<table >
		<tr>
		<th>회원번호(자동생성)</th>
		<td><input type="text" name="custno" value="<%=custno%>"></td>
		</tr>
		<tr>
		<th>회원성명</th>
		<td><input type="text" name="custname" value="<%=custname%>"></td>
		</tr>
		<tr>
		<th>회원전화</th>
		<td><input type="text" name="phone" value="<%=phone%>"></td>
		</tr>
		<tr>
		<th>회원주소</th>
		<td><input type="text" name="address" value="<%=address%>"></td>
		</tr>
		<tr>
		<th>가입일자</th>
		<td><input type="date" name="joindate" value="<%=joindate%>"></td>
		</tr>
		<tr>
		<th>고객등급</th>
		<td><input type="text" name="grade" value="<%=grade%>"></td>
		</tr>
		<tr>
		<th>도시코드</th>
		<td><input type="text" name="city" value="<%=city%>"></td>
		</tr>
		<tr>
		<th colspan="2">
		<input type="submit" value="수정">
		<input type="button" value="조회" onclick="location.href='memberList.jsp'">
		</th>
		</tr>
	</table>
	</form>
</div>
<jsp:include page="footer.jsp"/>

</body>
</html>