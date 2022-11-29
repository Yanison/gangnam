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
						<i class="fa-regular fa-message"> 200</i>
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
					<div class="boarderFooter">
						<div>		
							<p>댓글 200</p>
						</div>
						<div class="commentHead">
							<button class="writeBtn1" id="writeBtn">작성하기</button>
						</div>
					</div>
				<c:choose>
					<c:when test="${infrMmSeq eq null }">
					</c:when>
					<c:otherwise>
					<div id="writeDiv" class="writeDiv">
						<textarea style="width: 735px; height: 70px; resize: none;"></textarea>
					</div>
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
	</script>
</body>
</html>