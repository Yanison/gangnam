<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>SGWorld</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	 
	<link href="/resources/user/member/css/memberPostComment.css" rel="stylesheet">
	<link href="../resources/user/home/css/header.css" rel="stylesheet">
	<link href="../resources/user/home/css/footer.css" rel="stylesheet">
</head>
<body>
	<form name="form" method="post">
	<header>
		<%@ include file="../../common/header.jsp"%> 
	</header>
	<input type="hidden" name="bdSeq" value="<c:out value="${dto.bdSeq }"/>">
	<input type="hidden" name="thisPage" value="<c:out value="${vo.thisPage }" default="1"/>">
	<input type="hidden" name="rowNumToShow" value="<c:out value="${vo.rowNumToShow }"/>">
	<div class="wrap">
		<!-- header 넣을자리-->
		<div class="contentWrap">
			<!-- 왼쪽영영 s -->
			<span>My Page</span>
			<div class="leftDiv">	
				<!-- left Nav s-->
				<%@ include file="../../common/memberNav.jsp"%>
				<!-- left Nav e -->
				<!-- 왼쪽영역 e -->
				<!-- 오른쪽 영역 s -->
				<section style=" width: 1000px;">	
					<article class="rightContent">
						<b>내글 조회</b>
							<ul class="rightUl">
								<li style="color:#8F8CFF ">작성글
								<li onclick="ready()">댓글
								<li onclick="ready()">댓글단 글
								<li onclick="ready()">좋아요 글
							</ul>
							<%-- <c:out value="${vo.totalRows }"/> --%>
							<table>
								<tr>
									<th><input type="checkbox"></td>
									<th>제목</th>
									<th>작성일</th>
									<th>조회수</th>
									<th>좋아요</th>
								</tr>
								<c:choose>
									<c:when test="${fn:length(list) eq 0}">
							  			<tr>
							  				<td class="text-center" colspan="5">작성글이 없습니다</td>
							  			</tr>
					  				</c:when>
					  				<c:otherwise> 
										<c:forEach items="${list }" var="list" varStatus="status">	
											<tr>
												<td><input type="checkbox"></td>
												<td><c:out value="${list.bdTitle }" /></td>
												<td><%-- <c:out value="${list.regDatetime }" /> --%><fmt:formatDate value="${list.regDatetime }" pattern="yyyy-MM-dd"/></td>
												<td><c:out value="${list.viewCount }"/></td>
												<td><%-- <c:out value="${list.bdLikeSeq }" /> --%></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>		
							</table>
							<div class="button">
								<button type="button" class="btnDelete" onclick="ready()">삭제</button>
								<button type="button" class="btnModify" onclick="ready()">수정</button>
							</div>
							<!-- pagination s -->
							<%@include file="../../common/userPagination.jsp"%>
							<!-- pagination e -->	
					</article>
				</section>
			</div>	
		</div><!-- contentWrap end -->
	</form>	
	</div><!-- wrap end -->
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
	
	goList = function(thisPage){
		$("input:hidden[name=thisPage]").val(thisPage);
		form.attr("action" , goUrlMemberPostComment).submit();
	}	
	
	function ready(){
		alert("준비중입니다")
	};
</script>	
</body>
</html>