var infrMmSeq = $('#infrMmSeq').val()

const canvas = document.getElementById('myCanvas');
const ctx = canvas.getContext('2d');

var radius=16
var playerSpeed= 4

var rightPressed = false;
var leftPressed = false;
var upPressed = false;
var downPressed = false;



// 플레이어를 담을 아바타
function PlayerAvatar(id){
    this.id = infrMmSeq;
    this.color = "#FF00FF";
    this.x = 1024/2;
    this.y = 768/2;
}

var avatar  = [];
var avatarMap = {};
var myId;

document.addEventListener("keydown", keyDownHandler,false);
document.addEventListener("keyup", keyUpHandler,false);

function keyDownHandler(e){
    if (e.code == 'ArrowRight'){
        rightPressed = true;
    }
    if (e.code == 'ArrowLeft'){
        leftPressed = true;
    }
    if(e.code == "ArrowDown"){
        downPressed = true;
    }
    if(e.code == "ArrowUp"){
        upPressed = true;
    }
}

function keyUpHandler(e){
    if (e.code == "ArrowRight"){
        rightPressed = false;
    }
    if (e.code == "ArrowLeft"){
        leftPressed = false;
    }
    if(e.code == "ArrowDown"){
        downPressed = false;
    }
    if(e.code == "ArrowUp"){
        upPressed = false;
    }
}


function joinUser(id,color,x,y){
    let ball = new PlayerBall(id);
    ball.color = color;
    ball.x = x;
    ball.y = y;

    balls.push(ball);
    ballMap[id] = ball;

    return ball;
}

function leaveUser(id){
    for(var i = 0 ; i < balls.length; i++){
        if(balls[i].id == id){
            balls.splice(i,1);
            break;
        }
    }
    delete ballMap[id];
}

function updateState(id,x,y){
    let ball = ballMap[id];
    if(!ball){
        return;
    }
    ball.x = x;
    ball.y = y;

}

function connect() {
    var socket = new SockJS('/sgWorldService/avatarContorller');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        
        
        var endPoint = $('#endPoint').val()
		stompClient.subscribe('/topic/sgWorld/'+endPoint+"/avatarWSControll/join", function (join) {
		    var avatarWSControll = JSON.parse(avatarWSControll.body)
		    console.log(JSON.stringify(avatarWSControll.body));
		    
		    joinUser(data.id, data.color, data.x, data.y);
		});
		
		stompClient.subscribe('/topic/sgWorld/'+endPoint+"/avatarWSControll/leave", function (leave) {
		    var avatarWSControll = JSON.parse(avatarWSControll.body)
		    console.log(JSON.stringify(avatarWSControll.body));
		    
		    leaveUser(data);
		});
		
		stompClient.subscribe('/topic/sgWorld/'+endPoint+"/avatarWSControll/update", function (update) {
		    var avatarWSControll = JSON.parse(avatarWSControll.body)
		    console.log(JSON.stringify(avatarWSControll.body));
		    
		    updateState(data.id, data.x, data.y);
		});
		
		stompClient.subscribe('/topic/sgWorld/'+endPoint+"/avatarWSControll/userId", function (userId) {
		    var avatarWSControll = JSON.parse(avatarWSControll.body)
		    console.log(JSON.stringify(avatarWSControll.body));
		    
		    myId = data;
		});
    });
}

function send() {
    stompClient.send("/app/sgWorld/msgTo/"+endPoint,{},JSON.stringify(chatmsg));
}

//유저의 좌표와 아이디 데이터를 보낼 메소드 
function sendData() {
    let curPlayer = ballMap[myId];
    let data = {};
    data = {
        infrMmSeq : curPlayer.id,
        x: curPlayer.x,
        y: curPlayer.y,
    };
    if(data){
        socket.emit("send_location", data);
    }
}

function renderPlayer() {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
    
        for (let i = 0; i < balls.length; i++) {
            let ball = balls[i];
            
            ctx.fillStyle = ball.color;
            ctx.beginPath();
            ctx.arc(ball.x, ball.y, radius, 0, Math.PI * 2, false);
            ctx.closePath();
            ctx.fill();
            
            ctx.beginPath();
            ctx.font = '15px Arial';
            ctx.fillText(`player ${i}`,ball.x-radius-7, ball.y-radius);
            ctx.closePath();
        }

        let userAvatar = ballMap[myId];
        
        if (rightPressed){
            curPlayer.x += playerSpeed;
        }
        if (leftPressed ){
            curPlayer.x -= playerSpeed;
        }
        if(upPressed ){
            curPlayer.y -= playerSpeed;
        }
        if(downPressed ){
            curPlayer.y += playerSpeed;
        }
        sendData();
    }

function update() {
    renderPlayer();
}

setInterval(update, 10);


