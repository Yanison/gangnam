<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="./resources/user/home/css/header.css" rel="stylesheet">
<script src="./resources/common/js/header.js"></script>
<nav class="navbar">
	<div class="leftNav">
		<div class="logoStyle">
			<a href="http://127.0.0.1:8085/"><img class="headerLogo" alt="logo아이콘" src="./resources/user/home/images/logo/mainLogo.png"></a>
		</div>
		<ul class="navMenu">
			<li><a href="#" onclick="gohome()">홈</a></li>
			<li><a href="#">게시글</a></li>
			<li><a href="#">싸게월드</a></li>
		</ul>
	</div> 
	<div class="rightNav">
		<ul class="navBtn">
			<li class="write"><a class="writeBtn" href="#" type="button" id="">글쓰기</a></li>
			<c:choose>
				<c:when test="${empty infrMmSeq}">
					<li class="last"><a href="http://127.0.0.1:8085/userLogin" type="button" id="">로그인</a></li>
				</c:when>
				<c:otherwise>
					<li class="logedIn"><c:out value="${infrMmName}"/> 님</li>
					<li><button onClick="userLogOut()">로그아웃</button></li>
					<li class="logedIn"><a type="button" id="">마이페이지</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<div class="hiddenGroup" style="none">
		<input type="hidden" id="infrMmId" value="${infrMmId}">
		<input type="hidden" id="infrMmSeq" value="${infrMmSeq}">
		<input type="hidden" id="infrMmName" value="${infrMmName}">
	</div>
</nav>
