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
	<input type="hidden" id="infrMmSeq" name="infrMmSeq" value="${infrMmSeq}">
	<input type="hidden" id="bdSeq" name="bdSeq" value="${item.bdSeq}">
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
						<i class="fa-solid fa-eye"> <c:out value="${item.viewCount }" /></i>
						<i class="fa-regular fa-message"> 200</i>
					</div>
				</div>
				<div class="boarderBody">
					<div class="content">
						${item.bdContent }<!-- 게시글 내용 -->
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