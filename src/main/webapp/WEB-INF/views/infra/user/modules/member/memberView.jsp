<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>SGWorld</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	 
	<link href="/gangnam/resources/user/member/css/memberView.css" rel="stylesheet">
	<link href="/gangnam/../resources/user/home/css/header.css" rel="stylesheet">
	<link href="/gangnam/../resources/user/home/css/footer.css" rel="stylesheet">
	<!-- bootstrap --> 
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<!-- datepicker -->
	 <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	 <link rel="stylesheet" href="/gangnam/resources/demos/style.css">
	 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	 <script>
	 	var jb = jQuery.noConflict();
		/*  jb( function() {
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
		 } ); */
		 
		 jb(function() {
			  	//input을 datepicker로 선언
			  	jb("#datepicker").datepicker({
			  	dateFormat: 'yy-mm-dd' //달력 날짜 형태
			  	,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			  	,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
			  	,changeYear: true //option값 년 선택 가능
			  	,changeMonth: true //option값 월 선택 가능
			  	,yearRange:'c-99: c+99'
			  	,minDate : new Date('1900-01-01')
			  	,maxDate : new Date ('today')
			  	});
			  
				 //초기값을 오늘 날짜로 설정해줘야 합니다. 응 할필요 없어~~ 아니야 해야해 ㅋㅋㅋ
				  	jb('#datepicker').datepicker(); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
				  	}); 
				
				jb(document).ready(function(){               
				    jb.datepicker.setDefaults({
				    closeText: "닫기",
				    currentText: "오늘",
				    prevText: '이전 달',
				    nextText: '다음 달',
				    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
				    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
				    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
				    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
				    weekHeader: "주",
				    yearSuffix: '년'
				    });    
				 });
	 </script>
</head>
<body>
	<form name="form" method="post">
	<%-- <input type="hidden" id="infrMmSeq" name="infrMmSeq" value="${infrMmSeq}"> --%>
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
							 id="infrMmEmailId" name="infrMmEmailId" value="<c:out value="${item.infrMmEmailId }"/>@<c:out value="${item.infrCcNameEng }"/>" 
							 >
						</div>
						<div class="inputBox">
							<label class="label">닉네임</label>
							<input class="form-control" type="text"
							 id="infrMmNickname" name="infrMmNickname" value="<c:out value="${item.infrMmNickname }"/>"
							 >
						</div>
						<div class="inputBox">
							<label class="label">휴대폰</label>
							<input class="form-control" type="text"
							 id="infrMmPhone" name="infrMmPhone" value="<c:out value="${item.infrMmPhone }"/>"
							 >
						</div>
						<div class="inputBox">
							<label class="label">생년월일</label>
							<input class="form-control" type="text"
							 id="datepicker" name="infrMmBod" value="<c:out value="${item.infrMmBod }"/>"
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
	$(document).ready(function(){
		console.log('doc ready')
		$.ajax({
			data:{'infrMmSeq':$('#sessMmSeq').val()},
			url:'/member/memberView',
			type:'get',
			success:function(rp){
			}
			,error:function(){}
		})
	})
	
	$("#modifyBtn").on("click" , function(){
		form.attr("action" ,goUrlMemberUpdate).submit();
	});	
	
</script>


</body>
</html>