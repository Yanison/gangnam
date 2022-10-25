<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>맴버폼</title>
	<%@ include file="rscs/basicRscs.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="../../../admin/adminTemplate/css/styles.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/059fbc3cf8.js" crossorigin="anonymous"></script>
</head>
<body>
	<!-- top banner s-->
	<%@ include file="common/header.jsp"%>   
	<!-- top banner e-->
        <div id="layoutSidenav">
        	<!-- left banner s-->
            <%@ include file="common/sidebar.jsp"%> 
            <!-- left banner e-->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h3 class="mt-4">회원관리</h3>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">회원목록</li>
                        </ol>
                        <div class="container">
							<div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label">회원아이디</label>
		                        	<input class="form-control" type="text" placeholder="회원아이디" id="infrMmId">
		                        </div>
		                        <div class="col">
		                        	<label class="form-label">이름</label>
		                        	<input class="form-control" type="text" placeholder="이름" id="infrMmName">
		                        </div>
	                        </div>
	                        <div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label">비밀번호</label>
		                        	<input class="form-control" type="password" placeholder="비밀번호" id="infrMmPw">
		                        </div>
		                        <div class="col">
		                        	<label class="form-label">이메일</label>
		                        	<input class="form-control" type="text" placeholder="이메일" id="infrMmEmailId">
		                        </div>
	                        </div>
	                        <div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label">닉네임</label>
		                        	<input class="form-control" type="text" placeholder="닉네임">
		                        </div>
		                        <div class="col mb-4">
		                        	<label class="form-label">성별</label>
		                        	<select class="form-select">
		                        		<option>남자</option>
		                        		<option>여자</option>
		                        	</select>
		                        </div>
	                        </div>
	                        <div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label">생년월일</label>
		                        	<input class="form-control" type="text" placeholder="생년월일">
		                        </div>
		                        <div class="col">
		                        	<label class="form-label">전화번호</label>
		                        	<input class="form-control" type="text" placeholder="전화번호">
		                        </div>
	                        </div>
	                        <div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label">삭제여부</label>
									<select class="form-select">
		                        		<option>N</option>
		                        		<option>Y</option>
		                        	</select>
		                        </div>
		                        <div class="col">
		                        	<label class="form-label">사용여부</label>
									<select class="form-select">
		                        		<option>N</option>
		                        		<option>Y</option>
		                        	</select>
		                        </div>
	                        </div>
							<div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label">주소 넣을칸</label>
		                        </div>
		                        <div class="col">
		                        	<label class="form-label"></label>
		                        </div>
	                        </div>
							<div class="row p-0">
								<div class="col">
									<button class="btn btn-secondary" type="button" id="cglList"><i class="fa-sharp fa-solid fa-bars"></i></button>
								</div>
								<div class="col" style="text-align: right;">
									<button class="btn btn-danger" type="button" id="cglDel"><i class="fa-regular fa-trash-can"></i></button>
									<button class="btn btn-success" type="button" id="cglExcel"><i class="fa-regular fa-file-excel"></i></button>
									<button class="btn btn-primary" type="button" id="cglPlus"><i class="fa-regular fa-plus"></i></button>
								</div>
							</div>
						</div>
					</div>
				</main>
			</div>
		</div>
        <!-- footer s -->
        <%@ include file="common/footer.jsp"%> 
        <!-- footer s -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../../../admin/adminTemplate/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../../../admin/adminTemplate/assets/demo/chart-area-demo.js"></script>
        <script src="../../../admin/adminTemplate/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="../../../admin/adminTemplate/js/datatables-simple-demo.js"></script>
</body>
</html>