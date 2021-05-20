<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
<style></style>
</head>
<body>
	<%
		session.invalidate();
		out.println("접속한 브라우저의 세션을 삭제햇습니다");
	%>
	<br>
	<a href="sesfrm.jsp">세션폼으로 이동</a>
</body>
<script></script>
</html>