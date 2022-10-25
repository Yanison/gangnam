<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>sgWorld</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	
	<link href="./resources/user/sgworld/css/sgWorldTest.css" rel="stylesheet"/>
	<script src="./resources/user/sgworld/js/sgWorldDiv.js"></script>
</head>
<body>


<div class="sgWorld">
	<section class="div1">
		<article class ="canvasDiv">
			<canvas class="canvas" id="canvas">
			</canvas>
			<div class="camDiv" style="display:none;">
				<div class="littleCamDiv" onclick="fullCamDiv()">
					<div class="cam">
						cam
					</div>
				</div>
				<div class="littleCamDiv" onclick="fullCamDiv()">
					<div class="cam">
						cam
					</div>
				</div>
			</div>
		</article>
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
			<div class="chat">
				<div class="msgDiv">
					<div class="msgHeader">
						<i id="exitSgWorld"class="fa-solid fa-user"></i>
						<p>dateTime</p>
					</div>
					<div class="msgBody">
						<p class="magTextarea" id="magTextarea">
							msgTextarea
						</p>
					</div>
				</div>
				<div class="msgDiv">
					<div class="msgHeader">
						<i id="exitSgWorld"class="fa-solid fa-user"></i>
						<p>dateTime</p>
					</div>
					<div class="msgBody">
						<p class="magTextarea" id="magTextarea">
							msgTextarea
						</p>
					</div>
				</div>
				<div class="msgDiv">
					<div class="msgHeader">
						<i id="exitSgWorld"class="fa-solid fa-user"></i>
						<p>dateTime</p>
					</div>
					<div class="msgBody">
						<p class="magTextarea" id="magTextarea">
							msgTextarea
						</p>
					</div>
				</div>
				<div class="msgDiv">
					<div class="msgHeader">
						<i id="exitSgWorld"class="fa-solid fa-user"></i>
						<p>dateTime</p>
					</div>
					<div class="msgBody">
						<p class="magTextarea" id="magTextarea">
							msgTextarea
						</p>
					</div>
				</div>
				<div class="msgDiv">
					<div class="msgHeader">
						<i id="exitSgWorld"class="fa-solid fa-user"></i>
						<p>dateTime</p>
					</div>
					<div class="msgBody">
						<p class="magTextarea" id="magTextarea">
							msgTextarea
						</p>
					</div>
				</div>
				<div class="msgDiv">
					<div class="msgHeader">
						<i id="exitSgWorld"class="fa-solid fa-user"></i>
						<p>dateTime</p>
					</div>
					<div class="msgBody">
						<p class="magTextarea" id="magTextarea">
							msgTextarea
						</p>
					</div>
				</div>
				<div class="msgDiv">
					<div class="msgHeader">
						<i id="exitSgWorld"class="fa-solid fa-user"></i>
						<p>dateTime</p>
					</div>
					<div class="msgBody">
						<p class="magTextarea" id="magTextarea">
							msgTextarea
						</p>
					</div>
				</div>
				
			</div>
			<form class="inputMsgDiv">
				<div class="msgTo">
				<span>To.</span>
				<select>
					<option>NearBy</option>
					<option>EveryOne</option>
				</select>
				</div>
				<input type="text" class="inputMsg" name="msg" placeholder="Message...">
			</form>
		</article>
	</section>
	<section class="div2 utilDiv">
		<div class="left">
			<img id="sgLogo"class="sgLogo" src="./resources/common/images/sgLogo.png">
			<div class="divContents">
				<i class="fa-solid fa-user"></i>
			</div>
			<div class="divContents user">
				<span>
					<span style="color:#fff">userName</span>
					<i class="fa-solid fa-pen"></i>
				</span>
				<span>Online</span>
			</div>
			<div class="divContents">
				<i class="fa-solid fa-microphone-lines"></i>
				<!-- <i class="fa-solid fa-microphone-lines-slash"></i> -->
			</div>
			<div class="divContents">
				<!-- <i class="fa-solid fa-video-slash"></i> -->
				<i class="fa-solid fa-video"></i>
			</div>
		</div>
		<div class="right">
			<div class="divContents">
				<i class="fa-solid fa-screwdriver-wrench"></i>
			</div>
			<div class="divContents">
				<i class="fa-solid fa-comment"></i>
			</div>
			<div class="divContents" style="width:80px;">
				<i class="fa-solid fa-users"></i>
				<em style="font-size:15px;">#</em>
			</div>
			<div style="font-size:26px; color:#333A64; font-weight:700;">|</div>
			<div class="divContents" style="width:56px;" onclick="gohome()">
				<i class="fa-solid fa-door-open"></i>
			</div>
		</div>
	</section>
</div>

<div id="fullCamDiv" class="fullCamDiv" style="display:none;">
	<section class="top">
		<div class="left">
			<div class="littleCamDiv">
				<div class="cam">
					cam
				</div>
			</div>
		</div>
		<div class="right">
			<div class="bigCam">
			</div>
		</div>
	</section>
	<section class="bottom div2 utilDiv">
		<div class="left">
			<img id="sgLogo"class="sgLogo" src="./resources/common/images/sgLogo.png">
			
			<div class="divContents">
				<i class="fa-solid fa-microphone-lines"></i>
				<!-- <i class="fa-solid fa-microphone-lines-slash"></i> -->
			</div>
			<div class="divContents">
				<!-- <i class="fa-solid fa-video-slash"></i> -->
				<i class="fa-solid fa-video"></i>
			</div>
		</div>
		<div class="right">
			<div class="divContents" style="width:80px;">
				<i class="fa-solid fa-users"></i>
				<em style="font-size:15px;">#</em>
			</div>
			<div style="font-size:26px; color:#333A64; font-weight:700;">|</div>
			<div class="divContents" style="width:56px;" onclick="fullCamDivOff()">
				<i class="fa-solid fa-door-open"></i>
			</div>
		</div>
	</section>
</div>

</body>
</html>
<script src="./resources/user/sgworld/js/sgWorld.js"></script>
