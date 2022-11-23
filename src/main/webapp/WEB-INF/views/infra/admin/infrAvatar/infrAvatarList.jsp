<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
												<select id="shDelNy" name="shDelNy" class="form-select">
													<option value="" <c:if test="${empty vo.shDelNy }">selected</c:if> selected>삭제구분</option>
													<option value="0" <c:if test="${vo.shDelNy eq 0 }">selected</c:if>>N</option>
													<option value="1" <c:if test="${vo.shDelNy eq 1 }">selected</c:if>>Y</option>
												</select>
											</div>
											<div class="col-2 p-1">
												<select class="form-select" name="shOptionDate">
													<option value="" <c:if test="${empty vo.shOptionDate }">selected</c:if>>날짜선택</option>
													<option value="1" <c:if test="${vo.shOptionDate eq 1 }">selected</c:if>>등록일</option>
													<option value="2" <c:if test="${vo.shOptionDate eq 2 }">selected</c:if>>수정일</option>
												</select>
											</div>
											<div class="col-2 p-1">
												<input class="form-control" type="text" id="shDateStart" name="shDateStart" value="${vo.shDateStart }" placeholder="시작일">
											</div>
											<div class="col-2 p-1">
												<input class="form-control" type="text" id="shDateEnd" name="shDateEnd" value="${vo.shDateEnd }" placeholder="종료일">
											</div>
										</div>
										<div class="row mb-2">
											<div class="col-2 p-1">
												<select class="form-select" id="shOption" name="shOption">
													<option value="" <c:if test="${empty vo.shOption }">selected</c:if>>검색구분</option>
													<option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>아바타 작성자</option>
													<option value="2" <c:if test="${vo.shOption eq 2 }">selected</c:if>>아바타 이름</option>
												</select>
											</div>
											<div class="col-2 p-1">
												<input id="shValue" name="shValue" value="<c:out value="${vo.shValue }"/>" class="form-control" type="search" placeholder="검색어">
											</div>
											<div class="col-1 p-1">
												<button class="btn btn-warning" id="btnSearch" type="button"><i class="fa-solid fa-magnifying-glass"></i></button>
												<button class="btn btn-danger" id="btnReset" type="button"><i class="fa-solid fa-arrow-rotate-right"></i></button>
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
												<c:otherwise>
													<c:forEach items="${list }" var="list" varStatus="status">
												<tr style="cursor: pointer;">
													<td class="tableHead1"><input class="listCheck" type="checkbox"></td>
													<td class="tableHead1"><c:out value="${list.avatarSeq }" /></td>
													<td class="tableHead">
														<img style="width: 60px; height: 60px;" src="<c:out value="${list.path }"/><c:out value="${list.uuidName }"/>">
													</td>
													<td class="tableHead"><c:out value="${list.regBy }" /></td>
													<td class="tableHead"><a href="javascript:goView(<c:out value="${list.avatarSeq }" />)" class="text-decoration-none"><c:out value="${list.avatarName }" /></a></td>
													<td class="tableHead">
														<div>
															<span>등록일: <c:out value="${list.regDatetime }" /></span>
														</div>
														<div>
															<span>수정일: <c:out value="${list.modDatetime }" /></span>
														</div>
													</td>
													<td class="tableHead"><c:out value="${list.useNy }" /></td>
													<td class="tableHead"><c:out value="${list.delNy }" /></td>
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
											<button class="btn btn-primary" type="button" id="btnPlus"><i class="fa-regular fa-plus"></i></button>
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
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/js/datatables-simple-demo.js"></script>
        <script type="text/javascript">
	        var goUrlList = "/admin/avatar/infrAvatarList";
			var goUrlForm = "/admin/avatar/infrAvatarForm";
			var goUrlView = "/admin/avatar/infrAvatarView";
			var goUrlUpdt = "/admin/avatar/infrAvatarUpdt";
			var goUrlUele = "/admin/avatar/infrAvatarUele";
			var goUrlDele = "/admin/avatar/infrAvatarDele";
	
			var form = $("form[name=form]");
	
			$("#btnSearch").on("click", function() {
				form.attr("action", goUrlList).submit();
			});
			
			$("#btnList").on("click", function(){
				form.attr("action", goUrlList).submit();
			});
	
			$("#btnReset").on("click", function() {
				$(location).attr("href", goUrlList);
			});
			
			$("#btnPlus").on("click", function(){
				$(location).attr("href", goUrlForm);
			});
	
			goList = function(thisPage) {
				$("input:hidden[name=thisPage]").val(thisPage);
				form.attr("action", goUrlList).submit();
			}
			
			var seq = $("input:hidden[name=avatarSeq]");
			
			goForm = function(keyValue) {
				seq.val(keyValue);
				form.attr("action", goUrlForm).submit();
			}
			
			goView = function(keyValue) {
		    	/* if(keyValue != 0) seq.val(btoa(keyValue)); */
		    	seq.val(keyValue);
				form.attr("action", goUrlView).submit();
			}
        </script>
</body>
</html>