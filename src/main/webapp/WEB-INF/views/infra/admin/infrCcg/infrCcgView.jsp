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
                        <form method="post" id="form" name="form">
                        <input type="hidden" name="infrCcgSeq" value="${item.infrCcgSeq }">
                        <div class="container">
	                        <div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label">코드그룹이름</label>
		                        	<input class="form-control" type="text" name="infrCcgNameKor" id="infrCcgNameKor" value="${item.infrCcgNameKor }">
		                        </div>
		                        <div class="col">
		                        	<label class="form-label">코드그룹이름(영문)</label>
		                        	<input class="form-control" type="text" name="infrCcgNameEng" id="infrCcgNameEng" value="${item.infrCcgNameEng }">
		                        </div>
	                        </div>
	                        <div class="row mb-4">
		                        <!-- <div class="col-6">
		                        	<label class="form-label">순서</label>
		                        	<input class="form-control" type="text">
		                        </div> -->
		                        <div class="col-6">
		                        	<label class="form-label">사용여부</label>
		                        	<select class="form-select" name="infrCcgUseNy" id="infrCcgUseNy">
		                        		<option value="1"<c:if test="${item.infrCcgUseNy eq 1}">selected</c:if>>N</option>
		                        		<option value="0"<c:if test="${item.infrCcgUseNy eq 0}">selected</c:if>>Y</option>
		                        	</select>
		                        </div>
	                        </div>
	                        <div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label">삭제여부</label>
		                        	<select class="form-select" id="infrCcgDelNy" name="infrCcgDelNy">
		                        		<option value="1"<c:if test="${item.infrCcgDelNy eq 1}">selected</c:if>>N</option>
		                        		<option value="0"<c:if test="${item.infrCcgDelNy eq 0}">selected</c:if>>Y</option>
		                        	</select>
		                        </div>
		                        <div class="col">
		                        	<label class="form-label">등록일</label>
		                        	<input class="form-control" type="text" value="<fmt:formatDate value="${item.regDatetime }" pattern="yyyy-MM-dd" />">
		                        </div>
	                        </div>
	                        <div class="row mb-4">
	                        	<div class="col-6">
	                        		<label class="form-label">설명</label>
									<textarea class="form-control" style="resize: none; height: 150px;"></textarea>
								</div>
								<div class="col">
		                        	<label class="form-label">수정일</label>
		                        	<input class="form-control" type="text" name="modDatetime" value="<fmt:formatDate value="${list.modDatetime }" pattern="yyyy-MM-dd" />">
		                        </div>
	                        </div>
							<div class="row p-0">
								<div class="col">
									<button class="btn btn-secondary" type="button" id="btnList"><i class="fa-sharp fa-solid fa-bars"></i></button>
								</div>
								<div class="col" style="text-align: right;">
									<button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#deleModal"><i class="fa-duotone fa-x"></i></button>
									<button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#ueleModal"><i class="fa-regular fa-trash-can"></i></button>
									<button class="btn btn-primary" type="button" id="btnModify"><i class="fa-regular fa-plus"></i></button>
								</div>
							</div>
						</div>
						</form>						
					</div>
				</main>
			</div>
        </div>
        	<!-- uele Modal -->
			<div class="modal fade" id="ueleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">삭제</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        사용여부 삭제 하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-danger" id="btnUele" name="btnUele">삭제</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!--delete Modal -->
			<div class="modal fade" id="deleModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="staticBackdropLabel">삭제</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        완전삭제 하시겠습니까?
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			        <button type="button" class="btn btn-danger" id="btnDelete" name="btnDelete">삭제</button>
			      </div>
			    </div>
			  </div>
			</div>
		<form name="formVo" method="post">
			<%@include file="infrCcgFormVo.jsp"%>	
		</form>	
        <!-- footer s-->
        <%@ include file="../common/footer.jsp" %>
        <!-- footer e-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script> -->
        <script src="/resources/admin/adminTemplate/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/assets/demo/chart-area-demo.js"></script>
        <script src="/resources/admin/adminTemplate/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/admin/adminTemplate/js/datatables-simple-demo.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <script>
        var goUrlList = "/admin/codeGroup/infrCcgList";
        var goUrlUpdt = "/admin/codeGroup/update";
        var goUrlUele = "/admin/codeGroup/uelete";
        var goUrlDele = "/admin/codeGroup/delete";
        
        var seq = $("input:hidden[name=ccgseq]");
        var form = $("form[name=form]");
        var formVo = $("form[name=formVo]");
        
        $("#btnList").on("click",function(){
   			$(location).attr("href",goUrlList);
   		});
        
        $("#btnModify").on("click",function(){
        	 if(document.getElementById('infrCcgNameKor').value == '' || document.getElementById('infrCcgNameKor').value == null){
				alert("코드그룹이름(한글) 입력해주십쇼")
				document.getElementById('infrCcgNameKor').value="";
				document.getElementById('infrCcgNameKor').focus();
				return false;
			}
			if(document.getElementById('infrCcgNameEng').value == '' || document.getElementById('infrCcgNameEng').value == null){
				alert("코드그룹이름(영문) 입력해주십쇼")
				document.getElementById('infrCcgNameEng').value="";
				document.getElementById('infrCcgNameEng').focus();
				return false;
			} 
       		form.attr("action", goUrlUpdt).submit();
       	});
        
    	$("#btnUele").on("click",function(){
   			formVo.attr("action", goUrlUele).submit();
    	});
    	
    	$("#btnDelete").on("click", function(){
   			formVo.attr("action", goUrlDele).submit();
    	});
        
        </script>
        
</body>
</html>