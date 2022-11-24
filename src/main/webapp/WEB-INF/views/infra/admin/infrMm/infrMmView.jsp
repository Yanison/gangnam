<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>맴버뷰</title>
	<%@ include file="../../../rscs/basicRscs.jsp" %>
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    <link href="/resources/admin/adminTemplate/css/styles.css" rel="stylesheet" />
    <script src="https://kit.fontawesome.com/059fbc3cf8.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
 
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
                        <form name="form" method="post">
                        <input type="hidden" name="infrMmSeq" value="${item.infrMmSeq }">
                        <div class="container">
							<div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label">회원아이디</label>
		                        	<input class="form-control" type="text" placeholder="회원아이디" id="infrMmId" name="infrMmId" value="<c:out value="${item.infrMmId }"/>">
		                        </div>
		                        <div class="col">
		                        	<label class="form-label">이름</label>
		                        	<input class="form-control" type="text" placeholder="이름" id="infrMmName" name="infrMmName" value="<c:out value="${item.infrMmName }"/>" >
		                        </div>
	                        </div>
	                        <div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label">이메일</label>
		                        	<input class="form-control" type="text" placeholder="이메일" id="infrMmEmailId" name="infrMmEmailId" value="<c:out value="${item.infrMmEmailId }"/>">
		                        </div>
	                        </div>
	                        <div class="row mb-4" style="height: 70px;">
		                        <div class="col-6">
		                        	<label class="form-label">닉네임</label>
		                        	<input class="form-control" type="text" placeholder="닉네임" id="infrMmNickname" name="infrMmNickname" value="<c:out value="${item.infrMmNickname }"/>">
		                        </div>
		                        <div class="col mb-4">
		                        	<label class="form-label">성별</label>
		                        	<select class="form-select" id="infrMmGender" name="infrMmGender">
		                        		<option value="5"<c:if test="${item.infrMmGender eq 5 }">selected</c:if>>남자</option>
		                        		<option value="6"<c:if test="${item.infrMmGender eq 6 }">selected</c:if>>여자</option>
		                        	</select>
		                        </div>
	                        </div>
	                        <div class="row mb-4">
		                        <%-- <div class="col-6">
		                        	<label class="form-label">생년월일</label>
		                        	<input class="form-control" type="text" placeholder="생년월일" id="datepicker" name="infrMmBod" value="<c:out value="${item.infrMmBod }"/>">
		                        </div> --%>
		                        <div class="col-6">
		                        	<label class="form-label">전화번호</label>
		                        	<input class="form-control" type="text" placeholder="전화번호" id="infrMmPhone" name="infrMmPhone" value="<c:out value="${item.infrMmPhone }"/>">
		                        </div>
	                        </div>
	                        <div class="row mb-4">
		                        <div class="col-6">
		                        	<label class="form-label">삭제여부</label>
									<select class="form-select" id="infrMmDelNy" name="infrMmDelNy">
		                        		<option value="1"<c:if test="${item.infrMmDelNy eq 1 }">selected</c:if>>N</option>
		                        		<option value="0"<c:if test="${item.infrMmDelNy eq 0 }">selected</c:if>>Y</option>
		                        	</select>
		                        </div>
		                        <div class="col">
		                        	<label class="form-label">사용여부</label>
									<select class="form-select" id="infrMmUseNy" name="infrMmUseNy">
		                        		<option value="1"<c:if test="${item.infrMmUseNy eq 1 }">selected</c:if>>N</option>
		                        		<option value="0"<c:if test="${item.infrMmUseNy eq 0 }">selected</c:if>>Y</option>
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
                      	</div>
                      	</form>	  
							<div class="row p-0">
								<div class="col">
									<button class="btn btn-secondary" type="button" id="btnList"><i class="fa-sharp fa-solid fa-bars"></i></button>
								</div>
								<div class="col" style="text-align: right;">
									<button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#deleModal"><i class="fa-regular fa-trash-can"></i></button>
									<button class="btn btn-danger" type="button" data-bs-toggle="modal" data-bs-target="#ueleModal"><i class="fa-regular fa-trash-can"></i></button>
									<button class="btn btn-primary" type="button" id="btnModify"><i class="fa-regular fa-plus"></i></button>
								</div>
							</div>
						</div>
					</div>
				</main>
			</div>
		</div>
	
    <!-- footer s -->
    <%@ include file="../common/footer.jsp"%> 
    <!-- footer s -->
    
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
	        <button type="button" class="btn btn-danger" id="btnDele" name="btnDele">삭제</button>
	      </div>
	    </div>
	  </div>
	</div> 
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script> 
    <script src="../../../../../resources/admin/adminTemplate/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <!-- <script src="../../../admin/adminTemplate/assets/demo/chart-area-demo.js"></script>
    <script src="../../../admin/adminTemplate/assets/demo/chart-bar-demo.js"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <!-- <script src="../../../admin/adminTemplate/js/datatables-simple-demo.js"></script> -->
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script>
    var goUrlList = "/admin/memberGroup/infrMmList"
   	var goUrlModify = "/admin/memberGroup/update" 
   	var goUrlUele = "/admin/memberGroup/uelete"
	var goUrlDele = "/admin/memberGroup/delete"  
	
	var seq = $("input:hidden[name=infrMmSeq]");
    var form = $("form[name=form]");
    
   	$("#btnList").on("click",function(){
   		$(location).attr("href",goUrlList);
   	});
    
    $("#btnUele").on("click",function(){
		form.attr("action", goUrlUele).submit();
	});
    
    $("#btnDele").on("click",function(){
		form.attr("action", goUrlDele).submit();
	});
    
    $("#btnModify").on("click",function(){
    	if(document.getElementById('infrMmId').value == '' || document.getElementById('infrMmId').value == null){
			alert("아이디를 입력해주세요")
			document.getElementById('infrMmId').value="";
			document.getElementById('infrMmId').focus();
			return false;
		}
		if(document.getElementById('infrMmName').value == '' || document.getElementById('infrMmName').value == null){
			alert("이름을 입력해주세요")
			document.getElementById('infrMmName').value="";
			document.getElementById('infrMmName').focus();
			return false;
		}
		if(document.getElementById('infrMmEmailId').value == '' || document.getElementById('infrMmEmailId').value == null){
			alert("이메일주소 입력해주세요")
			document.getElementById('infrMmEmailId').value="";
			document.getElementById('infrMmEmailId').focus();
			return false;
		}
		if(document.getElementById('infrMmNickname').value == '' || document.getElementById('infrMmNickname').value == null){
			alert("닉네임 입력해주세요")
			document.getElementById('infrMmNickname').value="";
			document.getElementById('infrMmNickname').focus();
			return false;
		}
		if(document.getElementById('infrMmBod').value == '' || document.getElementById('infrMmBod').value == null){
			alert("생년월일 입력해주세요")
			document.getElementById('infrMmBod').value="";
			document.getElementById('infrMmBod').focus();
			return false;
		}
		if(document.getElementById('infrMmPhone').value == '' || document.getElementById('infrMmPhone').value == null){
			alert("전화번호 입력해주세요")
			document.getElementById('infrMmPhone').value="";
			document.getElementById('infrMmPhone').focus();
			return false;
		}
    	form.attr("action", goUrlModify).submit();
	});
    
    </script>
</body>
</html>