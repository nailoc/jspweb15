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
	String sesid = (String)(session.getAttribute("userid"));
	if(sesid==null) {
		out.println("인증실패");
	}else{
		out.println("인증성공:"+sesid);
	}
%>
	<br>
	<a href="sesout.jsp">접속한 이메일 세션 삭제</a>
</body>
<script></script>
</html>