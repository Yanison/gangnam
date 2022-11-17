<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head> 
	<meta charset="UTF-8">
	<meta name=viewport"" content="width=device-width, initial-scale=1.0">
	<title>sgworld | 싸게월드</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	<script src="https://kit.fontawesome.com/059fbc3cf8.js" crossorigin="anonymous"></script>
	
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
	
	<!-- include summernote css/js-->
	<!-- <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet"> -->
	<!-- <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script> -->
	
	<link href="/resources/user/board/css/boardForm.css" rel="stylesheet">
	<link href="/resources/user/home/css/header.css" rel="stylesheet">
	<link href="/resources/user/home/css/footer.css" rel="stylesheet">
	
</head>
<body>
	<!-- header s -->
	<%@ include file="../../common/header.jsp" %>
	<!-- header e -->
	<form method="post" id="form" name="form" autocomplete="off" enctype="multipart/form-data">
	<input type="hidden" id="infrMmSeq" name="infrMmSeq" value="${infrMmSeq}">
	<!-- contend s -->
	<section class="body">
		<div class="boardFormHead">
			<div class="boardFormHead1">
				<div>
					<a type="button" id="btnList"><i class="fa-solid fa-xmark"></i></a>
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
						<select class="form-select" id="bdDiv" name="bdDiv" style="width: 100px;">
							<option value="">게시판 선택</option>
							<option value="8">자유게시판</option>
							<option value="9">정보게시판</option>
							<option value="10">거래게시판</option>
						</select>
					</div>
				</div>
				<div class="boardBody">
					<div class="boardTitle">
						<input class="contentTitle" type="text" id="bdTitle" name="bdTitle" value="<c:out value="${dto.bdTitle }" />" placeholder="글 제목을 입력해 주세요.">
					</div>
					<div class="boardContent">
						<!-- <div class="boardFormContent" id="summernote"> -->
						<textarea class="boardFormContent" id="bdContent" name="bdContent" placeholder="내용을 입력해 주세요."><c:out value="${dto.bdContent }" /></textarea>
					</div>
				</div>
				<div class="boardFooter">
					<div class="boardIcon">
						<div class="icon">
							<c:set var="type" value="2"/>		<!-- #-> -->
				        	<c:set var="name" value="uploadImg"/>		<!-- #-> -->
				        	<input type="hidden" id="<c:out value="${name }"/>Type" name="<c:out value="${name }"/>Type" value="<c:out value="${type }"/>"/>
				        	<input type="hidden" id="<c:out value="${name }"/>MaxNumber" name="<c:out value="${name }"/>MaxNumber" value="0"/>
				        	<input type="hidden" id="<c:out value="${name }"/>DeleteSeq" name="<c:out value="${name }"/>DeleteSeq"/>
				        	<input type="hidden" id="<c:out value="${name }"/>DeletePathFile" name="<c:out value="${name }"/>DeletePathFile"/>
							<label for="uploadImg"><i class="fa-solid fa-camera"></i></label>
							<input type="file" style="display: none;" id="uploadImg">
							<a href="#"><i class="fa-solid fa-at"></i></a>
							<a href="#"><i class="fa-solid fa-hashtag"></i></a>
							<c:set var="type" value="3"/>		<!-- #-> -->
				        	<c:set var="name" value="uploadFile"/>		<!-- #-> -->
				        	<input type="hidden" id="<c:out value="${name }"/>Type" name="<c:out value="${name }"/>Type" value="<c:out value="${type }"/>"/>
				        	<input type="hidden" id="<c:out value="${name }"/>MaxNumber" name="<c:out value="${name }"/>MaxNumber" value="0"/>
				        	<input type="hidden" id="<c:out value="${name }"/>DeleteSeq" name="<c:out value="${name }"/>DeleteSeq"/>
				        	<input type="hidden" id="<c:out value="${name }"/>DeletePathFile" name="<c:out value="${name }"/>DeletePathFile"/> 
							<label for="uploadFile"><i class="fa-regular fa-file"></i></label>
							<input type="file" style="display: none;" id="uploadFile">
							<a href="#"><i class="fa-solid fa-code"></i></a>
						</div>
					</div>
					<div>
						<div class="addScroll">
							<ul id="<c:out value="${name }"/>Preview" class="list-group">
								<c:forEach items="${listUploaded}" var="listUploaded" varStatus="statusUploaded">
									<c:if test="${listUploaded.type eq type }">
										<li id="li_<c:out value="${type }"/>_<c:out value="${listUploaded.sort }"/>" class="list-group-item d-flex justify-content-between align-items-center">
										<a href="<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>" download="<c:out value="${listUploaded.originalName }"/>" class="text-decoration-none"><c:out value="${listUploaded.originalName }"/></a>
										<span class="badge bg-danger rounded-pill" onClick="delLi('<c:out value="${name }"/>', <c:out value="${type }"/>,<c:out value="${listUploaded.sort }"/>, <c:out value="${listUploaded.seq }"/>, '<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>')"><i class="fa-solid fa-x" style="cursor: pointer;"></i></span>
										</li>
									</c:if>
								</c:forEach>				
							</ul>
						</div>
					</div>
					<div>
						<div id="<c:out value="${name }"/>Preview" class="addScroll">
							<c:forEach items="${listUploaded}" var="listUploaded" varStatus="statusUploaded">
								<c:if test="${listUploaded.type eq type }">
									<div id="imgDiv_<c:out value="${type }"/>_<c:out value="${listUploaded.sort }"/>" style="display: inline-block; height: 95px;">
										<img src="<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>" class="rounded" width= "85px" height="85px" style="cursor:pointer;" onClick="openViewer(<c:out value="${listUploaded.type }"/>, <c:out value="${listUploaded. sort }"/>);">
										<div style="position: relative; top:-85px; left:5px"><span style="color: red; cursor:pointer;" onClick="delImgDiv('<c:out value="${name }"/>', <c:out value="${type }"/>,<c:out value="${listUploaded.sort }"/>, <c:out value="${listUploaded.seq }"/>, '<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>')">X</span></div>
									</div>
								</c:if>
							</c:forEach>
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
	<script src="/resources/common/js/upload.js"></script>
	<script src="/resources/user/common/js/commonUser.js"></script>
	<script type="text/javascript">
		var goUrlBoardInst = "/board/boardInst";
		var goUrlList = "/board/boardList";
		var goUrlBoardRegForm = "/board/boardWrite";
		
		var form = $("form[name=form]");
		
		$("#btnSave").on("click", function(){
			form.attr("action", goUrlBoardInst).submit();
		});
		
		$("#btnBoardRegForm").on("click", function(){
			$(location).attr("href", goUrlBoardRegForm);
		});
		
		$("#btnList").on("click", function(){
   			form.attr("action", goUrlList).submit();
   		});
		
		/*
		$(document).ready(function() {
		  $('#summernote').summernote({
			  height: 450,
			  width: 860,
		  });
		});
		*/
	</script>
</body>
</html>