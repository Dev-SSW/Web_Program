<%@ page language="java" contentType="text/html;charset=euc-kr" %><HTML>
<HEAD>
<TITLE> �Խ��� </TITLE>
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

<SCRIPT language="JavaScript">
function Check()
{
if (Write.name.value.length < 1) {
	alert("�ۼ��ڸ� �Է��ϼ���.");
	Write.name.focus(); 
        return false;
	}

if (Write.pass.value.length < 1) {
	alert("��й�ȣ�� �Է��ϼ���.");
	Write.pass.focus(); 
	return false;
	}

if (Write.email.value.indexOf("@") + "" == "-1" ||
	Write.email.value.indexOf(".") + "" == "-1" ||
	Write.email.value == "" )
	{ 
		alert("E-mail�� �Է��ϼ���.");
		Write.email.focus();
		return false;
	}

if (Write.title.value.length < 1) {
	alert("�������� �Է��ϼ���.");
	Write.write_title.focus(); 
	return false;
        }

if (Write.contents.value.length < 1) {
	alert("�۳����� �Է��ϼ���.");
	Write.content.focus(); 
	return false;
        }

return true;
}

</SCRIPT>
</HEAD>

<BODY>
<%
    String userID = (String)session.getAttribute("user");
    if (userID == null) {	
%>
	<center>
	<h1>�α����� �ʿ��մϴ�.</h1>
	<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
			<TR>
				<TD><hr size='1' noshade></TD>
			</TR>
	</TABLE>
    <a href="../Member/login.jsp">[�α���]</a>
</center>
<%
	} 
    else {
%>
<center><font size='5'><b> �Խ��� �۾��� </b></font>                   

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<FORM Name='Write' Action='write_input.jsp' Method='post' Enctype='multipart/form-data' OnSubmit='return Check()'>

<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='3'><center><b>�ۼ���</b></center></font> 
		</TD>
		<TD>
			<p><input type='text' size='12' name='name' > * �ʼ�</p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='3'><center><b>��й�ȣ</b></center></font>
		</TD>
		<TD>
			<p><input type='password' size='12' name='pass'> * �ʼ� (�Խù� ���� ������ �ʿ��մϴ�.)</p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>E-mail</b></center></font>
		</TD>
		<TD>
			<font size='3'><input type='text' size='40' maxlength='50' name='email'></font>
		</TD>
	</TR>
	
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='3'><center><b>����</b></center></font>
		</TD>
		<TD>
			<font size='3'><input type='file' name='userFile'></font>
		</TD>
	</TR>
	
	
	<TR>
      		<TD colspan='2'>
         		<hr size='1' noshade>
      		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='3'><center><b>�� ����</b></center></font>
		</TD>
		<TD>
			<font size='3'><input type='text' size='70' maxlength='50' name='title'></font>
		</TD>
	</TR>

	<TR>
		<TD bgcolor='cccccc'>
			<font size='3'><center><b>�� ����</b></center></font>
		</TD>
		<TD>
         		<font size='2'>
         		<textarea cols='70' rows='15' wrap='virtual' name='contents' ></textarea>
         		</font>
      		</TD>
	</TR>

	<TR>
      		<TD colspan='2'>
         		<hr size='1' noshade>
      		</TD>
	</TR>

	<TR>
		<TD align='center' colspan='2' width='100%'>
		<TABLE>
			<TR>
				<TD width='100' align='center'>
					<input Type = 'Reset' Value = '�ٽ� �ۼ�'>
				</TD>
				<TD width='200' align='center'>
					<input Type = 'Submit' Value = '���'>
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
   
</TABLE>

</FORM>
<% 
	}
%>
</BODY>
</HTML>