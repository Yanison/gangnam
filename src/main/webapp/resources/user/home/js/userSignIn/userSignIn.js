// valiScore for null is 17
var valiScore = 0;


$(document).ready(function(){
	$('#userSignInsubmit').click(function(){
		$('p').remove('.alertDiv')
//		$('p .alertDiv').fadeOut("normal",function(){$(this.remove())});
		valiScore = 0;
		
		var memberId = $('#memberId').val()
		var memberPw = $('#memberPw').val()
		var memberName = $('#memberName').val()
		var memberNickName = $('#memberNickName').val()
		var dobYear = $('#dobYear').val()
		var dobMonth = $('#dobMonth').val()
		var dobDay = $('#dobDay').val()
		var memberTel = $('#memberTel').val()
		var enableCertiNum = $('#enableCertiNum').val()
		var AuthCode = $('#AuthCode').val()
		var memberEmail = $('#memberEmail').val()
		var emailAddr = $('#emailAddr').val()
		var roadAddress = $('#roadAddress').val()
		var jibunAddress = $('#jibunAddress').val()
		var detailAddress = $('#detailAddress').val()
		var extraAddress = $('#extraAddress').val()
		var lat = $('#lat').val()
		var long = $('#long').val()
		
		
		var inputArr = 
			[memberId
			,memberPw
			,memberName
			,memberNickName
			,dobYear
			,dobMonth
			,dobDay
			,AuthCode
			,memberTel
			,memberEmail
			,emailAddr
			,roadAddress
			,jibunAddress
			,detailAddress
			,extraAddress
			,lat
			,long]
			
		var inputArrStr = 
			['#memberId' //정규식필요
			,'#memberPw'//정규식필요
			,'#memberName'//정규식필요
			,'#memberNickName'//정규식필요
			,'#dobYear'
			,'#dobMonth'
			,'#dobDay'
			,'#AuthCode'
			,'#memberTel'//정규식필요
			,'#memberEmail'
			,'#emailAddr'
			,'#roadAddress'
			,'#jibunAddress'
			,'#detailAddress'
			,'#extraAddress'
			,'#lat'
			,'#long']
			
		Validation(inputArrStr)
	})
})


function Validation(inputArrStr){
	
	for(i = 0; i <inputArrStr.length ; i ++){
		var inputArrStrIdxVal = $(inputArrStr[i]).val()
		if(inputArrStrIdxVal == ""){
			console.log("disable inputArrStrIdxVal :: " + inputArrStrIdxVal)
			addValiHtml(inputArrStr[i],"This is Empty","disable")
		}else{
			addValiHtml(inputArrStr[i],"Enable","enable")
			this.valiScore += 1
		}
		}
	console.log("valiScore is +"+ valiScore )
	
	if(valiScore == 16){
		console.log("널 ㄴ")
	}else{
		console.log("빈칸없이 쓰세요")
	}
	isDuple()
}
function addValiHtml(inputArrStrIdx,message,status){
	var html='';
	html+='<p class="alertDiv '+ status +'"><strong>'
	html+= message
	html +='</strong></p>';
	
	$(inputArrStrIdx).after(html).show('slow')
}
function addValiHtmlRe(inputArrStrIdx,message,status){
	var html='';
	html+='<p class="reAlertDiv '+ status +'"><strong>'
	html+= message
	html +='</strong></p>';
	
	$(inputArrStrIdx).after(html).show('slow')
}
var memberIdVali = /^[a-zA-Z0-9]{6,20}$/;
var memberPwVali = /^[a-zA-Z0-9]{4,12}$/;
var memberNameVali = /^[가-힝a-zA-Z0-9]{2,10}$/;
var memberNickNameVali = /^[가-힝a-zA-Z0-9]{2,20}$/;
var memberTelVali = /^[0-9]{11}$/;

function enableInputVal(str,val){
	var reVali = null;
	var valiScore = $(str+'ValiScore').val();
	var getDupleValiObj = '';
	
	if(str == '#memberId'){
		reVali = memberIdVali
		getDupleValiObj = 'infrMmId'
	}else if(str == '#memberPw'){
		reVali = memberPwVali
		getDupleValiObj = 'infrMmMmPw'
	}else if(str == '#memberName'){
		revalir = memberName
		getDupleValiObj = 'infrMmName'
	}else if(str == '#memberNickName'){
		revalir = memberNickNameVali
		getDupleValiObj = 'infrMmNickName'
	}else if(str == '#memberTel'){
		revalir = memberTelVali
		getDupleValiObj = 'infrMmPhone'
	}
	
	
	if(!reTest(reVali,val)){
		$(str+'Div'+' .alertDiv').remove()
		addValiHtml(str,"reTest :: disable","disable")
		valiScore = 0
	}else{
		$(str+'Div'+' .alertDiv').remove()
		addValiHtml(str,"reTest :: Enable","enable")
		valiScore = 1
		
		$.ajax({
			url:'../member/getValidationOfDuple'
			,method:'get'
			,data:{
				'dupleValiObj' : getDupleValiObj
				,'shDupleStr' : val
			}
			,success:function(rp){
				console.log('success')
				if(rp.getShDupleStr == val){
					addValiHtml(str,"isDuple :: Enable","enable")
					valiScore = 2
				}else{
					addValiHtml(str,"isDuple :: disable","disable")
					valiScore = 1
				}
			},err:function(err){
				console.log('err')
			}
		})
	}
	
	console.log(str+" ValiScore :: "+ valiScore)
}
function reTest(re,what){
	if (re.test(what)) {//what의 문자열에 re의 패턴이 있는지 나타내는 함수 test
    //만약 내가 입력한 곳의 값이 정규화 데이터를 썼다면 true를 반환해서 호출 된 곳으로 리턴됨           	
        return true;
    }
    what=""
}

function isDuple(param){
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

function addHtmlBelowInput(inputObj,message,status){
	console.log("inputObj // message //status :: " + inputObj +" // "+ message +" // "+ status)
	var html='';
	html+='<p class="alertDiv '+ status +'"><strong>'
	html+= message
	html +='</strong></p>';
	
	$(inputObj).after(html);
}

function onkeyupCerti(){
	var certiNum = $('#certiNum').val()
	var AuthCode = $('#AuthCode').val()
	var enableCertiNum = $('#enableCertiNum').val()
	console.log("onkeyupCerti AuthCode // certiNum ::" + AuthCode +"//" + certiNum)
	
	
	if(certiNum == AuthCode){
		$('p').remove('#certiNumDiv .alertDiv');
		console.log("ok")
		addHtmlBelowInput("#getAuthCode","인증번호가 일치합니다","enable")
		enableCertiNum = 1;
	}else{
		$('p').remove('#certiNumDiv .alertDiv');
		console.log("not ok")
		addHtmlBelowInput("#getAuthCode","인증번호가 일치하지 않습니다.","disable")
		enableCertiNum = 0;
	}
	
	console.log("enableCertiNum:: " + enableCertiNum)
}



