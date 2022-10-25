<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>SGWorld</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	 
	<link href="/resources/user/member/css/memberAvartar.css" rel="stylesheet">
</head>
<body>
	<header>
		<%@ include file="../../common/header.jsp"%> 
	</header>
	<!-- contend s -->
	<div class="wrap">
		<!-- header 넣을자리-->
		<div class="contentWrap">
			<span>My Page</span>
			<div class="leftDiv">	
				<nav class="leftVanner">
					<ul>
						<li><i class="fa-sharp fa-solid fa-user"></i>&nbsp내 정보 보기
						<li><i class="fa-sharp fa-solid fa-robot"></i>&nbsp아바타 수정
						<li><i class="fa-sharp fa-solid fa-pen"></i>&nbsp내 글 조회
						<li><i class="fa-sharp fa-solid fa-door-open"></i>&nbsp회원 탈퇴
					</ul>
				</nav>
				<section style=" width: 1000px;">
					<b>아바타 수정</b>
					<article class="rightContent">
						<div class="icon">
							<i class="fa-solid fa-user fa-4x"></i>
						</div>
						<div class="btns">
							<button type="button" class="modifyBtn">기본 아바타</button>
							<button type="button" class="modifyBtn">아바타 업로드</button>					
						</div>
					</article>
				</section>
			</div>	
		</div><!-- contentWrap end -->
	</div><!-- wrap end -->
	<!-- contend e -->
	<footer>
		<%@include file="../../common/footer.jsp" %>
	</footer>

</body>
</html>