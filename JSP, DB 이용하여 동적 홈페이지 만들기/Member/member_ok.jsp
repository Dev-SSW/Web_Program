<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 인증</title>
<META http-equiv="Content-Type" content="text/html; charset=euc-kr">
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
<style type='text/css'>
<!--
a:link {
	font-family: "";
	color: black;
	text-decoration: none;
}

a:visited {
	font-family: "";
	color: black;
	text-decoration: none;
}

a:hover {
	font-family: "";
	color: black;
	text-decoration: underline;
}
-->
</style>
<BODY>
	<center>
		<font size='6'><b> 회원 인증 </b></font>
		<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
			<TR>
				<TD><hr size='1' noshade></TD>
			</TR>
		</TABLE>
<%
	String name = null;
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    String sessionID = "yes";  // 세션 정보 초기화
	try{
   		if (id == "" || pass == "") {    // id와 pass를 전송받지 못한 경우
%>
		<TR>
			<TD align='center'><font size='5'>ID와 비밀번호를 입력하세요.</font></TD>
		</TR>s
		<TR>
			<TD align='center'><a href="login.jsp">[로그인]</a></TD>
		</TR>
<%
		} 
   		else {   // id와 pass를 전송 받은 경우
			Class.forName("com.mysql.jdbc.Driver");   // My-SQL DBMS 연결
        	String url = "jdbc:mysql://localhost:3306/dbMember?ServerTimeZone=UTC";  // DB 지정                  
        	Connection conn = DriverManager.getConnection(url,"Member","apple"); 	 
			Statement stmt = conn.createStatement();
			String strSQL = "SELECT * FROM tblmember where id='" + id + "'";
			ResultSet rs = stmt.executeQuery(strSQL);
			rs.next();
			String logid = rs.getString("id");  // DB에 등록된 ID 인출
			String logpass = rs.getString("pass");
			if (!id.equals(logid)){   // id가 불일치 경우  
%>
		<TR>
			<TD align="center"><font size='5'>회원 ID가 아닙니다.</font></TD>
		</TR>
		<TR>
			<TD align="center"><a href="login.jsp">[로그인]</a></TD>
		</TR>
<%
			} 
			else { 
				if (!pass.equals(logpass)){  // pass가 불일치 경우
%>
		<TR>
			<TD align='center'><font size='5'>비밀번호가 일치하지 않습니다.</font></TD>
		</TR>
		<TR>
			<TD align='center'><a href="login.jsp">[로그인]</a></TD>
		</TR>
<%
				} 
				else {   // 로그인 성공 – id와 pass 일치
					name = rs.getString("name");
					session.setAttribute("user",sessionID);  // 재 로그인시 사용 (p.44) member_page.jsp 에서 사용
					session.setAttribute("userName", name);
		    		response.sendRedirect("member_page.jsp"); // 로그인 성공, 메인 이동
				}	
			}	
		}
	} 
    catch(Exception e){  // DB 처리의 오류 발생시
%>
		<TR>
			<TD align="center"><font size='5'>회원 ID가 아닙니다.</font></TD>
		</TR>
		<TR>
			<TD align="center"><a href="login.jsp">[로그인]</a></TD>
		</TR>
<%
	}
%>
	</TABLE>
</BODY>
</HTML>
