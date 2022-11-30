
// 유저의 정보를 담을 배열
var infrMmSeq = $('#infrMmSeq').val()
var users=[];
// 유저의 고유 인덱스
var userIdx
var endPoint = $('#endPoint').val()
var userColor1;
var userColor2; 
var userColor3; 
var userColor4; 
var userColor5; 
var userColor6; 
var userColor7; 
var userColor8; 
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
			"#63144c"
	]
var sx = 494;
var sy = 494;

function findMyInx(users){
	console.log("findMyInx.users :: "+ JSON.stringify(users))
	for(var i = 0 ; i <users.length;i ++){
		console.log("findMyInx idx is :: " + users[i].infrMmSeq)
		console.log("findMyInx this infrMmSeq is :: " + this.infrMmSeq)
			if(this.infrMmSeq == users[i].infrMmSeq){
				console.log("findMyInx this userSeq"+users[i].infrMmSeq)
				this.userIdx = i
				break
		}
	}
	
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
            showMsg(msgObj);
        });
        
        stompClient.subscribe('/topic/sgWorld/requestOnloadInfo/'+endPoint, function(user) {
		console.log('/topic/sgWorld/requestOnloadInfo/')
		var user = JSON.parse(user.body)
		var users = [];
			for(i = 0 ; i < user.length;i ++){
					console.log('반복문시작')
					var arr={
						infrMmSeq :user[i].infrMmSeq,
						infrMmNickName : user[i].infrMmNickname,
						userColor :  user[i].userColor,
						x :  user[i].x,
						y :  user[i].y,
						avatarSeq : user[i].avatarSeq
					}
				if(users.length != 0){
					for(e = 0 ; e < users.length; e++){
						if(users[e].infrMmSeq == user[i].infrMmSeq){
							console.log('users.length != 0 중복')
							break;
						}else{
							console.log('users.length != 0 푸쉬')
							users.push(arr)
							this.user = user
						}
					}
				}else{
					console.log('users.length == 0 푸쉬')
					users.push(arr)
				}
			
			}
			
			console.log("users :: "+ JSON.stringify(users))
			this.users = users
			console.log("this.users :: "+ JSON.stringify(this.users))
			findMyInx(this.users)
			console.log("userIdx :: "+ this.userIdx)
        });
		stompClient.subscribe('/topic/sgWorld/' + endPoint + "/avatarWSControll/update", function(update) {
			var update = JSON.parse(update.body)
			updateState(update.infrMmSeq,update.x,update.y)
		});
		
		var endPoint = $('#endPoint').val()
		var infrMmSeq = $('#infrMmSeq').val()
		send(endPoint,infrMmSeq)
    });
}


function send(ep,seq) {
	data={'infrMmSeq' : seq}
	stompClient.send("/app/sgWorld/msgTo/" +ep+"/requestOnloadInfo",{},JSON.stringify(data));
}
function sendLocation(data){
	console.log("seq :: "+data.infrMmSeq+"\n"+
				" x :: "+data.x +"\n"+
				" y:: "+data.y)
	stompClient.send("/app/sgWorld/" +this.endPoint+"/avatarWSControll/updateLoca",{},JSON.stringify(data));
}

const canvas = document.getElementById('myCanvas');
const ctx = canvas.getContext('2d');

var ballRadius = 10;
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
			}
		}
	}
    
}

function draw(){
	let users = this.users
	
	
	ctx.clearRect(0, 0, canvas.width, canvas.height);
	for(var i = 0 ; i <users.length ; i ++){
		ctx.beginPath();
	    ctx.arc(users[i].x, users[i].y, ballRadius, 0, Math.PI*2);
	    ctx.fillStyle = colArr[i];
	    ctx.fill();
	    ctx.closePath();
	}
	
    let user = users[userIdx];
    if(rightPressed) {
        user.x += 2;
        if (user.x + ballRadius > canvas.width){
            user.x = canvas.width - ballRadius;
        }
    }
    else if(leftPressed) {
        user.x -= 2;
        if (user.x < 0){
            user.x = 0;
        }
    }
    else if(upPressed) {
        user.y -= 2;
        if (user.y + ballRadius > canvas.height){
            user.y = canvas.height - ballRadius;
        }
    }
    else if(downPressed) {
        user.y+= 2;
        if (user.y < 0){
            user.y = 0;
        }
    }
    sendLocation(user);
}
setInterval(draw, 10);
		