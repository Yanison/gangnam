<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	<link href="./resources/user/home/css/userLogin.css" rel="stylesheet">
</head>
<body>
	<header>
		<%@ include file="../../common/header.jsp"%> 
	</header>

	<section>
		<div>
			<div class="loginHead">
				<img class="loginLogo" alt="로고이미지" src="../image/user/logo.png">
				<h1>로그</h1>
			</div>
		</div>
		<section class="loginBody">
			<article class="loginBox">
				<div class="inputIdBox">
					<input class="inputId" type="text" placeholder="아이디">
				</div>
				<div class="inputPwBox">
					<input class="inputPw" type="password" placeholder="비밀번호">
				</div>
				<div class="loignCheck">
					<i class="fa-regular fa-circle-check"></i>
					<p>로그인 상태 유지</p>
				</div>
				<div class="loginBtnBox">
					<button class="loginBtn" type="button">로그인</button>
				</div>
				<div>
					<div class="easyLoginHead">
						<p>간편 로그인</p>
					</div>
					<div class="easyLoginLogo">
						<div>
							<a><img alt="네이버" src="../image/user/naver.png"></a>
						</div>
						<div>
							<a><img alt="구글" src="../image/user/google.png"></a>
						</div>
						<div>
							<a><img alt="카카오톡" src="../image/user/kakao.png"></a>
						</div>
						<div>
							<a><img alt="페이스북" src="../image/user/facebook.png"></a>
						</div>
					</div>		
				</div>
			</article>
		</section>
		<div class="loginFooterBox">
			<div class="loginFooter">
				<div><a>아이디/비밀번호 찾기</a></div>
				<div><a>회원가입</a></div>
			</div>
		</div>
	</section>
	
	<footer>
		<%@include file="../../common/footer.jsp" %>
	</footer>

</body>
</html>