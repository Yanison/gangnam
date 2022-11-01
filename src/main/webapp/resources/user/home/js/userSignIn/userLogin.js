


function userLogin(){
	var infrMmId = $('.loginBox #infrMmId').val();
	var infrMmPw = $('.loginBox #infrMmPw').val();
	console.log("userLogin infrMmId ::" + infrMmId)
	console.log("userLogin infrMmPw ::" + infrMmPw)
	$.ajax({
		async:true
		,cache:false
		,type:"get"
		,url:"../mmRest/userLogin"
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
