<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
                    	<form encoding="mutipart/form-data">
	                        <h3 class="mt-4">싸게월드 아바타 업로드</h3>
	                        <div class="text-center">
		                        <c:set var="type" value="1"/>		<!-- #-> -->
					        	<c:set var="name" value="uploadImgProfile"/>		<!-- #-> -->
								<c:choose>
									<c:when test="${ifmmSeq eq 0 }">
										<img id="<c:out value="${name }"/>Preview" src="/resources/xdmin/image/default_100_100.png" class="mx-auto d-block" width="600" height="470">
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${fn:length(listUploaded) eq 0 }">
												<img id="<c:out value="${name }"/>Preview" src="/resources/xdmin/image/default_100_100.png" class="mx-auto d-block" width="600" height="470">
											</c:when>
											<c:otherwise>
												<c:set var="GetNy" value="0"/>
												<c:forEach items="${listUploaded}" var="listUploaded" varStatus="statusUploaded">
													<c:if test="${listUploaded.type eq type }">
											        	<input type="hidden" id="<c:out value="${name }"/>DeleteSeq" name="<c:out value="${name }"/>DeleteSeq" value="<c:out value="${listUploaded.seq }"/>"/>
											        	<input type="hidden" id="<c:out value="${name }"/>DeletePathFile" name="<c:out value="${name }"/>DeletePathFile" value="<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>"/>  
														<img id="<c:out value="${name }"/>Preview" src="<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>" class="rounded-circle mx-auto d-block" width="100" height="100">
														<c:set var="GetNy" value="1"/>		
													</c:if>
												</c:forEach>
												<c:if test="${GetNy eq 0 }">
													<img id="<c:out value="${name }"/>Preview" src="/resources/xdmin/image/default_100_100.png" class="mx-auto d-block" width="600" height="470">
												</c:if>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
					            
								<input type="hidden" id="<c:out value="${name }"/>Type" name="<c:out value="${name }"/>Type" value="<c:out value="${type }"/>"/>
								<input type="hidden" id="<c:out value="${name }"/>MaxNumber" name="<c:out value="${name }"/>MaxNumber" value="0"/>
								<label for="<c:out value="${name }"/>" class="form-label input-file-button"><b>click</b></label>
					 			<input class="form-control form-control-sm" id="<c:out value="${name }"/>" name="<c:out value="${name }"/>" type="file" multiple="multiple" style="display: none;" onChange="upload('<c:out value="${name }"/>', <c:out value="${type }"/>, 1, 1, 0, 0, 3);">
	                        </div>
	                        <div class="inputBox">
	                        	<input type="text" class="form-control" placeholder="아바타 이름 입력">
	                        	<button type="button" class="button" >업로드</button>
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
       	<script src="/resources/common/upload.js"></script>
       	<script src="/resources/common/commonAdmin.js"></script>
</body>
</html>