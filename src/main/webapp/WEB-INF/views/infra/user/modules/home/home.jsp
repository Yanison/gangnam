<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<html>
<head>
	<title>SGWorld</title>
	<%@ include file="../../../../rscs/basicRscs.jsp" %>
	 
	<link href="/resources/user/home/css/home.css" rel="stylesheet">
	<script src="/resources/user/home/js/home.js"></script>
</head>
<body>
<!-- 	<form name="form" method="post"> -->
	<header>
		<%@ include file="../../common/header.jsp"%> 
	</header>
	
	<section class="bodyWrapper">
		<article class="mySgWorld">
			<c:choose>
				<c:when test="${not empty sessSgw}">
					<button class="creatMySgWorld" id="goMySgWorld" onclick="goMySgwolrd($('#sessMmSeq').val())">
						Get in SgWorld 
					</button>
				</c:when>
				<c:otherwise>
					<button class="creatMySgWorld" id="creatMySgWorld" onclick="showModal()" rel="modal:open">
						Create SgWorld
					</button>
				</c:otherwise>
			</c:choose>
		</article>
		<article class="onLiveSgWorld">
			<h1 class="onLiveSgWorldTitle">Onlive</h1>
			<div class="onSgWorldListDiv">
				<!-- forEach로 데이터 뿌려주세요 -->
				<div class="onSgWorldList onSgWorldList1">
					<div>
						<a class="SgWorldPreview">
							<img scr="/resources/common/images/pepe.png">
						</a>
						<div class="sgwTitle">
							<div>
								<i class="fa-solid fa-circle"></i>
								<span>title</span>
							</div>
							<div>
								<i class="fa-solid fa-eye"></i>
								<em>num</em>
							</div>
						</div>
					</div>
				</div>
				<!-- forEach로 데이터 뿌려주세요 -->
				<!-- forEach로 데이터 뿌려주세요 -->
				<div class="onSgWorldList onSgWorldList2">
					<div>
						<a class="SgWorldPreview">
							<img scr="/resources/common/images/pepe.png">
						</a>
						<div class="sgwTitle">
							<div>
								<i class="fa-solid fa-circle"></i>
								<span>title</span>
							</div>
							<div>
								<i class="fa-solid fa-eye"></i>
								<em>num</em>
							</div>
						</div>
					</div>
				</div>
				<!-- forEach로 데이터 뿌려주세요 -->
			</div>
		</article>
		<article class="board">
			<div class="boardPrev free">
				<table>
					<colgroup>
						<col width="70%">
						<col width="30%">
					</colgroup>
					<thead>
						<th>자유게시판</th>
						<td><strong><a>더보기</a></strong></td>
					</thead>
					<tbody>
						<th>
							<a>title</a>
						</th>
						<td>
							<i class="fa-solid fa-eye"></i>
							<em>num</em>
						</td>
					</tbody>
				</table>
			</div>
			<div class="boardPrev info">
				<table>
					<colgroup>
						<col width="70%">
						<col width="30%">
					</colgroup>
					<thead>
						<th>정보게시판</th>
						<td><strong><a>더보기</a></strong></td>
					</thead>
					<tbody>
						<th>
							<a>title</a>
						</th>
						<td>
							<i class="fa-solid fa-eye"></i>
							<em>num</em>
						</td>
					</tbody>
				</table>
			</div>
			<div class="boardPrev trade">
				<table>
					<colgroup>
						<col width="70%">
						<col width="30%">
					</colgroup>
					<thead>
						<th>거래게시판</th>
						<td><strong><a>더보기</a></strong></td>
					</thead>
					<tbody>
						<th>
							<a>title</a>
						</th>
						<td>
							<i class="fa-solid fa-eye"></i>
							<em>num</em>
						</td>
					</tbody>
				</table>
			</div>
		</article>
	</section>
	<footer>
		<%@include file="../../common/footer.jsp" %>
	</footer>
<!-- 	</form> -->
	<div id="modalDiv" class="modalDiv"  style="display:none">
			<%@include file="./createOption.jsp" %>
	</div>
</body>
</html>
