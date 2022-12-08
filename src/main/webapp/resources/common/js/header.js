$(document).ready(function(){
	var sessMmId = $('.hiddenGroup #sessMmId').val()
	var sessMmSeq = $('.hiddenGroup #sessMmSeq').val()
	var sessMmName = $('.hiddenGroup #sessMmName').val()
	var sessSgw = $('.hiddenGroup #sessSgw').val()
	console.log("hiddenGroup sessMmId :: " + sessMmId)
	console.log("hiddenGroup sessMmSeq :: " + sessMmSeq)
	console.log("hiddenGroup sessMmName :: " + sessMmName)
	console.log("hiddenGroup sessSgw :: " + sessSgw)
	
})


function userLogOut(){
	if(confirm("정말로 로그아웃 하시겠습니까?")){
		$.ajax({
			type:"post"
			,url:"./member/userLogOut"
			,success:function(logout){
				if(logout == "userLogOut"){
					alert('로그아웃 되셨습니다.')
					location.replace("/")	
				}
			},err:function(){
			}
		})
	}else{
		false
	}
	
}


function isSssValThere(str){
	var sessMmId = $(str).val();
	console.log(
		str + " Session is:: " + sessMmId +"\n"
	)
}




function myPage(){
	$.ajax({
		type:"post"
		,url:"/member/memberView"
		,data:"infrMmSeq"
	})
}