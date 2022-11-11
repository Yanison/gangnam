$(document).ready(function(){
	var infrMmId = $('.hiddenGroup #infrMmId').val()
	var infrMmSeq = $('.hiddenGroup #infrMmSeq').val()
	var infrMmName = $('.hiddenGroup #infrMmName').val()
	
	console.log("hiddenGroup infrMmId :: " + infrMmId)
	console.log("hiddenGroup infrMmSeq :: " + infrMmSeq)
	console.log("hiddenGroup infrMmName :: " + infrMmName)
	
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
	var infrMmId = $(str).val();
	console.log(
		str + " Session is:: " + infrMmId +"\n"
	)
}


