<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<html>
<head>
	<meta charset="UTF-8">
	<meta name=viewport"" content="width=device-width, initial-scale=1.0">
	<title>sgworld | 싸게월드</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
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
	<input type="hidden" id="cmSeq" name="cmSeq" value="${cmSeq}">
	<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage }" default="1"/>">
	<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow }"/>">
	
	<!-- contend s -->
	<section>
		<div class="boarderTitle">
			<a>게시판</a><a>자유게시판</a> <!-- 게시판 타이틀 -->
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
						<i class="fa-regular fa-clock"> <fmt:formatDate value="${item.regDatetime }" pattern="MM-dd" /></i>
						<i class="fa-solid fa-eye"> <c:out value="${item.viewCount }" /></i>
						<i class="fa-regular fa-message"> <c:out value="${item.commentCount }" /></i>
					</div>
				</div>
				<div class="boarderBody">
					<div class="content">
						${item.bdContent }<!-- 게시글 내용 -->
					</div>
					<div class="icon">
						<c:choose>
							<c:when test="${infrMmSeq eq null }">
							</c:when>
							<c:otherwise>
							<c:choose>
							<c:when test="${like.infrMmSeq eq null }">
							<div id="likeBtnATag" class="likeBtnDiv" name="likeBtnATag"><a id="likeBtn" type="button"><i class="fa-regular fa-heart"></i>  ${likeCount }</a></div>
							</c:when>
							<c:otherwise>
							<div id="likeBtnATag" class="likeBtnDiv" name="likedBtnATag"><a id="likedBtn" type="button"><i class="fa-solid fa-heart" style="color: #E95721;"></i> ${likeCount }</a></div>
							</c:otherwise>
							</c:choose>
							</c:otherwise>
						</c:choose>
						<div><i class="fa-regular fa-message"> 200</i></div>
					</div>
				</div>
				<div>
				<!-- totalAndRowNum s -->
				<%@include file="../../common//totalAndRowNum.jsp"%>
				<!-- totalAndRowNumu e -->
				<c:choose>
					<c:when test="${infrMmSeq eq null }">
					</c:when>
					<c:otherwise>
					<div class="commentBox">
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
								<textarea class="textBox" style="width: 680px; height: 90px; resize: none;" name="content" maxlength="200" placeholder="댓글을 입력하세요."><c:out value="${dto.content }" /></textarea>
								<div class="textLengthWrap">
								    <span class="textCount">0</span>
								    <span class="textTotal">/200</span>
								</div>
							</div>	
						</div>
					</div>
					</c:otherwise>
				</c:choose>
					<div id="lita"></div>
				</div>
			</article>
		</section>
	</section>
	<!-- contend e -->
	</form>
	<!-- footer s -->
	<%@ include file="../../common/footer.jsp" %>
	<!-- footer e -->
	
	<!-- modalBase s -->
	<%@include file="../../common/modalBase.jsp"%>
	<!-- modalBase e -->
	
	<script type="text/javascript">
		$(document).ready(function(){
			setLita();
		}); 
	
		var goUrlCommentInst = "/board/commentInst";
		var goUrlCommentDele = "/board/commentDele";
		var goUrlAjaxLita = "/board/boardCommentLita";
		
		var form = $("form[name=form]");
		var seq = $("input:hidden[name=cmSeq]");
		
		$("#btnComment").on("click", function(){
			form.attr("action", goUrlCommentInst).submit();
		});
		
		$("#btnCommentDele").on("click", function(){
			$(".modal-title").text("확 인");
			$(".modal-body").text("해당 데이터를 삭제하시겠습니까 ?");
			$("#btnModalDelete").show();
			$("#modalConfirm").modal("show");
		});
		
		$("#btnModalDelete").on("click", function(){
			
			$("#modalConfirm").modal("hide");
								
			form.attr("action", goUrlCommentDele).submit();
		});
	
		function unlike(){
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				,url: "/board/boardUnLike"
				,data : { "bdSeq" : $("#bdSeq").val(), "infrMmSeq" : $("#infrMmSeq").val() }
				,success: function(response) {
					if(response.rt == "success") {
						var str = "";
						$(".likeBtnDiv").empty();
		   				str += '<a id="likeBtn" type="button" onclick="like();">';
		   				str += '<i class="fa-regular fa-heart"></i> ' + response.likedCount;
		   				str += '</a>';	   		
		   				document.getElementById("likeBtnATag").innerHTML = str;
					} else {
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		};
		
		function like(){
			$.ajax({
				async: true 
				,cache: false
				,type: "post"
				,url: "/board/boardLike"
				,data : { "bdSeq" : $("#bdSeq").val(), "infrMmSeq" : $("#infrMmSeq").val() }
				,success: function(response) {
					if(response.rt == "success") {
						var str = "";
						$(".likeBtnDiv").empty();
		   				str += '<a id="likedBtn" name="likedBtn" type="button" onclick="unlike();">';
		   				str += '<i class="fa-solid fa-heart" style="color: #E95721;"></i> ' + response.likedCount;
		   				str += '</a>';   
		   				document.getElementById("likeBtnATag").innerHTML = str;
					} else{
						
					}
				}
				,error : function(jqXHR, textStatus, errorThrown){
					alert("ajaxUpdate " + jqXHR.textStatus + " : " + jqXHR.errorThrown);
				}
			});
		}
		
		$("#likedBtn").on("click", function(){
			unlike();
		});
		
		
		$("#likeBtn").on("click", function(){
			like();
		});
		
		//댓글 글자수 제한 체크
		$('.textBox').keyup(function (e) {
			let content = $(this).val();
		    
		    // 글자수 세기
		    if (content.length == 0 || content == '') {
		    	$('.textCount').text('0');
		    } else {
		    	$('.textCount').text(content.length + '');
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
</body>
</html>