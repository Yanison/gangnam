<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link href="/gangnam/resources/user/home/css/header.css" rel="stylesheet">
<script src="/gangnam/resources/common/js/header.js"></script>
<nav class="navbar">
	<div class="leftNav">
		<div class="logoStyle">
			<a href="/gangnam/"><img class="headerLogo" alt="logo아이콘" src="${pageContext.request.contextPath}/resources/user/home/images/logo/mainLogo.png"></a>
		</div>
	</div> 
	<div class="rightNav">
		<ul class="navBtn">
			
			<c:choose>
				<c:when test="${infrMmSeq eq null}">
					<li class="last" style="margin-right:20px"><a href="/gangnam/userLogin" type="button" id="" >로그인</a></li>
					<li class="last"><a href="/gangnam/userSignIn" type="button" id="">회원가입</a></li>
					
				</c:when>
				<c:otherwise>
					<li class="logedIn" style="margin-left:20px; width: 150px;" ><span style="font-weight:600;"><c:out value="${infrMmName}"/></span> 님</li>
					<li class="logedIn"><button id="logOutBtn" onClick="userLogOut()">로그아웃</button></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	<div class="hiddenGroup" style="none">
		<input type="hidden" id="sessMmId" value="${infrMmId}" onchange="isSssValThere('#sessMmId')">
		<input type="hidden" id="sessMmSeq" name="infrMmSeq" value="${infrMmSeq}" onchange="isSssValThere('#sessMmSeq')">
		<input type="hidden" id="sessMmName" value="${infrMmName}" onchange="isSssValThere('#sessMmName')">
		<input type="hidden" id="sessSgw"  value="${sessSgw}" onchange="isSssValThere('#sessSgw')"> 
	</div>
</nav>


