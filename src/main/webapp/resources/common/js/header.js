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

function goMp(){
	var mmSeq = $('#sessMmSeq').val()
	console.log("../member/memberView?infrMmSeq="+mmSeq)
	//location.href="../member/memberView?infrMmSeq="+mmSeq
}


function isSssValThere(str){
	var sessMmId = $(str).val();
	console.log(
		str + " Session is:: " + sessMmId +"\n"
	)
}

function gohome(){
	location.href="/"
}

function goboard(){
	location.href="/board/boardList"
}

function goWrite(){
	location.href="/board/boardWrite"
}


var goUrlView = "/member/memberView?infrMmSeq=";

var form = $("form[name=form]");
var seq = $("input:hidden[name=infrMmSeq]");

goMemberView = function(keyValue) {
	seq.val(keyValue);
	form.attr("action", goUrlView).submit();
}

function goMp(){
	var sessMmSeq = $('.hiddenGroup #sessMmSeq').val()
	location.href=goUrlView+sessMmSeq
}

function myPage(){
	$.ajax({
		type:"post"
		,url:"/member/memberView"
		,data:"infrMmSeq"
	})
}