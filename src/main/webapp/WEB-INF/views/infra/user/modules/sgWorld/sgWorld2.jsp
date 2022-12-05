<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>sgWorld</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js" integrity="sha512-1QvjE7BtotQjkq8PxLeF6P46gEpBRXuskzIVgjFpekzFVF4yjRgrQvTG1MTOJ3yQgvTteKAcO7DSZI92+u/yZw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link href="/resources/user/sgworld/css/sgWorldTest.css" rel="stylesheet"/>
	
</head>
<body>
<input type="hidden" id="infrMmSeq" value="<c:out value="${infrMmSeq}"/>">
<input type="hidden" id="infrMmNickname" value="<c:out value="${infrMmNickname}"/>">
<input type="hidden" id="endPoint" value="<c:out value="${endPoint}"/>">
<div class="wrapper" style="display:flex">
	 <canvas id = "myCanvas" width ="1024" height = "768" style="background:#fff"></canvas>
	 <article class="utilDiv chatDiv">
		<div class="headerDiv">
			<h6>SgWorld Room Title</h6>
			<i id="extiRoom" class="fa-solid fa-x"></i>
		</div>
		<p style="font-size:24px; width:100%;">Chat</p>
		<div class="showNumPeople">
			<div>
				<i class="fa-solid fa-location-dot"></i>
				<em style="font-size:14px;">num</em>
			</div>
		</div>
		<div class="chat" id="sgwChat">
			
			
		</div>
		<div class="inputMsgDiv">
			<div class="msgTo">
			<span>To.</span>
			<select>
				<option>NearBy</option>
				<option>EveryOne</option>
			</select>
			</div>
			<input type="text" class="inputMsg" name="msg" id="inputMsg" placeholder="Message..." onkeypress="sendMsg(event)">
		</div>
	</article>
</div>
<section class="bottom div2 utilDiv">
		<div class="left">
			<img id="sgLogo"class="sgLogo" src="/../../resources/common/images/sgLogo.png">
			
			<div class="divContents">
				<i class="fa-solid fa-microphone-lines"></i>
				<<i class="fa-solid fa-microphone-lines-slash"></i>
			</div>
			<div class="divContents">
				<i class="fa-solid fa-video-slash"></i>
				<i class="fa-solid fa-video"></i>
			</div>
		</div>
		<div class="right">
			<div class="divContents" style="width:80px;" onclick="sendUserList()">
				<!-- onclick="fullCamDivOff()" -->
				<i class="fa-solid fa-users"></i>
				<em style="font-size:15px;">#</em>
			</div>
			<div style="font-size:26px; color:#333A64; font-weight:700;">|</div>
			<div class="divContents" style="width:56px;" onclick="leaveAndDel()">
				<i id="leaveDoor" class="fa-solid fa-door-open" ></i>
			</div>
		</div>
	</section>

</body>
</html>
<script src="/resources/user/sgworld/js/sgWorldDiv.js"></script>
<script src="/resources/user/sgworld/js/sgWorldRequets.js"></script>
<script src="/resources/user/sgworld/js/sgWorld.js"></script>