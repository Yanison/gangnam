<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="com.sgworld.infra.common.constants.Constants" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	<link href="./resources/user/home/css/userLogin.css" rel="stylesheet">
	<script src="/resources/user/home/js/userLogin.js"></script>
</head>
<body>
<form id="formLogin" name="formLogin" method="post">
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
						<div class="loignCheck">
							<i class="fa-regular fa-circle-check" style="margin-right:10px;"></i>
							<p>로그인 상태 유지</p>
						</div>
						<div class="loginBtnBox">
							<!-- <button class="loginBtn" type="button" onClick="userLogin()">로그인</button> -->
							<button class="loginBtn" type="button" id="btnLogin">로그인</button>
						</div>
					<div>
						<div class="easyLoginHead">
							<p>간편 로그인</p>
						</div>
						<div class="easyLoginLogo">
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
						</div>		
					</div>
				</article>
			</section>
			<div class="loginFooterBox">
				<div class="loginFooter">
					<a id="findMyLogin">아이디/비밀번호 찾기</a>
					<a id="goToSignIn">회원가입</a>
				</div>
			</div>
		</section>
	</div>
	<footer>
		<%@include file="../../common/footer.jsp" %>
	</footer>
</form>	
	<script type="text/javascript">
	
		var goUrlLogin = "/";
		
		$("#btnLogin").on("click", function(){
			
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				/* ,dataType:"json" */
				,url: "/member/loginProc"
				/* ,data : $("#formLogin").serialize() */
				//,data : { "infrMmId" : $("#infrMmId").val(), "infrMmPw" : $("#infrMmPw").val(), "autoLogin" : $("#autoLogin").is(":checked")}
				,data : { "infrMmId" : $("article.loginBox #infrMmId").val(), "infrMmPw" : $("#infrMmPw").val()}
				,success: function(response) {
					if(response.rt == "success") {
							location.href = goUrlLogin;
					} else {
						alert("회원없음");
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		});
	
		
	</script>

</body>
</html>