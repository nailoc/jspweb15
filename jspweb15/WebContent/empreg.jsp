<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp 가입폼</title>
</head>
<body>
	<%
		//폼에서 입력받은 값 저장
		String eid = request.getParameter("empid");
		String ename = request.getParameter("empname");
		String epw = request.getParameter("emppw");
		String ejob = request.getParameter("empjob");
		String ephn = request.getParameter("empphn");
	
		// Statement -> PreparedStatement
		PreparedStatement pstmt = null;
		Connection conn = null;
		//접속정보를 정의 + 추가변수
		String driveName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspweb"; //포트정보/디비정보
		String user = "jsp";
		String password = "1234";
				
		//드라이브 로딩
		try {
			Class.forName(driveName);
			//out.println("<h3>드라이버 로딩 성공</h3>");
			conn = DriverManager.getConnection(url, user, password);
			//out.println("<h3>mysql 접속 성공</h3>");
			
			//stmt = conn.createStatement();
			//rs = stmt.executeQuery(sql);  // select문
			// insert update delete --> executeUpdate(sql)
			
			String sql = "insert into emp values (?,?,?,?,?)"; //1 2 3 4 5
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eid);
			pstmt.setString(2, ename);
			pstmt.setString(3, epw);
			pstmt.setString(4, ejob);
			pstmt.setString(5, ephn);
			int result= pstmt.executeUpdate();
			
			
			//out.println("<h3>쿼리수행성공</h3>");
			out.println("emp 테이블의 등록결과="+result);
			if(result==1) {
				response.sendRedirect("empform.jsp");
			}else{
				out.println("<h3>등록 실패하였습니다</h3>");
			}
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
			if(pstmt!=null) { pstmt.close(); pstmt=null;}
		}
	%>
</body>
</html>