<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>코드폼</title>
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
        	<!-- sidebar s-->
            <%@ include file="../common/sidebar.jsp"%> 
            <!-- sidebar e-->
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h3 class="mt-4">코드관리</h3>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">코드</li>
                        </ol>
					<form name="ccFormReg" id="ccFormReg" action="insert" method="post">
						<div class="container">
							<div class="row mb-4">
								<div class="col-6">
									<!-- forEach문으로 코드그릅 리스트 뿌리기 -->
									<label class="form-label">코드그룹</label> 
										<select
										class="form-select" id="infrCodeGroupSeq" name="infrCodeGroupSeq" 
										>
										<option>코드그룹선택</option>
										<c:forEach items="${view }" var="view" varStatus="status">
											<option  value="${view.infrCcgSeq }"><c:out value="${view.infrCcgNameKor }"/></option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="row mb-4">
								<div class="col-6">
									<label class="form-label">코드 이름 (한글)</label> <input
										class="form-control" type="text" id="infrCcNameKor"
										name="infrCcNameKor" value="${dto.infrCcNameKor }">
								</div>
								<div class="col">
									<label class="form-label">코드 이름 (영문)</label> <input
										class="form-control" type="text" id="infrCcNameEng"
										name="infrCcNameEng" value="${dto.infrCcNameEng }">
								</div>
							</div>
							<div class="row mb-4">
								<!-- <div class="col-6">
									<label class="form-label">순서</label> <input
										class="form-control" type="text" id="infrCcOrder"
										name="infrCcOrder">
								</div> -->
								<div class="col-6">
									<label class="form-label">사용여부</label> <select
										class="form-select" id="infrCcUseNy" name="infrCcUseNy">
										<option value="1">N</option>
										<option value="0">Y</option>
									</select>
								</div>
							
								<div class="col-6">
									<label class="form-label">삭제여부</label> <select
										class="form-select" id="infrCcDelNy" name="infrCcDelNy">
										<option value="1">N</option>
										<option value="0">Y</option>
									</select>
								</div>
							</div>	
								<!-- <div class="col">
									<label class="form-label">등록일</label> <input
										class="form-control" type="text">
								</div> -->
							<div class="row mb-4">
								<div class="col-6">
									<label class="form-label">설명</label>
									<textarea class="form-control"
										style="resize: none; height: 150px;"></textarea>
								</div>
							</div>
							<div class="row p-0">
								<div class="col">
									<button class="btn btn-secondary" type="button" id="btnList">
										<i class="fa-sharp fa-solid fa-bars"></i>
									</button>
								</div>
								<div class="col" style="text-align: right;">
									<!-- <button class="btn btn-danger" type="button" id="cglCancel">
										<i class="fa-duotone fa-x"></i>
									</button>
									<button class="btn btn-danger" type="button" id="cglDel">
										<i class="fa-regular fa-trash-can"></i>
									</button> -->
									<button class="btn btn-primary" type="button" onclick="register()">
										<i class="fa-regular fa-plus"></i>
									</button>
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
        <script src="../../../admin/adminTemplate/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../../../admin/adminTemplate/assets/demo/chart-area-demo.js"></script>
        <script src="../../../admin/adminTemplate/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="../../../admin/adminTemplate/js/datatables-simple-demo.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
		var goUrlList = "/admin/code/infrCcList";
		
		$("#btnList").on("click",function(){
   			$(location).attr("href",goUrlList);
   		});
		
		function register(){
			if(document.getElementById('infrCodeGroupSeq').value == '' || document.getElementById('infrCodeGroupSeq').value == null){
				alert("코드그룹을 선택해주세요")
				return false;
			}
			if(document.getElementById('infrCcNameKor').value == '' || document.getElementById('infrCcNameKor').value == null){
				alert("코드이름(한글)을 입력해주세요")
				document.getElementById('infrCcNameKor').value="";
				document.getElementById('infrCcNameKor').focus();
				return false;
			}
			if(document.getElementById('infrCcNameEng').value == '' || document.getElementById('infrCcNameEng').value == null){
				alert("코드이름(영문)을 입력해주세요")
				document.getElementById('infrCcNameEng').value="";
				document.getElementById('infrCcNameEng').focus();
				return false;
			}
			
		    	document.getElementById('ccFormReg').submit();
		    };
		</script>
</body>
</html>