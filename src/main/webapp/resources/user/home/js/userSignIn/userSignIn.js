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
			]
			
	
	$.ajax({
			url:'/gangnam/member/userSignIn'
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
					location.replace('/gangnam/')
				}else{
					alert('회원가입 거부')
				}
			},err:function(err){
				alert('회원가입 거부')
			}
			
		})
}



function submitUserSignIn(){
		console.log('userSignInsubmit')
		$('p').remove('.alertDiv')
		
		var inputArrStr = 
			['#memberId' //정규식필요 /** 1*/
			,'#infrMmPw'//정규식필요 /** 2*/
			,'#infrMmPwChk'
			,'#memberName'//정규식필요 /** 3*/
			,'#infrMmNickname'//정규식필요 /** 4*/
			,'#infrMmBod' /** 5*/
			,'#infrMmGender' /** 6*/
			,'#infrMmTelecom' /** 7*/
			,'#infrMmPhone'//정규식필요 /** 8*/
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
	if($('.enable').length != 13){
		alert(" 올바른 회원가입 정보를 입력해주세요 $('.enable').length :: " + $('.enable').length)
		return false;
	}else{
		confirm('회원가입 하시겠습니까?')
		
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
		//영어와 숫자 혼용 6~20자
		reVali = /^[a-z]+[a-z0-9]{5,19}$/;
		getDupleValiObj = 'infrMmId'
		console.log("reVali // val :: " +reVali + " // "+ val)
	}else if(str == '#infrMmPw'){
		//최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자 :
		reVali =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		console.log("reVali // val :: " +reVali + " // "+ val)
		
	}else if(str == '#infrMmPwChk'){
		//최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자 :
		reVali =  /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
		console.log("reVali // val :: " +reVali + " // "+ val)
		
	}else if(str == '#memberName'){
		reVali = /^[가-힣a-zA-Z]{2,10}$/;
		getDupleValiObj = 'infrMmName'
		console.log("reVali // val :: " +reVali + " // "+ val)
	}else if(str == '#infrMmNickname'){
		reVali =  /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
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
				url:'/gangnam/member/getValidationOfDuple'
				,method:'get'
				,data:{
					'dupleValiObj' : getDupleValiObj
					,'shDupleStr' : val
				}
				,success:function(rp){
					console.log('success dupleValiObj ::' + rp)
					if(rp == 0){
						console.log('rp :: ' + rp)
						addValiHtml(str,"중복없음","enable")
					}else{
						console.log('rp :: ' + rp)
						addValiHtml(str,"중복된 입력값입니다.","disable")
					}
				},err:function(err){
					console.log('err')
				}
			})	
		}else{ 
			addValiHtml(str,"reTest :: Enable","enable")
			if($('#infrMmPwChk').val() != $('#infrMmPw').val()){
				addValiHtml('#infrMmPwChk',"비밀번호 일치하지 않습니다.","disable")
			}else if($('#infrMmPwChk').val() == $('#infrMmPw').val()){
				addValiHtml('#infrMmPwChk',"비밀번호가 일치합니다","enable")
			}
		}
	}
}

function reTest(re,what){
	if (re.test(what)) {//what의 문자열에 re의 패턴이 있는지 나타내는 함수 test
    //만약 내가 입력한 곳의 값이 정규화 데이터를 썼다면 true를 반환해서 호출 된 곳으로 리턴됨           	
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
			url:'/gangnam/member/send-one'
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
		addValiHtml("#infrMmPhone","휴대폰 번호를 입력해주세요.","disable")
		addValiHtml("#infrMmTelecom","통신사를 선택해주세요","disable")
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
			addValiHtml("#AuthCode","인증번호가 일치하지 않습니다.","disable")
		}else{
			console.log("ok")
			addValiHtml("#AuthCode","인증번호가 일치합니다","enable")
		}	
	}else{
		console.log("AuthCode != '' " + (certiNum != ''))
		console.log("AuthCode ::" + certiNum)
		addValiHtml("#certiNum","인증번호를 요청해주세요.","disable")
	}
}

function getEmailAuthCode(){
	var infrMmEmailId = $('#infrMmEmailId').val();
	var infrMmEmailAddress = $('#infrMmEmailAddress option:selected').text();
	
	
	
	if(infrMmEmailId != "" && infrMmEmailAddress != ""){
		console.log("infrMmEmail :: "+infrMmEmailId + infrMmEmailAddress)
		$.ajax({
			url:'/gangnam/member/getEmailAuthCode'
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
		alert("올바른 이메일 정보를 입력해주세요")
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
		addValiHtml('#infrMmEmailAuth',"인증번호를 요청해주세요.","disable")
	
	}else{
		if(infrMmEmailAuth == infrMmEmailAuthCode){
			console.log(infrMmEmailAuth +' :: ' + infrMmEmailAuthCode)
			addValiHtml('#infrMmEmailAuth',"인증번호가 일치합니다.","enable")
		
		}else{
			console.log(infrMmEmailAuth +' :: ' + infrMmEmailAuthCode)
			addValiHtml('#infrMmEmailAuth',"인증번호가 일치하지 않습니다.","disable")
		}
	}
	
}


