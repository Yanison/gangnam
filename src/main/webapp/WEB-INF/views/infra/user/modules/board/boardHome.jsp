<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head> 
	<meta charset="UTF-8">
	<meta name=viewport"" content="width=device-width, initial-scale=1.0">
	<title>sgworld | 싸게월드</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	<script src="https://kit.fontawesome.com/059fbc3cf8.js" crossorigin="anonymous"></script>
	<link href="/resources/user/board/css/boardList.css" rel="stylesheet">
</head>
<body>
	<!-- header s -->
	<%@ include file="../../common/header.jsp" %>
	<!-- header e -->
	
	<!-- contend s -->
	<section>
		<div class="boarderTitle">
			<h2>자유게시판</h2> <!-- 게시판 타이틀 -->
		</div>
		<section class="boarder">
			<article class="board">
				<div class="post1">
					<div class="state1">
						<span>NOW</span> <!-- 작성상태(최신글, 조회수 높은 글 등) -->
					</div>
					<div class="title1">
						<span>교사인데 오늘 진짜 마음 울렁울렁함..</span> <!-- 글 제목 -->
					</div>
					<div>
						<p>해당 게시글에 대한 내용이 들어가는 곳입니다.</p> <!-- 글 내용(게시판 리스트에 보이는 글자 수 제한 둘 것) -->
					</div>
					<div>
						<p>nickname</p> <!-- 작성자 닉네임 -->
					</div>
					<div class="icon">
						<i class="fa-solid fa-eye">99</i> <!-- 조회수 -->
						<i class="fa-regular fa-thumbs-up">99</i> <!-- 좋아요 -->
						<i class="fa-regular fa-message">99</i> <!-- 댓글수 -->
					</div>
				</div>
			</article>
			<article class="board">
				<div class="post1">
					<div class="state2">
						<span>HOT</span>
					</div>
					<div class="title1">
						<span>기대 없었는데 맥카페 존맛이네</span>
					</div>
					<div>
						<p>해당 게시글에 대한 내용이 들어가는 곳입니다.</p>
					</div>
					<div>
						<p>nickname</p>
					</div>
					<div class="icon">
						<i class="fa-solid fa-eye">99</i>
						<i class="fa-regular fa-thumbs-up">99</i>
						<i class="fa-regular fa-message">99</i>
					</div>
				</div>
			</article>
		</section>
		<section class="boarder">
			<article class="board">
				<div class="post1">
					<div class="state1">
						<span></span>
					</div>
					<div class="title1">
						<span>31살까지 1억</span>
					</div>
					<div>
						<p>해당 게시글에 대한 내용이 들어가는 곳입니다.</p>
					</div>
					<div>
						<p>nickname</p>
					</div>
					<div class="icon">
						<i class="fa-solid fa-eye">99</i>
						<i class="fa-regular fa-thumbs-up">99</i>
						<i class="fa-regular fa-message">99</i>
					</div>
				</div>
			</article>
			<article class="board">
				<div class="post1">
					<div class="state1">
						<span></span>
					</div>
					<div class="title1">
						<span>남자들은 소개팅녀 맘에 들면 어떻게함??</span>
					</div>
					<div>
						<p>해당 게시글에 대한 내용이 들어가는 곳입니다.</p>
					</div>
					<div>
						<p>nickname</p>
					</div>
					<div class="icon">
						<i class="fa-solid fa-eye">99</i>
						<i class="fa-regular fa-thumbs-up">99</i>
						<i class="fa-regular fa-message">99</i>
					</div>
				</div>
			</article>
		</section>
		<section class="boarder">
			<article class="board">
				<div class="post1">
					<div class="state1">
						<span></span>
					</div>
					<div class="title1">
						<span>결혼식 전에 청첩장 돌리고...</span>
					</div>
					<div>
						<p>해당 게시글에 대한 내용이 들어가는 곳입니다.</p>
					</div>
					<div>
						<p>nickname</p>
					</div>
					<div class="icon">
						<i class="fa-solid fa-eye">99</i>
						<i class="fa-regular fa-thumbs-up">99</i>
						<i class="fa-regular fa-message">99</i>
					</div>
				</div>
			</article>
			<article class="board">
				<div class="post1">
					<div class="state1">
						<span></span>
					</div>
					<div class="title1">
						<span>아아아 졸려 ㅜㅜ</span>
					</div>
					<div>
						<p>해당 게시글에 대한 내용이 들어가는 곳입니다.</p>
					</div>
					<div>
						<p>nickname</p>
					</div>
					<div class="icon">
						<i class="fa-solid fa-eye">99</i>
						<i class="fa-regular fa-thumbs-up">99</i>
						<i class="fa-regular fa-message">99</i>
					</div>
				</div>
			</article>
		</section>
		<section class="boarder">
			<article class="board">
				<div class="post1">
					<div class="state1">
						<span></span>
					</div>
					<div class="title1">
						<span>아 진짜 연애하고 싶다</span>
					</div>
					<div>
						<p>해당 게시글에 대한 내용이 들어가는 곳입니다.</p>
					</div>
					<div>
						<p>nickname</p>
					</div>
					<div class="icon">
						<i class="fa-solid fa-eye">99</i>
						<i class="fa-regular fa-thumbs-up">99</i>
						<i class="fa-regular fa-message">99</i>
					</div>
				</div>
			</article>
			<article class="board">
				<div class="post1">
					<div class="state1">
						<span></span>
					</div>
					<div class="title1">
						<span>나랑 친구할사람?</span>
					</div>
					<div>
						<p>해당 게시글에 대한 내용이 들어가는 곳입니다.</p>
					</div>
					<div>
						<p>nickname</p>
					</div>
					<div class="icon">
						<i class="fa-solid fa-eye">99</i>
						<i class="fa-regular fa-thumbs-up">99</i>
						<i class="fa-regular fa-message">99</i>
					</div>
				</div>
			</article>
		</section>
	</section>
	<!-- contend e -->
	
	<!-- footer s -->
	<%@ include file="../../common/footer.jsp" %>
	<!-- footer e -->
</body>
</html>