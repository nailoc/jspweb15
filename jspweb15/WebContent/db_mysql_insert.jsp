<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.ResultSet" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
<style></style>
</head>
<body>
	<h3>jsp + mysql 연동 테스트(insert)</h3>
	
	<%
		//접속정보를 정의 + 추가변수
		String driveName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspweb"; //디비정보
		String user = "jsp";
		String password = "1234";
		Connection conn = null;
		Statement stmt = null;      // 쿼리에 변수가 일반적 쿼리
		// 만약에 쿼리 변수가 있다면  preparedStatement pstmt = null
		// 입력할 데이터 변수
		String num = "2";
		String name = "이주호";
		String email = "lee@naver.com";
		String phn = "011-2222-3333";
		String id = "2";
		String sql = String.format("insert into test values ('%s', '%s', '%s', '%s', '%s')", 
				                                   num, name, email, phn, id); // 다른 부분은 쿼리부분
		//드라이브 로딩
		try {
			Class.forName(driveName);
			out.println("<h3>드라이버 로딩 성공</h3>");
			conn = DriverManager.getConnection(url, user, password);
			out.println("<h3>mysql 접속 성공</h3>");
			stmt = conn.createStatement();
			//stmt.executeQuery(sql);  // select문
			int result = stmt.executeUpdate(sql);   // insert update delete + 자동컴밋됨
			
			out.println("<h3>쿼리수행성공=" + result + "</h3>");
			
		}catch(ClassNotFoundException e){
			out.println("<h3>드라이버 로딩 실패</h3>");
		}catch(SQLException e2) {
			out.println("<h3>쿼리수행실패</h3>");
		}
		catch(Exception e3) {
			out.println("<h3>mysql 접속 실패</h3>");
		}finally {
			// 디비 접속 및 수행 끝나면 리소스 반환
			if(conn!=null) { conn.close(); conn=null;}
			if(stmt!=null) { stmt.close(); stmt=null;}
		}
		
		// 접속정보나 메소드들은 반복으로 이루어짐 ==> class에서 메소드정의
	
	%>
</body>
<script></script>
</html>