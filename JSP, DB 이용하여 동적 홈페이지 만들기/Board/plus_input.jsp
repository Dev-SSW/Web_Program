<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	String num = request.getParameter("num");  // (1) Ŭ���̾�Ʈ�� ������ �Խñ� ����
    String name = request.getParameter("plus_name");   // ��� �ۼ���
    String contents = request.getParameter("plus_contents");  // ��� ����
    int num_plus = 0;  // ��� ���� �ʱⰪ

    Class.forName("com.mysql.jdbc.Driver");   // My-SQL DBMS ����
    String url = "jdbc:mysql://localhost:3306/dbMember?ServerTimeZone=UTC";   // DB
    Connection conn = DriverManager.getConnection(url,"Member","apple"); 
    Statement stmt = conn.createStatement();
                   // (2) ���� �Խñ��� ���ڵ尡 �ִ����� ���� �ĺ����� select�� ����
    String strSQL = "SELECT num FROM tblplus ORDER BY num DESC";  // (2) tblplus ���̺� �˻�  
    ResultSet rs = stmt.executeQuery(strSQL);
    if (rs == null) {
	num_plus = 1; // (3) ó�� ��� ��� ���� �ʱ�ȭ: �ش� �Խñۿ� ����� �� ���� ���� ���
    }
    else {     // (4) ó�� ��� ���� �ƴ� ���, Max(num) �Լ��� ���� ���� ū ���� �� ����
    strSQL = "SELECT Max(num) FROM tblplus";
    rs = stmt.executeQuery(strSQL);
    rs.next();
   	num_plus = rs.getInt(1) + 1;  } // ������ ����
	Calendar dateIn = Calendar.getInstance();
   	String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
   	indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
   	indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
  	indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
    indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
 	indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

	strSQL ="INSERT INTO tblplus (num, id, name, contents, writedate)";
	strSQL = strSQL +  "VALUES('" + num_plus + "', '" + num + "', '" + name + "',";
	strSQL = strSQL +  "'" + contents + "', '" + indate + "')";
	stmt.executeUpdate(strSQL);
	
	stmt.close();
	conn.close();

	// (4) ��� ������, �Խñ� �� �������� �̵� (��� ��� ���, p.37)
	response.sendRedirect("photo_write_output.jsp?num=" + num);  
%>