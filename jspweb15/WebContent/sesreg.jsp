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
	<h3>로그인을 성공하며 세션 생성하는 페이지</h3>
	<%
		//입력한 값 가져오기
		String email = request.getParameter("email");
		//인증을 통해서 인증성공결과
		String DBEmailA = "aaaa@db.com";
		String DBEmailB = "bbbb@db.com";
		
		//boolean blogin = true; // 참이면 인증성공이라고 가정
		boolean blogin = false; // 거짓이면 인증실패이라고 가정
		if(email.equals(DBEmailA) || email.equals(DBEmailB)) {
			blogin=true;	
		}
		if(blogin==true) {
			//세션을 생성 => 서버에 정보가 저장됨
			session.setAttribute("userid", email); // 맵이랑 유사
		}else { // 세션을 만들지 않음 
		}
		
	%>
	<a href="seschk.jsp">접속한 이메일 세션 확인</a>
</body>
<script></script>
</html>