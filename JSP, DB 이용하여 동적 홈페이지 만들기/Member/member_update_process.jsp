<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정 결과</title>
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
    String pass = request.getParameter("pass");
    String name = request.getParameter("name");
    String juminnum1 = request.getParameter("juminnum1");
    String juminnum2 = request.getParameter("juminnum2");
    String address1 = request.getParameter("address1");
    String address2 = request.getParameter("address2");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");

    // DB 연결 및 회원 정보 업데이트
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/dbMember?serverTimezone=UTC";
    Connection conn = DriverManager.getConnection(url, "Member", "apple");
    Statement stmt = conn.createStatement();
    String strSQL = "UPDATE tblmember SET pass='" + pass + "', name='" + name + "', address1='" + address1 + "', address2='" + address2 + "', phone='" + phone + "', email='" + email + "' WHERE id='" + id + "'";
    int result = stmt.executeUpdate(strSQL);

    stmt.close();
    conn.close();

    if (result > 0) {
%>
    <font size='5'><b>회원 정보가 성공적으로 수정되었습니다.</b></font>
    <BR><BR>
    <a href="member_list.jsp">[회원 목록으로 돌아가기]</a>
<%
    } else {
%>
    <font size='5'><b>회원 정보 수정에 실패했습니다.</b></font>
    <BR><BR>
    <a href="member_list.jsp">[회원 목록으로 돌아가기]</a>
<%
    }
%>
</center>
</body>
</html>