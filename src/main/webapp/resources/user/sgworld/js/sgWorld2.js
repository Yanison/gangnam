var infrMmSeq = $('#infrMmSeq').val()

// 캔버스를 다룰 변수
const canvas = document.getElementById('myCanvas');
const ctx = canvas.getContext('2d');

//플레리어의 아바타의 반지름
var radius = 16
//플레이어가 움직일때 속도
var playerSpeed = 4


// 플레이어를 담을 아바타
function PlayerAvatar(infrMmSeq) {
	this.id = infrMmSeq;
	this.color = "#FF00FF";
	this.x = 1024 / 2;
	this.y = 768 / 2;
}

var avatars = [];
var avatarMap = {};
var mySeq;

// 키를 입력할 이벤트와키 입력을 판단할 변수. 
var rightPressed = false;
var leftPressed = false;
var upPressed = false;
var downPressed = false;


document.addEventListener("keydown", keyDownHandler, false);
document.addEventListener("keyup", keyUpHandler, false);

function keyDownHandler(e) {
	if (e.code == 'ArrowRight') {
		rightPressed = true;
	}
	if (e.code == 'ArrowLeft') {
		leftPressed = true;
	}
	if (e.code == "ArrowDown") {
		downPressed = true;
	}
	if (e.code == "ArrowUp") {
		upPressed = true;
	}
}

function keyUpHandler(e) {
	if (e.code == "ArrowRight") {
		rightPressed = false;
	}
	if (e.code == "ArrowLeft") {
		leftPressed = false;
	}
	if (e.code == "ArrowDown") {
		downPressed = false;
	}
	if (e.code == "ArrowUp") {
		upPressed = false;
	}
}





// 새로운 플레이어를 배열에 담아주는 역할
function joinUser(infrMmSeq, color, x, y) {
	let avatar = new PlayerAvatar(infrMmSeq);
	avatar.color = color;
	avatar.x = x;
	avatar.y = y;

	avatar.push(ball);
	avatarMap[infrMmSeq] = ball;

	return avatars;
}

// id를 받아서 배열에서 떠난 유저를 삭제
function leaveUser(infrMmSeq) {
	for (var i = 0; i < avatars.length; i++) {
		if (avatars[i].infrMmSeq == infrMmSeq) {
			avatars.splice(i, 1);
			break;
		}
	}
	delete avatarMap[infrMmSeq];
}
//id, x,y좌표를 받아서 새로운 좌표로 업데이트 시켜주는 함수
function updateState(infrMmSeq, x, y) {
	let avatar = avatarMap[infrMmSeq];
	if (!avatar) {
		return;
	}
	avatar.x = x;
	avatar.y = y;

}

//해당하는 플레이어의 id를 찾아서 서버에 socket.emit을 통해 이동된 좌표를 보내주는 함수.  
function sendData() {
	let curPlayer = avatarMap[mySeq];
	let data = {};
	data = {
		infrMmSeq: curPlayer.infrMmSeq,
		x: curPlayer.x,
		y: curPlayer.y,
	};
	if (data) {
		socket.send("send_location", data);
	}
}

// 이후 소켓을 생성하고 데이터를 받아오는 메소드들을 작성
function connect() {
	var socket = new SockJS('/sgWorldService/avatarContorller');
	stompClient = Stomp.over(socket);
	stompClient.connect({}, function(frame) {
		setConnected(true);
		console.log('Connected: ' + frame);


		
		
		stompClient.subscribe('/topic/sgWorld/' + endPoint + "/avatarWSControll/join", function(join) {
			var avatarWSControll = JSON.parse(avatarWSControll.body)
			console.log(JSON.stringify(avatarWSControll.body));

			joinUser(data.infrMmSeq, data.color, data.x, data.y);
		});

		stompClient.subscribe('/topic/sgWorld/' + endPoint + "/avatarWSControll/leave", function(leave) {
			var avatarWSControll = JSON.parse(avatarWSControll.body)
			console.log(JSON.stringify(avatarWSControll.body));

			leaveUser(data);
		});

		stompClient.subscribe('/topic/sgWorld/' + endPoint + "/avatarWSControll/update", function(update) {
			var avatarWSControll = JSON.parse(avatarWSControll.body)
			console.log(JSON.stringify(avatarWSControll.body));

			updateState(data.infrMmSeq, data.x, data.y);
		});

		stompClient.subscribe('/topic/sgWorld/' + endPoint + "/avatarWSControll/userId", function(userId) {
			var avatarWSControll = JSON.parse(avatarWSControll.body)
			console.log(JSON.stringify(avatarWSControll.body));

			mySeq = data;
		});
	});
}





function renderPlayer() {
	/**
	clearRect() 메소드는 Canvas에서 지원하는 메소드 사각형 영역을 지운다.
	받는 매개변수의 정보는 x,y,width,height이다. 
	 */
	ctx.clearRect(0, 0, canvas.width, canvas.height);


	for (let i = 0; i < avatars.length; i++) {
		let avatar = avatars[i];

		ctx.fillStyle = avatar.color;
		ctx.beginPath();
		ctx.arc(avatar.x, avatar.y, radius, 0, Math.PI * 2, false);
		ctx.closePath();
		ctx.fill();

		ctx.beginPath();
		ctx.font = '15px Arial';
		ctx.fillText(`player ${i}`, avatar.x - radius - 7, avatar.y - radius);
		ctx.closePath();
	}

	let userAvatar = avatarsMap[mySeq];

	if (rightPressed) {
		curPlayer.x += playerSpeed;
	}
	if (leftPressed) {
		curPlayer.x -= playerSpeed;
	}
	if (upPressed) {
		curPlayer.y -= playerSpeed;
	}
	if (downPressed) {
		curPlayer.y += playerSpeed;
	}
	sendData();
}

function update() {
	renderPlayer();
}

setInterval(update, 10);


