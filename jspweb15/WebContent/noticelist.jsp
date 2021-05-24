<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오라클 게시판</title>
<link rel="stylesheet" href="css/style_list.css"></link>
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
				<li><a href="">menu_1</a></li>
				<li><a href="">menu_2</a></li>
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

	<div id="iboard-defualt-list">
		
		<div class="iboard-list-header">
			<div class="iboard-total-count">전체 20</div>
		
			<div class="iboard-sort">
				최신순으로 정렬
			</div>
		</div>
		
		<div class="iboard-list">
		
			<table>
				<thead>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>추천</td>
						<td>조회</td>
					</tr>
				</thead>	
				
				<tbody>
					<tr>
						<td>20</td>
						<td>코로나 백신 개발 3차 임상 실험 완료</td>
						<td>admin</td>
						<td>2020.12.20</td>
						<td>100</td>
						<td>1000</td>
					</tr>
					
					<tr>
						<td>19</td>
						<td>코로나 백신 개발 3차 임상 실험 완료</td>
						<td>admin</td>
						<td>2020.12.20</td>
						<td>100</td>
						<td>1000</td>
					</tr>
				</tbody>
				</tbody>
				
			</table>
		
		</div>
		
		<div>페이네이션 화면</div>
		
		<div>검색</div>

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


</body>
<script></script>
</html>