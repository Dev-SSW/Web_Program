<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>
<TITLE> �Խ��� </TITLE>

<SCRIPT language="JavaScript">
function Check()
{
if (Form.keyword.value.length < 1) {
	alert("�˻�� �Է��ϼ���.");
	Form.keyword.focus(); 
         return false;
	}
}
</SCRIPT>
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
<%
String key = request.getParameter("key");
String keyword = request.getParameter("keyword");

String pageNum = request.getParameter("pageNum");
if(pageNum == null){
	pageNum = "1";	
}

int listSize = 5;
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * listSize + 1;
int endRow = currentPage * listSize;
int lastRow = 0;
int i = 0;
String strSQL = "";

Class.forName("com.mysql.jdbc.Driver");

String url = "jdbc:mysql://localhost:3306/dbMember?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
Connection conn = DriverManager.getConnection(url,"Member","apple");

Statement stmt = conn.createStatement();
ResultSet rs = null;

if (key==null || keyword==null){
	strSQL = "SELECT count(*) FROM tblboard";
}else{
	strSQL = "SELECT count(*) FROM tblboard WHERE " + key + " like '%" + keyword + "%'";
}
rs = stmt.executeQuery(strSQL);
rs.next();
lastRow = rs.getInt(1);

rs.close();
%>

<center><font size='5'><b> �Խ��� </b></font></TD>
                                    
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>              
                    
<TABLE border='0' cellspacing=1 cellpadding=2 width='600'>      

	<TR bgcolor='cccccc'>      
		<TD><font size=3><center><b>��ȣ</b></center></font></TD>      
		<TD><font size=3><center><b>�� ����</b></center></font></TD>      
		<TD><font size=3><center><b>�ۼ���</b></center></font></TD>      
		<TD><font size=3><center><b>�ۼ���</b></center></font></TD>      
		<TD><font size=3><center><b>��ȸ</b></center></font></TD>      
	</TR>   
	
<%
if(lastRow > 0) {
	if(key==null || keyword==null){
		strSQL = "SELECT * FROM tblboard WHERE num BETWEEN " + startRow + " and " + endRow + " ORDER BY num DESC";
		rs = stmt.executeQuery(strSQL);
	} else {
		strSQL = "SELECT * FROM tblboard WHERE " + key + " like '%" + keyword + "%' ORDER BY num DESC";
		rs = stmt.executeQuery(strSQL);
	}

	for (i = 1; i < listSize; i++){			
		while(rs.next()){

		int listnum = rs.getInt("num");
		String name = rs.getString("name");
		String email = rs.getString("email");
		String title = rs.getString("title");
		String writedate = rs.getString("writedate");
		int readcount = rs.getInt("readcount");
%>

	<TR bgcolor='ededed'>     
		<TD align=center><font size=2 color='black'><%=listnum %></font></TD>     
		<TD align=left>
			<a href="write_output.jsp?num=<%=listnum %>">
			<font size=3 color="black"><%=title %></font></a>
		</TD>
		<TD align=center>
			<font size=3 color="black"><%=name %></font></a>     
		</TD>     
		<TD align=center><font size=3><%=writedate %></font>
		</TD>     
		<TD align=center><font size=3><%=readcount %></font>     
	</TR>  
	   	
<% 
		}    
	}	
%>

</TABLE>     

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE> 
                  	                   
<%
rs.close();
stmt.close();
conn.close();
}

if(lastRow > 0) {
	int setPage = 1;
	int lastPage = 0;
	if(lastRow % listSize == 0)
		lastPage = lastRow / listSize;
	else
		lastPage = lastRow / listSize + 1;

	if(currentPage > 1) {
%>
		<a href="listboard.jsp?pageNum=<%=currentPage-1%>">[����]</a>	
<%	
	}
	for(i=setPage; i<=lastPage; i++) {
		if (i == Integer.parseInt(pageNum)){
%>
		[<%=i%>]
<%		
		}else{
%>
		<a href="listboard.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<%
		}
	}
	if(lastPage > currentPage) {
%>
		<a href="listboard.jsp?pageNum=<%=currentPage+1%>">[����]</a>
<%
	}
}
%>  

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>                    

<TABLE border=0 width=600>
	<TR>
		<TD align='center'>	
			<TABLE border='0' cellpadding='0' cellspacing='0'>
			<FORM Name='Form' Method='POST' Action='listboard.jsp' OnSubmit='return Check()'>
			<input type='hidden' name='search' value='1'>
			<TR>
				<TD align='right'>
				<select name='key' style="background-color:cccccc;">
				<option value='title' selected><font size='3'>
                                                        ������</font></option>
				<option value='contents'><font size='3'>
                                                        �۳���</font></option>
				<option value='name'><font size='3'>
                                                        �ۼ���</font></option>
				</select>
				</TD>
				<TD align='left'>
					<input type='text' name='keyword' 
                                                   value='' size='20' maxlength='30'>
					<input type='submit' value='�˻�'>
				</td>
			  </TR>
			  </FORM>
			  </TABLE> 
		</TD>

		<TD align='right'>		
		<a href='write.jsp'>[���]</a>				
		</TD>
	</TR>
</TABLE>
<%
	}
%>         
</BODY>                     
</HTML>