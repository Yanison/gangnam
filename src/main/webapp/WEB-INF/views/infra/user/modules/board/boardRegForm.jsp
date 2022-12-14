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
	
	<link href="/resources/user/board/css/boardForm.css" rel="stylesheet">
	<link href="/resources/user/home/css/header.css" rel="stylesheet">
	<link href="/resources/user/home/css/footer.css" rel="stylesheet">
	
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- summernote -->
	<!-- 
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	 -->
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
						<div class="selectImage">
							<ul>
								<li>
									<label class="btnImage" for="uploadImg" style="cursor: pointer">
										<i class="fa-regular fa-image" style="display: block;"></i>
										<span></span>
										<span>사진</span>
									</label>
								</li>		
							</ul>
						</div>
						<!-- <div>
							<input type="text">
						</div> -->
						<%-- <textarea id="bdContent" name="bdContent">
							<c:out value="${dto.bdContent }"/>
						</textarea> --%>
						<%-- <textarea class="boardFormContent summerNote" id="bdContent" name="bdContent"><c:out value="${dto.bdContent }" /></textarea> --%>
					</div>
					<div class="boardInputDiv">
						<c:set var="type" value="2"/>		<!-- #-> -->
				        	<c:set var="name" value="uploadImg"/>		<!-- #-> -->
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
							<input type="hidden" id="<c:out value="${name }"/>Type" name="<c:out value="${name }"/>Type" value="<c:out value="${type }"/>"/>
				        	<input type="hidden" id="<c:out value="${name }"/>MaxNumber" name="<c:out value="${name }"/>MaxNumber" value="0"/>
				        	<input type="hidden" id="<c:out value="${name }"/>DeleteSeq" name="<c:out value="${name }"/>DeleteSeq"/>
				        	<input type="hidden" id="<c:out value="${name }"/>DeletePathFile" name="<c:out value="${name }"/>DeletePathFile"/>
				 			<input class="form-control form-control-sm" id="<c:out value="${name }"/>" name="<c:out value="${name }"/>" type="file" style="display: none;" onChange="upload('<c:out value="${name }"/>', <c:out value="${type }"/>, 0, 1, 0, 0, 1);">
							<%-- <label for="uploadImg" class=" input-file-button">이미지첨부</label><c:set var="type" value="2"/> --%>		<!-- #-> -->
				        	<c:set var="name" value="uploadImg"/>		<!-- #-> -->
						<textarea rows="" cols="" class="boardInput" name="bdContent" placeholder="글을 입력해주세요"><c:out value="${dto.bdContent }"/></textarea>
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
	<script src="/resources/user/common/js/commonUser.js"></script>
	<script src="/resources/common/js/upload.js"></script>
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
		
		
			
		
		// summernote 부분 
		// 툴바생략
		$(document).ready(function(){
			 var toolbar = [
				    // 글꼴 설정
				    ['fontname', ['fontname']],
				    // 글자 크기 설정
				    ['fontsize', ['fontsize']],
				    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    // 글자색
				    ['color', ['forecolor', 'color']],	
				    // 글머리 기호, 번호매기기, 문단정렬
				    ['para', ['paragraph']],
				    // 줄간격
				    ['height', ['height']],
				    // 그림첨부, 링크만들기, 동영상첨부
				    ['insert',['picture','link']],
				  ],
				  // 추가한 글꼴
				fontNames = ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
				 // 추가한 폰트사이즈
				fontSizes = ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	
			var setting = {
		            height : 600,
		            width: 860,
		            minHeight : null,
		            maxHeight : null,
		            focus : false, 
		            lang : 'ko-KR',
		            toolbar : toolbar
		            //콜백 함수
		           
		         };
			 
		        $('.summerNote').summernote(setting);
		        
		        $('#bdContent').summernote('editor.insertText', "${board_data.BOARD_CONTENT}")
		})
	</script>
</body>
</html>