<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="UTF-8">
	<meta name=viewport"" content="width=device-width, initial-scale=1.0">
	<title>sgworld | 싸게월드</title>
	
	<script src="https://kit.fontawesome.com/059fbc3cf8.js" crossorigin="anonymous"></script>
	<link href="../css/user/boardView.css" rel="stylesheet">
</head>
<body>
	<!-- header s -->
	<%@ include file="../home/header.jsp" %>
	<!-- header e -->
	
	<!-- contend s -->
	<section>
		<div class="boarderTitle">
			<h2>자유게시판</h2> <!-- 게시판 타이틀 -->
		</div>
		<section class="boarder">
			<article class="board">
				<div class="boardHead">
					<div>
						<h1>다들 매달 찍히는 월급 얼마정도야</h1>
					</div>
					<div>
						<p>C*******</p>
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
							우리반 여자아이 중에 발표를 절대 안 하는 아이가 있는데, 오늘 구술평가라 모든 학생 돌아가며 쓴 내용 발표를 해야했어.<br><br>
							얘가 일어나서 아무말도 안하고 못하겠다고 하길래 내가 괜찮다고 틀려도 된다 이미 잘 썼으니 그대로 읽기만 하면 된다. 
							선생님이 그냥 발표 안했다고 0점 주면 끝날 일이라도 그렇게 하지 않는 이유는 00이가 앞으로도 자기 자신을 믿고 좀더 
							자신감을 가졌으면 좋겠어서 이렇게 기회를 주는거다. 다른 친구들도 선생님과 같은 마음으로 응원하고 있으니 편안한 마음으로 
							읽어봐라 작게 읽어도 괜찮다 했거든?<br><br>
							결국 자기 순서 때 못하고, 아이들 다 끝나고 두번째 기회에는 눈물 뚝 흘리고, 마지막 세번째 기회에 읽기 시작했어.<br>
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
							<p>댓글 200</p>
						</div>
						<div class="commentHead">
							<p class="writeBtn" type="button">작성하기</p>
						</div>
					</div>
					<div class="commentBody">
						<div>
							<p>g*******</p>
						</div>
						<div>
							<p>6년차 실수령 300</p>
						</div>
						<div class="iconComment">
							<i class="fa-regular fa-clock"> 5분</i>
							<i class="fa-regular fa-thumbs-up"> 13</i>
							<i class="fa-regular fa-message"> 10</i>
						</div>
					</div>
					<div class="commentBody">
						<div>
							<p>k*****</p>
						</div>
						<div>
							<p>들어오면 뭐해 빠져나가면 없음</p>
						</div>
						<div class="iconComment">
							<i class="fa-regular fa-clock"> 5분</i>
							<i class="fa-regular fa-thumbs-up"> 13</i>
							<i class="fa-regular fa-message"> 10</i>
						</div>
					</div>
					<div class="commentBody">
						<div>
							<p>r*****</p>
						</div>
						<div> 
							<p>세후 580</p>
						</div>
						<div class="iconComment">
							<i class="fa-regular fa-clock"> 5분</i>
							<i class="fa-regular fa-thumbs-up"> 13</i>
							<i class="fa-regular fa-message"> 10</i>
						</div>
					</div>
					<div class="commentPlus">
						<p>더보기<i class="fa-solid fa-chevron-down"></i></p>
					</div>
				</div>
			</article>
		</section>
	</section>
	<!-- contend e -->
	
	<!-- footer s -->
	<%@ include file="../home/footer.jsp" %>
	<!-- footer e -->
</body>
</html>