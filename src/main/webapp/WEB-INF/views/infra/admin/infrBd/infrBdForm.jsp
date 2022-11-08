<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="rb" uri="http://www.springframework.org/tags" %>
<%@ page session="false" %>
<html>
<head>
	<title>게시판폼</title>
	<%@ include file="../../../rscs/basicRscs.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="/resources/admin/adminTemplate/css/styles.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/059fbc3cf8.js" crossorigin="anonymous"></script>
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
	<form method="post" id="bdForm" name="form" enctype="multipart/form-data">
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
									<textarea class="form-control" style="resize: none; height: 150px;" id="bdContent" name="bdContent"><c:out value="${dto.bdContent }"/></textarea>
		                        </div>
		                    </div>    
		                    <div class="row mb-4">
						        <div class="col-6">
						        	<c:set var="type" value="2"/>		<!-- #-> -->
						        	<c:set var="name" value="uploadImg"/>		<!-- #-> -->
						        	<input type="hidden" id="<c:out value="${name }"/>Type" name="<c:out value="${name }"/>Type" value="<c:out value="${type }"/>"/>
						        	<input type="hidden" id="<c:out value="${name }"/>MaxNumber" name="<c:out value="${name }"/>MaxNumber" value="0"/>
						        	<input type="hidden" id="<c:out value="${name }"/>DeleteSeq" name="<c:out value="${name }"/>DeleteSeq"/>
						        	<input type="hidden" id="<c:out value="${name }"/>DeletePathFile" name="<c:out value="${name }"/>DeletePathFile"/>
						            <label for="uploadImg" class="form-label input-file-button">이미지첨부</label>
						 			<input class="form-control form-control-sm" id="<c:out value="${name }"/>" name="<c:out value="${name }"/>" type="file" multiple="multiple" style="display: none;" onChange="upload('<c:out value="${name }"/>', <c:out value="${type }"/>, 0, 1, 0, 0, 1);">
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
						        <div class="col-6">
						        	<c:set var="type" value="3"/>		<!-- #-> -->
						        	<c:set var="name" value="uploadFile"/>		<!-- #-> -->
						        	<input type="hidden" id="<c:out value="${name }"/>Type" name="<c:out value="${name }"/>Type" value="<c:out value="${type }"/>"/>
						        	<input type="hidden" id="<c:out value="${name }"/>MaxNumber" name="<c:out value="${name }"/>MaxNumber" value="0"/>
						        	<input type="hidden" id="<c:out value="${name }"/>DeleteSeq" name="<c:out value="${name }"/>DeleteSeq"/>
						        	<input type="hidden" id="<c:out value="${name }"/>DeletePathFile" name="<c:out value="${name }"/>DeletePathFile"/>   	
									<label for="uploadFile" class="form-label input-file-button">파일첨부</label>
									<input class="form-control form-control-sm" id="<c:out value="${name }"/>" name="<c:out value="${name }"/>" type="file" multiple="multiple" style="display: none;" onChange="upload('<c:out value="${name }"/>', <c:out value="${type }"/>, 0, 2, 0, 0, 2);" >
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/assets/demo/chart-area-demo.js"></script>
        <script src="/resources/admin/adminTemplate/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/js/datatables-simple-demo.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script src="/resources/common/js/upload.js"></script>
        <script src="/resources/common/js/commonAdmin.js"></script>
        <script type="text/javascript">
        	var goUrlList = "/admin/board/infrBdList";
        	var goUrlInst = "/admin/board/infrBdInst";
        	
        	var form = $("form[id=bdForm]");
        	
        	$("#btnSave").on("click", function(){
    	   		form.attr("action", goUrlInst).submit();
    		}); 
    		
        	$("#btnList").on("click", function(){
    			form.attr("action", goUrlList).submit();
    		});
        	
        </script>
</body>
</html>