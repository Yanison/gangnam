$(document).ready(function(){
})

var enableCertiNum = $('#enableCertiNum').val()
var AuthCode = $('#AuthCode').val()

function requestSignIn(){
	
	var infrMmId = $('#memberId').val() /** 1*/
	var infrMmPw = $('#infrMmPw').val() /** 2*/
	var infrMmName = $('#memberName').val() /** 3*/
	var infrMmNickname = $('#infrMmNickname').val() /** 4*/
	var infrMmBod = $('#infrMmBod').val() /** 5*/
	var infrMmGender = $('#infrMmGender').val() /** 6*/
	var infrMmTelecom = $('#infrMmTelecom').val() /** 7*/
	var infrMmPhone = $('#infrMmPhone').val() /** 8*/
	var infrMmEmailId = $('#infrMmEmailId').val() /** 9*/
	var infrMmEmailAddress = $('#infrMmEmailAddress').val() /** 11*/
	var infrMmZip = $('#postcode').val() /** 12*/
	var infrMmRoadAddress = $('#infrMmRoadAddress').val() /** 13*/
	var infrMmJibunAddress = $('#infrMmJibunAddress').val() /** 14*/
	var infrMmDetailAddress = $('#infrMmDetailAddress').val() /** 15*/
	var infrMmExtraAddress = $('#infrMmExtraAddress').val() /** 16*/
	var infrMmLat = $('#infrMmLat').val() /** 17*/
	var infrMmLong = $('#infrMmLong').val() /** 18*/
	
	var inputArr = 
			[infrMmId
			,infrMmPw
			,infrMmName
			,infrMmNickname
			,infrMmBod
			,infrMmGender
			,infrMmTelecom
			,AuthCode
			,infrMmPhone
			,infrMmEmailId
			,infrMmEmailAddress
			,infrMmZip
			,infrMmRoadAddress
			,infrMmJibunAddress
			,infrMmDetailAddress
			,infrMmExtraAddress
			,infrMmLat
			,infrMmLong
			]
			
	for(i = 0 ; i < inputArr.length; i ++){
		if(i != 16 && i != 15){
			if(inputArr[i] == ""){
				console.log("inputArr["+i+"] is empty " )
				return false;
			}
		}else{
			console.log("inputArr["+i+"] :: " + inputArr[i] +" :: "+ i+"/18")
		}
	}
	
	$.ajax({
			url:'../member/userSignIn'
			,method:'post'
			,data:{
				'infrMmId': infrMmId /** 1*/
				, 'infrMmPw': infrMmPw /** 2*/
				, 'infrMmName': infrMmName /** 3*/
				, 'infrMmNickname': infrMmNickname /** 4*/
				, 'infrMmBod': infrMmBod /** 5*/
				, 'infrMmGender': infrMmGender /** 6*/
				, 'infrMmTelecom': infrMmTelecom /** 7*/
				, 'infrMmPhone': infrMmPhone /** 8*/
				, 'infrMmEmailId': infrMmEmailId /** 9*/
				, 'infrMmEmailAddress' : infrMmEmailAddress /** 10*/
				, 'infrMminfrMmEmailAddressess': infrMmEmailAddress /** 11*/
				, 'infrMmZip': infrMmZip /** 12*/
				, 'infrMmRoadAddress': infrMmRoadAddress /** 13*/
				, 'infrMmJibunAddress': infrMmJibunAddress /** 14*/
				, 'infrMmDetailAddress': infrMmDetailAddress /** 15*/
				, 'infrMmExtraAddress': infrMmExtraAddress /** 16*/
				, 'infrMmLat': infrMmLat /** 17*/
				, 'infrMmLong': infrMmLong /** 18*/
			}
			,success:function(rp){
				if(rp == "userSignIn"){
					location.replace('../')
				}else{
					alert('???????????? ??????')
				}
			},err:function(err){
				alert('???????????? ??????')
			}
			
		})
}



function submitUserSignIn(){
		console.log('userSignInsubmit')
		$('p').remove('.alertDiv')
		
		var inputArrStr = 
			['#memberId' //??????????????? /** 1*/
			,'#infrMmPw'//??????????????? /** 2*/
			,'#infrMmPwChk'
			,'#memberName'//??????????????? /** 3*/
			,'#infrMmNickname'//??????????????? /** 4*/
			,'#infrMmBod' /** 5*/
			,'#infrMmGender' /** 6*/
			,'#infrMmTelecom' /** 7*/
			,'#infrMmPhone'//??????????????? /** 8*/
			,'#AuthCode' /** 9*/
			,'#infrMmEmailId' /** 10*/
			,'#infrMmEmailAddress' /** 11*/
			,'#postcode'
			,'#infrMmEmailAuth'
			,'#infrMmRoadAddress' /** 12*/
			,'#infrMmDetailAddress' /** 14*/
			,'#infrMmLat' /** 16*/
			,'#infrMmLong'] /** 17*/
			
		Validation(inputArrStr)
}


function Validation(inputArrStr){
	
	for(i = 0; i <inputArrStr.length ; i ++){
			var inputArrStrIdxVal = $(inputArrStr[i]).val()
			if(inputArrStrIdxVal == ""){
				console.log("disable inputArrStrIdxVal :: " + inputArrStrIdxVal)
				addValiHtml(inputArrStr[i],"This is Empty","disable")
			}else{
				addValiHtml(inputArrStr[i],"Enable","enable")
			}
	}
	if($('.enable').length != 18){
		alert(" ????????? ???????????? ????????? ?????????????????? $('.enable').length :: " + $('.enable').length)
		return false;
	}else{
		confirm('???????????? ???????????????????')
		
		requestSignIn()
	}

}


function getValBod(str){
	var bod = $('.datepicker').val()
	var infrMmBod = $('#infrMmBod').val(bod)
	console.log('str :: ' + str)
	addValiHtmlOnKeyEvent(str)
}
function radioCheckVal(){
	var gender = $('input[name="infrMmGender"]:checked').val()
	var infrMmGender = $('#infrMmGender').val(gender)
	console.log('infrMmGender :: ' + infrMmGender)
	addValiHtmlOnKeyEvent('#infrMmGender')
}

function addValiHtml(str,message,status){
	var html='';
	html+='<p class="alertDiv '+ status +'"><strong>'
	html+= message
	html +='</strong></p>';
	
	$(str+'Div'+' .alertDiv').remove()
	$(str).after(html).show('slow')
}

function addValiHtmlOnKeyEvent(str){
	var val = $(str).val()
	console.log("AddValiHtmlOnKeyEvent val :: " + val)
	if(val == ""){
		console.log("disable AddValiHtmlOnKeyEvent "+ str +" :: " + val)
		$(str+'Div'+' .alertDiv').remove()
		addValiHtml(str,"This is Empty","disable")
	}else{
		console.log("enable AddValiHtmlOnKeyEvent "+ str +" :: " + val)
		$(str+'Div'+' .alertDiv').remove()
		addValiHtml(str,"Enable","enable")
	}
}

var regExpEm = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

function enableInputVal(str,val){
	var reVali = null;
	var getDupleValiObj = '';
	
	if(str == '#memberId'){
		//????????? ?????? ?????? 6~20???
		reVali = /^[a-z]+[a-z0-9]{5,19}$/;
		getDupleValiObj = 'infrMmId'
		console.log("reVali // val :: " +reVali + " // "+ val)
	}else if(str == '#infrMmPw'){
		//?????? 8 ???, ?????? ????????? ??????, ????????? ?????? ??? ????????? ?????? ?????? :
		reVali =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		console.log("reVali // val :: " +reVali + " // "+ val)
		
	}else if(str == '#infrMmPwChk'){
		//?????? 8 ???, ?????? ????????? ??????, ????????? ?????? ??? ????????? ?????? ?????? :
		reVali =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		console.log("reVali // val :: " +reVali + " // "+ val)
		
	}else if(str == '#memberName'){
		reVali = /^[???-???a-zA-Z]{2,10}$/;
		getDupleValiObj = 'infrMmName'
		console.log("reVali // val :: " +reVali + " // "+ val)
	}else if(str == '#infrMmNickname'){
		reVali =  /^[\w\W???-??????-??????-???]{2,20}$/;
		getDupleValiObj = 'infrMmNickname'
		console.log("reVali // val :: " +reVali + " // "+ val)
	}else if(str == '#infrMmPhone'){
		reVali = /^[0-9]{11}$/;
		getDupleValiObj = 'infrMmPhone'
		console.log("reVali // val :: " +reVali + " // "+ val)
	}
	
	
	if(!reTest(reVali,val)){
		addValiHtml(str,"reTest :: disable","disable")
	}else{
		if(str != '#infrMmPw' && str != '#infrMmPwChk'){
			addValiHtml(str,"reTest :: Enable","enable")
			console.log("dupleValiObj // shDupleStr :: " +getDupleValiObj + " // "+ val)
			$.ajax({
				url:'../member/getValidationOfDuple'
				,method:'get'
				,data:{
					'dupleValiObj' : getDupleValiObj
					,'shDupleStr' : val
				}
				,success:function(rp){
					console.log('success dupleValiObj ::' + rp)
					if(rp == 0){
						console.log('rp :: ' + rp)
						addValiHtml(str,"????????????","enable")
					}else{
						console.log('rp :: ' + rp)
						addValiHtml(str,"????????? ??????????????????.","disable")
					}
				},err:function(err){
					console.log('err')
				}
			})	
		}else{ 
			addValiHtml(str,"reTest :: Enable","enable")
			if($('#infrMmPwChk').val() != $('#infrMmPw').val()){
				addValiHtml('#infrMmPwChk',"???????????? ???????????? ????????????.","disable")
			}else if($('#infrMmPwChk').val() == $('#infrMmPw').val()){
				addValiHtml('#infrMmPwChk',"??????????????? ???????????????","enable")
			}
		}
	}
}

function reTest(re,what){
	if (re.test(what)) {//what??? ???????????? re??? ????????? ????????? ???????????? ?????? test
    //?????? ?????? ????????? ?????? ?????? ????????? ???????????? ????????? true??? ???????????? ?????? ??? ????????? ?????????           	
        return true;
    }
    what=""
}


function addHtmlBelowInput(inputObj,message,status){
	console.log("inputObj // message //status :: " + inputObj +" // "+ message +" // "+ status)
	var html='';
	html+='<p class="alertDiv '+ status +'"><strong>'
	html+= message
	html +='</strong></p>';
	$('p').remove('#certiNumDiv .alertDiv');
	$(inputObj).after(html);
}

function getSMS(){
	var toNum = $('#infrMmPhone').val();
	var infrMmTelecom = $('#infrMmTelecom').val()
	console.log("infrMmPhone // infrMmTelecom" + toNum + " // " + infrMmTelecom);
	
	if(toNum != '' && infrMmTelecom !=''){
		$.ajax({
			url:'../member/send-one'
			,method:'post'
			,data:{ 'toNum':toNum
				
			},success:function(response){
				console.log("response :: "+response)
				var certiNum = $('#certiNum').val(response)
				console.log("certiNum :: "+certiNum)
			},err:function(){
				console.log("err :: "+response)
			}
		})	
	}else{
		addValiHtml("#infrMmPhone","????????? ????????? ??????????????????.","disable")
		addValiHtml("#infrMmTelecom","???????????? ??????????????????","disable")
	}
}

function onkeyupCerti(){
	var certiNum = $('#certiNum').val()
	var AuthCode = $('#AuthCode').val()
	console.log("onkeyupCerti AuthCode // certiNum ::" + AuthCode +"//" + certiNum)
	
	if(certiNum != ''){
		console.log("AuthCode != '' " + (certiNum != ''))
		console.log("AuthCode ::" + certiNum)
		if(certiNum != AuthCode){
			addValiHtml("#AuthCode","??????????????? ???????????? ????????????.","disable")
		}else{
			console.log("ok")
			addValiHtml("#AuthCode","??????????????? ???????????????","enable")
		}	
	}else{
		console.log("AuthCode != '' " + (certiNum != ''))
		console.log("AuthCode ::" + certiNum)
		addValiHtml("#certiNum","??????????????? ??????????????????.","disable")
	}
}

function getEmailAuthCode(){
	var infrMmEmailId = $('#infrMmEmailId').val();
	var infrMmEmailAddress = $('#infrMmEmailAddress option:selected').text();
	
	
	
	if(infrMmEmailId != "" && infrMmEmailAddress != ""){
		console.log("infrMmEmail :: "+infrMmEmailId + infrMmEmailAddress)
		$.ajax({
			url:'../member/getEmailAuthCode'
			,method:'post'
			,data:{ 'infrMmEmail':infrMmEmailId + infrMmEmailAddress
				
			},success:function(emailAuthCode){
				if(emailAuthCode != "fail"){
					var code = $('#infrMmEmailAuthCode').val(emailAuthCode)
					console.log("emailAuthCode :: "+ code)
				}else{
					alert("Email is null")
				}
			},err:function(){
				console.log("err ")
			}
		})	
	}else{
		alert("????????? ????????? ????????? ??????????????????")
		addValiHtmlOnKeyEvent('#infrMmEmailId')
		addValiHtmlOnKeyEvent('#infrMmEmailAddress')
	}
	
}

function emailAuthCodeVali(){
	var infrMmEmailAuth = $('#infrMmEmailAuth').val()
	var infrMmEmailAuthCode = $('#infrMmEmailAuthCode').val()
	console.log()
	if(infrMmEmailAuthCode == ''){
		
		console.log('infrMmEmailAuthCode =! :: '+ (infrMmEmailAuthCode =! '')+' // infrMmEmailAuthCode ::' + infrMmEmailAuthCode)
		addValiHtml('#infrMmEmailAuth',"??????????????? ??????????????????.","disable")
	
	}else{
		if(infrMmEmailAuth == infrMmEmailAuthCode){
			console.log(infrMmEmailAuth +' :: ' + infrMmEmailAuthCode)
			addValiHtml('#infrMmEmailAuth',"??????????????? ???????????????.","enable")
		
		}else{
			console.log(infrMmEmailAuth +' :: ' + infrMmEmailAuthCode)
			addValiHtml('#infrMmEmailAuth',"??????????????? ???????????? ????????????.","disable")
		}
	}
	
}


