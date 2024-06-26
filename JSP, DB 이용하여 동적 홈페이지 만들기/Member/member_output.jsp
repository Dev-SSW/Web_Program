<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 회원 등록 성공 </title>
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
<% // member_input.jsp에서 전달받은 회원정보
   String id = request.getParameter("id");
   String pass = request.getParameter("pass"); 
   String name = request.getParameter("name");
   String juminnum1 = request.getParameter("juminnum1");
   String juminnum2 = request.getParameter("juminnum2");
   // String zip = request.getParameter("zip");
   String address1 = request.getParameter("address1");
   String address2 = request.getParameter("address2");
   String phone = request.getParameter("phone");
   String email = request.getParameter("email");
   String check_ok = "yes"; // 수신 항목 확인, 중간 URL 접근 해킹 방지

   	if (id == "")
   		check_ok = "no";   // 중간 URL로 해킹으로 접근한 경우는 id가 null임 (해킹경우)
   	if (pass == "")
   		check_ok = "no";
   	if (name == "")
   		check_ok = "no";
   	if (juminnum1 == "")
   		check_ok = "no";
   	if (juminnum2 == "")
   		check_ok="no";

    Class.forName("com.mysql.jdbc.Driver");   // My-SQL DBMS 연결
    String url = "jdbc:mysql://localhost:3306/dbMember?ServerTimeZone=UTC";   // DB 지정
    Connection conn = DriverManager.getConnection(url,"Member","apple"); 	

   	Statement stmt = conn.createStatement();
   	String strSQL = "SELECT id FROM tblmember where id='" + id + "'";   // ID 중복여부 재 확인
   	ResultSet rs = stmt.executeQuery(strSQL);

   	if (!rs.next()) 
   		check_ok="yes"; // 고객이 입력한 ID가 DB에 없음  DB에 회원 등록 처리 대상
   	else
   		check_ok="no";  // 찾는 id가 DB에 중복되는 경우
   	if (check_ok == "yes"){    // 중복 ID 아니고, 중간 해킹이 아닌 경우  신규 회원 DB 저장
   		strSQL = "INSERT INTO tblmember(id,pass,name,juminnum1,juminnum2,address1,address2,phone,email)";
   		strSQL = strSQL +  "VALUES('" + id + "', '" + pass + "', '" + name + "', '" + juminnum1 + "',";
   		strSQL = strSQL +  "'" + juminnum2 + "', '" + address1 + "',"; 
        strSQL = strSQL +  "'" + address2 + "', '" + phone + "', '" + email + "')";
   		stmt.executeUpdate(strSQL);
%>

<body>
	<center>
		<font size='6'><b> 회원 가입 성공 </b></font>  
	<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
		<TR>
			<TD><hr size='1' noshade>
			</TD> 	
		</TR>
	</TABLE>
	<TABLE cellSpacing='0' cellPadding='10' align='center' border='0'>
		<TR>
			<TD align='center'>
				<font size='5'>회원 가입을 축하합니다.<BR>로그인 하세요.</font>
			</TD>
		</TR>
		<TR>
			<TD align='center'>
				<font size='5'><a href="login.jsp">[로그인]</a></font>
			</TD>
		</TR>
	</TABLE>
</BODY>
</HTML>

<%
	} 
   	else {   // 회원 가입 DB 저장 실패 경우
%>
<HTML>
<HEAD>
	<TITLE> 회원 가입 실패 </TITLE> 
</HEAD>
<BODY>
	<center><font size='6'><b> 회원 가입 실패 </b></font>
		<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
			<TR>	
				<TD>
					<hr size='1' noshade>
				</TD>
 			</TR>
		</TABLE>
		<TABLE cellSpacing='0' cellPadding='10' align='center' border='0'>
			<TR>	
				<TD align='center'>
					<font size='5'>회원 가입에 실패 했습니다. <BR>다시 가입서를 작성해주세요.</font>	
				</TD>
				</TR>
			<TR>
				<TD align='center'>
					<font size='5'><a href="member_input.jsp">[가입서 작성]</a></font>
				</TD>
			</TR>
		</TABLE>
</BODY>
</HTML>
<%
	}  
	stmt.close();   
	conn.close();
%>
