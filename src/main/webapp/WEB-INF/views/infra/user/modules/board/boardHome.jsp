<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head> 
	<meta charset="UTF-8">
	<meta name=viewport"" content="width=device-width, initial-scale=1.0">
	<title>sgworld | 싸게월드</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	<script src="https://kit.fontawesome.com/059fbc3cf8.js" crossorigin="anonymous"></script>
	<link href="/resources/user/board/css/boardList.css" rel="stylesheet">
	<!-- <link href="/resources/user/home/css/header.css" rel="stylesheet"> -->
	<link href="/resources/user/home/css/footer.css" rel="stylesheet">
</head>
<body>
	<!-- header s -->
	<%@ include file="../../common/header.jsp" %>
	<!-- header e -->
<form method="post" id="form" name="form">
	<input type="hidden" id="infrMmSeq" name="infrMmSeq" value="${infrMmSeq}">
	<input type="hidden" name="bdSeq" value="${dto.bdSeq }">
	<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage }" default="1"/>">
	<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow }"/>">
	<!-- contend s -->
	<section class=" container boardBody">
		<div class="boarderTitle">
			<a>게시판</a><a>자유게시판</a> <!-- 게시판 타이틀 -->
		</div>
		<section class="boarder row">
		<c:choose>
			<c:when test="${fn:length(list) eq 0 }">
				<div>
					<p>게시글이 없습니다.</p>
				</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list}" var="list" varStatus="status">
			<article class="board col-4">
				<div class="post1" style="curcor: pointer;">
					<div class="state1">
						<c:if test="${resultInfo.frstRegisterPnttm>=nowday }"><span>NOW</span></c:if> <!-- 작성상태(최신글, 조회수 높은 글 등) -->
					</div>
					<div class="title1">
						<p class="bdTitle" style="cursor: pointer" onClick="goBoardView(<c:out value="${list.bdSeq}"/>)">
							<c:out value="${list.bdTitle }"/>
						</p>
						<!-- <p > 
							 
						</p> 글 제목 -->
					</div>
					<div class="contentBox">
						<div>${list.bdContent }</div> <!-- 글 내용(게시판 리스트에 보이는 글자 수 제한 둘 것) -->
					</div>
					<div class="userName">
						<p><c:out value="${list.infrMmNickname }" /></p><!-- 작성자 닉네임 -->
					</div>
					<div class="icon">
						<i class="fa-solid fa-eye"> <c:out value="${list.viewCount }" /></i> <!-- 조회수 -->
						<i class="fa-regular fa-heart"> <c:out value="${list.likeCount }" /></i> <!-- 좋아요 -->
						<i class="fa-regular fa-message"> <c:out value="${list.commentCount }" /></i> <!-- 댓글수 -->
					</div>
				</div>
			</article>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</section>
	</section>
	<!-- contend e -->
	<!-- pagination s -->
	<%@include file="../../common/userPagination.jsp"%>
	<!-- pagination e -->
</form>	
	<!-- footer s -->
	<%@ include file="../../common/footer.jsp" %>
	<!-- footer e -->
	<script type="text/javascript">
		var goUrlBoardRegForm = "/board/boardWrite";
		var goUrlBoardView = "/board/boardView/"
		var goUrlList = "/board/boardList";
		
		var form = $("form[name=form]");
		var seq = $("input:hidden[name=bdSeq]");
		
		$("#btnBoardRegForm").on("click", function(){
			$(location).attr("href", goUrlBoardRegForm);
		})
		
		
		
		/* goBoardView = function(keyValue) {
			var keyValue = seq.val(keyValue);
			form.attr("action", goUrlBoardView+keyValue).submit();
		} */
		goList = function(thisPage) {
			$("input:hidden[name=thisPage]").val(thisPage);
			form.attr("action", goUrlList).submit();
		}
		function goBoardView(e){
			/* console.log("bdSeq :: "+ e)
			form.attr("action", goUrlBoardView).submit(); */
			seq.val(e);
			form.attr("action", goUrlBoardView+e).submit();
		}
	</script>
</body>
</html>