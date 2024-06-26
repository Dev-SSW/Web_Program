<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 아이디 중복 체크 </title>
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
<FORM>
	<TABLE border='1' width=300>
<%
    String id = request.getParameter("id");  // p.15에서 전달
    
	if (id == ""){
%>
		<TR>
			<TD align='center' bgcolor='black'>
				<font size='4' color = 'white'>id를 입력하세요.</font>
			</TD> 
		</TR>
		<TR>
			<TD align='center'>
				<a href=javascript:close()>[닫 기]</a>
			</TD>
		</TR>
<%
	} 
	else {
		Class.forName("com.mysql.jdbc.Driver");   // My-SQL DBMS 연결
        String url = "jdbc:mysql://localhost:3306/dbMember?ServerTimeZone=UTC";   
        Connection conn = DriverManager.getConnection(url,"Member","apple"); 	
        Statement stmt = conn.createStatement();
        String strSQL = "SELECT id FROM tblmember where id='" + id + "'";
        ResultSet rs = stmt.executeQuery(strSQL);

        if (!rs.next()) {   // 중복 id 없는 경우
%>
		<TR>	
			<TD align='center' bgcolor='black'>
            	<font size='4' color = 'white'>ID : <%=id%> <BR> 사용할 수 있는 아이디입니다.</font>
            </TD>
        </TR>
        <TR>	
        	<TD align='center'>
            	<a href=javascript:close()>[닫 기]</a>
            </TD>
        </TR>
<%
        } 
        else {  // 중복 id 있는 경우
%>
		
		<TR>
			<TD align='center' bgcolor='black'>
				<font size='4' color = 'white'>ID : <%=id%> <BR> 사용할 수 없는 아이디입니다.</font>
			</TD>
		</TR>
		<TR>
			<TD align='center'>
				<a href=javascript:close()>[닫 기]</a>
			</TD>
		</TR>
<%
		}
		rs.close();
		stmt.close();
		conn.close();
	}
%>
		

</body>
</html>