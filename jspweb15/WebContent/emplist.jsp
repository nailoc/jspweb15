<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp 등록정보보기 </title>
</head>
<body>
	<h2>등록된 직원정보</h2>
	<h3>아이디, 이름, 직무, 전화번호</h3>
<%
	//접속정보를 정의 + 추가변수
	String driveName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/jspweb"; //포트정보/디비정보
	String user = "jsp";
	String password = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select id, name, designation, phone from emp";
	
	try {
		Class.forName(driveName);
		conn = DriverManager.getConnection(url, user, password);
		pstmt = conn.prepareStatement(sql); // ? 없으면 그래도 사용가능
		rs = pstmt.executeQuery();
		out.println("<form method='GET' action='empdelete.jsp'>");
		while(rs.next()) {
			out.println("<p><input type='radio' name='delemp' value='" +rs.getString("id")+ "'>");
			out.println(rs.getString("id")+", ");
			out.println(rs.getString("name")+", ");
			out.println(rs.getString("designation")+", ");
			out.println(rs.getString("phone")+"</p>");
		}
		out.println("<p><input type='submit' value='선택된 직원 삭제'></p>");
		out.println("<form>");
	}catch(ClassNotFoundException e) {
		
	}catch(SQLException e2) {
		
	}catch(Exception e3) {
		
	}
%>
</body>
</html>