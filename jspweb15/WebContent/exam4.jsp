<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jspweb15-로그인폼</title>
<link rel="stylesheet" href="css/style.css"></link>
<style>
	fieldset {
		width: 300px;
		border: 1px solid #888888;
	}
	legend {
		font-weight: bold;
		border: 1px solid #888888;
		padding: 5px;
		background-color: #888888;
		color: #ffffff;
		letter-spacing: 0.2em;
	}
	input {
		width: 180px;
		margin-bottom: 10px;
	}
	label {
		width: 100px;
		padding-right: 10px;
	}
	input.checkbox {
		width: 10px;
		border: 1px solid green;
	}
</style>
</head>
<body>

	<form method='GET' action="exam4pro.jsp">
		<fieldset>
			<legend>회원로그인</legend>
			<label for="id">아이디</label>
			<input type="text" name="uid" id="id" value=""> <br>
			
			<label for="pwd">비밀번호</label>
			<input type="password" name="pwd" id="pwd" value=""> <br>
			
			<label for="recall" class="chkbox">로그인저장?</label>
			<input type="checkbox" name="recall" id="recall" class="checkbox"> <br>
			
			<input type="submit" name="submit" value="로그인" class="buttonsubmit">
		
		
		</fieldset>
	</form>
</body>
<script></script>
</html>