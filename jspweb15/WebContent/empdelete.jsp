<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("delemp");
	
		//접속정보를 정의 + 추가변수
		String driveName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspweb"; //포트정보/디비정보
		String user = "jsp";
		String password = "1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "delete from emp where id = ?";
		int result = 0;
		
		if(id==null || id.equals("") ) {
			out.println("선택된 아이디가 없습니다");
		}else{
			
			//드라이브 로딩
			try {
				Class.forName(driveName);
				//out.println("<h3>드라이버 로딩 성공</h3>");
				conn = DriverManager.getConnection(url, user, password);
				//out.println("<h3>mysql 접속 성공</h3>");
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				result = pstmt.executeUpdate();
				if(result==1) {
					response.sendRedirect("emplist.jsp");
				}else{
					out.println("<h3>정보 삭제 실패</h3>");
				}
			}catch(ClassNotFoundException e){
				out.println("<h3>드라이버 로딩 실패</h3>");
			}catch(SQLException e2) {
				out.println("<h3>쿼리수행실패</h3>");
			}
			catch(Exception e3) {
				out.println("<h3>mysql 접속 실패</h3>");
			}
			
		}
	%>
</body>
</html>