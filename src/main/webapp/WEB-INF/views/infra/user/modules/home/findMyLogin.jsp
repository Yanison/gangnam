<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	<link href="./resources/user/home/css/findMyLogin.css" rel="stylesheet">
	<script src="./resources/user/home/js/findMyLogin.js"></script>
</head>
<body>
	<header>
		<%@ include file="../../common/header.jsp"%> 
	</header>
	
	<div class="bodyWrapper">
		<section class="findMyLogin">
			<div class="divHeader">
				<img class="logo" alt="로고이미지" src="./resources/user/home/images/logo/mainLogo.png">
				<h1>아이디/비밀번호 찾기</h1>
			</div>
			<p>
				이메일을 입력하시고 인증번호를 받아주신 후<br>
				아이디 찾기 혹은 비밀번호 찾기를 해주세요
			</p>
			<div class="inputBox">
				<div>
					<input type="text" class="" name="" id="inputEmail" placeholder="Email" style="width:350px;">
					<button class="btn" id="" name="">보내기</button>
				</div>
				<input type="text" class="" name="" id="inputEmail" placeholder="인증번호 입력" style="width:420px;">
				<div>
					<button class="btn" id="" name="" style="width:200px;">아이디 찾기</button>
					<button class="btn" id="" name="" style="width:200px;">비밀번호 찾기</button>
				</div>
			</div>
		</section>
	</div>
	<footer>
		<%@include file="../../common/footer.jsp" %>
	</footer>

</body>
</html>