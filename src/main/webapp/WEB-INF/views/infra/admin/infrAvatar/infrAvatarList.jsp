<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>AvatarList</title>
	<%@ include file="../../../rscs/basicRscs.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="/resources/admin/adminTemplate/css/styles.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/059fbc3cf8.js" crossorigin="anonymous"></script>
    <link href="/resources/admin/infrAvatar/css/infrAvatarList.css" rel="stylesheet" />
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
               	    <form method="post" name="form" id="form">
               	    	<input type="hidden" name="avatarSeq" value="${dto.avatarSeq }">
						<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage }" default="1"/>">
						<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow }"/>">
						<input type="hidden" name="checkboxSeqArray">
	                    <div class="container-fluid px-4">
	                        <h3 class="mt-4">아바타관리</h3>
	                        <ol class="breadcrumb mb-4">
	                            <li class="breadcrumb-item active">아바타목록</li>
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
											<span>Total: </span><c:out value="${vo.totalRows }" />
											<sapn>Remain: </sapn><c:out value="${vo.totalRows - ((vo.thisPage - 1) * vo.rowNumToShow + status.index) }" />
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
													<td class="tableHead">아바타 이미지</td>
													<td class="tableHead">아바타 작성자</td>
													<td class="tableHead">아바타 이름</td>
													<td class="tableHead">시간</td>
													<td class="tableHead">사용여부</td>
													<td class="tableHead">삭제여부</td>
												</tr>
											</thead>
											<tbody>
											<c:choose>
												<c:when test="${fn:length(list) eq 0 }">
												<tr>
													<td class="text-center" colspan="8">There is no data!</td>
												</tr>
												</c:when>
												<c:otherWise>
													<c:forEach items="${list }" var="list" varStatus="status">
												<tr style="cursor: pointer;">
													<td class="tableHead1"><input class="listCheck" type="checkbox"></td>
													<td class="tableHead1"><c:out value="${list.avatarSeq }" /></td>
													<td class="tableHead">
														<img src="../../user/image/profil3.png">
													</td>
													<td class="tableHead"><c:out value="${list.regBy }" /></td>
													<td class="tableHead"><c:out value="${list.avatarName }" /></td>
													<td class="tableHead">
														<div>
															<span><c:out value="${list.regDatetime }" /></span>
														</div>
														<div>
															<span><c:out value="${list.modDatetime }" /></span>
														</div>
													</td>
													<td class="tableHead"><c:out value="${list.useNy }" /></td>
													<td class="tableHead"><c:out value="${list.delNy }" /></td>
												</tr>
													</c:forEach>
												</c:otherWise>
											</c:choose>
											</tbody>
										</table>
									</div>
									<!-- pagination s -->
									<%@include file="../common/pagination.jsp"%>
									<!-- pagination e -->
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
					</form>
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