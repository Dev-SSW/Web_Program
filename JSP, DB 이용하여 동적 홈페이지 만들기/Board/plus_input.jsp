<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	String num = request.getParameter("num");  // (1) 클라이언트가 전송한 게시글 순번
    String name = request.getParameter("plus_name");   // 댓글 작성자
    String contents = request.getParameter("plus_contents");  // 댓글 내용
    int num_plus = 0;  // 댓글 순번 초기값

    Class.forName("com.mysql.jdbc.Driver");   // My-SQL DBMS 연결
    String url = "jdbc:mysql://localhost:3306/dbMember?ServerTimeZone=UTC";   // DB
    Connection conn = DriverManager.getConnection(url,"Member","apple"); 
    Statement stmt = conn.createStatement();
                   // (2) 기존 게시글의 레코드가 있는지의 여부 식별위해 select문 실행
    String strSQL = "SELECT num FROM tblplus ORDER BY num DESC";  // (2) tblplus 테이블 검색  
    ResultSet rs = stmt.executeQuery(strSQL);
    if (rs == null) {
	num_plus = 1; // (3) 처음 댓글 경우 순번 초기화: 해당 게시글에 댓글이 한 개도 없는 경우
    }
    else {     // (4) 처음 댓글 저장 아닌 경우, Max(num) 함수에 의해 가장 큰 순번 값 얻음
    strSQL = "SELECT Max(num) FROM tblplus";
    rs = stmt.executeQuery(strSQL);
    rs.next();
   	num_plus = rs.getInt(1) + 1;  } // 순번값 얻음
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

	// (4) 댓글 저장후, 게시글 상세 열람으로 이동 (댓글 목록 출력, p.37)
	response.sendRedirect("photo_write_output.jsp?num=" + num);  
%>