$(document).ready(function(){
	
	connect()
})
var endPoint = $('#endPoint').val()
var infrMmSeq = $('#infrMmSeq').val()
var infrMmNickname = $('#infrMmNickname').val()
var stompClient = null;
	
function setConnected(connected) {
    $("#connect").prop("disabled", connected);
    //$("#disconnect").prop("disabled", !connected);
    if (connected) {
        $("#conversation").show();
    }
    //else {
        //$("#conversation").hide();
    //}
    $("#greetings").html("");
}


function sendMsg(f) {
	var chatmsg = {
		chatMsg : $('input[name="msg"]').val(),
		infrMmSeq : $('#infrMmSeq').val(),
		infrMmNickname : $('#infrMmNickname').val()
	}
	if(f.keyCode == 13){ //javascript에서는 13이 enter키를 의미함
	    
	    stompClient.send(
		"/app/sgWorld/msgTo/"+endPoint,
	    {}, 
	    JSON.stringify(chatmsg)
	    );
	    $('#inputMsg').val('');
	}
}
function sendMsgBtn() {
	var chatmsg = {
		chatMsg : $('input[name="msg"]').val(),
		infrMmSeq : $('#infrMmSeq').val(),
		infrMmNickname : $('#infrMmNickname').val()
	}
	
    stompClient.send(
		"/app/sgWorld/msgTo/"+endPoint,
    {}, 
    JSON.stringify(chatmsg)
    );
    $('#inputMsg').val('');
}

function showMsg(message) {
	var html =''
	html += '<div class="msgDiv">'
	html += 	'<div class="msgHeader">'
	html += 		'<i id="exitSgWorld"class="fa-solid fa-user"></i>'
	html +=			message.infrNickname
	html += 		'<p>'+message.datetime+'</p>'	
	html += 	'</div>'	
	html += 	'<div class="msgBody">'	
	html += 		'<p class="magTextarea" id="magTextarea">'	
	html += 			message.chatMsg
	html += 		'</p>'	
	html += 	'</div>'
	html += '</div>'
	
    $("#sgwChat").prepend(html);
}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
}