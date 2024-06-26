<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
<%
    session.invalidate(); // 세션 무효화
%>
<script>
    alert("로그아웃 되었습니다.");
    location.href = "login.jsp"; // 로그인 페이지로 리디렉션
</script>
</body>
</html>