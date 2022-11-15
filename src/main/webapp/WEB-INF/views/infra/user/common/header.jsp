<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="/resources/user/home/css/header.css" rel="stylesheet">
<script src="/resources/common/js/header.js"></script>
<nav class="navbar">
	<div class="leftNav">
		<div class="logoStyle">
			<a href="http://127.0.0.1:8085/"><img class="headerLogo" alt="logo아이콘" src="/resources/user/home/images/logo/mainLogo.png"></a>
		</div>
		<ul class="navMenu">
			<li><a href="#" onclick="gohome()">홈</a></li>
			<li><a type="button" id="btnBoardHome">게시글</a></li>
			<li><a href="#">싸게월드</a></li>
		</ul>
	</div> 
	<div class="rightNav">
		<ul class="navBtn">
			<li class="write"><a class="writeBtn" id="btnBoardRegForm" type="button">글쓰기</a></li>
			<c:choose>
				<c:when test="${sessSeq eq null}">
					<li class="last"><a href="http://127.0.0.1:8085/userLogin" type="button" id="">로그인</a></li>
				</c:when>
				<c:otherwise>
					<li class="logedIn" style="margin-left:20px"><span style="font-weight:600;"><c:out value="${sessName}"/></span> 님</li>
					<li class="logedIn"><button id="logOutBtn" onClick="userLogOut()">로그아웃</button></li>
					<!-- 마이페이지 링크 연결해주세요 -->
					<li class="logedIn" f><a href="http://127.0.0.1:8085/member/memberView" type="button" id="">마이페이지</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<div class="hiddenGroup" style="none">
		<input type="hidden" id="infrMmId" value="${infrMmId}" onchange="isSssValThere('#infrMmId')">
		<input type="hidden" id="infrMmSeq" name="infrMmSeq" value="${infrMmSeq}" onchange="isSssValThere('infrMmSeq')">
		<input type="hidden" id="infrMmName" value="${infrMmName}" onchange="isSssValThere('infrMmName')">
	</div>
</nav>


