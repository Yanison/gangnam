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
	<link href="/resources/user/board/css/boardForm.css" rel="stylesheet">
	<link href="/resources/user/home/css/header.css" rel="stylesheet">
	<link href="/resources/user/home/css/footer.css" rel="stylesheet">
</head>
<body>
	<!-- header s -->
	<%@ include file="../../common/header.jsp" %>
	<!-- header e -->
	<form method="post" id="form" name="form" autocomplete="off" enctype="multipart/form-data">
	<!-- contend s -->
	<section class="body">
		<div class="boardFormHead">
			<div class="boardFormHead1">
				<div>
					<i class="fa-solid fa-xmark"></i>
				</div>
				<div>
					<h2>글쓰기</h2> <!-- 게시판 타이틀 -->
				</div>
				<div class="regBtn">
					<p type="button" id="btnSave">등록</p>
				</div>
			</div>
		</div>
		<section>
			<article class="board">
				<div class="boardHead">
					<div class="boardFormTitle">
						<i class="fa-solid fa-globe"></i>
						<h4>자유게시판</h4>
					</div>
				</div>
				<div class="boardBody">
					<div class="boardTitle">
						<input class="contentTitle" type="text" id="bdTitle" name="bdTitle" value="<c:out value="${dto.bdTitle }" />" placeholder="글 제목을 입력해 주세요.">
					</div>
					<div class="boardContent">
						<textarea class="boardFormContent" id="bdContent" name="bdContent" placeholder="내용을 입력해 주세요."><c:out value="${dto.bdContent }" /></textarea>
					</div>
				</div>
				<div class="boardFooter">
					<div class="boardIcon">
						<div class="icon">
							<a href="#"><i class="fa-solid fa-camera"></i></a>
							<a href="#"><i class="fa-solid fa-at"></i></a>
							<a href="#"><i class="fa-solid fa-hashtag"></i></a>
							<a href="#"><i class="fa-regular fa-file"></i></a>
							<a href="#"><i class="fa-solid fa-code"></i></a>
						</div>
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
		var goUrlBoardInst = "/board/boardInst";
		var goUrlBoardRegForm = "/board/boardWrite";
		
		var form = $("form[name=form]");
		
		$("#btnSave").on("click", function(){
			form.attr("action", goUrlBoardInst).submit();
		})
		
		$("#btnBoardRegForm").on("click", function(){
			$(location).attr("href", goUrlBoardRegForm);
		})
	</script>
</body>
</html>