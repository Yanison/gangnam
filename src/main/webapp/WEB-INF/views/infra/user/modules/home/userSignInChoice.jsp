<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>userSignIn</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	<link href="./resources/user/home/css/userSignInChoice.css" rel="stylesheet">
	<script src="./resources/user/home/js/userSignInChoice.js"></script>
</head>
<body>
<header>
		<%@ include file="../../common/header.jsp"%> 
	</header>
	<div class="bodyWrapper">
		<section>
			<div>
				<div class="SignInChoiceHeader">
					<img class="logo" alt="로고이미지" src="./resources/user/home/images/logo/mainLogo.png">
					<h1>가입 선택</h1>
				</div>
			</div>
			<section class="ChoiceBoxDiv">
				<article class="ChoiceBox">
					<button id="normalSignIn" class="signInChoiceBtn" href="http://127.0.0.1:8085/userSignIn">
						<img alt="카카오톡" src="./resources/user/home/images/logo/mainLogo.png">
						<span>일반회원가입</span>
					</button>
					<button class="signInChoiceBtn">
						<img alt="네이버" src="./resources/user/home/images/logo/naver.png">
						<span>네이버</span>
					</button>
					<button class="signInChoiceBtn">
						<img alt="구글" src="./resources/user/home/images/logo/google.png">
						<span>Google</span>
					</button>
					<button class="signInChoiceBtn">
						<img alt="카카오톡" src="./resources/user/home/images/logo/kakao.png">
						<span>KakaoTalk</span>
					</button>
				</article>
			</section>
		</section>
	</div>
	<footer>
		<%@include file="../../common/footer.jsp" %>
	</footer>
</body>
</html>

<!-- <div class="easyLoginLogo">
	<div>
		<a><img alt="네이버" src="./resources/user/home/images/logo/naver.png"></a>
	</div>
	<div>
		<a><img alt="구글" src="./resources/user/home/images/logo/google.png"></a>
	</div>
	<div>
		<a><img alt="카카오톡" src="./resources/user/home/images/logo/kakao.png"></a>
	</div>
	<div>
		<a><img alt="페이스북" src="./resources/user/home/images/logo/facebook.png"></a>
	</div>
</div>	 -->