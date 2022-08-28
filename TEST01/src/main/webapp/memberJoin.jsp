<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBPKG.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	
	String sql = "SELECT CUSTNO FROM MEMBER_TBL_02";
	Connection con = DBConnect.getConnection();
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	int custno = 0;
	while(rs.next()){
		custno = rs.getInt(1);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memebrJoin</title>
<style type="text/css">
table{
margin: 0 auto;
}
tr,td,th{
border: 1px black solid;
border-collapse: collapse;

}
</style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="contents">
	<h2 style="text-align: center;">홈쇼핑 회원 등록</h2>
	<form action="memberInsert.jsp" method="post" name="memberJoinForm" onsubmit="return formCheck()";>
	<table >
		<tr>
		<th>회원번호(자동생성)</th>
		<td><input type="text" name="custno" value="<%=custno+1%>"></td>
		</tr>
		<tr>
		<th>회원성명</th>
		<td><input type="text" name="custname"></td>
		</tr>
		<tr>
		<th>회원전화</th>
		<td><input type="text" name="phone"></td>
		</tr>
		<tr>
		<th>회원주소</th>
		<td><input type="text" name="address"></td>
		</tr>
		<tr>
		<th>가입일자</th>
		<td><input type="date" name="joindate"></td>
		</tr>
		<tr>
		<th>고객등급</th>
		<td><input type="text" name="grade"></td>
		</tr>
		<tr>
		<th>도시코드</th>
		<td><input type="text" name="city"></td>
		</tr>
		<tr>
		<th colspan="2">
		<input type="submit" value="등록">
		<input type="button" value="조회" onclick="location.href='memberList.jsp'">
		</th>
		</tr>
	</table>
	</form>
</div>
<jsp:include page="footer.jsp"/>

<script type="text/javascript">
function formCheck() {
	var formData = document.memberJoinForm;
	if(formData.custname.value.length==0){
		alert("회원성명 입력되지 않았습니다.");
		formData.custname.focus();
		return false;
	}
	if(formData.phone.value.length == 0){
		alert("회원전화 입력되지 않았습니다");
		formData.phone.focus();
		return false;
	}
	if(formData.address.value.length == 0){
		alert("주소 입력되지 않았습니다");
		formData.address.focus();
		return false;
	}
	if(formData.joindate.value.length == 0){
		alert("가입일자 입력되지 않았습니다");
		formData.joindate.focus();
		return false;
	}
	if(formData.grade.value.length == 0){
		alert("고객등급 입력되지 않았습니다");
		formData.grade.focus();
		return false;
	}
	if(formData.city.value.length == 0){
		alert("도시코드 입력되지 않았습니다");
		formData.city.focus();
		return false;
	}
	
	return true;
}

</script>
</body>
</html>