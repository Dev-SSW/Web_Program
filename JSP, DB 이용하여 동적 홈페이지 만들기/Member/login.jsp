<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
	String userName = (String)session.getAttribute("userName");
    if (userID == null) {	
%>
    <center><font size='6'><b> 로그인 </b></font>   

	<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
		<TR>
			<TD><hr size='1' noshade>
			</TD>
 		</TR>
	</TABLE>
<FORM Name='Member' Method='post' Action='member_ok.jsp'>
	<TABLE align=center width='500' border='0' cellpadding='10' cellspacing='0'>
		<TR>	
			<TD bgcolor='white' align='right'>
				<font size='5'>ID :</font>
			</TD>
			<TD bgcolor='white' align='center'>
				<input type=text maxlength=10 size=10 name=id>
			</TD>
			<TD bgcolor='white'>
				<input Type = 'Submit' value='로그인'>
			</TD>
		</TR>
		<TR>
			<TD bgcolor='white' align='right'>
				<font size='5'>비밀번호 :
			</TD>
			<TD bgcolor='white' align='center'>
				<input type='password' maxlength='10' size='10' name='pass'>
			</TD>
			<TD bgcolor='white'>
				<font size='4'>
					<input Type = 'reset' value='초기화'>
				</font>
			</TD>
		</TR>
	</TABLE>
</FORM>	
<%
	} 
    else {
%>

<center>
	<h1>이미 로그인되셨습니다. <%= userName %>님, 환영합니다!</h1>
	<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
			<TR>
				<TD><hr size='1' noshade></TD>
			</TR>
	</TABLE>
    <a href="logout.jsp">[로그아웃]</a>
</center>
<% 
	}
%>
</body>
</html>