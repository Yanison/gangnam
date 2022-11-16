$(document).ready(function(){
	
})



function buildSgwBtn(){
	valiForBuildingSgw()
}

function requestBuildSgw(){
	var infrMmSeq = $('#infrMmSeq').val();
	var sgwTitle = $('#sgwTitle').val()
	var isHidden = $('#isHidden').val()
	var sgwMmNumber = $('#sgwMmNumber').val()
	var sgwMap = $('input[name="sgwMap"]:checked').val()
	var sgwAvatar = $('input[name="sgwAvatar"]:checked').val()
	
	console.log(
		"infrMmSeq :: "  + infrMmSeq + "\n" +
		"sgwTitle :: "  + sgwTitle + "\n" +
		"isHidden :: "  + isHidden + "\n" +
		"sgwMmNumber :: "  + sgwMmNumber + "\n" +
		"sgwMap :: "  + sgwMap + "\n" +
		"sgwAvatar :: "  + sgwAvatar + "\n"
	)
	
	$.ajax({
		url:'/sgwrold/buildSgw'
		,data:{
			'sgwTitle':sgwTitle
			,'isHidden':isHidden
			,'sgwMmNumber':sgwMmNumber
			,'sgwMap':sgwMap
			,'sgwAvatar' : sgwAvatar
			,'infrMmSeq' : infrMmSeq
		}
		,method:'post'
		,success:function(response){
			if(response == "nope"){
				confirm("이미 개설하셨습니다. 개설된 방으로 들어가시겠습니까?")
				goMySgWorld(infrMmSeq)
			}else{
				console.log("response ::" + response)
				goSgWorld(response,infrMmSeq)	
			}
		}
		,err:function(err){
			alert("system Err")
		}
	})
}
function valiForBuildingSgw(){
	
	var inputArrStr = [
		'#sgwTitle'
		,'#sgwPw'
		,'#sgwMmNumber'
		,'#sgwMap'
		,'#sgwAvatar'
	]
	
	for(i = 0; i <inputArrStr.length ; i ++){
			var inputArrStrIdxVal = $(inputArrStr[i]).val()
			console.log(
				"inputArrStr["+i+"] :: " + inputArrStr[i] +"\n" +
				"inputArrStrIdxVal :: " + inputArrStrIdxVal
				)
			if(inputArrStrIdxVal == ""){
				console.log("disable inputArrStrIdxVal :: " + inputArrStrIdxVal)
				addValiHtml(inputArrStr[i],"This is Empty","disable")
			}else{
				addValiHtml(inputArrStr[i],"Enable","enable")
			}
	}
	
	var enable = $('.enable').length
	if($('input:checkbox[name="pwAvailable"]').is(':checked')){
		console.log('pwAvailable :checked // enable ::' + enable)
		if(enable == 5){
			alert("싸게월들을 개설합니다!")
			goSgWorld()
//			requestBuildSgw()
		}else{
			alert("올바른 정보를 입력해주세요")
			return false;
		}
	}else{
		console.log('pwAvailable :unChecked // enable ::' + enable)
		if(enable == 4){
			alert("싸게월들을 개설합니다!")
			requestBuildSgw()
			
		}else{
			alert("올바른 정보를 입력해주세요")
			return false;
		}
	}
}

function addValiHtml(str,message,status){
	console.log("str :: "+ str)
	var html='';
	html+='<p class="alertDiv '+ status +'"><strong>'
	html+= message
	html +='</strong></p>';
	
	$(str+'Div'+' .alertDiv').remove()
	$(str).after(html).show('slow')
}

function enableInputVal(str,val){
	console.log("val :: " + val)
	var reVali = null;
	var getDupleValiObj = '';
	
	if(str == '#sgwTitle'){
		//영어와 한글 숫자 혼용 6~30자
		reVali = /^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z0-9\s{0,}]{2,30}$/g;
		getDupleValiObj = 'infrMmId'
		console.log("reVali // val :: " +reVali + " // "+ val)
	}
	
	if(!reTest(reVali,val)){
		addValiHtml(str,"reTest :: disable","disable")
	}else{
		addValiHtml(str,"reTest :: Enable","enable")
		console.log("dupleValiObj // shDupleStr :: " +getDupleValiObj + " // "+ val)
//		$.ajax({
//			url:'../member/getValidationOfDuple'
//			,method:'get'
//			,data:{
//				'dupleValiObj' : getDupleValiObj
//				,'shDupleStr' : val
//			}
//			,success:function(rp){
//				console.log('success dupleValiObj ::' + rp)
//				if(rp == 0){
//					console.log('rp :: ' + rp)
//					addValiHtml(str,"중복없음","enable")
//				}else{
//					console.log('rp :: ' + rp)
//					addValiHtml(str,"중복된 입력값입니다.","disable")
//				}
//			},err:function(err){
//				console.log('err')
//			}
//		})
	}
}

function reTest(re,what){
	console.log("reTest what ::" + what)
	if (re.test(what)) {//what의 문자열에 re의 패턴이 있는지 나타내는 함수 test
    //만약 내가 입력한 곳의 값이 정규화 데이터를 썼다면 true를 반환해서 호출 된 곳으로 리턴됨           	
        return true;
    }
    what=""
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
function pwAvailable2(){

	if($('input:checkbox[name="pwAvailable"]').is(':checked')){
		$('#isHidden').val(1)
		console.log('checked // ' + $('#isHidden').val())
	}else{
		$('#isHidden').val(0)
		console.log('not checked // ' + $('#isHidden').val())
	}
}

function AcheckedRadio(){
	
	var thisRadio = $('input[name="sgwAvatar"]')
	
	if(thisRadio.is(':checked')){
		var thisRadioVal = $('input[name="sgwAvatar"]:checked').val()
		console.log(thisRadioVal);
		thisRadio.next().removeClass('focus')
		$('input[name="sgwAvatar"]:checked').next().addClass('focus')
		$('#sgwAvatar').val(thisRadioVal);
	}
}

function McheckedRadio(){
	var thisRadio = $('input[name="sgwMap"]')
	if(thisRadio.is(':checked')){
		var thisRadioVal = $('input[name="sgwMap"]:checked').val()
		console.log(thisRadioVal);
		thisRadio.next().removeClass('focus')
		$('input[name="sgwMap"]:checked').next().addClass('focus')
		$('#sgwMap').val(thisRadioVal);
	}
}
function closeModal(){
	$('#modalDiv').fadeOut("fast")
}

function goSgWorld(endPoint,mmSeq){
	if(mmSeq != ""){
		$.ajax({
			url:'sgWorld/'+endPoint
			,type:'get'
			,data:{
				'infrMmSeq':mmSeq
			}
			,success:function(){
				location.href=sgwUrl
			},error:function(){
				
			}
		})
	}else{
		alert('확인되지 않은 회원입니다. 로그인을 해주세요')
	}
	
}
function goMySgWorld(infrMmSeq){
	$.ajax({
		url:'/sgwrold/goMySgw'
		,type:'get'
		,data:{'infrMmSeq':infrMmSeq
		}
		,success:function(response){
			if(response == "nope"){
				alert("개설한 방이 존재하지 않습니다.")
//				location.href="/"
			}else{
				location.replace('/sgWorld/sgw/'+response);
			}
			
		},error:function(){
			
		}
	})
}

function isSssValThere2(){
	var thisID = $(this).attr('id');
	console.log(thisID)
}