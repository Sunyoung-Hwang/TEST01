<%@page import="java.sql.*"%>
<%@page import="DBPKG.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	System.out.println("회원가입등록");
	request.setCharacterEncoding("UTF-8");
	String sql ="INSERT INTO member_tbl_02 VALUES(?,?,?,?,?,?,?) ";
	Connection con = DBConnect.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, Integer.parseInt(request.getParameter("custno")));
	pstmt.setString(2,request.getParameter("custname"));
	pstmt.setString(3,request.getParameter("phone"));
	pstmt.setString(4,request.getParameter("address"));
	pstmt.setString(5,request.getParameter("joindate"));
	pstmt.setString(6,request.getParameter("grade"));
	pstmt.setString(7,request.getParameter("city"));
	int updateResult = 0;
	updateResult = pstmt.executeUpdate();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInsert</title>
</head>
<body>
<script type="text/javascript">
<%
if(updateResult >0){
%>
alert("회원가입되었습니다");
location.href="main.jsp";
<%	
}
%>
</script>

</body>
</html>