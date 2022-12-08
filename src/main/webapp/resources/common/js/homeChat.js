function sendMsg(f){
	var arr={
		'chatMsg':$('#homeChat').val(),
		'infrMmSeq':$('#sessMmSeq').val()
	}
	if(f.keyCode == 13){
		if(arr.chatMsg == ""){return false}
		stompClient.send("/app/home/chat",{},JSON.stringify(arr))
		$('#homeChat').val(null)
	}
}
//이게 왜 될까?
function appendChat(msg){
	var nick = "";
	switch(msg.infrMmSeq){
		case $('#sessMmSeq').val():
			nick = "You"
			break;
		default:
			nick = "익명의 아무개"
			break;
	}
	if(msg.infrMmSeq == "" ||msg.infrMmSeq == undefined ){
			msg.infrMmNickname = "익명의아무개"
		}
	var html =""
	html += '<p class="chatText">'+nick+" : "+msg.chatMsg+'</p>'
	$('.chatBody').prepend(html)
	if($('.chatText').length > 20){
		console.log($('.chatText').length)
		$('.chatBody p.chatText:last-child').remove()
	}
}