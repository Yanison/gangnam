<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="/resources/admin/adminTemplate/css/styles.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/059fbc3cf8.js" crossorigin="anonymous"></script>
    <link href="/resources/admin/adminHome/css/adminHome.css" rel="stylesheet" />
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
                        <h3 class="mt-4">코드그룹관리</h3>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">코드그룹</li>
                        </ol>
                        <div class="container">
	                        <div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label">코드그룹이름</label>
		                        	<input class="form-control" type="text">
		                        </div>
		                        <div class="col">
		                        	<label class="form-label">코드그룹이름(영문)</label>
		                        	<input class="form-control" type="text">
		                        </div>
	                        </div>
	                        <div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label">순서</label>
		                        	<input class="form-control" type="text">
		                        </div>
		                        <div class="col">
		                        	<label class="form-label">사용여부</label>
		                        	<select class="form-select">
		                        		<option>사용여부선택</option>
		                        		<option>N</option>
		                        		<option>Y</option>
		                        	</select>
		                        </div>
	                        </div>
	                        <div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label">삭제여부</label>
		                        	<select class="form-select">
		                        		<option>삭제여부선택</option>
		                        		<option>N</option>
		                        		<option>Y</option>
		                        	</select>
		                        </div>
		                        <div class="col">
		                        	<label class="form-label">등록일</label>
		                        	<input class="form-control" type="text">
		                        </div>
	                        </div>
	                        <div class="row mb-4">
	                        	<div class="col-6">
	                        		<label class="form-label">설명</label>
									<textarea class="form-control" style="resize: none; height: 150px;"></textarea>
								</div>
								<div class="col">
		                        	<label class="form-label">수정일</label>
		                        	<input class="form-control" type="text">
		                        </div>
	                        </div>
							<div class="row p-0">
								<div class="col">
									<button class="btn btn-secondary" type="button" id="cglCancel"><i class="fa-sharp fa-solid fa-bars"></i></button>
								</div>
								<div class="col" style="text-align: right;">
									<button class="btn btn-danger" type="button" id="cglCancel"><i class="fa-duotone fa-x"></i></button>
									<button class="btn btn-danger" type="button" id="cglDel"><i class="fa-regular fa-trash-can"></i></button>
									<button class="btn btn-primary" type="button" id="cglPlus"><i class="fa-regular fa-plus"></i></button>
								</div>
							</div>
						</div>
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
</body>
</html>