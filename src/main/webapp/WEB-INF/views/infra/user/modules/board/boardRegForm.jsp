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
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	
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
						<textarea class="boardFormContent summerNote" id="bdContent" name="bdContent"><c:out value="${dto.bdContent }" /></textarea>
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