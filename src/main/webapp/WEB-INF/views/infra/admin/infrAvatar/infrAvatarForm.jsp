<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<html>
<head>
	<title>AvatarForm</title>
	<%@ include file="../../../rscs/basicRscs.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="/resources/admin/adminTemplate/css/styles.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/059fbc3cf8.js" crossorigin="anonymous"></script>
    <link href="/resources/admin/infrAvatar/css/infrAvatarForm.css" rel="stylesheet" />
</head>
<body>
	<!-- header s-->
    <%@ include file="../common/header.jsp" %>
    <!-- header e-->
        <div id="layoutSidenav">
        	<!-- top banner s-->
	        <%@ include file="../common/sidebar.jsp" %>
	        <!-- top banner e-->
	        <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                    	<form method="post" name="form" id="form" autocomplete="off" enctype="multipart/form-data">
	                        <h3 class="mt-4">싸게월드 아바타 업로드</h3>
	                        <div class="text-center">
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
					 			<input class="form-control form-control-sm" id="<c:out value="${name }"/>" name="<c:out value="${name }"/>" type="file" multiple="multiple" style="display: none;" onChange="upload('<c:out value="${name }"/>', <c:out value="${type }"/>, 0, 1, 0, 0, 1);">
								<label for="uploadImg" class="form-label input-file-button">이미지첨부</label>
	                        </div>
	                        <div class="inputBox">
	                        	<input type="text" class="form-control" value="<c:out value="${dto.avatarName }" />" placeholder="아바타 이름 입력">
	                        	<button type="button" id="btnSave" class="button" >업로드</button>
	                        </div>	
                        </form>
					</div>
				</main>
			</div>
        </div>
        <!-- footer s-->
        <%@ include file="../common/footer.jsp" %>
        <!-- footer e-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/assets/demo/chart-area-demo.js"></script>
        <script src="/resources/admin/adminTemplate/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/js/datatables-simple-demo.js"></script>
       	<script src="/resources/common/js/upload.js"></script>
       	<script src="/resources/common/js/commonAdmin.js"></script>
       	
       	<script type="text/javascript">
       		var goUrlList = "/admin/avatar/infrAvatarList";
	       	var goUrlInst = "/admin/avatar/infrAvatarInst";
	       	
	       	var form = $("form[name=form]");
	       	var seq = $("input:hidden[name=avatarSeq]");
	       	
	       	$("#btnSave").on("click", function(){
    	   		form.attr("action", goUrlInst).submit();
    		});
	       	
	       	$("#btnList").on("click", function(){
    			form.attr("action", goUrlList).submit();
    		});
       	</script>
</body>
</html>