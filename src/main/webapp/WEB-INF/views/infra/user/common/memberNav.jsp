<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<nav class="leftVanner">
		<ul>
			<li><a href="javascript:goMemberView(<c:out value="${infrMmSeq }"/>)" ><i class="fa-sharp fa-solid fa-user"></i></a>&nbsp내 정보 보기
			<li><a href="javascript:goMemberAvartar(<c:out value="${infrMmSeq }"/>)" ><i class="fa-sharp fa-solid fa-robot"></i></a>&nbsp아바타 수정
			<li><a href="javascript:goMemberPostComment(<c:out value="${infrMmSeq }"/>)" ><i class="fa-sharp fa-solid fa-pen"></i></a>&nbsp내 글 조회
			<li><a href="javascript:goMemberWithdraw(<c:out value="${infrMmSeq }"/>)" ><i class="fa-sharp fa-solid fa-door-open"></i></a>&nbsp회원 탈퇴
		</ul>
	</nav>