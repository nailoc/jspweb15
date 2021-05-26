<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="com.hk.jsp.dao.BoardDao" %>
<%@ page import="com.hk.jsp.vo.BoardVo" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오라클 게시판</title>
<link rel="stylesheet" href="css/style_list.css"></link>
<link rel="stylesheet" href="css/iboard_default.css"></link>
<style></style>
</head>
<body>

<!-- 상단 콘텐츠를 싸는 박스 -->
<div class="jb-box">

	<div class="jb-text">
		
		<header>
			<div id="logo"><img src="images/logo_400x200.png"></div>
			
			<nav>
			<ul class="menu">
				<li><a href="">menu_1</a>
					<ul class="sub">
						<li><a href="">sub_menu_1</a></li>
						<li><a href="">sub_menu_2</a></li>
						<li><a href="">sub_menu_3</a></li>
					</ul>
				</li>
				<li><a href="">menu_2</a>
					<!-- <ul class="sub">
						<li><a href="">sub_menu_1</a></li>
						<li><a href="">sub_menu_2</a></li>
						<li><a href="">sub_menu_3</a></li>
					</ul> -->
				</li>
				<li><a href="">menu_3</a></li>
				<li><a href="">menu_4</a></li>
				<li><a href="">Notice & News</a></li>
			</ul>
			</nav>
		</header>
	
	</div>
	
	<div class="subslide">
		<h1>Notice & News</h1>
	</div>

</div>

<!-- 게시판 내용 -->
<div class="content_wrapper">

	<div id="iboard-default-list">
		
		<%
			BoardDao board = BoardDao.getInstance();			
			List<BoardVo> result = board.getBoardList();
		%>
		<div class="iboard-list-header">
			<div class="iboard-total-count">전체 <%=result.size() %></div>
		
			<div class="iboard-sort">
				<form id="iboard-sort-form-1" method="GET" action="noticelist.jsp">
					<select name="iboard_list_sort" onchange="">
					<option value="newest" selected="selected">최신순</option>
					<option value="best">추천순</option>
					<option value="viewed">조회순</option>	
					</select>
				</form>
			</div>
		</div>
		
		
		<div class="iboard-list">
		
			<table>
				<thead>
					<tr>
						<td class="iboard-list-uid">번호</td>
						<td class="iboard-list-title">제목</td>
						<td class="iboard-list-user">작성자</td>
						<td class="iboard-list-date">작성일</td>
						<td class="iboard-list-vote">추천</td>
						<td class="iboard-list-view">조회</td>
					</tr>
				</thead>	
				
				<tbody>
				<%
					for(int i=0; i<result.size(); i++) {
						BoardVo row = result.get(i);
						if(i==0) {
							out.println("<tr class='iboard-list-notice'>");
						}else{
							out.println("<tr class=''>");	
						}
				%>
					
						<td class="iboard-list-uid"><%=row.getNo() %></td>
						<td class="iboard-list-title"><%=row.getTitle() %></td>
						<td class="iboard-list-user"><%=row.getWrite_name() %></td>
						<td class="iboard-list-date"><%=row.getRegdate() %></td>
						<td class="iboard-list-vote"><%=row.getVotes() %></td>
						<td class="iboard-list-view"><%=row.getViews() %></td>
					</tr>
				<%
					}
				%>					
					<!-- 
					<tr class="">
						<td class="iboard-list-uid">19</td>
						<td class="iboard-list-title">코로나 백신 개발 3차 임상 실험 완료</td>
						<td class="iboard-list-user">admin</td>
						<td class="iboard-list-date">2020.12.20</td>
						<td class="iboard-list-vote">100</td>
						<td class="iboard-list-view">1000</td>
					</tr>
					-->		
				</tbody>
				
			</table>
		
		</div>
		
		<div class="iboard-pagination">
			<ul class="iboard-pagination-pages">
				<li class="active"><a href="">1</a></li>
				<li><a href="">2</a></li>
				<li class="next-page"><a href="">>></a></li>
				<li class="last-page"><a here="">마지막</a></li>
			</ul>
		</div>
		
		<div class="iboard-search">
			<form id="iboard-search-form-1" method="GET" action="noticelist.jsp">
				<select name="target">
					<option value="">전체</option>
					<option value="title">제목</option>
					<option value="contents">내용</option>
					<option value="write_name">작성자</option>
				</select>
				<input type="text" name="keyword" value="">
				<button type="submit" class="iboard-default-button-small">검색</button>
			</form>
		</div>

	</div>

</div>

<footer>
	<div class="footer_wrapper">
		<address>&copy; Copywriter Java Based WebSite</address>
		<div id="logo_gray">
			<img src="images/logo_gray_800x400.png">
		</div>
	</div>
</footer>

<script src="js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$("ul.menu li").hover(
			function(){ 
				$('ul:not(:animated)',this).stop().show();
			},
			function(){ 
				$('ul',this).stop().hide();
			}
		);
	});
</script>
</body>
<script></script>
</html>