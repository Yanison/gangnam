<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>

<!-- 답글에 답글 버튼 누를시 입력창 뜨게 하고, 로그인 없이 누르면 로그인 페이지로 연결되게끔 -->
<c:choose>
	<c:when test="${fn:length(list) eq 0}">
	<div class="commentContent">
		<p>댓글이 없습니다. 댓글을 작성해주세요.</p>
	</div>
	</c:when>
	<c:otherwise>
		<c:forEach items="${list }" var="list" varStatus="status">
	<div class="commentList">
		<div class="commentItem">
			<div class="">
				<input type="hidden" name="cmSeq" value="${list.cmSeq }">
				<span><c:out value="${list.infrMmNickname }" />(<c:out value="${list.infrMmId }" />)</span>
			</div>
			<div class="dropstart">
				<a type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-ellipsis-vertical"></i></a>
				<ul class="dropdown-menu">
					<li><button class="dropdown-item" type="button" id="btnCommentDele" style="font-size: x-small; cursor: pointer;">삭제</button></li>
				</ul>
			</div>
		</div>
		<div class="commentContent">
			<p><c:out value="${list.content }" /></p>
		</div>
		<div class="">
			<p><!-- 2022-11-29 15:57 --><c:out value="${list.regDatetime }" /></p>
		</div>
		<div class="commentBtnBox">
			<div class="">
				<button class="commentBtn" style="text-decoration: none;" type="button" onclick="reComment(<c:out value="${list.cmSeq }"/>)">답글</button>
			</div>
			<div class="">
				<div class="">
					<a><i class="fa-regular fa-heart"></i></a>
				</div>
			</div>
		</div>
	</div>
	<div class="reCommentBox" style="display: none;">
		<div class="commentHead">
			<div class="">
				<span><c:out value="${infrMmName }" />(<c:out value="${infrMmId }" />)</span>
			</div>
			<div>
				<button class="writeBtn1" id="btnComment">등록</button>
			</div>
		</div>
		<div class="writeBox">
			<div id="writeDiv" class="writeDiv">
				<textarea class="textBox" style="width: 680px; height: 90px; resize: none;" name="content" maxlength="200" placeholder="댓글을 입력하세요."></textarea>
				<div class="textLengthWrap">
				    <span class="textCount">0</span>
				    <span class="textTotal">/200</span>
				</div>
			</div>	
		</div>
	</div>
		</c:forEach>
	</c:otherwise>
</c:choose>

<!-- pagination s -->
<%@include file="../../common/userPagination.jsp"%>
<!-- pagination e -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script type="text/javascript">
	
	var seq = $("input:hidden[name=cmSeq]");
	/*
	$('#commentBtn_').on('click', function() {
		$(".reCommentBox").show();
	});
	*/
	var num = $("input:hidden[name=cmSeq]");
	
	goReComment = function reComment(keyValue) {
		num.val(keyValue);
		$(".reCommentBox").show();
	}	
	
	goForm = function(keyValue) {
		/* if(key != 0) seq.val(btoa(key)); */
		seq.val(keyValue);
		form.attr("action", goUrlForm).submit();
	}
	
	goView = function(keyValue) {
		seq.val(keyValue);
		form.attr("action", goUrlBoardView).submit();
	}
	
	goList = function(thisPage) {
		$("input:hidden[name=thisPage]").val(thisPage);
		setLita();
	}
	

	
</script>