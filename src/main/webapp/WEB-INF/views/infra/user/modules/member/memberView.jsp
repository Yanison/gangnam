<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>SGWorld</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	 
	<link href="/resources/user/member/css/memberView.css" rel="stylesheet">
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
				<!-- left Nav s-->
				<%@ include file="../../common/memberNav.jsp"%>
				<!-- left Nav e -->
				<section style=" width: 1000px;">
					<b>내 정보 보기</b>
					<article class="rightContent">
						<div class="inputBox">
							<label class="label">이메일</label>
							<input type="text" class="txt">
						</div>
						<div class="inputBox">
							<label class="label">닉네임</label>
							<input type="text" class="txt">
						</div>
						<div class="inputBox">
							<label class="label">휴대폰</label>
							<input type="text" class="txt">
							<button class="phoneButton">인증</button>
						</div>
						<div class="inputBox">
							<label class="label">생년월일</label>
							<input type="text" class="txt">
						</div>
						<button type="button" class="modifyBtn">수정하기</button>					
					</article>
				</section>
			</div>	
		</div><!-- contentWrap end -->
	</div><!-- wrap end -->
	<!-- contend e -->
	</div><!-- wrap end -->
	<footer>
		<%@include file="../../common/footer.jsp" %>
	</footer>

</body>
</html>