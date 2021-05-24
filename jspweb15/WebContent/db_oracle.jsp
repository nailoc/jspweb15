<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb13</title>
<link rel="stylesheet" href="css/style.css"></link>
<style></style>
</head>
<body>
	<h3>오라클과 java연동 예제</h3>
	<%
		String driveName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String user = "java";
		String password = "1234";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql  = "SELECT COUNT(*) AS CNT FROM EMP";
		try {
			Class.forName(driveName);
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				out.println("직원총수:"+rs.getString("CNT"));
			}
		}catch(ClassNotFoundException e) {
			out.println("오라클 드라이버 로딩 실패");
		}catch(Exception e2) {
			out.println("오라클 접속 실패"+e2.getMessage());
		}
	%>


</body>
<script></script>
</html>