<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<nav class="leftVanner">
		<ul style="font-size: 12px;">
			<li>
				<a href="javascript:goMemberView(<c:out value="${infrMmSeq }"/>)" >
					<i class="fa-sharp fa-solid fa-user"></i>
						&nbsp<span>내 정보 보기</span>
				</a>	
			<li>
				<a href="javascript:goMemberAvartar(<c:out value="${infrMmSeq }"/>)" ><i class="fa-sharp fa-solid fa-robot"></i>
					&nbsp<span>아바타 수정</span>
				</a>	
			<li>
				<a href="javascript:goMemberPostComment(<c:out value="${infrMmSeq }"/>)" ><i class="fa-sharp fa-solid fa-pen"></i>
					&nbsp<span>내 글 조회</span>
				</a>	
			<li>
				<a href="javascript:goMemberWithdraw(<c:out value="${infrMmSeq }"/>)" ><i class="fa-sharp fa-solid fa-door-open"></i>
					&nbsp<span>회원 탈퇴</span>
				</a>	
		</ul>
	</nav>
	
	<script>
	var goUrlMemberUpdate = "/member/memberUpdt";
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
	
		
</script>