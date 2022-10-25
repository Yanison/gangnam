<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>MapList</title>
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
                        <h3 class="mt-4">매타버스관리</h3>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">매타버스목록</li>
                        </ol>
						<div class="col">
							<div class="row">
								<div class="col border me-4">
									<div class="row  mt-2 mb-2">
										<div class="col-2 p-1">
											<select class="form-select">
												<option>N</option>
											</select>
										</div>
										<div class="col-2 p-1">
											<select class="form-select">
												<option>수정일</option>
											</select>
										</div>
										<div class="col-2 p-1">
											<input class="form-control" type="text" placeholder="시작일">
										</div>
										<div class="col-2 p-1">
											<input class="form-control" type="text" placeholder="종료일">
										</div>
									</div>
									<div class="row mb-2">
										<div class="col-2 p-1">
											<select class="form-select">
												<option>검색구분</option>
											</select>
										</div>
										<div class="col-2 p-1">
											<input class="form-control" type="text" placeholder="검색어">
										</div>
										<div class="col-1 p-1">
											<a class="btn btn-warning" href="#" role="button"><i class="fa-solid fa-magnifying-glass"></i></a>
											<a class="btn btn-danger" href="#" role="button"><i class="fa-solid fa-arrow-rotate-right"></i></a>
										</div>
									</div>
								</div>
							</div>
							<div class="row mt-3">
								<div class="row">
									<div class="col-11 p-0">
										<span>Total: 42</span>
									</div>
									<div class="col-1 p-0">
										<div class="col-12">
											<select class="form-select py-1" style="height: 30px; font-size: 12px;">
												<option>10</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row mt-1">
									<table class="table table-striped table-hover border">
										<thead>
											<tr class="table-dark">
												<td class="tableHead1"><input class="listCheck" type="checkbox"></td>
												<td class="tableHead1">#</td>
												<td class="tableHead">맵 사진</td>
												<td class="tableHead">맴 작성자</td>
												<td class="tableHead">맴 이름</td>
												<td class="tableHead">시간</td>
												<td class="tableHead">사용여부</td>
												<td class="tableHead">삭제여부</td>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="tableHead1"><input class="listCheck" type="checkbox"></td>
												<td class="tableHead1">#</td>
												<td class="tableHead">맵 사진</td>
												<td class="tableHead">맴 작성자</td>
												<td class="tableHead">맴 이름</td>
												<td class="tableHead">시간</td>
												<td class="tableHead">사용여부</td>
												<td class="tableHead">삭제여부</td>
											</tr>
											<tr>
												<td class="tableHead1"><input class="listCheck" type="checkbox"></td>
												<td class="tableHead1">#</td>
												<td class="tableHead">맵 사진</td>
												<td class="tableHead">맴 작성자</td>
												<td class="tableHead">맴 이름</td>
												<td class="tableHead">시간</td>
												<td class="tableHead">사용여부</td>
												<td class="tableHead">삭제여부</td>
											</tr>
											<tr>
												<td class="tableHead1"><input class="listCheck" type="checkbox"></td>
												<td class="tableHead1">#</td>
												<td class="tableHead">맵 사진</td>
												<td class="tableHead">맴 작성자</td>
												<td class="tableHead">맴 이름</td>
												<td class="tableHead">시간</td>
												<td class="tableHead">사용여부</td>
												<td class="tableHead">삭제여부</td>
											</tr>
											<tr>
												<td class="tableHead1"><input class="listCheck" type="checkbox"></td>
												<td class="tableHead1">#</td>
												<td class="tableHead">맵 사진</td>
												<td class="tableHead">맴 작성자</td>
												<td class="tableHead">맴 이름</td>
												<td class="tableHead">시간</td>
												<td class="tableHead">사용여부</td>
												<td class="tableHead">삭제여부</td>
											</tr>
											<tr>
												<td class="tableHead1"><input class="listCheck" type="checkbox"></td>
												<td class="tableHead1">#</td>
												<td class="tableHead">맵 사진</td>
												<td class="tableHead">맴 작성자</td>
												<td class="tableHead">맴 이름</td>
												<td class="tableHead">시간</td>
												<td class="tableHead">사용여부</td>
												<td class="tableHead">삭제여부</td>
											</tr>
											<tr>
												<td class="tableHead1"><input class="listCheck" type="checkbox"></td>
												<td class="tableHead1">#</td>
												<td class="tableHead">맵 사진</td>
												<td class="tableHead">맴 작성자</td>
												<td class="tableHead">맴 이름</td>
												<td class="tableHead">시간</td>
												<td class="tableHead">사용여부</td>
												<td class="tableHead">삭제여부</td>
											</tr>
											<tr>
												<td class="tableHead1"><input class="listCheck" type="checkbox"></td>
												<td class="tableHead1">#</td>
												<td class="tableHead">맵 사진</td>
												<td class="tableHead">맴 작성자</td>
												<td class="tableHead">맴 이름</td>
												<td class="tableHead">시간</td>
												<td class="tableHead">사용여부</td>
												<td class="tableHead">삭제여부</td>
											</tr>
											<tr>
												<td class="tableHead1"><input class="listCheck" type="checkbox"></td>
												<td class="tableHead1">#</td>
												<td class="tableHead">맵 사진</td>
												<td class="tableHead">맴 작성자</td>
												<td class="tableHead">맴 이름</td>
												<td class="tableHead">시간</td>
												<td class="tableHead">사용여부</td>
												<td class="tableHead">삭제여부</td>
											</tr>
											<tr>
												<td class="tableHead1"><input class="listCheck" type="checkbox"></td>
												<td class="tableHead1">#</td>
												<td class="tableHead">맵 사진</td>
												<td class="tableHead">맴 작성자</td>
												<td class="tableHead">맴 이름</td>
												<td class="tableHead">시간</td>
												<td class="tableHead">사용여부</td>
												<td class="tableHead">삭제여부</td>
											</tr>
											<tr>
												<td class="tableHead1"><input class="listCheck" type="checkbox"></td>
												<td class="tableHead1">#</td>
												<td class="tableHead">맵 사진</td>
												<td class="tableHead">맴 작성자</td>
												<td class="tableHead">맴 이름</td>
												<td class="tableHead">시간</td>
												<td class="tableHead">사용여부</td>
												<td class="tableHead">삭제여부</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="row mt-2 text-center">
									<ul class="pagination" style="justify-content: center;">
										<li class="page-item">
											<a class="page-link" href="#" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</li>
										<li class="page-item">
											<a class="page-link active" aria-current="page">1</a>
										</li>
										<li class="page-item">
											<a class="page-link" href="#">2</a>
										</li>
										<li class="page-item">
											<a class="page-link" href="#">3</a>
										</li>
										<li class="page-item">
											<a class="page-link" href="#">4</a>
										</li>
										<li class="page-item">
											<a class="page-link" href="#">5</a>
										</li>
										<li class="page-item">
											<a class="page-link" href="#" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									</ul>
								</div>
								<div class="row p-0">
									<div class="col">
										<button class="btn btn-danger" type="button" id="cglCancel"><i class="fa-duotone fa-x"></i></button>
										<button class="btn btn-danger" type="button" id="cglDel"><i class="fa-regular fa-trash-can"></i></button>
									</div>
									<div class="col" style="text-align: right;">
										<button class="btn btn-success" type="button" id="cglExcel"><i class="fa-regular fa-file-excel"></i></button>
										<button class="btn btn-primary" type="button" id="cglPlus"><i class="fa-regular fa-plus"></i></button>
									</div>
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