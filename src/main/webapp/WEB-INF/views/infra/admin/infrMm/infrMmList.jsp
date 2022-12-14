<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="AdminCodeServiceImpl" class="com.sgworld.infra.modules.admin.code.AdminCodeServiceImpl"/>
<html>
<head>
	<title>맴버리스트</title>
	<%@ include file="../../../rscs/basicRscs.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="/resources/admin/adminTemplate/css/styles.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/059fbc3cf8.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
	<!-- top banner s-->
	<%@ include file="../common/header.jsp"%>   
	<!-- top banner e-->
        <div id="layoutSidenav">
        	<!-- left banner s-->
            <%@ include file="../common/sidebar.jsp"%> 
            <!-- left banner e-->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h3 class="mt-4">회원관리</h3>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">회원목록</li>
                        </ol>
                        <form  method="post" name="form">
                        <input type="hidden" name="infrMmSeq" value="<c:out value="${dto.infrMmSeq }"/>">
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
											<select class="form-select" id="shOption" name="shOption">
												<option value="">검색구분</option>
												<option value="1" <c:if test="${vo.shOption eq 1 }">selected</c:if>>순서</option>
												<option value="2" <c:if test="${vo.shOption eq 2 }">selected</c:if>>이름</option>
												<option value="3" <c:if test="${vo.shOption eq 3 }">selected</c:if>>아이디</option>
											</select>
										</div>
										<div class="col-2 p-1">
											<input class="form-control" type="text" placeholder="검색어" id="shValue" name="shValue" value="<c:out value="${vo.shValue }"/>">
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
									<table class="table table-striped table-hover border">
										<thead>
											<tr class="table-dark">
												<td class="tableHead1"><input class="listCheck" type="checkbox"></td>
												<td class="tableHead1">#</td>
												<td class="tableHead">회원아이디</td>
												<td class="tableHead">이름</td>
												<td class="tableHead">닉네임</td>
												<td class="tableHead">성별</td>
												<td class="tableHead">생년월일</td>
												<td class="tableHead">이메일</td>
												<td class="tableHead">전화번호</td>
												<td class="tableHead">계정상태</td>
											</tr>
										</thead>
										<tbody>
											<c:set var="listCodeGender" value="${AdminCodeServiceImpl.selectListCachedCode('2')}"/>
					  						<c:set var="listCodeEmail" value="${AdminCodeServiceImpl.selectListCachedCode('1')}"/><!-- 이메일 -->
											<c:set var="listCodePersonalState" value="${AdminCodeServiceImpl.selectListCachedCode('5')}"/><!--  -->
											<c:choose>
												<c:when test="${fn:length(list) eq 0 }">
													<tr>
														<td class="text-center" colspan="10">There is no data!</td>
													</tr>
												</c:when>
												<c:otherwise>
												<c:forEach items="${list }" var="list" varStatus="status">
													<tr>
														<td class="tableHead1"><input class="listCheck" type="checkbox"></td>
														<td class="tableHead1"><c:out value="${list.infrMmSeq }" /></td>
														<td class="tableHead"><c:out value="${list.infrMmId }" /></td>
														<td class="tableHead"><a href="javascript:goMemberView(<c:out value="${list.infrMmSeq }"/>)" class="text-decoration-none"><c:out value="${list.infrMmName }"/></td>
														<td class="tableHead"><c:out value="${list.infrMmNickname }" /></td>
														<td class="tableHead">
															<c:forEach items="${listCodeGender }" var="listGender" varStatus="statusGender">
																<c:if test="${list.infrMmGender eq listGender.infrCcSeq }"><c:out value="${listGender.infrCcNameKor }" /></c:if>	
															</c:forEach>
														</td>
														<td class="tableHead"><c:out value="${list.infrMmBod }" /></td>
														<td class="tableHead">
															<c:out value="${list.infrMmEmailId }" />@
															<c:forEach items="${listCodeEmail }" var="listEmail" varStatus="statusEmail">
																<c:if test="${list.infrMmEmailAddress eq listEmail.infrCcSeq }"><c:out value="${listEmail.infrCcNameEng }" /></c:if>	
															</c:forEach>
														</td>
														<td class="tableHead"><c:out value="${list.infrMmPhone }" /></td>
														<td class="tableHead">
															<c:forEach items="${listCodePersonalState }" var="listState" varStatus="statusState">
																<c:if test="${list.infrMmDelNy eq listState.infrCcSeq }"><c:out value="${listState.infrCcNameKor }" /></c:if>
															</c:forEach>
														</td>
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
										<button class="btn btn-danger" type="button" onclick="ready()"><i class="fa-duotone fa-x"></i></button>
										<button class="btn btn-danger" type="button" onclick="ready()"><i class="fa-regular fa-trash-can"></i></button>
									</div>
									<div class="col" style="text-align: right;">
										<button class="btn btn-success" type="button" onclick="ready()"><i class="fa-regular fa-file-excel"></i></button>
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
        <!-- footer s -->
        <%@ include file="../common/footer.jsp"%> 
        <!-- footer s -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../../../../../resources/admin/adminTemplate/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <!-- <script src="../../../../resources/admin/adminTemplate/chart-area-demo.js"></script> -->
        <!-- <script src="../../../admin/adminTemplate/assets/demo/chart-bar-demo.js"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <!-- <script src="../../../admin/adminTemplate/js/datatables-simple-demo.js"></script> -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script>
        	var goUrlMemberForm = "/admin/memberGroup/infrMmForm";
        	var goUrlView ="/admin/memberGroup/infrMmView";
        	var goUrlList = "/admin/memberGroup/infrMmList";
        	
       		var seq = $("input:hidden[name=infrMmSeq]");
        	var form = $("form[name=form]");
        	
       		$("#btnForm").on("click",function(){
       			$(location).attr("href",goUrlMemberForm);
       		});
        	
       		$("#btnSearch").on("click",function(){
        		form.attr("action", goUrlList).submit();
        	});
       		
       		$("#btnReset").on("click",function(){
       			$(location).attr("href",goUrlList);
       		});
       		
        	goMemberView = function(seqValue){
        		seq.val(seqValue);
        		form.attr("action" , goUrlView).submit();
        	}
        	
        	goList = function(thisPage) {
    			$("input:hidden[name=thisPage]").val(thisPage);
    			form.attr("action", goUrlList).submit();
    		}
        	
        	goView = function(keyValue) {
    	    	/* if(keyValue != 0) seq.val(btoa(keyValue)); */
    	    	seq.val(keyValue);
    			form.attr("action", goUrlView).submit();
    		}
        	
        	function ready(){
        		alert("준비중입니다")
        	};
        	
        </script>
</body>
</html>