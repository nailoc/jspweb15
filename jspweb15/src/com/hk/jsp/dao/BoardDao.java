package com.hk.jsp.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.hk.jsp.vo.BoardVo;

public class BoardDao {
	
	private static String driveName = "oracle.jdbc.driver.OracleDriver";
	private static String url = "jdbc:oracle:thin:@localhost:1521:XE";
	private static String user = "java";
	private static String password = "1234";
	
	private static Connection conn = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	private static BoardDao instance = new BoardDao(); 
	// 자신의 클래스에 대한 참조변수
	
	private BoardDao() { } // 생성자
	
	public static BoardDao getInstance() {
		return instance;
	}
	
	private void connectDB() throws Exception {
		Class.forName(driveName);
		System.out.println("오라클 드라이버로딩성공");
		if(conn==null) { //접속이 안된 상태면
			conn=DriverManager.getConnection(url, user, password);
			stmt=conn.createStatement();
			System.out.println("오라클 접속 성공");
		}
	}
	
	private void closeDB() {
		
		try {
			if(conn!=null) { conn.close(); conn=null; }
			if(stmt!=null) { stmt.close(); stmt=null; }
			if(rs!=null) { rs.close(); rs=null; }
			System.out.println("오라클 접속 종료 완료");
		}catch(Exception e) {
			System.out.println("오라클 접속 종료 오류");
		}
		
	}
	
	public List<BoardVo> getBoardList(String sort, String keyword) throws Exception {
		//정렬변수
		//검색어변수
		List<BoardVo> rst = new ArrayList<BoardVo>();
		connectDB();
		//sql
		String sql = "select no, title, contents, write_name, "
				+ "TO_CHAR(regdate,'YYYY.MM.DD') as regdate, votes, "
				+ "views from board where title like '%"+keyword+"%' order by "+sort+ " desc";
		rs = stmt.executeQuery(sql);
		while(rs.next()) {
			BoardVo row = new BoardVo();
			row.setNo(rs.getInt("no"));
			row.setTitle(rs.getString("title"));
			row.setContents(rs.getString("contents"));
			row.setWrite_name(rs.getString("write_name"));
			row.setRegdate(rs.getString("regdate"));
			row.setVotes(rs.getInt("votes"));
			row.setViews(rs.getInt("views"));
			rst.add(row);
		}
		closeDB();
		return rst;
	}
	

}


