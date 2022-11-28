<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>SGWorld</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	 
	<link href="/resources/user/member/css/memberWithdraw.css" rel="stylesheet">
	<link href="../resources/user/home/css/header.css" rel="stylesheet">
	<link href="../resources/user/home/css/footer.css" rel="stylesheet">
</head>
<body>
	<form name="form" method="post">
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
					<b>회원탈퇴</b>
					<article class="rightContent">
						<div class="rightContentWrap">
							<h5>회원탈퇴를 원하시면 아래의 텍스트를 입력해주세요.</h5>
							<div style="margin: auto">
								<input type="text" placeholder="회원탈퇴" class="txt form-control" id="withdrawText">
							</div>	
							<div>	
								<select class="form-select txt1">
									<option>탈퇴사유</option>
									<option>이용하고 싶은 서비스가 없어요.</option>
									<option>서비스 퀄리티가 낮아요.</option>
									<option>비매너 회원을 만났어요.</option>
									<option>잦은 오류가 발생해요.</option>
									<option>대체할 만한 서비스를 찾았어요.</option>
									<option>기타</option>
								</select>
								<!-- <input type="text" placeholder="탈퇴사유" class="txt"> -->
							</div>
							<button type="button" id="btnModify" class="modifyBtn">탈퇴하기</button>
							
						</div>
					</article>
				</section>
			</div>	
		</div><!-- contentWrap end -->
	</form>
	<form name="formVo" id="formVo" method="post">
	<input type="hidden" id="infrMmSeq" name="infrMmSeq" value="${infrMmSeq}" onchange="isSssValThere('infrMmSeq')">
	</form>	
	</div><!-- wrap end -->
	<!-- contend e -->
	<footer>
		<%@include file="../../common/footer.jsp" %>
	</footer>
	
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	var goUrlMemberView = "/member/memberView";
	var goUrlMemberAvartar = "/member/memberAvartar";
	var goUrlMemberPostComment = "/member/memberPostComment";
	var goUrlMemberWithdraw = "/member/memberWithdraw";
	var goUrlMemberUelete = "/member/ueleteMm";
	
	var seq = $("input:hidden[name=infrMmSeq]");
	var form = $("form[name=form]");
	var formVo = $("form[name=formVo]"); 
	
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
	
	$("#btnModify").on("click" , function(){
		if(document.getElementById('withdrawText').value == '회원탈퇴'){
			formVo.attr("action" ,goUrlMemberUelete).submit();
		}else{
			alert('회원탈퇴 입력해주십쇼');
			false
		}
	});
</script>
</body>
</html>