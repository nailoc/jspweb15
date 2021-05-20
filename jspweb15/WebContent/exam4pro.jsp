<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb15-로그인처리</title>
<link rel="stylesheet" href="css/style.css"></link>
<style></style>
</head>
<body>
	<h3>로그인 결과</h3>
	<%
		// 폼에서 값을 가져오고
		String id = request.getParameter("uid");
		String pw = request.getParameter("pwd");
		
		String DBid = null;
		String DBpw = null;
		
		// 디비에서 값을 가져오고
		//접속정보를 정의 + 추가변수
		String driveName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jspweb"; //디비정보
		String user = "jsp";
		String password = "1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select id, pwd from member where id=?";
		// 1번째로 아이디 비번을 가져와서 비교하기
		// 2번째로 아이디 비번의 조건해서 count(*) == 0 아니면 
		// 1번째방법으로 
		try {
			Class.forName(driveName);
			
			conn = DriverManager.getConnection(url, user, password);
			
			pstmt = conn.prepareStatement(sql); // 이미 들어가 있음
			pstmt.setString(1, id);			// ? 부분에 대입
			rs = pstmt.executeQuery();     // pstmt 경우는 실행시 파라미터에 sql을 넣지 않음
			while(rs.next()) {
				DBid = rs.getString("id");
				DBpw = rs.getString("pwd");
			}
		}catch(ClassNotFoundException e){
			out.println("드라이버 로딩 실패");
		}catch(SQLException e2){
			
		}catch(Exception e3){
			out.println("디비 접속 실패");
		}
		
		if(id!=null && id.equals(DBid)) {
			if(pw!=null && pw.equals(DBpw)) {
				out.println("로그인성공");
				//세션을 생성할 수 있음
			}else{
				out.println("비밀번호가 틀립니다");
			}
		}else{
			out.println("아이디가 틀립니다");
		}
	%>
	
</body>
<script></script>
</html>