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
<input type="hidden" id="sgwSeq" value="<c:out value="${sgwSeq}"/>">
<div class="mainDiv">
<div class="wrapper" style="display:flex; height:93%">
	 <canvas id = "myCanvas" width ="1024" height = "768" style="background:#fff"></canvas>
	 
	 <div id="camDiv" class="camDiv" style="display:none;">
		<div class="littleCamDiv" onclick="fullCamDiv()">
			<div class="cam myCam" onclick="whosCam(this)">
				<video id="myFace" autoplay playsinline width="200" height="160"></video>
			</div>
		</div>
		<div class="littleCamDiv" onclick="fullCamDiv()">
			<div class="cam myCam" onclick="whosCam(this)">
				<video id="yourFace" autoplay playsinline width="200" height="150"></video>
			</div>
		</div>
	</div>
	 <article class="utilDiv chatDiv">
		<div class="headerDiv">
			<h6>SgWorld Room Title</h6>
			<i id="extiRoom" class="fa-solid fa-x" onclick="confirmLeaving()"></i>
		</div>
		<p style="font-size:24px; width:100%;">Chat</p>
		<div class="showNumPeople">
			<div>
				<i  class="fa-solid fa-location-dot"></i>
				<em id="usersNum2" style="font-size:14px;" >num</em>
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
<section class="bottom div2 utilDiv" style="width:1300px;">
	<div class="left">
		<img id="sgLogo"class="sgLogo" src="/../../resources/common/images/sgLogo.png">
		
		<div class="divContents">
			<button  id="micOff" onclick="onoff(this)" value="0">
				<i class="fa-solid fa-microphone-lines onOffMic"></i>
			</button>
			<button id="micOn" onclick="onoff(this)" value="1">
				<i class="fa-solid fa-microphone-lines-slash onOffMic"></i>
			</button>
			
		</div>
		<div class="divContents">
			<button  id="camOff" onclick="onoff(this)" value="0">
				<i class="fa-solid fa-video-slash onOffCam"></i>
			</button>
			<button  id="camOn" onclick="onoff(this)" value="1">
				<i class="fa-solid fa-video onOffCam"></i>
			</button>
		</div>
	</div>
	<div class="right">
		<div class="divContents" style="width:80px;" >
			<!-- onclick="fullCamDivOff()" -->
			<i class="fa-solid fa-users"></i>
			<em id="usersNum"style="font-size:15px;">#</em>
			<input type="hidden" id="ipUsersNum" onchange="sendUsersNum()">
		</div>
		<div style="font-size:26px; color:#333A64; font-weight:700;">|</div>
		<div class="divContents" style="width:56px;" onclick="confirmLeaving()">
			<i id="leaveDoor" class="fa-solid fa-door-open" ></i>
		</div>
	</div>
</section>

</div>

<div id="fullCamDiv" class="fullCamDiv" style="display:none;">
	<div class="fullCamDivHeader" onclick="fullCamDivOff()">
		전체화면 종료
		<!-- <div class="left">
			<span></span>
		</div>
		<div class="right">
			<span></span>
		</div> -->
	</div>
	<section class="top">
		<div class="left">
			<div id="littleCamDiv" class="littleCamDiv">
				<div id="myCam" class="cam myCam" onclick="whosCam(this)">
					cam
				</div>
			</div>
		</div>
		<div class="right">
			<div id="bigCam" class="bigCam">
				<div id="yourCam" class="cam yourCam" onclick="whosCam(this)">
					cam
				</div>
			</div>
		</div>
	</section>
</div>

 <!--  <video muted autoplay loop class="backgroundVid">
    <source src="/resources/common/video/space.mp4" type="video/mp4">
    <strong>Your browser does not support the video tag.</strong>
  </video> -->
</body>
</html>
<script src="/resources/user/sgworld/js/sgworldCam.js"></script>
<script src="/resources/user/sgworld/js/sgWorldRequets.js"></script>
<script src="/resources/user/sgworld/js/sgWorld.js"></script>