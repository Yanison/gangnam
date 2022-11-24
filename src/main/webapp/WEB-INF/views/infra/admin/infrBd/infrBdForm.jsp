<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>게시판폼</title>
	<%@ include file="../../../rscs/basicRscs.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="/resources/admin/adminTemplate/css/styles.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/059fbc3cf8.js" crossorigin="anonymous"></script>
    
    <!-- summernote -->
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
   
    <style type="text/css">
		
		.addScroll{
			overflow-y:auto;
			height: 200px;
			background-color:#E9ECEF;
			padding-top:5px; 
			padding-left:5px;
		}
		 	
		.input-file-button{
			padding: 4px 25px;
			background-color:#FF6600;
			border-radius: 4px;
			color: white;
			cursor: pointer;
		}
			
	</style>
</head>
<body class="sb-nav-fixed">
	<!-- top banner s-->
	<%@ include file="../common/header.jsp"%>   
	<!-- top banner e-->
	<form method="post" id="bdForm" name="bdForm" autocomplete="off" enctype="multipart/form-data">
	<input type="hidden" id="infrMmSeq" name="infrMmSeq" value="${infrMmSeq}">
        <div id="layoutSidenav">
        	<!-- sidebar s-->
            <%@ include file="../common/sidebar.jsp"%> 
            <!-- sidebar e-->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h3 class="mt-4">공지글 등록</h3>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">공지글</li>
                        </ol>
                        <div class="container">
                        	<div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label" for="bdDiv">게시판</label>
		                        	<select class="form-select" id="bdDiv" name="bdDiv">
										<option value="">게시판 선택</option>
										<option value="8">자유게시판</option>
										<option value="9">정보게시판</option>
										<option value="10">거래게시판</option>
									</select>
		                        </div>
	                        </div>
							<div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label" for="bdTitle">제목</label>
		                        	<input class="form-control" type="text" placeholder="제목" id="bdTitle" name="bdTitle" value="<c:out value="${dto.bdTitle }"/>">
		                        </div>
	                        </div>
	                        <div class="row mb-4">
		                        <div class="col-12">
		                        	<label class="form-label" for="bdContent">내용</label>
									<textarea class="boardFormContent summerNote" id="bdContent" name="bdContent"><c:out value="${dto.bdContent }" /></textarea>
		                        </div>
		                    </div>    
							<div class="row p-0">
								<div class="col">
									<button class="btn btn-secondary" type="button" id="btnList"><i class="fa-sharp fa-solid fa-bars"></i></button>
								</div>
								<div class="col" style="text-align: right;">
									<button class="btn btn-primary" type="button" id="btnSave"><i class="fa-regular fa-plus"></i></button>
								</div>
							</div>
						</div>
					</div>
				</main>
			</div>
		</div>
	</form>
        <!-- footer s -->
        <%@ include file="../common/footer.jsp"%> 
        <!-- footer s -->
	
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/js/datatables-simple-demo.js"></script>
       <!--  <script src="/resources/common/js/boardUpload.js"></script> -->
        <script src="/resources/common/js/commonAdmin.js"></script>
        
        <script type="text/javascript">
        	var goUrlList = "/admin/board/infrBdList";
        	var goUrlInst = "/admin/board/infrBdInst";
        	
        	var form = $("form[name=bdForm]");
        	
        	$("#btnSave").on("click", function(){
    	   		form.attr("action", goUrlInst).submit();
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