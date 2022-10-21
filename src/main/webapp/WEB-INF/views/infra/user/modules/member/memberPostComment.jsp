<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>SGWorld</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	 
	<link href="./resources/user/member/css/memberPostComment.css" rel="stylesheet">
</head>
<body>
	<header>
		<%@ include file="../../common/header.jsp"%> 
	</header>
	<div class="wrap">
		<!-- header 넣을자리-->
		<div class="contentWrap">
			<!-- 왼쪽영영 s -->
			<span>My Page</span>
			<div class="leftDiv">	
				<nav class="leftVanner">
					<ul>
						<li>내 정보 보기
						<li>아바타 수정
						<li>내 글 조회
						<li>회원 탈퇴
					</ul>
				</nav>
				<!-- 왼쪽영역 e -->
				<!-- 오른쪽 영역 s -->
				<section style=" width: 1000px;">	
					<article class="rightContent">
						<b>내글 조회</b>
							<ul class="rightUl">
								<li style="color:#8F8CFF ">작성글
								<li>댓글
								<li>댓글단 글
								<li>좋아요 글
							</ul>
							<table>
								<tr>
									<th><input type="checkbox"></td>
									<th>제목</th>
									<th>작성일</th>
									<th>조회수</th>
									<th>좋아요</th>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>자기 어필 한마디씩 해봐</td>
									<td>2022-10-14</td>
									<td>10</td>
									<td>0</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>후배한테 설렜다</td>
									<td>2022-10-09</td>
									<td>456</td>
									<td>2</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>잘헤어진거지?</td>
									<td>2022-10-06</td>
									<td>999</td>
									<td>5</td>
								</tr>
								<tr>
									<td><input type="checkbox"></td>
									<td>다들 매달 찍히는 월급 얼마정도야?</td>
									<td>2022-10-02</td>
									<td>1247</td>
									<td>20</td>
								</tr>
							</table>
							<div class="button">
								<button type="button" class="btnDelete">삭제</button>
								<button type="button" class="btnModify">수정</button>
							</div>
							<div class="pagination">
								<ul class="paginationUl">
									<li><
									<li>1
									<li>2
									<li>3
									<li>4
									<li>5
									<li>>
								</ul>
							</div>	
					</article>
				</section>
			</div>	
		</div><!-- contentWrap end -->
	</div><!-- wrap end -->
	<footer>
		<%@include file="../../common/footer.jsp" %>
	</footer>

</body>
</html>