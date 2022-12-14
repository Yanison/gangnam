<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>SGWorld</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	 
	<link href="/resources/user/member/css/memberAvartar.css" rel="stylesheet">
	<link href="../resources/user/home/css/header.css" rel="stylesheet">
	<link href="../resources/user/home/css/footer.css" rel="stylesheet">
</head>
<body>
	<form name="form" method="post" enctype="multipart/form-data">
	<header>
		<%@ include file="../../common/header.jsp"%> 
	</header>
	<!-- contend s -->
	<div class="wrap">
		<!-- header 넣을자리-->
		<div class="contentWrap">
			<span>My Page</span>
			<div class="leftDiv">	
				<!-- left Nav s-->
				<%@ include file="../../common/memberNav.jsp"%>
				<!-- left Nav e -->
				<section style=" width: 1000px;">
					<b>아바타 수정</b>
					<c:choose>
						<c:when test="${item.seq == null}">
							<article class="rightContent">
								<!-- <div class="icon"> -->
									<c:set var="type" value="2"/>	
						        	<c:set var="name" value="uploadImg"/>		
									<div id="<c:out value="${name }"/>Preview" class="addScroll">
										<c:forEach items="${listUploaded}" var="listUploaded" varStatus="statusUploaded">
											<c:if test="${listUploaded.type eq type }">
												<div id="imgDiv_<c:out value="${type }"/>_<c:out value="${listUploaded.sort }"/>" style="display: inline-block; height: 95px;">
													<img src="<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>" class="rounded" width= "85px" height="85px" style="cursor:pointer;" onClick="openViewer(<c:out value="${listUploaded.type }"/>, <c:out value="${listUploaded. sort }"/>);">
													<div style="position: relative; top:-85px; left:5px"><span style="color: red; cursor:pointer;" onClick="delImgDiv('<c:out value="${name }"/>', <c:out value="${type }"/>,<c:out value="${listUploaded.sort }"/>, <c:out value="${listUploaded.seq }"/>, '<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>')">X</span></div>
												</div>
											</c:if>
										</c:forEach>
									</div>
									<input type="hidden" id="<c:out value="${name }"/>Type" name="<c:out value="${name }"/>Type" value="<c:out value="${type }"/>"/>
						        	<input type="hidden" id="<c:out value="${name }"/>MaxNumber" name="<c:out value="${name }"/>MaxNumber" value="0"/>
						        	<input type="hidden" id="<c:out value="${name }"/>DeleteSeq" name="<c:out value="${name }"/>DeleteSeq"/>
						        	<input type="hidden" id="<c:out value="${name }"/>DeletePathFile" name="<c:out value="${name }"/>DeletePathFile"/>
						 			<input class="form-control form-control-sm" id="<c:out value="${name }"/>" name="<c:out value="${name }"/>" type="file" style="display: none;" onChange="upload('<c:out value="${name }"/>', <c:out value="${type }"/>, 0, 1, 0, 0, 1);">
									<div class="uploadDiv">
										<label for="uploadImg" class="form-label input-file-button">이미지첨부</label>
									</div>	
									<!-- <i class="fa-solid fa-user fa-4x"></i>  -->
									<div class="btns">
										<button type="button" class="modifyBtn" id="btnSave">아바타 업로드</button>					
						        	</div>
								</div>
							</article>
						</c:when>
						<c:otherwise>
							<article class="rightContent">
							<!-- <div class="icon"> -->
								<c:set var="type" value="2"/>	
					        	<c:set var="name" value="uploadImg"/>
					        	<!-- 이미지 먼저 보여주는 곳 -->		
								<div id="<c:out value="${name }"/>Preview" class="addScroll">
									<c:forEach items="${listUploaded}" var="listUploaded" varStatus="statusUploaded">
										<c:if test="${listUploaded.type eq type }">
											<div  id="imgDiv_<c:out value="${type }"/>_<c:out value="${listUploaded.sort }"/>">
												<img src="<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>" class="rounded" width= "85px" height="85px" style="cursor:pointer;" onClick="openViewer(<c:out value="${listUploaded.type }"/>, <c:out value="${listUploaded. sort }"/>);">
												<div style="position: relative; top:-200px; left:94px"><span style="color: red; cursor:pointer;" onClick="delImgDiv('<c:out value="${name }"/>', <c:out value="${type }"/>,<c:out value="${listUploaded.sort }"/>, <c:out value="${listUploaded.seq }"/>, '<c:out value="${listUploaded.path }"/><c:out value="${listUploaded.uuidName }"/>')">X</span></div>
											</div>
										</c:if>
									</c:forEach>
								</div>
								<input type="hidden" id="<c:out value="${name }"/>Type" name="<c:out value="${name }"/>Type" value="<c:out value="${type }"/>"/>
					        	<input type="hidden" id="<c:out value="${name }"/>MaxNumber" name="<c:out value="${name }"/>MaxNumber" value="0"/>
					        	<input type="hidden" id="<c:out value="${name }"/>DeleteSeq" name="<c:out value="${name }"/>DeleteSeq"/>
					        	<input type="hidden" id="<c:out value="${name }"/>DeletePathFile" name="<c:out value="${name }"/>DeletePathFile"/>
					 			<input class="form-control form-control-sm" id="<c:out value="${name }"/>" name="<c:out value="${name }"/>" type="file" style="display: none;" onChange="upload('<c:out value="${name }"/>', <c:out value="${type }"/>, 0, 1, 0, 0, 1);">
								<div class="uploadDiv">
									<label for="uploadImg" class="form-label input-file-button">이미지바꾸기</label>
								</div>	
								<!-- <i class="fa-solid fa-user fa-4x"></i>  -->
								<div class="btns">
									<button type="button" class="modifyBtn" id="btnUpload">아바타 업로드</button>					
					        	</div>
							</div>
						</article>
						</c:otherwise>
					</c:choose> 
				</section>
			</div>	
		</div><!-- contentWrap end -->
	</div><!-- wrap end -->
	</form>
	<!-- contend e -->
	<footer>
		<%@include file="../../common/footer.jsp" %>
	</footer>
	
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- <script src="/resources/common/js/upload.js"></script> -->
<script src="/resources/common/js/commonAdmin.js"></script>
<script src="/resources/common/js/memberUpload.js"></script>
<script>
	var goUrlMemberView = "/member/memberView";
	var goUrlMemberAvartar = "/member/memberAvartar";
	var goUrlMemberPostComment = "/member/memberPostComment";
	var goUrlMemberWithdraw = "/member/memberWithdraw";
	var goUrlInst = "/member/avatarInst";
	var goUrlUpload = "/member/avatarUpload";
	
	var seq = $("input:hidden[name=infrMmSeq]");
	var form = $("form[name=form]");
	
	goMemberView = function(seqValue){
		seq.val(seqValue);
		form.attr("action" , goUrlMemberView).submit();
	};
	
	goMemberAvartar = function(seqValue){
		seq.val(seqValue);
		form.attr("action" , goUrlMemberAvartar).submit();
	};
	
	goMemberPostComment = function(seqValue){
		seq.val(seqValue);
		form.attr("action" , goUrlMemberPostComment).submit();
	};
	
	goMemberWithdraw = function(seqValue){
		seq.val(seqValue);
		form.attr("action" , goUrlMemberWithdraw).submit();
	};	
	
	$("#btnSave").on("click", function(){
   		form.attr("action", goUrlInst).submit();
	});
	
	$("#btnUpload").on("click", function(){
   		form.attr("action", goUrlUpload).submit();
	});
	
	function sgwAvatar(){
		
		var thisRadio = $('input[name="avatar"]')
		
		if(thisRadio.is(':checked')){
			var thisRadioVal = $('input[name="avatar"]:checked').val()
			console.log(thisRadioVal);
			thisRadio.next().removeClass('focus')
			$('input[name="avatar"]:checked').next().addClass('focus')
			$('#sgwAvatar').val(thisRadioVal);
		}
	}
	
	
</script>
	<!-- $("#avatarInst").on("click" , function(){
		form.attr("action" ,goUrlAvatarInst).submit();
	});	 -->


</body>

</html>