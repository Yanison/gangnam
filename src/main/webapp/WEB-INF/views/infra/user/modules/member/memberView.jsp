<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>SGWorld</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	 
	<link href="/resources/user/member/css/memberView.css" rel="stylesheet">
	<link href="../resources/user/home/css/header.css" rel="stylesheet">
	<link href="../resources/user/home/css/footer.css" rel="stylesheet">
	<!-- bootstrap --> 
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<!-- datepicker -->
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	 <link rel="stylesheet" href="/resources/demos/style.css">
	 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	 <script>
	 	var jb = jQuery.noConflict();
		 jb( function() {
		   jb( "#datepicker" ).datepicker({
			   dateFormat: 'yy-mm-dd',	//날짜 포맷이다. 보통 yy-mm-dd 를 많이 사용하는것 같다.
		        prevText: '이전 달',	// 마우스 오버시 이전달 텍스트
		        nextText: '다음 달',
		        monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],	//한글 캘린더중 월 표시를 위한 부분
		        monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        dayNames: ['일', '월', '화', '수', '목', '금', '토'],	//한글 캘린더 요일 표시 부분
		        dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],	//한글 요일 표시 부분
		        dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],	// 한글 요일 표시 부분
		   });
		 } );
	 </script>
</head>
<body>
	<form name="form" method="post">
	<input type="hidden" id="infrMmSeq" name="infrMmSeq" value="${infrMmSeq}">
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
					<b>내 정보 보기</b>
					<article class="rightContent">
						<div class="inputBox">
							<label class="label">이메일</label>
							 <input class="form-control" type="text"
							 id="infrMmEmailId"  value="<c:out value="${item.infrMmEmailId }"/>"
							 >
						</div>
						<div class="inputBox">
							<label class="label">닉네임</label>
							<input class="form-control" type="text"
							 id="infrMmNickname"  value="<c:out value="${item.infrMmNickname }"/>"
							 >
						</div>
						<div class="inputBox">
							<label class="label">휴대폰</label>
							<input class="form-control" type="text"
							 id="infrMmPhone"  value="<c:out value="${item.infrMmPhone }"/>"
							 >
						</div>
						<div class="inputBox">
							<label class="label">생년월일</label>
							<input class="form-control" type="text"
							 id="datepicker"  value="<c:out value="${item.infrMmBod }"/>"
							 >
						</div>
						<button type="button" class="modifyBtn" id="modifyBtn">수정하기</button>					
					</article>
				</section>
			</div>	
		</div><!-- contentWrap end -->
	</form>
	</div><!-- wrap end -->
	<!-- contend e -->
	</div><!-- wrap end -->
	<footer>
		<%@include file="../../common/footer.jsp" %>
	</footer>
	
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$("#modifyBtn").on("click" , function(){
		form.attr("action" ,goUrlMemberUpdate).submit();
	});	
</script>


</body>
</html>