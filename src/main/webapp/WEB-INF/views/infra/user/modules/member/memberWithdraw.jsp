<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>SGWorld</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	 
	<link href="/resources/user/member/css/memberWithdraw.css" rel="stylesheet">
	<link href="../resources/user/home/css/header.css" rel="stylesheet">
	<link href="../resources/user/home/css/footer.css" rel="stylesheet">
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
					<b>회원탈퇴</b>
					<article class="rightContent">
						<div class="rightContentWrap">
							<h5>회원탈퇴를 원하시면 아래의 텍스트를 입력해주세요.</h5>
							<div>
								<input type="text" placeholder="회원탈퇴" class="txt">
							</div>	
							<div>	
								<select class="txt1">
									<option>탈퇴사유</option>
									<option>이용하고 싶은 서비스가 없어요.</option>
									<option>서비스 퀄리티가 낮아요.</option>
									<option>비매너 회원을 만났어요.</option>
									<option>잦은 오류가 발생해요.</option>
									<option>대체할 만한 서비스를 찾았어요.</option>
									<option>기타</option>
								</select>
								<!-- <input type="text" placeholder="탈퇴사유" class="txt"> -->
							</div>
							<button type="button" class="modifyBtn">탈퇴하기</button>
							
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