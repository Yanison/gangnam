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
	<script src="/resources/user/home/js/userSignIn/kkoGetAddr.js"></script>
	
	<script src="/resources/user/home/jquery-datePircker-ui-1.13.2/jquery-ui.js"></script>
	<link href="/resources/user/home/jquery-datePircker-ui-1.13.2/jquery-ui.css" rel="stylesheet"/>
	<link href="/resources/user/home/jquery-datePircker-ui-1.13.2/jquery-ui.structure.css" rel="stylesheet"/>
	<link href="/resources/user/home/jquery-datePircker-ui-1.13.2/jquery-ui.theme.css" rel="stylesheet"/>
	<script>
		$.datepicker.setDefaults({
			  dateFormat: 'yy-mm-dd',
			  prevText: '이전 달',
			  nextText: '다음 달',
			  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
			  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
			  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
			  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
			  showMonthAfterYear: true,
			  yearSuffix: '년'
			  
			});
	 $(function(){
	   $('.datepicker').datepicker({
		  changeYear: true
	   });
	 })
	</script>
</head>
<body>
	<header>
		<%@ include file="../../common/header.jsp"%>
	</header>
	<div class="bodyWrapper">
		<img class="logo" alt="로고이미지" src="/resources/user/home/images/logo/mainLogo.png" style="margin-bottom:20px">
		<form class="inputSignInGroup">
			<div class="inputDiv"  id="memberIdDiv">
				<!-- input 1 -->	
				<input type="text" id="memberId" class="memberInput" name="memberId" placeholder="ID" onkeyup="enableInputVal('#memberId',$('#memberId').val())">
				
			</div>
			<div class="inputDiv" id="infrMmPwDiv">
				<!-- input 2 -->
				<input type="password" id="infrMmPw" class="memberInput" name="infrMmPw" placeholder="Passcode" onkeyup="enableInputVal('#infrMmPw',$('#infrMmPw').val())">
				
			</div>
			<div class="inputDiv" id="infrMmPwChkDiv">
				<!-- input 2-1 -->
				<input type="password" id="infrMmPwChk" class="memberInput" name="infrMmPwChk" placeholder="Passcode Check" onkeyup="enableInputVal('#infrMmPwChk',$('#infrMmPwChk').val())">
			
			</div>
			<div class="inputDiv" id="memberNameDiv">
				<!-- input 3 -->
				<input type="text" id="memberName" class="memberInput" name="memberName" placeholder="Name" onkeyup="enableInputVal('#memberName',$('#memberName').val())">
				
			</div>
			<div class="inputDiv" id="infrMmNicknameDiv">
				<!-- input 4 -->
				<input type="text" id="infrMmNickname" class="memberInput" name="infrMmNickname" placeholder="Nickname" onkeyup="enableInputVal('#infrMmNickname',$('#infrMmNickname').val())">
				
			</div>
			
			<div class="dobDiv">
				<div class="inputDiv" id="infrMmBodDiv" style="width:200px;">
					<input type="hidden" id="infrMmBod">
					<script>
						
					</script>
					<!-- input 5 -->
					<input class="datepicker memberInput" name="datepicker" onchange="getValBod('#infrMmBod')" autocomplete='off' readOnly>
				</div>
				<div class="inputDiv" style="width:200px; " id="infrMmGenderDiv">
					<!-- input 6 -->
					<input type="hidden" id="infrMmGender">
					<label class="genderRadio" for="infrMmGenderMan" name="infrMmGender">
						남자
						<input type="radio" id="infrMmGenderMan" class="memberInputRadio" name="infrMmGender" value="0" onchange="radioCheckVal()" >						
					</label>
					<label class="genderRadio" for="infrMmGenderWoman" name="infrMmGender">
						여자
						<input type="radio" id="infrMmGenderWoman"  class="memberInputRadio" name="infrMmGender" value="1" onchange="radioCheckVal()">						
					</label>
				</div>
			</div>
			
			
			
			<div class="telDiv">
				<div class="telNumDiv">
					<div class="inputDiv" id="infrMmPhoneDiv">
						<!-- input 7,8 -->
						<input type="number" id="infrMmPhone" class="memberInput" name="member" placeholder="Tel" onkeyup="enableInputVal('#infrMmPhone',$('#infrMmPhone').val())">
					</div>
					<div class="inputDiv" id="infrMmTelecomDiv">
						<!-- input 7,8 -->
						<select class="infrMmTelecom memberInput" id="infrMmTelecom" name="infrMmTelecom" onchange="addValiHtmlOnKeyEvent('#infrMmTelecom')">
							<option value="" disable>통신사</option>
							<option value="1">KT</option>
							<option value="2">SKT</option>
							<option value="2">LG</option>
							<option value="11">KT</option>
							<option value="12">SKT</option>
							<option value="13">LG</option>
							<option value="14">알뜰폰</option>
						</select>
					</div>
				</div>
				<div class="inputDiv" id="certiNumDiv">
					<div>
						<!-- input 9 -->
						<input type="number" id="AuthCode" class="memberInput" name="member" placeholder="인증번호 입력" onkeyup="onkeyupCerti()">
					</div>
					<div>
						<button type="button" class="getAuthCode memberInput" id="getAuthCode" onClick="getSMS()" >인증번호받기</button>
						<input type="hidden" id="certiNum"/>
					</div>
				</div>
			</div>
			<div class="emailDiv">
				<div class="inputDiv" id="infrMmEmailIdDiv">
					<input type="text" id="infrMmEmailId" class="memberInput emailVal" name="member" placeholder="Email" onchange="addValiHtmlOnKeyEvent('#infrMmEmailId')">
				</div>
				<div class="inputDiv" id="infrMmEmailAddressDiv">
					<select class="infrMmEmailAddress memberInput emailVal" id="infrMmEmailAddress" name="infrMmEmailAddress" onchange="addValiHtmlOnKeyEvent('#infrMmEmailAddress')">
						<option value="" disable>이메일</option>
						<option value="1">@naver.com</option>
						<option value="2">@gmail.com</option>
						<option value="3">@hanmail.com</option>
						<option value="4">@daum.com</option>
						<option value="5">@yahoo.com</option>
						<option value="20">@yahoo.com</option>
					</select>
				</div>
			</div>
			<div class="emailAuthDiv">
				<div class="inputDiv" id="infrMmEmailAuthDiv">
					<input type="text" id="infrMmEmailAuth" class="memberInput emailVal" name="infrMmEmailAuth" placeholder="이메일 인증번호를 입력해주세요" onkeyup="emailAuthCodeVali()">
				</div>
				<input type="hidden" id="infrMmEmailAuthCode">
				<button id="getInfrMmEmailAuth" type="button" class="memberInput" onclick="getEmailAuthCode()">이메일 인증하기</button>
			</div>
			<div class="getKkoAddr">
				<div class="inputDiv srchAddr">	
					<input type="number" class="memberInput" id="postcode" name="infrMmZip" placeholder="우편번호"  readonly onchange="addValiHtmlOnKeyEvent('#postcode')">	
					<input id="kkoAddr" class="memberInput" type="button" value="우편번호 찾기" style="margin-left:20px;">
				</div>
				<div class="inputDiv">
					<input type="text" class="memberInput" id="infrMmRoadAddress" name="memberAddrLoad" placeholder="도로명주소"   readonly>
				</div>
				<div class="inputDiv">
					<input type="text" class="memberInput" id="infrMmJibunAddress" name="memberAddrJibun" placeholder="지번주소"  readonly >
				</div>
				<div class="inputDiv">
					<input type="text" class="memberInput" id="infrMmDetailAddress" name="addrDetail" placeholder="상세주소">
				</div>
				<div class="inputDiv">
					<input type="text" class="memberInput" id="infrMmExtraAddress" name="addrLoca"  placeholder="참고항목" readonly>
				</div>
				<div class="inputDiv">
					<div class="srchAddr">
						<div class="inputDiv" id="infrMmLatDiv">
							<input id="infrMmLat" class="memberInput" type="text" name="addrLat" placeholder="위도" readonly>
						</div>
						<div class="inputDiv" id="infrMmLongDiv">
							<input id="infrMmLong" class="memberInput" type="text" name="addrLong" placeholder="경도" readonly>
						</div>
					</div>
				</div>
				<span id="guide" style="color:#999;display:none"></span>
				<div id="addressDetail-alert" class="alert-box"></div>
				<div id="addr-alert" class="alert-box"></div>
			</div>
			
			<input onClick='submitUserSignIn()' type="button" id="userSignInsubmit" class="memberInput formSubmit" name="member" value="회원가입" style="margin-top:20px" >
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