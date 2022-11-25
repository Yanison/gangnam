<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<html>
<head>
    <title>sgworld-XdminLogin</title>
    <%@ include file="../../../rscs/basicRscs.jsp" %>

	<style type="text/css">
		.btn {
			border-radius: 5px;
			height: 45px;
		}
		
		.container-fluid {
			display: flex;
			justify-content: center;
			text-align: center;
		}
	</style>
</head>

<body>
    <!-- Contact Start -->
	<form method="post" name="form" id="form" autocomplete="off" enctype="multipart/form-data">
		<input type="hidden" id="infrMmSeq" name="infrMmSeq" value="${infrMmSeq }">
		<div class="container-fluid overflow-hidden" style="margin: 1rem 0;">
			<div class="col mt-5" style="text-align: center;">
				<a type="button">
					<img src="/resources/common/images/sgLogo.png" style="width: 60px; height: 60px;">
				</a>
			</div>
		</div>
		<div class="container p-lg-5">
			<div class="col-6 bg-light pt-5 pb-5 offset-3" style="border-radius: 10px;">
				<div class="row" style="text-align: center;">
					<div class="section-title">
						<h1 class="display-6 mb-5">로그인</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-8 mx-auto mb-3">
						<div class="form-floating">
							<input type="email" class="form-control" id="infrMmId" name="infrMmId" value="root11">
                            <label for="infrMmId">이메일</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-8 mx-auto mb-3">
						<div class="form-floating">
							<input type="password" class="form-control" id="infrMmPw" name="infrMmPw" value="123123">
                            <label for="infrMmPw">비밀번호</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-8 mx-auto">
						<button class="btn btn-secondary w-100" type="button" id="btnLogin">로그인</button>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-4 offset-2">
						<div class="form-check form-switch">
							<input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckDefault">
							<label class="form-check-label" for="flexSwitchCheckDefault">Auto login</label>
						</div>
					</div>
				</div>
			</div>    
		</div>
	</form>
    <!-- Contact End -->
    
    <!-- JavaScript & jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	
	<script>
		var goUrlLogin = "/admin/adminHome";
	 	// 암호화
		$("#btnLogin").on("click", function(){
		//if(validation() == false) return false;
		
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				/* ,dataType:"json" */
				,url: "/admin/xdminLoginProc"
				/* ,data : $("#formLogin").serialize() */
				//,data : { "mmEmail" : $("#mmEmail").val(), "mmPw" : $("#mmPw").val(), "autoLogin" : $("#autoLogin").is(":checked")}
				,data : { "infrMmId" : $("#infrMmId").val(), "infrMmPw" : $("#infrMmPw").val()}
				,success: function(response) {
					if(response.rt == "success") {
						//if(response.changePwd == "true") {
						//	location.href = URL_CHANGE_PWD_FORM;
						//} else {
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