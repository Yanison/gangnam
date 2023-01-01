
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="com.sgworld.infra.common.constants.Constants" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	<link href="/gangnam/resources/user/home/css/userLogin.css" rel="stylesheet">
	<script src="/gangnam/resources/user/home/js/userLogin.js"></script>
</head>
<body>
<form id="formLogin" name="formLogin" method="post">
	<input type="hidden" id="sessSeq" name="sessSeq" value="${sessSeq }">
	<header>
		<%@ include file="../../common/header.jsp"%> 
	</header>
	
	<div class="bodyWrapper">
		<section>
			<div>
				<div class="loginHead">
					<img class="loginLogo" alt="로고이미지" src="./resources/user/home/images/logo/mainLogo.png">
					<h1>로그인</h1>
				</div>
			</div>
			<section class="loginBody">
				<article class="loginBox">
						<div class="inputIdBox">
							<input class="inputId inputLogin" id="infrMmId" name="infrMmId" type="text" placeholder="아이디">
						</div>
						<div class="inputPwBox">
							<input class="inputPw inputLogin" id="infrMmPw" name="infrMmPw" type="password" placeholder="비밀번호">
						</div>
						<div class="loginBtnBox">
							<button class="loginBtn" type="button" onClick="userLogin()">로그인</button> 
							<!-- <button class="loginBtn" type="button" id="btnLogin">로그인</button> -->
						</div>
				</article>
			</section>
			<div class="loginFooterBox">
				<div class="loginFooter">
					<a id="findMyLogin">아이디/비밀번호 찾기</a>
					<a id="goToSignIn" href="/gangnam/userSignIn">회원가입</a>
				</div>
			</div>
		</section>
	</div>
	<footer>
		<%@include file="../../common/footer.jsp" %>
	</footer>
</form>	

</body>
</html>