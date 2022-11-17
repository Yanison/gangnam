<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name=viewport"" content="width=device-width, initial-scale=1.0">
	<title>sgworld | 싸게월드</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	<script src="https://kit.fontawesome.com/059fbc3cf8.js" crossorigin="anonymous"></script>
	<link href="/resources/user/board/css/boardView.css" rel="stylesheet">
	<link href="/resources/user/home/css/header.css" rel="stylesheet">
	<link href="/resources/user/home/css/footer.css" rel="stylesheet">
</head>
<body>
	<!-- header s -->
	<%@ include file="../../common/header.jsp" %>
	<!-- header e -->
	<form id="form" name="form" autocomplete="off" enctype="multipart/form-data">
	<!-- contend s -->
	<section>
		<div class="boarderTitle">
			<h2>자유게시판</h2> <!-- 게시판 타이틀 -->
		</div>
		<section class="boarder">
			<article class="board">
				<div class="boardHead">
					<div>
						<h3><c:out value="${item.bdTitle }"/></h3>
					</div>
					<div>
						<p><c:out value="${item.infrMmNickname }"/></p>
					</div>
					<div class="icon">
						<i class="fa-regular fa-clock"> 10-19</i>
						<i class="fa-solid fa-eye"> 990</i>
						<i class="fa-regular fa-message"> 200</i>
					</div>
				</div>
				<div class="boarderBody">
					<div class="content">
						<p>
							<c:out value="${item.bdContent }"/>
						</p> <!-- 게시글 내용 -->
					</div>
					<div class="icon">
						<i class="fa-regular fa-thumbs-up"> 99</i>
						<i class="fa-regular fa-message"> 200</i>
					</div>
				</div>
				<div>
					<div class="boarderFooter">
						<div>
							<p>전체댓글수 200</p>
						</div>
						<div class="commentHead">
							<button class="writeBtn1" id="writeBtn">작성하기</button>
						</div>
					</div>
					<div id="writeDiv" class="writeDiv">
						<textarea style="width: 735px; height: 70px; resize: none;"></textarea>
					</div>
				<c:choose>
					<c:when test="${fn:length(list) eq 0 }">
						<div>
							<p>댓글이 없습니다. 댓글을 남겨주세요.</p>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="list" varStatus="status">
					<div class="commentBody">
						<div>
							<p><c:out value="${list.infrMmNickname }" /></p>
						</div>
						<div>
							<c:forEach items="${listUploaded}" var="listUploaded" varStatus="statusUploaded">
								<c:if test="${listUploaded.type eq type }">
									<li id="li_<c:out value="${type }"/>_<c:out value="${listUploaded.sort }"/>" class="list-group-item d-flex justify-content-between align-items-center">
									<a href="<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>" download="<c:out value="${listUploaded.originalName }"/>" class="text-decoration-none"><c:out value="${listUploaded.originalName }"/></a>
									<span class="badge bg-danger rounded-pill" onClick="delLi('<c:out value="${name }"/>', <c:out value="${type }"/>,<c:out value="${listUploaded.sort }"/>, <c:out value="${listUploaded.seq }"/>, '<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>')"><i class="fa-solid fa-x" style="cursor: pointer;"></i></span>
									</li>
								</c:if>
							</c:forEach>
							<p><c:out value="${list.content }" /></p>
							<c:forEach items="${listUploaded}" var="listUploaded" varStatus="statusUploaded">
								<c:if test="${listUploaded.type eq type }">
									<div id="imgDiv_<c:out value="${type }"/>_<c:out value="${listUploaded.sort }"/>" style="display: inline-block; height: 95px;">
										<img src="<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>" class="rounded" width= "85px" height="85px" style="cursor:pointer;" onClick="openViewer(<c:out value="${listUploaded.type }"/>, <c:out value="${listUploaded. sort }"/>);">
										<div style="position: relative; top:-85px; left:5px"><span style="color: red; cursor:pointer;" onClick="delImgDiv('<c:out value="${name }"/>', <c:out value="${type }"/>,<c:out value="${listUploaded.sort }"/>, <c:out value="${listUploaded.seq }"/>, '<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>')">X</span></div>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<div class="iconComment">
							<i class="fa-regular fa-clock"> <c:out value="${list.regDatetime }" /></i>
							<i class="fa-regular fa-thumbs-up"> 13</i>
							<i class="fa-regular fa-message"> 10</i>
						</div>
					</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</div>
			</article>
		</section>
	</section>
	<!-- contend e -->
	</form>
	<!-- footer s -->
	<%@ include file="../../common/footer.jsp" %>
	<!-- footer e -->
	
	<script type="text/javascript">
		$(document).ready(function(){
			
		})
	</script>
</body>
</html>