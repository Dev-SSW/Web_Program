<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 전용</title>
</head>
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

<BODY>
	<center>
		<font size='6'><b> 회원 전용 페이지 </b></font>

		<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
			<TR>
				<TD><hr size='1' noshade></TD>
			</TR>
		</TABLE>
		<TABLE cellSpacing='0' cellPadding='30' align='center' border='0'>
<%
	try {
		String strUser = "yes";
		String strSession = session.getAttribute("user").toString(); // url 중간 해킹 접근시 방지
		if (!strUser.equals(strSession)) {
%>
			<TR>
				<TD align='center'><font size='5'>로그인 하세요.</font></TD>
			</TR>
			<TR>
				<TD align='center'><a href="login.jsp">[로그인]</a></TD>
			</TR>
<%
		}
		else { //
%>
			<TR>
				<TD align='center'><font size='5'>로그인되셨습니다. 환영합니다!</font></TD>
			</TR>

<%
		}
	} 
	catch (NullPointerException e) { // dbms 수행 오류 발생시
%>
			<TR>
				<TD align='center'><font size='5'>로그인 하세요.</font></TD>
			</TR>
			<TR>
				<TD align='center'><a href="login.jsp">[로그인]</a></TD>
			</TR>
<%
	}
%>
		</TABLE>
</BODY>
</HTML>
