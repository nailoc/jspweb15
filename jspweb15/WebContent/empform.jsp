<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp 가입폼</title>
</head>
<body>
	<h3>직원등록</h3>
	<form method="GET" action="empreg.jsp">
		<p><input type="text" name="empid" value="" placeholder="직원아이디입력"></p>
		<p><input type="text" name="empname" value="" placeholder="직원이름입력"></p>
		<p><input type="text" name="emppw" value="" placeholder="직원비밀번호입력"></p>
		<p><input type="text" name="empjob" value="" placeholder="직원업무입력"></p>
		<p><input type="text" name="empphn" value="" placeholder="직원폰번호입력"></p>
	
		<p><input type="submit" value="등록하기">
		<input type="button" value="등록된직원보기" onclick="location.href='emplist.jsp'"></p>
	</form>
</body>
</html>