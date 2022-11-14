
$(document).ready(function(){

})

function gohome(){
	location.href="http://127.0.0.1:8085"
}

function showModal(){
	var infrMmSeq = $('#infrMmSeq').val();
	if(infrMmSeq == ""){
		alert('로그인이 필요한 서비스입니다.')
	}else{
		$('#creatMySgWorld').click(function(){
			$('#modalDiv').fadeIn("fast")
		})
	}
	
	
}

function closeModal(){
	$('#modalDiv').fadeOut("fast")
}