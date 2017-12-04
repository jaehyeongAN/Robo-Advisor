<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
<!-- 	<title>YOUR FINANCE CONSULTING</title> -->

	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700|Lato:400,100,300,700,900' rel='stylesheet' type='text/css'>

	<link rel="stylesheet" href="../<%=request.getContextPath() %>/resources/css/animate.css">
	<!-- Custom Stylesheet -->
	<link rel="stylesheet" href="../<%=request.getContextPath() %>/resources/css/style.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
</head>

<body>
	<form method="post" action="login_ok.do" onsubmit="return check()">
	<div class="container">
		<!-- <div class="top">
			<h1 id="title" class="hidden"><span id="logo">Daily <span>UI</span></span></h1>
		</div> -->
		<div class="login-box animated fadeInUp">
			<div class="box-header">
				<h2>Log In</h2>
			</div>
			<label for="username">ID</label>
			<br/>
			<input type="text" id="id" name="id">
			<br/>
			<label for="password">Password</label>
			<br/>
			<input type="password" id="pwd" name="pwd">
			<br/>
			<input type="submit" id="login" value="로그인">
			<input type="reset" id="cancel" value="취소">
			<br/>
			<a href="<%=request.getContextPath() %>/join.do"><p class="small">회원가입</p></a>
		</div>
	</div>
	</form>
</body>

<script>
	$(document).ready(function () {
    	$('#logo').addClass('animated fadeInDown');
    	$("input:text:visible:first").focus();
	});
	$('#username').focus(function() {
		$('label[for="username"]').addClass('selected');
	});
	$('#username').blur(function() {
		$('label[for="username"]').removeClass('selected');
	});
	$('#password').focus(function() {
		$('label[for="password"]').addClass('selected');
	});
	$('#password').blur(function() {
		$('label[for="password"]').removeClass('selected');
	});
</script>

</html>
