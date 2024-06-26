<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
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
<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}
-->
</style>

</head>
<body>
<%
    String userID = (String)session.getAttribute("user");
    if (userID == null) {	
%>
	<center>
	<h1>로그인이 필요합니다.</h1>
	<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
			<TR>
				<TD><hr size='1' noshade></TD>
			</TR>
	</TABLE>
    <a href="login.jsp">[로그인]</a>
</center>
<%
	} 
    else {
%>
<center>
    <font size='6'><b>회원 목록</b></font>
    <table border='1' width=1000' cellpadding='5' cellspacing='0'>
        <tr>
            <th>ID</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>주민등록번호</th>
            <th>주소</th>
            <th>전화번호</th>
            <th>이메일</th>
            <th>수정하기</th>
            <th>탈퇴</th>
        </tr>
    
<%
    // DB 연결 및 회원 정보 조회
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/dbMember?serverTimezone=UTC";
    Connection conn = DriverManager.getConnection(url, "Member", "apple");
    Statement stmt = conn.createStatement();
    String strSQL = "SELECT id, pass, name, CONCAT(juminnum1, '-', juminnum2) as jumin, CONCAT(address1, ' ', address2) as address, phone, email FROM tblmember";
    ResultSet rs = stmt.executeQuery(strSQL);

    // 회원 정보를 테이블 형식으로 출력
    while (rs.next()) {
        String id = rs.getString("id");
        String pass = rs.getString("pass");
        String name = rs.getString("name");
        String jumin = rs.getString("jumin");
        String address = rs.getString("address");
        String phone = rs.getString("phone");
        String email = rs.getString("email");

%>
        <tr>
            <td><%= id %></td>
            <td><%= pass %></td>
            <td><%= name %></td>
            <td><%= jumin %></td>
            <td><%= address %></td>
            <td><%= phone %></td>
            <td><%= email %></td>
            <td><a href="member_update.jsp?id=<%= id %>">수정</a></td>
            <td><a href="member_delete.jsp?id=<%= id %>" onclick="return confirm('정말 탈퇴하시겠습니까?');">탈퇴</a></td>
        </tr>
<%
    }

    rs.close();
    stmt.close();
    conn.close();
%>

    </table>
</center>

<% 
	}
%>
</body>
</html>