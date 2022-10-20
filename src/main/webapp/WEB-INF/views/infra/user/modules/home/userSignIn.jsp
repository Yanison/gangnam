<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>userSignIn</title>
	<%@ include file="../../../../rscs/basicRscs.jsp"%>
	<link href="./resources/user/home/css/userSignIn.css" rel="stylesheet">
	<script src="./resources/user/home/js/userSignIn.js"></script>
</head>
<body>
	<header>
		<%@ include file="../../common/header.jsp"%>
	</header>
	<div class="bodyWrapper">
		<img class="logo" alt="로고이미지" src="./resources/user/home/images/logo/mainLogo.png" style="margin-bottom:20px">
		<form class="inputSignInGroup">
			<input type="text" id="memberId" class="memberInput" name="member" placeholder="ID"> 
			<input type="text" id="memberPw" class="memberInput" name="member" placeholder="Passcode"> 
			<input type="text" id="memberName" class="memberInput" name="member" placeholder="Name">
			<input type="text" id="memberNickName" class="memberInput" name="member" placeholder="Nickname">
			<div class="dobDiv">
				<input type="text" id="dobYear" class="memberInput" name="" placeholder="BirthYear">
				<select id="dobMonth" class="dobSelect memberInput" name="dobSelect">
					<option value="1">1월</option>
					<option value="2">2월</option>
					<option value="3">3월</option>
					<option value="4">4월</option>
					<option value="5">5월</option>
					<option value="6">6월</option>
					<option value="7">7월</option>
					<option value="8">8월</option>
					<option value="9">9월</option>
					<option value="10">10월</option>
					<option value="11">11월</option>
					<option value="12">12월</option>
				</select>
				<input type="text" id="dobDay" class="memberInput" name="member" placeholder="BirthDay">
			</div>
			
			<div class="telDiv">
				<input type="text" id="memberTel" class="memberInput" name="member" placeholder="Tel">
				<div>
					<input type="text" id="AuthCode" class="memberInput" name="member">
					<button class="getAuthCode memberInput Btn" id="getAuthCode">인증번호받기</button>
				</div>
			</div>
			<div class="emailDiv">
				<input type="text" id="memberEmail" class="memberInput" name="member" placeholder="Email"> 
				<select class="emailAddr memberInput" id="emailAddr" name="emailAddr">
					<option>이메일주소</option>
				</select>
			</div>
			<div class="getKkoAddr">
				<input type="text" id="memberPostCode" class="memberInput" name="member" placeholder="Address">
			</div>
			<input type="submit" id="submit" class="memberInput formSubmit Btn" name="member" value="회원가입" style="margin-top:20px">
		</form>
	</div>
	<footer>
		<%@include file="../../common/footer.jsp"%>
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