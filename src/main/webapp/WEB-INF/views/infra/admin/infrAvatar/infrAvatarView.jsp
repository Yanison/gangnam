<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<html>
<head>
	<title>AvatarView</title>
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
	                        <input type="hidden" name="avatarSeq" value="<c:out value="${vo.avatarSeq}"/>"/>
	                        <h3 class="mt-4">싸게월드 아바타 업로드</h3>
	                        <div class="text-center">
	                        	<c:set var="type" value="2"/>		<!-- #-> -->
					        	<c:set var="name" value="uploadImg"/>		<!-- #-> -->
								<input type="hidden" id="<c:out value="${name }"/>Type" name="<c:out value="${name }"/>Type" value="<c:out value="${type }"/>"/>
					        	<input type="hidden" id="<c:out value="${name }"/>MaxNumber" name="<c:out value="${name }"/>MaxNumber" value="0"/>
					        	<input type="hidden" id="<c:out value="${name }"/>DeleteSeq" name="<c:out value="${name }"/>DeleteSeq"/>
					        	<input type="hidden" id="<c:out value="${name }"/>DeletePathFile" name="<c:out value="${name }"/>DeletePathFile"/>
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
					 			<input class="form-control form-control-sm" id="<c:out value="${name }"/>" name="<c:out value="${name }"/>" type="file" style="display: none;" onChange="upload('<c:out value="${name }"/>', <c:out value="${type }"/>, 0, 1, 0, 0, 1);">
								<label for="uploadImg" class="form-label input-file-button">이미지첨부</label>
	                        </div>
	                        <div class="inputBox">
	                        	<input type="text" class="form-control" id="avatarName" name="avatarName" value="<c:out value="${item.avatarName }" />" placeholder="아바타 이름 입력">
	                        	<button type="button" id="btnUpdate" class="button" >수정</button>
	                        </div>
	                        <div class="row p-0">
								<div class="col">
									<button class="btn btn-secondary" type="button" id="btnList"><i class="fa-sharp fa-solid fa-bars"></i></button>
								</div>
								<div class="col" style="text-align: right;">
									<button class="btn btn-danger" type="button" id="cglCancel"><i class="fa-duotone fa-x"></i></button>
									<button class="btn btn-danger" type="button" id="cglDel"><i class="fa-regular fa-trash-can"></i></button>
								</div>
							</div>	
                        </form>
					</div>
				</main>
			</div>
        </div>
        <!-- footer s-->
        <%@ include file="../common/footer.jsp" %>
        <!-- footer e-->
        <form name="formVo" id="formVo" method="post">
		<!-- *Vo.jsp s -->
		<%@include file="../common/avatarVo.jsp"%>		<!-- #-> -->
		<!-- *Vo.jsp e -->
		</form>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/js/datatables-simple-demo.js"></script>
        <script src="/resources/common/js/upload.js"></script>
       	<script src="/resources/common/js/commonAdmin.js"></script>
       	<script type="text/javascript">
       		var goUrlList = "/admin/avatar/infrAvatarList";
	       	var goUrlUpdt = "/admin/avatar/infrAvatarUpdt";
	       	var goUrlUele = "/admin/avatar/infrAvatarUele";
	       	var goUrlDele = "/admin/avatar/infrAvatarDele";
	       	
	       	var form = $("form[name=form]");
	       	var formVo = $("form[name=formVo]");
	       	var seq = $("input:hidden[name=avatarSeq]");
	       	
	       	$("#btnList").on("click", function(){
				formVo.attr("action", goUrlList).submit();
			});
			
			$("#btnUpdate").on("click",function(){
				form.attr("action", goUrlUpdt).submit();
			});
			
			$("#btnUelete").on("click", function(){
				formVo.attr("action", goUrlUele).submit();
			});
			
			$("#btnDelete").on("click", function(){
				formVo.attr("action", goUrlDele).submit();
			});
       	</script>
</body>
</html>