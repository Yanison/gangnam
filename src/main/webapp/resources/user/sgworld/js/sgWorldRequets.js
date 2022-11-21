$(document).ready(function(){
	selectSgworldInfo()
	connect()
})

function selectSgworldInfo(){
	var infrMmSeq = $('#infrMmSeq').val()
	console.log("infrMmSeq :: "+ infrMmSeq)
	
	$.ajax({
		url:'/sgWorld/findMm'
		,type:'get'
		,data:{
			'infrMmSeq': infrMmSeq
		}
		,success:function(rp){
			console.log(JSON.stringify(rp))
		}
		,error:function(rp){
			alert('selectSgworldInfo err')
		}
	})
}


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

function connect() {
    var socket = new SockJS('/sgWorldService');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        
        
        var endPoint = $('#endPoint').val()
        stompClient.subscribe('/topic/sgWorld/chatroom/'+endPoint, function (msgObjFromServer) {
			var msgObj = JSON.parse(msgObjFromServer.body)
			 console.log("topic/sgWorld/chatroom"+ msgObj)
            showMsg(msgObj);
        });
        
         stompClient.subscribe('/topic/sgWorld/sendMessage/'+endPoint, function (msgObjFromServer) {
            var msgObj = JSON.parse(msgObjFromServer.body)
            console.log("topic/sgWorld/sendMessage"+msgObj)
            showMsg(msgObj);
        });
    });
}


function sendMsg(f) {
	var endPoint = $('#endPoint').val()
	if(f.keyCode == 13){ //javascript에서는 13이 enter키를 의미함
	    stompClient.send("/app/sgWorld/msgTo/"+endPoint+"/",
	    {}, 
	    JSON.stringify(
				{
					chatMsg : $('input[name="msg"]').val(),
					infrMmSeq : $('#infrMmSeq').val(),
					endPoint:$('#endPoint').val()
				}
			)
	    );
	    $('#inputMsg').text('');
    }
	
   
}
function showMsg(message) {
	console.log("message.chatMsg :: "+message)
	var html =''
	html += '<div class="msgDiv">'
	html += 	'<div class="msgHeader">'
	html += 		'<i id="exitSgWorld"class="fa-solid fa-user"></i>'	
	html += 		'<p>'+new Date()+'</p>'	
	html += 	'</div>'	
	html += 	'<div class="msgBody">'	
	html += 		'<p class="magTextarea" id="magTextarea">'	
	html += 			message	
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
