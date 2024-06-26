<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
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
<SCRIPT language="JavaScript">
function Check() {
    if (Member_Input.pass.value.length < 1){
        alert("비밀번호를 입력하세요.");
        Member_Input.pass.focus();
        return false;
    }
    if (Member_Input.name.value.length < 1){
        alert("이름을 입력하세요.");
        Member_Input.name.focus();
        return false;
    }
    return true;
}
</SCRIPT>
</head>
<body>
<center>
<%
    String id = request.getParameter("id");

    // DB 연결 및 회원 정보 조회
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/dbMember?serverTimezone=UTC";
    Connection conn = DriverManager.getConnection(url, "Member", "apple");
    Statement stmt = conn.createStatement();
    String strSQL = "SELECT * FROM tblmember WHERE id='" + id + "'";
    ResultSet rs = stmt.executeQuery(strSQL);

    String pass = "";
    String name = "";
    String juminnum1 = "";
    String juminnum2 = "";
    String address1 = "";
    String address2 = "";
    String phone = "";
    String email = "";

    if (rs.next()) {
        pass = rs.getString("pass");
        name = rs.getString("name");
        juminnum1 = rs.getString("juminnum1");
        juminnum2 = rs.getString("juminnum2");
        address1 = rs.getString("address1");
        address2 = rs.getString("address2");
        phone = rs.getString("phone");
        email = rs.getString("email");
    }

    rs.close();
    stmt.close();
    conn.close();
%>

<font size='6'><b>회원 정보 수정</b></font>
<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
    <TR>
        <TD>
            <hr size='1' noshade>
        </TD>
    </TR>
</TABLE>
<FORM Name='Member_Input' Method='post' Action='member_update_process.jsp' OnSubmit='return Check()'>
    <INPUT type='hidden' name='id' value='<%= id %>'>
    <TABLE border='2' cellSpacing=0 cellPadding=5 align=center>
        <TR>
            <TD bgcolor='white' align='center'>
                <font size='3'>아이디</font>
            </TD>
            <TD bgcolor='white'>
                <%= id %>
            </TD>
        </TR>
        <TR>
            <TD bgcolor='white' align='center'>
                <font size='3'>비밀번호</font>
            </TD>
            <TD bgcolor='white'>
                <input type='password' maxLength='10' size='10' name='pass' value='<%= pass %>'>
            </TD>
        </TR>
        <TR>
            <TD bgcolor='white' align='center'>
                <font size='3'>이름</font>
            </TD>
            <TD bgcolor='white'>
                <input type='text' maxLength='10' size='10' name='name' value='<%= name %>'>
            </TD>
        </TR>
        <TR>
            <TD bgcolor='white' align='center'>
                <font size='3'>주민등록번호</font>
            </TD>
            <TD bgcolor='white'>
                <input type='text' size='6' maxLength='6' name='juminnum1' value='<%= juminnum1 %>' readonly>- 
                <input type='text' size='7' maxLength='7' name='juminnum2' value='<%= juminnum2 %>' readonly>
            </TD>
        </TR>
        <TR>
            <TD bgcolor='white' align='center'>
                <font size='3'>주소</font>
            </TD>
            <TD bgcolor='white'>
                <input type='text' maxLength='50' size='50' name='address1' value='<%= address1 %>'><BR>
                <input type='text' maxLength='50' size='50' name='address2' value='<%= address2 %>'>
            </TD>
        </TR>
        <TR>
            <TD bgcolor='white' align='center'>
                <font size='3'>전화번호</font>
            </TD>
            <TD bgcolor='white'>
                <input type='text' maxLength='20' size='20' name='phone' value='<%= phone %>'>
            </TD>
        </TR>
        <TR>
            <TD bgcolor='white' align='center'>
                <font size='3'>이메일</font>
            </TD>
            <TD bgcolor='white'>
                <input type='text' maxLength='50' size='50' name='email' value='<%= email %>'>
            </TD>
        </TR>
    </TABLE>
    <TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
        <TR>
            <TD>
                <hr size='1' noshade>
            </TD>
        </TR>
    </TABLE>
    <TABLE>
        <TR>
            <TD colspan='2' align='center'>
                <input type='submit' value='수정'>
            </TD>
        </TR>
    </TABLE>
</FORM>
</center>
</body>
</html>