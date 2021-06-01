<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hk.jsp.vo.*" %>
<%@ page import="com.hk.jsp.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오라클게시판</title>
</head>
<body>
	<%
		String title = request.getParameter("title");
		String writeName = request.getParameter("write_name");
		String passwd = request.getParameter("passwd");
		String ck_contents = request.getParameter("contents");
		//out.println("확인:"+ck_contents);
		
		// BoardVo 에 담아서 전송
		BoardVo writeVo = new BoardVo();
		writeVo.setTitle(title);
		writeVo.setWrite_name(writeName);
		//writeVo.setPasswd(); // 디비에서 컬럼이 생략됨
		writeVo.setContents(ck_contents);
		
		// BoardDao 에서 데이터저장
		BoardDao brddao = BoardDao.getInstance();
		int result = brddao.saveBoard(writeVo);
		
		// 성공이면 목록으로 이동, 실패면 글쓰기폼으로 이동
		if(result == 1) {
			out.println("<script>alert('글저장했습니다'); location.href='noticelist.jsp'</script>");			
		}else{
			out.println("<script>alert('글저장을 실패했습니다'); location.href='noticewrite.jsp'</script>");
		}
		
	%>
</body>
</html>
