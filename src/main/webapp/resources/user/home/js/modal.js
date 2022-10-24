$(document).ready(function(){
	
})

function showModal(){
	
}

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

