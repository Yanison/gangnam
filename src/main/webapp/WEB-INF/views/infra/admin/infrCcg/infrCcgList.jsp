<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	<%@ include file="../../../rscs/basicRscs.jsp" %>
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
                        <form  method="post" name="form">
                        <input type="hidden" name="infrCcgSeq" value="<c:out value="${dto.infrCcgSeq }"/>">
						<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage }" default="1"/>">
						<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow }"/>">
						<input type="hidden" name="checkboxSeqArray">
						<div class="col">
							<div class="row">
								<div class="col border me-4">
									<div class="row  mt-2 mb-2">
										<div class="col-2 p-1">
											<select class="form-select" id="shDelNy" name="shDelNy">
												<option value="" selected<c:if test="${empty vo.shDelNy }">selected</c:if>>삭제여부</option>
												<option value="1" <c:if test="${vo.shDelNy eq 1 }">selected</c:if>>N</option>
												<option value="0" <c:if test="${vo.shDelNy eq 0 }">selected</c:if>>Y</option>
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
												<option value="">검색구분</option>
												<option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>순서</option>
												<option value="2" <c:if test="${vo.shOption eq 2 }">selected</c:if>>이름(한글)</option>
												<option value="3" <c:if test="${vo.shOption eq 3 }">selected</c:if>>이름(영문)</option>
											</select>
										</div>
										<div class="col-2 p-1">
											<input class="form-control" type="text" placeholder="검색어">
										</div>
										<div class="col-1 p-1">
											<a class="btn btn-warning" role="button" id="btnSearch"><i class="fa-solid fa-magnifying-glass"></i></a>
											<a class="btn btn-danger"  role="button" id="btnReset"><i class="fa-solid fa-arrow-rotate-right"></i></a>
										</div>
									</div>
								</div>
							</div>
							<div class="row mt-3">
								<div class="row">
									<div class="col-11 p-0">
										<span>Total: <c:out value="${vo.totalRows }"/></span>
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
									<table class="table table-striped table-hover border"> <!-- table choose, forEach문 -->
										<thead>
											<tr class="table-dark">
												<td class="tableHead1"><input class="listCheck" type="checkbox"></td>
												<td class="tableHead1">#</td>
												<td class="tableHead">코드그룹 코드</td>
												<td class="tableHead">코드그룹 이름 (한글)</td>
												<td class="tableHead">코드그룹 이름 (영문)</td>
												<td class="tableHead">코드갯수</td>
												<td class="tableHead">등록일</td>
												<td class="tableHead">수정일</td>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${fn:length(list) eq 0 }">
													<tr>
														<td class="text-center" colspan="8">There is no data!</td>
													</tr>
												</c:when>
												<c:otherwise>
												<c:forEach items="${list }" var="list" varStatus="status">
													<tr>
														<td class="tableHead1"><input class="listCheck" type="checkbox"></td>
														<td class="tableHead1"><c:out value="${list.infrCcgSeq }"/></td>
														<td>코드그룹 코드</td>
														<td><c:out value="${list.infrCcgNameKor }"/></td>
														<td><c:out value="${list.infrCcgNameEng }"/></td>
														<td><c:out value="${list.infrCcCount }"/></td>
														<td><c:out value="${list.regDatetime }"/></td>
														<td><c:out value="${list.modDatetime }"/></td>
													</tr>
												</c:forEach>
												</c:otherwise>
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
										<button class="btn btn-primary" type="button" id="btnForm"><i class="fa-regular fa-plus"></i></button>
									</div>
								</div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/assets/demo/chart-area-demo.js"></script>
        <script src="/resources/admin/adminTemplate/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/js/datatables-simple-demo.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script>
	        var goUrlForm = "/admin/codeGroup/infrCcgForm";
	    	var goUrlView ="/admin/codeGroup/infrCcgView";
	    	var goUrlList = "/admin/codeGroup/infrCcgList";
	    	
	   		var seq = $("input:hidden[name=infrCcgSeq]");
	    	var form = $("form[name=form]");
	    	
	    	$("#btnSearch").on("click",function(){
        		form.attr("action", goUrlList).submit();
        	});
	    	
	    	$("#btnReset").on("click",function(){
       			$(location).attr("href",goUrlList);
       		});
	    	
	    	$("#btnForm").on("click",function(){
       			$(location).attr("href",goUrlForm);
       		});
        </script>
</body>
</html>