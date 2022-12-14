$(window).on("beforeunload",function(){
	
	leaveAndDel()
	sendUsersNum(users.length)
	disconnect()
})
var camwith = null;
var endPoint = $('#endPoint').val()
var infrMmSeq = $('#infrMmSeq').val()
var sgwSeq = $('#sgwSeq').val()
// 유저의 정보를 담을 배열
var userIdx
var users=[];
// 유저의 고유 인덱스

// 색상. 
var colArr = [
		"#5c1e1e",
		"#7b6bb3",
		"#708a94",
		"#3e6941",
		"#096085",
		"#098536",
		"#000000",
		"#008536",
		"#a19fbf",
		"#63144c" ]
/**
선언된 배열 users에 유저들의 정보가 담겨있음. 각자 본인의 정보에만 접근 가능하도록
본인의 index를 할당받는 메소드
 */



function findMyInx(){
	console.log("findMyInx.users :: "+ JSON.stringify(users))
	loopi:for(var i = 0 ; i <users.length;i ++){
		console.log("findMyInx for ["+i+"] users :: "+ JSON.stringify(users[i]))
		console.log("findMyInx, infrMmSeq :: " + infrMmSeq)
		
		if(infrMmSeq == users[i].infrMmSeq){
			
			console.log("findMyInx users["+i+"] userSeq :: "+users[i].infrMmSeq)
			console.log("findMyInx users["+i+"] infrMmNickname :: "+users[i].infrMmNickname)
			this.userIdx = i
			console.log("findMyInx, userIdx :: " + this.userIdx)
			break loopi
		}
	}
	
}
function connect() {
	var socket = new SockJS('/sgWorldService');
	stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        
        
        //listenContact
		stompClient.subscribe("/topic/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/contactListener",function (contactListener) {
		   let contact = false;
		   
		   if(contactListener.body == "contacted"){
				contact = true;
			}else{
				contact = false;
			}
			if(contact === true){
				console.log("init c")
				initCall();
				sendOffer();
			}
		});
        //listenOffer
		stompClient.subscribe("/topic/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/offer",function (listenOffer) {
		    const offer = JSON.parse(listenOffer.body)
		    console.log(offer)
		    console.log("received the answer"+ offer);
		    sendAnswer(offer);
		    
		});
        //listenAnswer
		stompClient.subscribe("/topic/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/answer",function (listenAnswer) {
		   	const answer = JSON.parse(listenAnswer.body)
		   	console.log(answer);
		    console.log("received the answer" + answer);
		    myPeerConnection.setRemoteDescription(answer);
		});
		//listenIceCandidate
		stompClient.subscribe("/topic/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/ice",function (iceCandidate) {
			const ice = JSON.parse(iceCandidate.body)
			console.log(ice);
		    console.log("received the answer" + ice);
		    myPeerConnection.addIceCandidate(ice);
		});

        
        stompClient.subscribe('/topic/sgWorld/chatroom/'+endPoint, function (msgObjFromServer) {
			 var msgObj = JSON.parse(msgObjFromServer.body)
			 console.log("topic/sgWorld/chatroom"+ msgObj)
            showMsg(msgObj);
        });
        
         stompClient.subscribe('/topic/sgWorld/sendMessage/'+endPoint, function (msgObjFromServer) {
            var msgObj = JSON.parse(msgObjFromServer.body)
            showMsg(msgObj);
        });
        
        stompClient.subscribe("/topic/sgWorld/" +this.endPoint+"/avatarWSControll/updateLoca",function (leave) {
            var leave = JSON.parse(leave.body)
            console.log("topic/sgWorld/chatroom"+ msgObj)
        });
        stompClient.subscribe('/topic/sgWorld/requestOnloadInfo/'+endPoint, function(usersInfo) {
		console.log('/topic/sgWorld/requestOnloadInfo/')
		var usersInfo = JSON.parse(usersInfo.body)
		var users = this.users
		
		var arr = {
				infrMmSeq :usersInfo.infrMmSeq,
				infrMmNickname : usersInfo.infrMmNickname,
				userColor :  usersInfo.userColor,
				x :  usersInfo.x,
				y :  usersInfo.y,
				avatarSeq : usersInfo.avatarSe,
			}
		users.push(arr)
		/**
		배열에 추가하고 전체 플레이어를 다시 렌더링 해주는 작업 필요
		이미 들어와서 렌더링 된 플레이어들은 렌더링에서 제외
		 */
		findMyInx()
		console.log("userIdx :: "+ this.userIdx)
		//새로운 배열에 유저가 추가가 되면 추가가 되었다고 다른 유저들에게도 공유
		/**
	      새로운 유저가 추가가되면 추가된 배열울 후발주자에게 전달해야함. 
	      지금 문제는 전달되고 전달 잘 받고 나서 reRenderingUsers 메소드 때문에 덮어 씌여짐.
	      왜냐하면 
		 */
        });
        stompClient.subscribe('/topic/sgWorld/' + endPoint + "/avatarWSControll/reRenderingUsers", function(udateUserList) {
			var udateUserList = JSON.parse(udateUserList.body);
			console.log("udateUserList :: "+JSON.stringify(udateUserList) + "// usersNum :: "  + udateUserList.x)
			
			this.users = []
			var userLsit=[];
			loopi:for(var i = 0 ; i < udateUserList.length; i ++){
				console.log("udateUserList.length :: " +  udateUserList.length)
				console.log("users :: "  +JSON.stringify(users))
				
				if(users.length <= 0){
					for(var q = 0;q < udateUserList.length ;q ++){
						var arr = {
								infrMmSeq :udateUserList[q].infrMmSeq,
								infrMmNickname : udateUserList[q].infrMmNickname,
								userColor :  udateUserList[q].userColor,
								x :  udateUserList[q].x,
								y :  udateUserList[q].y,
								avatarSeq : udateUserList[q].avatarSeqx,
								userStatus : "normal"
							}
						userLsit.push(arr); console.log("break"); 	
					}
					break loopi
				}else{
					loope:for(var e = 0; e < users.length; e  ++){
						console.log("users.length :: " + users.length)
						
						
						if (users[e].infrMmSeq == udateUserList[i].infrMmSeq){
							console.log("this.users["+e+"].infrMmSeq == udateUserList["+i+"].infrMmSeq"+ (users[e].infrMmSeq == udateUserList[i].infrMmSeq))
							var arr = {
								infrMmSeq :udateUserList[i].infrMmSeq,
								infrMmNickname : udateUserList[i].infrMmNickname,
								userColor :  udateUserList[i].userColor,
								x :  udateUserList[i].x,
								y :  udateUserList[i].y,
								avatarSeq : udateUserList[i].avatarSeq,
								userStatus : "normal"
							}
							userLsit.push(arr)
							console.log(JSON.stringify("arr :: " + arr))
							continue loope;
						}else{
							console.log("this.users["+e+"].infrMmSeq == udateUserList["+i+"].infrMmSeq"+ (users[e].infrMmSeq == udateUserList[i].infrMmSeq))
						}
					}	
				}
				
				
			}
			console.log(JSON.stringify("after for ie. userLsit :: " + JSON.stringify(userLsit)))
			for(var o = 0; o < userLsit.length; o  ++){
				users.push(userLsit[o])
			}
			console.log(JSON.stringify("after for ie. this.users:: " + JSON.stringify(users)))
			findMyInx()
			$('em#usersNum,em#usersNum2').text(userLsit.length)
			var usersNum = $('#ipUsersNum').val(userLsit.length)
			sendUsersNum(userLsit.length)
		});
		stompClient.subscribe('/topic/sgWorld/' + endPoint + "/avatarWSControll/update", function(update) {
			var update = JSON.parse(update.body)
			updateState(update.infrMmSeq,update.x,update.y)
		});
		
		send(endPoint,infrMmSeq)
    });
    
    stompClient.reconnect_delay = 5000;
}

function send(ep,seq) {
	data={'infrMmSeq' : infrMmSeq}
	stompClient.send("/app/sgWorld/msgTo/" +ep+"/requestOnloadInfo",{},JSON.stringify(data));
}
function sendUsersNum(usersNum){
	console.log("usersNum :: " + usersNum)
	stompClient.send("/app/usersNum/"+endPoint,{},usersNum);
}
function leaveAndDel() {
	var users = this.users;
	var leavingUser = users[userIdx]
	leavingUser["sgwSeq"] = $('#sgwSeq').val()
	console.log(JSON.stringify(users[userIdx]))
	for(var i = 0 ; i < users.length; i ++){
		if(users[i].infrMmSeq == leavingUser.infrMmSeq){
			var leaving = users.splice(i,1);
			i--;
			leavingUser.x = 1600;
			leavingUser.y = 0;
			sendLocation(leavingUser)
			this.userIdx = null;
			console.log("leaving"+JSON.stringify(leaving))
			console.log("leftusers"+JSON.stringify(users))
		}
	}
	console.log("leavingUser :: " + JSON.stringify(leavingUser))
	stompClient.send("/app/sgWorld/" +this.endPoint+"/avatarWSControll/leave",{},JSON.stringify(leavingUser));
	
	location.href="/"
}
function confirmLeaving(){
	if(confirm("정말 나가시겠습니까?"+this.sgwSeq)){
		leaveAndDel()
	}
}

function sendLocation(data){
	console.log("seq :: "+data.infrMmSeq+"\n"+
				" x :: "+data.x +"\n"+
				" y:: "+data.y)
	stompClient.send("/app/sgWorld/" +this.endPoint+"/avatarWSControll/updateLoca",{},JSON.stringify(data));
}

const canvas = document.getElementById('myCanvas');
const ctx = canvas.getContext('2d');


var rightPressed = false;
var leftPressed = false;
var upPressed = false;
var downPressed = false;

document.addEventListener("keydown", keyDownHandler, false);
document.addEventListener("keyup", keyUpHandler, false);

function keyDownHandler(e) {
    if(e.key == "Right" || e.key == "ArrowRight") {
        rightPressed = true;
    }
    else if(e.key == "Left" || e.key == "ArrowLeft") {
        leftPressed = true;
    }else if(e.key == "Up" || e.key == "ArrowUp") {
        upPressed = true;
    }else if(e.key == "Dwon" || e.key == "ArrowDown") {
        downPressed = true;
    }
}

function keyUpHandler(e) {
    if(e.key == "Right" || e.key == "ArrowRight") {
        rightPressed = false;
    }
    else if(e.key == "Left" || e.key == "ArrowLeft") {
        leftPressed = false;
    }else if(e.key == "Up" || e.key == "ArrowUp") {
        upPressed = false;
    }else if(e.key == "Dwon" || e.key == "ArrowDown") {
        downPressed = false;
    }
}

function updateState(infrMmSeq,x,y){
	// 메세지는 한번에 한명씩 정보를 던짐. 
	// 메세지는 seq 정보를 줌
	// seq와 맞는 유저에 위치 정보를 주면 됨
	// But 내 인덱스 정보를 제외
	let users = this.users
    
    for(var i = 0 ; i < users.length; i ++){
		if(i != this.userIdx){
			if(infrMmSeq == users[i].infrMmSeq){
				users[i].x = x;
   	 			users[i].y = y;
   	 			console.log(users[i].infrMmSeq +":: x_"+ users[i].x +" y_"+ users[i].y)
			}
		}
	}
}

var ballRadius = 10;



function draw(){
	
	let users = this.users
		
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	for(var i = 0 ; i <users.length ; i ++){
		ctx.beginPath();
	    ctx.arc(users[i].x, users[i].y, ballRadius, 0, Math.PI*2);
	    ctx.fillStyle = colArr[i];
	    ctx.fill();
	    ctx.font = "10px Arial";
		ctx.fillText(users[i].infrMmNickname, users[i].x-(ballRadius+5), users[i].y-(ballRadius+2));
	    ctx.closePath();
	}
	
    let user = users[userIdx];
  
//    let preventOverlap = 
//		user.x < users[e].x + ballRadius&&
//		user.x > users[e].x - ballRadius&& 
//		user.y < users[e].y + ballRadius&& 
//		user.y >users[e].y - ballRadius
//	
//	if(preventOverlap){
//		if(user.x  > users[e].x - ballRadius &&  user.y > users[e].y - ballRadius){
//			user.x = users[e].x - ballRadius;
//			user.y = users[e].y - ballRadius;
//		}else if(user.x  < users[e].x + ballRadius &&  user.y > users[e].y - ballRadius){
//   			user.x = users[e].x + ballRadius;
//			user.y = users[e].y - ballRadius;
//		}else if(user.x  < users[e].x + ballRadius &&  user.y < users[e].y + ballRadius){
//			user.x = users[e].x + ballRadius;
//			user.y = users[e].y + ballRadius;
//		}else if(user.x  > users[e].x - ballRadius &&  user.y < users[e].y + ballRadius){
//			user.x = users[e].x - ballRadius;
//			user.y = users[e].y + ballRadius;
//		}
//	}
    
    // 정방향
    if(rightPressed) {
        user.x += 10;
        if (user.x + ballRadius > canvas.width){
            user.x = canvas.width - ballRadius;
        }
        sendLocation(user);
    }
    else if(leftPressed) {
        user.x -= 10;
        if (user.x < ballRadius){
            user.x = ballRadius;
        }
        sendLocation(user);
    }
    else if(upPressed) {
        user.y -= 10;
        if (user.y < ballRadius){
            user.y = ballRadius;
        }
        sendLocation(user);
    }
    else if(downPressed) {
        user.y+= 10;
        if (user.y + ballRadius > canvas.height){
            user.y = canvas.height - ballRadius;
        }
        sendLocation(user);
    }
    
    
    //대각
    if(downPressed && leftPressed) {
        user.y += 7;
        user.x -= 7;
        if (user.y + ballRadius > canvas.height){
            user.y = canvas.height - ballRadius;
        }
        if (user.x < ballRadius){
            user.x = ballRadius;
        }
        sendLocation(user);
    }else if(downPressed && rightPressed) {
        user.y += 7;
        user.x += 7;
        if (user.y + ballRadius > canvas.height){
            user.y = canvas.height - ballRadius;
        }
        if (user.x + ballRadius > canvas.width){
            user.x = canvas.width - ballRadius;
        }
        sendLocation(user);
    }else if(upPressed && leftPressed) {
        user.y -= 7;
        user.x -= 7;
        if (user.y < ballRadius){
            user.y = ballRadius;
        }
        if (user.x < ballRadius){
            user.x = ballRadius;
        }
        sendLocation(user);
    }else if(upPressed && rightPressed) {
        user.y -= 7;
        user.x += 7;
         if (user.y < ballRadius){
            user.y = ballRadius;
        }
        if (user.x + ballRadius > canvas.width){
            user.x = canvas.width - ballRadius;
        }
        sendLocation(user);
    }
    for(var e = 0 ; e  < users.length; e ++){
		if(users[e].infrMmSeq != user.infrMmSeq){
			let contact = users[e].x < user.x + 25 && users[e].x > user.x - 25 && users[e].y < user.y + 25 && users[e].y > user.y - 25
			
			
			if(contact){anotherUser = e}
			if(anotherUser != null){
				let contactWith = users[anotherUser].x < user.x + 25 && users[anotherUser].x > user.x - 25 && users[anotherUser].y < user.y + 25 && users[anotherUser].y > user.y - 25
				if(contactWith){
					if(users[anotherUser].userStatus == "normal" && user.userStatus == "normal"){
						showCamDiv(true)
					}
					users[anotherUser].userStatus = "onCam"
					user.userStatus = "onCam"
				}else{
					if(users[anotherUser].userStatus == "onCam" && user.userStatus == "onCam"){
						showCamDiv(false)
					}
					users[anotherUser].userStatus = "normal"
					user.userStatus = "normal"
					anotherUser=null
				}
			}
		}
	}
}
setInterval(draw, 50);
let anotherUser;
let bool = false;

function showCamDiv(e){
	console.log("showCamDivEnvet :: "+e)
	if(e != bool){
		bool = e;
		console.log("값이 바뀜")
		if(e){
			console.log('showCamDivOn')
			appendCam()
		}else{
			$('.littleCamDiv').remove()
			console.log('showCamDivOff')
			//myPeerConnection.close()
		}	
	}else{
		console.log("중복 할당 방지")
	}
}


function appendCam(){
	html =""
	html += '<div class="littleCamDiv" onclick="fullCamDiv()">'
	html += '<div class="cam myCam" onclick="whosCam(this)">'
	html += '<video id="myFace" autoplay playsinline width="200" height="160"></video>'
	html += '</div></div>'
	
	
	html2 =""
	html += '<div class="littleCamDiv" onclick="fullCamDiv()">'
	html += '<div class="cam myCam" onclick="whosCam(this)">'
	html += '<video id="yourFace" autoplay playsinline width="200" height="150"></video>'
	html +=	'</div></div>'
	
	$('#myCamDiv').append(html)
	$('#yourCamDiv').append(html2)
}


	
		
			
		
	
	
		
			
		
	


	