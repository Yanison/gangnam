<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>sgWorld</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	
	<link href="./resources/user/sgworld/css/sgWorldTest.css" rel="stylesheet"/>
</head>
<body>


<div class="sgWorld">
	<section class="div1">
		<article class="canvasDiv">
			<canvas class="canvas" id="canvas">
			</canvas>
		</article>
		<article class="utilDiv chatDiv">
			<div class="headerDiv">
				<h6>SgWorld Room Title</h6>
				<i class="fa-solid fa-x"></i>
			</div>
			<p style="font-size:24px; width:100%;">Chat</p>
			<div class="showNumPeople">
				<div>
					<i class="fa-solid fa-location-dot"></i>
					<em style="font-size:14px;">num</em>
				</div>
			</div>
			<div class="chat">
				<div>a</div>
			</div>
		</article>
	</section>
	<section class="div2 utilDiv">
	
	</section>
</div>



</body>
</html>
<script src="./resources/user/sgworld/js/sgWorld.js"></script>