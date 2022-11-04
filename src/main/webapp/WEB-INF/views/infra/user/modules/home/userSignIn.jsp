<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>userSignIn</title>
	<%@ include file="../../../../rscs/basicRscs.jsp"%>
	<link href="/resources/user/home/css/userSignIn.css" rel="stylesheet">
	<script src="/resources/user/home/js/userSignIn/userSignIn.js"></script>
	<script src="/resources/user/home/js/userSignIn/sol.js"></script>
	<script src="/resources/user/home/js/userSignIn/kkoGetAddr.js"></script>
	<!-- <script src="./resources/user/home/js/userSignIn/Validation.js"></script> -->
</head>
<body>
	<header>
		<%@ include file="../../common/header.jsp"%>
	</header>
	<div class="bodyWrapper">
		<img class="logo" alt="로고이미지" src="/resources/user/home/images/logo/mainLogo.png" style="margin-bottom:20px">
		<form class="inputSignInGroup">
		
			<div class="inputDiv"  id="memberIdDiv">
				<input type="text" id="memberId" class="memberInput" name="member" placeholder="ID" onkeyup="enableInputVal('#memberId',$(memberId).val())">
				<!-- <p class="alertDiv enable">됩니다</p>
				<p class="reAlertDiv enable">됩니다</p> -->
				<!-- <p class="alertDiv disable">안됩니다</p> -->
				<!-- <p class="alertDiv duple"><strong>중복된 000 입니다</strong></p> -->
				<input type="hidden" id="memberIdValiScore">
			</div>
			<div class="inputDiv" id="memberPwDiv">
				<input type="text" id="memberPw" class="memberInput" name="member" placeholder="Passcode" onkeyup="enableInputVal('#memberPw',$(memberPw).val())">
				<input type="hidden" id="memberPwValiScore"/>
			</div>
			<div class="inputDiv" id="memberNameDiv">
				<input type="text" id="memberName" class="memberInput" name="member" placeholder="Name" onkeyup="enableInputVal('#memberName',$(memberName).val())">
				<input type="hidden" id="memberNameValiScore"/>
			</div>
			<div class="inputDiv" id="memberNickNameDiv">
				<input type="text" id="memberNickName" class="memberInput" name="member" placeholder="Nickname" onkeyup="enableInputVal('#memberNickName',$(memberNickName).val())">
				<input type="hidden" id="memberNickNameValiScore"/>
			</div>
			
			<div class="dobDiv">
				<div class="inputDiv">
					<input type="number" id="dobYear" class="memberInput" name="" placeholder="년">
					<select id="dobMonth" class="dobSelect memberInput" name="dobSelect">
						<option value="" disable>월</option>
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
					<input type="number" id="dobDay" class="memberInput" name="member" placeholder="일">
				</div>
			</div>
			
			
			
			<div class="telDiv">
				<div class="inputDiv" id="memberTelDiv">
					<input type="number" id="memberTel" class="memberInput" name="member" placeholder="Tel" onkeyup="enableInputVal('#memberTel',$(memberTel).val())">
					<input type="hidden" id="memberTelValiScore"/>
				</div>
				<div class="inputDiv" id="certiNumDiv">
					<div>
						<input type="number" id="AuthCode" class="memberInput" name="member" placeholder="인증번호 입력" onkeyup="onkeyupCerti()">
						<button type="button" class="getAuthCode memberInput" id="getAuthCode" onClick="getSMS()" >인증번호받기</button>
						<input type="hidden" id="certiNum" value="1234"/>
						<input type="hidden" id="enableCertiNum">
					</div>
				</div>
			</div>
			<div class="emailDiv">
				<div class="inputDiv">
					<input type="text" id="memberEmail" class="memberInput" name="member" placeholder="Email"> 
					<select class="emailAddr memberInput" id="emailAddr" name="emailAddr">
						<option value="" disable>이메일</option>
						<option value="1">네이버</option>
						<option value="2">다음</option>
					</select>
				</div>
			</div>
			<div class="getKkoAddr">
				
				<div class="srchAddr">
					<div class="inputDiv">
						<input id="kkoAddr" class="memberInput" type="button" value="우편번호 찾기">	
						<input type="number" class="memberInput" id="postcode" name="postCode" placeholder="우편번호"  readonly>		
					</div>	
				</div>
				<div class="inputDiv">
					<input type="text" class="memberInput" id="roadAddress" name="memberAddrLoad" placeholder="도로명주소"   readonly>
				</div>
				<div class="inputDiv">
					<input type="text" class="memberInput" id="jibunAddress" name="memberAddrJibun" placeholder="지번주소"  readonly >
				</div>
				<div class="inputDiv">
					<input type="text" class="memberInput" id="detailAddress" name="addrDetail" placeholder="상세주소">
				</div>
				<div class="inputDiv">
					<input type="text" class="memberInput" id="extraAddress" name="addrLoca"  placeholder="참고항목" readonly>
				</div>
				<div class="inputDiv">
					<div class="srchAddr">
						<input id="lat" class="memberInput" type="text" name="addrLat" placeholder="위도" readonly>
						<input id="long" class="memberInput" type="text" name="addrLong" placeholder="경도" readonly>
					</div>
				</div>
				<span id="guide" style="color:#999;display:none"></span>
				<div id="addressDetail-alert" class="alert-box"></div>
				<div id="addr-alert" class="alert-box"></div>
			</div>
			
			<input type="button" id="userSignInsubmit" class="memberInput formSubmit Btn" name="member" value="회원가입" style="margin-top:20px"  >
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