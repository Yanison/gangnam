$(document).ready(function(){
	$('#goToSignIn').click(function(){
		location.href = "/userSignInChoice";
	})
	
	$('#findMyLogin').click(function(){
		location.href = "/findMyLogin";
	})
})


function userLogin(){
	var infrMmId = $('.loginBox #infrMmId').val();
	var infrMmPw = $('.loginBox #infrMmPw').val();
	
	if(infrMmId == "" && infrMmPw == ""){
		alert("아이디 혹은 비밀번호를 입력해주세요")
	}else{
		console.log("userLogin infrMmId ::" + infrMmId)
		console.log("userLogin infrMmPw ::" + infrMmPw)
		
		$.ajax({
			async:true
			,cache:false
			,type:"get"
			,url:"../member/userLogin"
			,data:{
				"infrMmId" : infrMmId
				,"infrMmPw" : infrMmPw
			}
			,success: function(userLogin){
				if(userLogin == "okay"){
					alert("로그인되셨습니다.")
					location.replace('../');
				}else{
					alert("일치한 회원정보가 없습니다.")
				}
			}
			,error : function(err){
				alert("err :: problem on the serverSide")
			}
		})	
	}
}
