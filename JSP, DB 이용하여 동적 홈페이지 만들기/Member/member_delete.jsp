<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 결과</title>
<style>
@font-face {
	font-family: 'Cafe24Shiningstar';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Shiningstar.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

body {
	font-family: Cafe24Shiningstar, serif;
}

table {
	border-collapse: collapse;
}

td {
	border: hidden;
}
</style>
</head>
<body>
<center>
<%
    String id = request.getParameter("id");

    // DB 연결 및 회원 정보 삭제
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/dbMember?serverTimezone=UTC";
    Connection conn = DriverManager.getConnection(url, "Member", "apple");
    Statement stmt = conn.createStatement();
    String strSQL = "DELETE FROM tblmember WHERE id='" + id + "'";
    int result = stmt.executeUpdate(strSQL);

    stmt.close();
    conn.close();

    if (result > 0) {
%>
    <font size='5'><b>회원 탈퇴가 성공적으로 처리되었습니다.</b></font>
    <BR><BR>
    <a href="member_list.jsp">[회원 목록으로 돌아가기]</a>
<%
    } else {
%>
    <font size='5'><b>회원 탈퇴에 실패했습니다.</b></font>
    <BR><BR>
    <a href="member_list.jsp">[회원 목록으로 돌아가기]</a>
<%
    }
%>
</center>
</body>
</html>