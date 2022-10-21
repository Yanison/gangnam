<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>SGWorld</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	 
	<link href="./resources/user/member/css/memberWithdraw.css" rel="stylesheet">
</head>
<body>
	<header>
		<%@ include file="../../common/header.jsp"%> 
	</header>
	<div class="wrap">
		<!-- header 넣을자리-->
		<div class="contentWrap">
			<span>My Page</span>
			<div class="leftDiv">	
				<nav class="leftVanner">
					<ul>
						<li>내 정보 보기
						<li>아바타 수정
						<li>내 글 조회
						<li>회원 탈퇴
					</ul>
				</nav>
				<section style=" width: 1000px;">
					<b>회원탈퇴</b>
					<article class="rightContent">
						<div class="rightContentWrap">
							<h5>회원탈퇴를 원하시면 아래의 텍스트를 입력해주세요</h5>
							<div>
								<input type="text" placeholder="회원탈퇴" class="txt">
							</div>	
							<input type="text" placeholder="탈퇴사유" class="txt">
							<button type="button" class="modifyBtn">수정하기</button>
						</div>
					</article>
				</section>
			</div>	
		</div><!-- contentWrap end -->
	</div><!-- wrap end -->
	<footer>
		<%@include file="../../common/footer.jsp" %>
	</footer>

</body>
</html>