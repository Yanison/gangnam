$(document).ready(function(){
	$('#goToSignIn').click(function(){
		location.href = "http://127.0.0.1:8085/userSignInChoice";
	})
	
	$('#findMyLogin').click(function(){
		location.href = "http://127.0.0.1:8085/findMyLogin";
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
				if(userLogin.infrMmId == infrMmId && userLogin.infrMmPw == infrMmPw){
					alert("ok")
					location.replace('../');
				}else{
					alert("nope")
				}
			}
			,error : function(err){
				alert("err :: problem on the serverSide")
			}
		})	
	}
	
	
}
