<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<html>
<head>
	<title>SGWorld</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	 
	<link href="/gangnam/resources/user/home/css/home.css" rel="stylesheet">
	<script src="/gangnam/resources/user/home/js/home.js"></script>
	
	<!-- homeChat -->
	<link href="/gangnam/resources/common/css/homeChat.css" rel="stylesheet">
	<script src="/gangnam/resources/common/js/homeChat.js"></script>
</head>
<body>
	
	<header>
		<%@ include file="../../common/header.jsp"%> 
	</header>
	<section class="bodyWrapper">
		
		<article class="mySgWorld">
			<c:choose>
				<c:when test="${not empty sessSgw}">
					<button class="creatMySgWorld" id="goMySgWorld" onclick="goMySgwolrd($('#sessMmSeq').val())">
						Get in SgWorld 
					</button>
				</c:when>
				<c:otherwise>
					<button class="creatMySgWorld" id="creatMySgWorld" onclick="showModal()" rel="modal:open"> 
						Create SgWorld
					</button>
				</c:otherwise>
			</c:choose>
		</article>
		<article class="onLiveSgWorld">
			<!-- homeChat -->
				
			<!-- homeChat -->
			<h1 class="onLiveSgWorldTitle">Onlive</h1>
			<div class="onSgWorldListDiv">
				<!-- forEach로 데이터 뿌려주세요 -->
					<div class="container text-center">
					  <div class="row row-cols-3">
					  <c:forEach items="${sgwList}" var="sl" varStatus="status">
					    <div class="col">
						    <div  id="${sl.sgwLink}" class="SgWorldPreviewDiv">
								<a class="SgWorldPreview" href="./sgWorld/join/${sl.sgwLink}">
									<img scr="/gangnam/resources/common/images/pepe.png">
								</a>
								<div class="sgwTitle">
									<div>
										<i class="fa-solid fa-circle"></i>
										<span>${sl.sgwTitle}</span>
									</div>
									<div>
										<i class="fa-solid fa-eye"></i>
										<em>${sl.usersNum}</em>
									</div>
								</div>
							</div>
						</div>
						 </c:forEach>
					  </div>
					</div>
				<div class="onSgWorldList onSgWorldList1">
					
				</div>
				<!-- forEach로 데이터 뿌려주세요 -->
				<!-- forEach로 데이터 뿌려주세요 -->
				<div class="onSgWorldList onSgWorldList2">
					
				</div>
				<!-- forEach로 데이터 뿌려주세요 -->
			</div>
		</article>
		
		<div class="sideChatDiv">
			<div>
				<div class="chatHeader">
					sgWorld Chat
				</div>
				<div class="chatBody">
				</div>
				<div class="chatFoot">
					<input id="homeChat" type="text" placeholder="message" required onkeypress="sendMsg(event)">
				</div>
			</div>
			
		</div>
	</section>
	<footer>
		<%@include file="../../common/footer.jsp" %>
	</footer>
	<div id="modalDiv" class="modalDiv"  style="display:none">
			<%@include file="./createOption.jsp" %>
	</div>
</body>
</html>
