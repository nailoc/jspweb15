<%@ page language="java" contentType="text/html; charset=UTF-8"%>
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
				<li><a href="noticelist.jsp">Notice & News</a></li>
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

	<div id="iboard-thumbnail-editor">
	
		<form class="iboard-form" id="frm_write" method="GET" action="noticewrtpro.jsp">
		
		<input type="hidden" name="board_id" value="hidden_val">
		
		<div class="iboard-attr-row iboard-attr-title">
			<label class="attr-name" for="title">
			<span class="field-name">제목</span>
			<span class="attr-required-text">*</span></label>
			<div class="attr-value">
				<input type="text" id="title" name="title" value="">
			</div>
		</div>
		
		<div class="iboard-attr-row iboard-attr-author">
			<label class="attr-name" for="iboard-input-member-display">
			<span class="field-name">작성자</span>
			<span class="attr-required-text">*</span></label>
			<div class="attr-value">
				<input type="text" id="iboard-input-member-display" name="write_name" value="">
			</div>
		</div>
		
		<div class="iboard-attr-row iboard-attr-password">
			<label class="attr-name" for="iboard-input-password">
			<span class="field-name">비밀번호</span>
			<span class="attr-required-text">*</span></label>
			<div class="attr-value">
				<input type="text" id="iboard-input-password" name="passwd" value="">
			</div>
		</div>
		
		<div class="iboard-attr-row iboard-attr-content">
			<label class="attr-name" for="iboard-content">
			<span class="field-name">내용</span></label>
			<div id="iboard-content-wrap">
				
				<div id="iboard-content-editor-container" class="editor-container">
				<textarea class="editor-textarea" style="height:250px" cols="40" name="contents" id="iboard_content"></textarea>
				</div>
			</div>
		</div>
		
		<div class="iboard-attr-row iboard-attr-attach-1">
			<label class="attr-name" for="iboard-input-file1">
			<span class="field-name">첨부파일-1</span></label>
			<div class="attr-value">
				<input type="file" id="iboard-input-file1" name="attach1" value="">
			</div>
		</div>
		
		<div class="iboard-control">
			<div class="left">
				<button type="button" onclick="history.back();">돌아가기</button>
			</div>
			
			<div class="right">
				<button type="button" onclick="bbs_write();">저장하기</button>
			</div>
		</div>
		
		</form>
	
	
	</div> <!--  iboard-thumbnail-editor -->

</div> <!-- content_wrapper end -->

<footer>
	<div class="footer_wrapper">
		<address>&copy; Copywriter Java Based WebSite</address>
		<div id="logo_gray">
			<img src="images/logo_gray_800x400.png">
		</div>
	</div>
</footer>

<script src="js/jquery-3.6.0.min.js"></script>
<script src="js/ckeditor.js"></script>
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

	CKEDITOR.replace('iboard_content');
	
	// 글쓰기
	function bbs_write() {
		frm = document.getElementById("frm_write");
		frm.submit();
	}
</script>
</body>
</html>