<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb15</title>
<link rel="stylesheet" href="css/style.css"></link>
<style></style>
</head>
<body>
	<h3>emp테이블 데이터를 조회(id=admin)</h3>
	
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
		String sql = "select id, name, passwd from emp where id='admin'";
		// Class EmpVo { // 멤버변수 }
		try {
			Class.forName(driveName);
			conn = DriverManager.getConnection(url, user, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				//EmpVo temp = new EmpVo();
				out.println(rs.getString("id") + ",");
				out.println(rs.getString("name") + ",");
				out.println(rs.getString("passwd") + "<br>");
			}
		}catch(ClassNotFoundException e) {
			out.println("드라이버로딩에러");
		}catch(SQLException e2) {
			out.println("쿼리에러");
		}catch(Exception e3) {
			out.println("디비접속에러");
		}
		
	
	%>
</body>
<script></script>
</html>