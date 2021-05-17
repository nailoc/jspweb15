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
	<h3>jsp + mysql 연동 테스트</h3>
	
	<%
		//접속정보를 정의 + 추가변수
		String driveName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspweb"; //디비정보
		String user = "jsp";
		String password = "1234";
		Connection conn = null;
		Statement stmt = null;      // 쿼리에 변수가 일반적 쿼리
		// 만약에 쿼리 변수가 있다면  preparedStatement pstmt = null
		ResultSet rs = null;
		String sql = "select count(*) as cnt from test"; // 결과 1
		int total_test = 0;
		//드라이브 로딩
		try {
			Class.forName(driveName);
			out.println("<h3>드라이버 로딩 성공</h3>");
			conn = DriverManager.getConnection(url, user, password);
			out.println("<h3>mysql 접속 성공</h3>");
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);  // select문
			// insert update delete --> executeUpdate(sql)
			
			out.println("<h3>쿼리수행성공</h3>");
			while(rs.next()) { // row의 다음값이 있는지 확인 - true (있으면)
				total_test =rs.getInt("cnt");  // getString
			}
			out.println("test테이블의 로우갯수="+total_test);
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
			if(rs!=null) { rs.close(); rs=null;}
		}
		
		// 접속정보나 메소드들은 반복으로 이루어짐 ==> class에서 메소드정의
	
	%>
</body>
<script></script>
</html>