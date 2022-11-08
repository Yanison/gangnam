$(document).ready(function(){
	
})



function buildSgwBtn(){
	valiForBuildingSgw()
}

function requestBuildSgw(){
	var inftMmSeq = $('#inftMmSeq').val();
	var sgwTitle = $('#sgwTitle').val()
	var sgwPw = $('#sgwPw').val()
	var sgwMmNumber = $('input[name="sgwMmNumber"]:selected').val()
	var sgwMap = $('input[name="sgwMap"]:checked').val()
	var sgwAvatar = $('input[name="sgwAvatar"]:checked').val()
	
	$.ajax({
		uel:''
		,data:{
			'sgwTitle':sgwTitle
			,'sgwPw':sgwPw
			,'sgwMmNumber':sgwMmNumber
			,'sgwMap':sgwMap
			,'sgwAvatar' : sgwAvatar
			,'inftMmSeq' : inftMmSeq
		}
		,method:'post'
		,success:function(sccss){
			goSgWorld();
		}
		,err:function(err){
			
		}
	})
}
function valiForBuildingSgw(){
	const enable = $('.enable').lenght
	var inputArrStr = [
		'#sgwTitle'
		,'#sgwPw'
		,'#sgwMmNumber'
		,'#sgwMap'
		,'#sgwAvatar'
	]
	for(i = 0; i <inputArrStr.length ; i ++){
			var inputArrStrIdxVal = $(inputArrStr[i]).val()
			if(inputArrStrIdxVal == ""){
				console.log("disable inputArrStrIdxVal :: " + inputArrStrIdxVal)
				addValiHtml(inputArrStr[i],"This is Empty","disable")
			}else{
				addValiHtml(inputArrStr[i],"Enable","enable")
			}
	}
	
	if($('input:checkbox[name="pwAvailable"]').is(':checked')){
		if(enable != 4){
			alert("올바른 정보를 입력해주세요")
			return false;
		}else{
			alert("회원가입을 진행합니다.")
			requestBuildSgw()
		}
	}else{
		if(enable != 5){
			alert("올바른 정보를 입력해주세요")
			return false;
		}else{
			alert("회원가입을 진행합니다.")
			requestBuildSgw()
		}
	}
}

function valivali(){
	
}

function addValiHtml(str,message,status){
	var html='';
	html+='<p class="alertDiv '+ status +'"><strong>'
	html+= message
	html +='</strong></p>';
	
	$(str+'Div'+' .alertDiv').remove()
	$(str).after(html).show('slow')
}




/**
modal
 */
function pwAvailable(){
	if($('input:checkbox[name="pwAvailable"]').is(':checked')){
		console.log('checked')
		$('.pwInputDiv').slideDown("fast")
	}else{
		console.log('not checked')
		$('.pwInputDiv').slideUp("fast")
	}
}

function AcheckedRadio(){
	
	var thisRadio = $('input[name="avaratSelect"]')
	
	if(thisRadio.is(':checked')){
		var thisRadioVal = $('input[name="avaratSelect"]:checked').val()
		console.log(thisRadioVal);
		thisRadio.next().removeClass('focus')
		$('input[name="avaratSelect"]:checked').next().addClass('focus')
	}
}

function McheckedRadio(){
	var thisRadio = $('input[name="mapSelect"]')
	if(thisRadio.is(':checked')){
		var thisRadioVal = $('input[name="mapSelect"]:checked').val()
		console.log(thisRadioVal);
		thisRadio.next().removeClass('focus')
		$('input[name="mapSelect"]:checked').next().addClass('focus')
	}
}
function closeModal(){
	$('#modalDiv').fadeOut("fast")
}

function goSgWorld(){
	location.href="http://127.0.0.1:8085/sgWorld"
}