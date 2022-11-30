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

</body>
</html>
<script src="/resources/user/sgworld/js/sgWorldDiv.js"></script>
<script src="/resources/user/sgworld/js/sgWorldRequets.js"></script>
<script src="/resources/user/sgworld/js/sgWorld.js"></script>