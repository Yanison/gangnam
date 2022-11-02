function userSignIn(){
	
}

function Validation(){
	$('#memberId').keyup(ajaxGetVali())
}

function ajaxGetVali(param){
	console.log('memberId')

	$.ajax({
		tpye:'get'
		,url:''
		,data:{
			param: param
		}
		,success:function(){
			
		},err:function(){
			
		}
	})
}
