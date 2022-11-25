<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>코드뷰</title>
	<%@ include file="../../../rscs/basicRscs.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="/resources/admin/adminTemplate/css/styles.css" rel="stylesheet" />
    <!-- <script src="https://kit.fontawesome.com/059fbc3cf8.js" crossorigin="anonymous"></script> -->
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
                        <form method="post" name="form">
                        <input type="hidden" name="infrCcSeq" value="${item.infrCcSeq }">
                        <div class="container">
	                        <div class="row mb-4">
		                        <div class="col-6"> <!-- forEach문으로 코드그릅 리스트 뿌리기 -->
		                        	<label class="form-label">코드그룹</label>
		                        	<select class="form-select" id="infrCodeGroupSeq" name="infrCodeGroupSeq">
		                        		<option>코드그룹선택</option>
		                        		<c:forEach items="${view}" var="view" varStatus="status">
									  		<option value="${ view.infrCcgSeq}" <c:if test="${item.infrCodeGroupSeq eq view.infrCcgSeq }">selected</c:if>>
									  			<c:out value="${ view.infrCcgNameKor}"/>
									  		</option>
							  			</c:forEach>
		                        	</select>
		                        </div>
	                        </div>
	                        <div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label">코드 이름 (한글)</label>
		                        	<input class="form-control" type="text" id="infrCcNameKor" name="infrCcNameKor" value="${item.infrCcNameKor} ">
		                        </div>
		                        <div class="col">
		                        	<label class="form-label">코드 이름 (영문)</label>
		                        	<input class="form-control" type="text" id="infrCcNameEng" name="infrCcNameEng" value="${item.infrCcNameEng }">
		                        </div>
	                        </div>
	                        <div class="row mb-4">
		                        <!-- <div class="col-6">
		                        	<label class="form-label">순서</label>
		                        	<input class="form-control" type="text" id="infrCcOrder" name="infrCcOrder">
		                        </div> -->
		                        <div class="col-6">
		                        	<label class="form-label">사용여부</label>
		                        	<select class="form-select" id="infrCcUseNy" name="infrCcUseNy">
		                        		<option value="0">Y</option>
		                        		<option value="1">N</option>
		                        	</select>
		                        </div>
	                        </div>
	                        <div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label">삭제여부</label>
		                        	<select class="form-select" id="infrCcDelNy" name="infrCcDelNy">
		                        		<option value="1">N</option>
		                        		<option value="0">Y</option>
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
        <!-- footer s -->
        <%@ include file="../common/footer.jsp"%> 
        <!-- footer s -->
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script> -->
        <!-- <script src="../../../admin/adminTemplate/js/scripts.js"></script> -->
        <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script> -->
     <!--    <script src="../../../admin/adminTemplate/assets/demo/chart-area-demo.js"></script>
        <script src="../../../admin/adminTemplate/assets/demo/chart-bar-demo.js"></script> -->
        <!-- <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script> -->
        <!-- <script src="../../../admin/adminTemplate/js/datatables-simple-demo.js"></script> -->
	 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
		var goUrlList = "/admin/code/infrCcList";
		var goUrlUpdt = "/admin/code/update";
		var goUrlUele = "/admin/code/uelete";
		var goUrlDele =	"/admin/code/delete";
		
        var seq = $("input:hidden[name=ccgseq]");
        var form = $("form[name=form]");
		
		$("#btnList").on("click",function(){
   			$(location).attr("href",goUrlList);
   		});
        
    	$("#btnUele").on("click",function(){
   			form.attr("action", goUrlUele).submit();
    	});
    	
    	$("#btnDelete").on("click", function(){
   			form.attr("action", goUrlDele).submit();
    	});
    	
    	$("#btnModify").on("click",function(){
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
    		
    		form.attr("action", goUrlUpdt).submit();
       	});
		</script> 
</body>
</html>