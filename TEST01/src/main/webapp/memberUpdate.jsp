<%@page import="java.sql.*"%>
<%@page import="DBPKG.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sql="UPDATE MEMBER_TBL_02 SET CUSTNAME =?,PHONE =?,ADDRESS =?,JOINDATE =?,GRADE =?,CITY =? WHERE CUSTNO=?";
	int updateResult = 0;
	try{
		Connection con = DBConnect.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("custname"));
		pstmt.setString(2, request.getParameter("phone"));
    	pstmt.setString(3, request.getParameter("address"));
    	pstmt.setString(4, request.getParameter("joindate"));
    	pstmt.setString(5, request.getParameter("grade"));
    	pstmt.setString(6, request.getParameter("city"));
    	pstmt.setInt(7, Integer.parseInt(request.getParameter("custno")));
		updateResult = pstmt.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
		
		
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">

<%if(updateResult>0){%>
	alert("수정되었습니다.");
	location.href="memberList.jsp";
<%}else{%>
	alert("수정실패");
	history.back();
<%}%>
</script>
</body>
</html>