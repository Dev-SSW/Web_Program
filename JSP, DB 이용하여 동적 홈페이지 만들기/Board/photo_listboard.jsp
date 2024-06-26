<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>
<TITLE> 게시판 </TITLE>

<SCRIPT language="JavaScript">
function Check()
{
if (Form.keyword.value.length < 1) {
	alert("검색어를 입력하세요.");
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
	<h1>로그인이 필요합니다.</h1>
	<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
			<TR>
				<TD><hr size='1' noshade></TD>
			</TR>
	</TABLE>
    <a href="../Member/login.jsp">[로그인]</a>
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
	pageNum = "1";       }
    int listSize = 9;         // 11장은 5개
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * listSize + 1;
    int endRow = startRow + listSize - 1;
    int lastRow = 0;
    int i = 0;
    String strSQL = "";

    Class.forName("com.mysql.jdbc.Driver");   // (4) My-SQL DBMS 연결
	String url = "jdbc:mysql://localhost:3306/dbMember?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC"; // DB 지정
    Connection conn = DriverManager.getConnection(url,"Member","apple"); 
    Statement stmt = conn.createStatement();
    ResultSet rs = null;
    if (key==null || keyword==null){
		strSQL = "SELECT count(*) FROM tblphoto";
    }
	else{
		strSQL = "SELECT count(*) FROM tblphoto WHERE " + key + " like '%" + keyword + "%'";}
     	rs = stmt.executeQuery(strSQL);
      	rs.next();
      	lastRow = rs.getInt(1);      
      	rs.close(); 
%>

	<center>
	<TD><font size='3'><b> 엘범 게시판 </b></font></TD>                                    
	<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
		<TR> 	<TD><hr size='1' noshade></TD>  	</TR>
	</TABLE>    
	<TABLE border='0' cellspacing=1 cellpadding=2 width='600'>             	
<%
    if(lastRow > 0) {
	if(key==null || keyword==null){
		strSQL = "SELECT * FROM tblphoto WHERE num BETWEEN " + startRow + " and " + endRow;
		rs = stmt.executeQuery(strSQL);
	} else {
		strSQL = "SELECT * FROM tblphoto WHERE " + key + " like '%" + keyword + "%'";
		rs = stmt.executeQuery(strSQL);
	}
	for (i = 0; i < listSize; i++){	
		int j = 0;
%>
		<TR>
<%
		for(j = 0; j < 3; j++){     // (1) 한줄에 3개 사진 출력		
			if(rs.next()){
			int listnum = rs.getInt("num");  // (2) DB에서 읽음
			String title = rs.getString("title");
			String writedate = rs.getString("writedate");
			String filename = rs.getString("filename");
%>

			<TD>
				<TABLE border='2' bgcolor='ededed'>
					<TR>
						<TD align=center width='170'>    s
							<font size=2 color="black"> <%=title %></font> 
						</TD>  
					</TR>
					<TR> 
			      		<TD align=center>
							<a href="photo_write_output.jsp?num=<%=listnum %>">
								<img src=<%="image/" + filename %> width="160" height="160">  
							</a> 
						</TD>  
					</TR>
					<TR>
						<TD align=center>
                			<font size=2><%=writedate %>
                    		</font>
                		</TD> 
					</TR>
					</TABLE>
				</TD>	   
<% 			}
			else{
				break;	
			}	
		}
		i = i + j;  
%>	
			</TR>
<%	}	%>
			<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
				<TR>
					<TD><hr size='1' noshade> </TD> </TR>
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
	   <a href="photo_istboard.jsp?pageNum=<%=currentPage-1%>">[이전]</a>	
<%	
	}

	for(i=setPage; i<=lastPage; i++) {
		if (i == Integer.parseInt(pageNum)){
%>
		[<%=i%>]
<%		
		}else{
%>
		<a href=“photo_listboard.jsp?pageNum=<%=i%>">[<%=i%>]</a> // 페이지번호[ ]
<%
		}
	}
	if(lastPage > currentPage) {
%>
		<a href="photo_listboard.jsp?pageNum=<%=currentPage+1%>">[다음]</a>
<%
	}
}
%>  

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR><TD><hr size='1' noshade></TD></TR>
</TABLE>
<TABLE border=0 width=600>
	<TR>	<TD align='center'>	
			<TABLE border='0' cellpadding='0' cellspacing='0'>
			<FORM Name='Form' Method='POST' Action='photo_listboard.jsp' OnSubmit='return Check()'>
			<input type='hidden' name='search' value='1'>
			<TR>
				<TD align='right'>
				<select name='key' style="background-color:cccccc;">
				<option value='title' selected><font size='2'>
                                                        글제목</font></option>
				<option value='contents'><font size='2'>
                                                        글내용</font></option>
				<option value='name'><font size='2'>
                                                        작성자</font></option>
				</select>
				</TD>
				<TD align='left'>
					<input type='text' name='keyword' value='' size='20' maxlength='30'>
					<input type='submit' value='검색'>	
				</td>
			</TR>
			</FORM>			  
			</TABLE> 
			</TD>	
		<TD align='right'>	<a href='photo_write.jsp'>[등록]</a></TD>
	</TR>
</TABLE></BODY></HTML>

<%
	}
%>         
</BODY>                     
</HTML>