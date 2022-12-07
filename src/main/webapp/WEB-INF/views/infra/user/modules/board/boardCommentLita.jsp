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
				<div class="testDiv">
					<input type="hidden" value="${list.cmSeq}">
					<%-- <button class="commentBtn" id="reCommentBtn" style="text-decoration: none;" type="button" onclick="thisVal(this)" value="${list.cmSeq }">답글</button> --%>
					<button class="commentBtn" id="reCommentBtn" style="text-decoration: none;" type="button" onclick="showRecomment(this)" value="${list.cmSeq }">답글</button>
				</div>
				<div class="">
					<div class="">
						<a><i class="fa-regular fa-heart"></i></a>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 답글 s -->
		<div id="re_${list.cmSeq }" style="display: none;">
			<c:choose>
				<c:when test="${fn:length(listt) eq 0}">
					<%-- <c:out value="${fn:length(listt) }"/> --%>
					<%-- <c:out value="${vo.selectReCommentCount }"/> --%>
					<p>답글이 없습니다. 답글을 작성해주세요.</p>
					<div class="commentHead">
						<div class="">
							<span><c:out value="${list.infrMmNickname }" />(<c:out value="${infrMmId }" />)</span>
						</div>
						<div>
							<button class="writeBtn1" id="btnReComment">등록</button>
						</div>
					</div>
					<div class="writeBox">
						<div id="writeDiv" class="writeDiv">
							<textarea class="reTextBox" style="width: 680px; height: 90px; resize: none;" name="content" maxlength="200" placeholder="답글을 입력하세요."></textarea>
							<div class="textLengthWrap">
							    <span class="reTextCount">0</span>
							    <span class="textTotal">/200</span>
							</div>
						</div>	
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${listt }" var="listt" varStatus="status">
						<p><c:out value="${listt.reContent }"/></p>
					</c:forEach>
					<div class="commentHead">
						<div class="">
							<span><c:out value="${infrMmName }" />(<c:out value="${infrMmId }" />)</span>
						</div>
						<div>
							<button class="writeBtn1" id="btnReComment2">등록</button>
						</div>
					</div>
					<div class="writeBox">
						<div id="writeDiv" class="writeDiv">
							<textarea class="textBox" style="width: 680px; height: 90px; resize: none;" name="Recontent" maxlength="200" placeholder="댓글을 입력하세요."></textarea>
							<div class="textLengthWrap">
							    <span class="textCount">0</span>
							    <span class="textTotal">/200</span>
							</div>
						</div>	
					</div>
				</c:otherwise>
			</c:choose>	
		</div>
		<!-- 답글 e -->
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
	
	/* function reComment(numm){
		$(".reCommentBox").show();
	} */
	
	//답글 보여주기
	function thisVal(val){
		console.log("this val :: " + $(val).val())
	}
	
	function showRecomment(val){
		var thisValue = $("div.testDiv button").val()
		var numm = $(val).val();
		var re = $('#re_'+numm);
		$.ajax({
			async: true 
			,cache: false
			,type: "post"
			,url: "/board/boardReCommentLita"
			,data : { "cmSeq" : $(val).val(), "infrMmSeq" : $("#infrMmSeq").val()}
			,success: function(data) {
					//답글이 보일때
					if(re.css('display') !=='none'){
						re.hide();
					//답글일 안보일때	
					}else{ 
						re.show();
					} 
				} 
			,error : function(jqXHR, textStatus, errorThrown){
				alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
			}
		});
	} 
	/*  function showRecomment(commentSeq){
		var numm = commentSeq;
		var re = $('#re_'+numm);
		//답글이 보일때 
		if(re.css('display') !=='none'){
			re.hide();
		//답글일 안보일때	
		}else{ 
			re.show();
		}  */
		/* $('#re_'+numm).show();
	} */
	
	/* $(function(){
		$('#recomment').click(function(){
			$('#re_recomment').val().show();
		})
	}) */
	
	//댓글 글자수 제한 체크
		$('.reTextBox').keyup(function (e) {
			let content = $(this).val();
		    
		    // 글자수 세기
		    if (content.length == 0 || content == '') {
		    	$('.reTextCount').text('0');
		    } else {
		    	$('.reTextCount').text(content.length + '');
		    }
		    
		    // 글자수 제한
		    if (content.length > 200) {
		    	// 200자 부터는 타이핑 되지 않도록
		        $(this).val($(this).val().substring(0, 200));
		        // 200자 넘으면 알림창 뜨도록
		        alert('글자수는 200자까지 입력 가능합니다.');
		    };
		});
	
		//commentLita jsp
		var page = 0;
		
		function setLita() {
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				/* ,dataType:"json" */
				,url: goUrlAjaxLita
				,data : $("#form").serialize()
				/* ,data : {  } */
				,success: function(response) {
					$("#lita").empty();
					$("#lita").append(response);
					window.location.hash = '#page' + page;
					page++;

				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		}
		
		$(window).bind('hashchange', function() { 
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				/* ,dataType:"json" */
				,url: goUrlAjaxLita
				,data : $("#form").serialize()
				/* ,data : {  } */
				,success: function(response) {
					$("#lita").empty();
					$("#lita").append(response);
					window.location.hash = '#page' + page;
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		});
		
		function setHash() {
			if(location.hash == "" || location.hash == null){
				alert("hash is empty");
			}
		}
	

	
</script>