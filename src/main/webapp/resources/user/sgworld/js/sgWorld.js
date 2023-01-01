$(window).on("beforeunload",function(){
	leaveAndDel()
	sendUsersNum(users.length)
	disconnect()
})


/**
 WebRTC Field
 */
 
let myFace;
let yourFace;
const muteBtn = document.getElementById('micOnOff');
const cameraBtn = document.getElementById("camOnOff");
const camerasSelect = document.getElementById("cameras");
const shareBtn = document.getElementById("sreenShare")
let myScreen;
let yourScreen;
let myDisplayStream;
let yourDisplayStream;
 
let myStream;
let yourStream;
let myPeerConnection;
let muted = false;
let cameraOff = false;
let myScreenShare = false;
let yourScreenShare = false;

// 사용자의 오디오,카메라 장치를 가져올 메소드 
async function getCameras() {
    try {
        //enumerateDevices()로 사용자의 장치 목록 정보들이 담긴 배열을 불러와 devices 변수에 할당. 
        const devices = await navigator.mediaDevices.enumerateDevices();
        //filter메소드를 사용하여 devices 배열에서 kind(key) === "videoinput"(value)인 조건의 데이터(카메라 장치 목록)를 cameras에 담음. 
        const cameras = devices.filter((device) => device.kind === "videoinput");
        //카메라 장치 목록들 중 첫번째 장치의 Stream을 currentCamera에 할당. 
        const currentCamera = myStream.getVideoTracks()[0];
        //enumerateDevices() 로 가져온 내 비디오장치 목록을을 forEach 반복문으로 돌림.
        cameras.forEach((camera) => {
            //option은 camerasSelect의 select DOM 요소의 option DOM 
            const option = document.createElement("option");
            //option value 값은 장치의 id
            option.value = camera.deviceId;
            //option의 텍스트는 장치의 label
            option.innerText = camera.label;
            //장치 목록들 중 현재 출력되고 있는 Stream 장치의 label과 일치하면 select true
            if (currentCamera.label === camera.label) {
                option.selected = true;
            }
            //select 내부에 카메라 장치들을 append 해줌. 
            camerasSelect.appendChild(option);
        });
    } catch (e) {
        console.log(e);
    }
}


	
//getUserMedia()로 본인의 카메라 장치의 Steam을 불러옴. 
async function getMedia(deviceId) {
    //초기 contraints
    const initialConstrains = {
        audio: true,
        video: { facingMode: "user" },
    };
    /**
     * getCameras() 불러온 장치의 contraints, 만약 카메라 장치가 여러개일 경우 해당 카메라 장치로 전환할 수 있도록 하기 위함.
    */
    const cameraConstraints = {
        audio: true,
        video: { deviceId: { exact: deviceId } },
    };

    try {
        //getUserMedia() 메소드로 Stream을 myStream변수에 할당. 
        myStream = await navigator.mediaDevices.getUserMedia(
            //getUserMedia() 에 매개변수로 들어갈 contraints 조건문, deviceId가 cameraConstraints과 일치하면 해당 장치로 보여주게 하기 위함. 
            deviceId ? cameraConstraints : initialConstrains
        );
        
        // video Dom 요소인 myFace에 srcObject() 메소드를 사용하여 myStream(선택된 장치의 Stream)을 할당. 
        myFace.srcObject = myStream;
            //deviceId가 비어있으면 getCameras()메소드를 호출하여  deviceId를 가져옴. 
        if (!deviceId) {
        await getCameras();
        }
    } catch (e) {
        console.log(e);
    }
    
    return true
}

//getDisplayMedia() 메소드로 화면공유기능 구현
async function getDisplayMedia(){
    try{
        //getDisplayMedia의 contraints
        const options = {audio: true, video: true};
        //화면공유 Stream을 mydisPlayStream에 할당. 
        myDisplayStream = await navigator.mediaDevices.getDisplayMedia(options);
        console.log("displayMedia :: " + myDisplayStream);
        //video DOM 요소에 srcObject메소드를 사용하여 화면공유 Stream을 할당. 
        myScreen = document.getElementById('myScreen');
        myScreen.srcObject = myDisplayStream;

        const videoTrack = myDisplayStream.getVideoTracks()[0]

        console.info("Track settings:");
        console.info(JSON.stringify(videoTrack.getSettings(), null, 2));
        console.info("Track constraints:");
        console.info(JSON.stringify(videoTrack.getConstraints(), null, 2));
    }catch(e){
        console.log(e)
    }
}

/**
 sgworld Field
 */
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
	var socket = new SockJS('/gangnam/sgWorldService');
	stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        
        
        //listenOffer
		stompClient.subscribe("/topic/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/offer/"+infrMmSeq,function (listenOffer) {
			const offerFromServer = JSON.parse(listenOffer.body)
			var receive = offerFromServer.to
			console.log("recieved Offer from :: " + users[userIdx].infrMmSeq + " me ::" + receive)
				console.log("recieved Offer")
				console.log(offerFromServer)
				const receivedoffer = offerFromServer.obj
				receiveAnswer(receivedoffer);
		});
        //listenAnswer
		stompClient.subscribe("/topic/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/answer/"+infrMmSeq,function (listenAnswer) {
		   	const answerFromServer = JSON.parse(listenAnswer.body)
		   	receivedAnswer = answerFromServer.obj
		   	console.log("received answer :: ")
		   	console.log(receivedAnswer)
		   	remoteDescription(receivedAnswer)
		});
		//listenIceCandidate
		stompClient.subscribe("/topic/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/ice",function (iceCandidate) {
			const iceFromServer = JSON.parse(iceCandidate.body);
			console.log("received candidate")
			console.log(iceFromServer.obj)
			myPeerConnection.addIceCandidate(iceFromServer.obj)
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
	
	location.href="/gangnam/"
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
			if(contact){
				const f = anotherUsers.find((elem) => elem == users[e].infrMmSeq)
				if(f != undefined){
					
				}else{
					console.log("nope go push")
					anotherUsers.push(users[e].infrMmSeq)
				}
			}
			
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
let anotherUsers = [infrMmSeq];
let bool = false;

async function showCamDiv(e){
	console.log("showCamDivEnvet :: "+e)
	if(e != bool){
		bool = e;
		console.log("값이 바뀜")
		if(e){
			console.log('showCamDivOn')
			appendCam()
			const myFace = document.getElementById('myFace')
			await initCall()
		}else{
			$('.littleCamDiv').remove()
			console.log('showCamDivOff')
			RTCdisconnection()
			//myPeerConnection.close()
		}	
	}else{
		console.log("중복 할당 방지")
	}
}


function appendCam(){
	html =""
	html += '<div class="littleCamDiv">'
	html += '<div class="cam myCam" onclick="openFullCam()">'
	html += '<video id="myFace" autoplay playsinline width="200" height="160"></video>'
	html += '</div></div>'
	
	
	html2 =""
	html2 += '<div class="littleCamDiv">'
	html2 += '<div class="cam yourCam" onclick="openFullCam()">'
	html2 += '<video id="yourFace" autoplay playsinline width="200" height="150"></video>'
	html2 += '</div></div>'
	
	$('#myCamDiv').append(html)
	$('#yourCamDiv').append(html2)
	myFace = document.getElementById('myFace')
	yourFace = document.getElementById('yourFace')
}


/***
@@@@@@ RTC PeerConnection
 */
function RTCdisconnection(){
	$('#cameras option').remove()
	myStream.getTracks().forEach(function(track) {
  		track.stop();
	});
	yourStream.getTracks().forEach(function(track) {
  		track.stop();
	});
	myDisplayStream.getTracks().forEach(function(track) {
  		track.stop();
	});
}


// 음소거 버튼 Controll 이벤트 
function handleMuteClick(){
	 // 동시에 음소거를 ui로 보여줄 수 있는 DOM 요소도 컨트롤
	let muteBtn = document.getElementById('micOnOff')
    if(!muted){
        muteBtn.innerHTML = "<i class='fa-solid fa-microphone-lines onOffMic' style='color:#4d9d85'></i>";
        muted = true;
    }else{
        muteBtn.innerHTML = "<i class='fa-solid fa-microphone-lines-slash onOffMic' style='color:#ac3b49'></i>";
        muted = false;
    }
    //Stream이 담겨진 myStream에서 getAudioTracks()에서 forEach(track)으로 접근하여 track의 enable 요소를 컨트롤 
    myStream
        .getAudioTracks()
        .forEach((track) => (track.enabled = !track.enabled))
        /**
         * track.enabled 에 새로운 value를 설정해주는 것
         * track.enabled이 true면 false로 설정해주고 false면 그 반대로 true로 설정해줌. 
         */
   
}

// 카메라 버튼 Controll
function handleCameraClick(){
	let cameraBtn = document.getElementById('camOnOff')
	
	if(!cameraOff){
        cameraBtn.innerHTML='<i class="fa-solid fa-video onOffCam" style="color:#4d9d85"></i>'
        cameraOff = true;
    }else{
        cameraBtn.innerHTML='<i class="fa-solid fa-video-slash onOffCam" style="color:#ac3b49"></i>'
        cameraOff = false;
    }
    //Stream이 담겨진 myStream에서 getVideoTracks()에서 forEach(track)으로 접근하여 track의 enable 요소를 컨트롤 
    myStream.getVideoTracks().forEach((track) => (track.enabled = !track.enabled))
    // 동시에 카메라 onOff를 ui로 보여줄 수 있는 DOM 요소도 컨트롤
    
}


function handleScreenShareClick(){
	var html = ""
	
	html += '<div id="myScreenDiv" class="littleCamDiv">'
	html += '<div class="cam myScreen" onclick="receiveAnswer()">'
	html += '<video id="myScreen" autoplay playsinline width="200" height="150"></video>'
	html +=	'</div></div>'
	
	if(!myScreenShare){
		myScreenShare = true;
		$('#myCamDiv').after(html)
		getDisplayMedia()
		//myDisplayStream.getTracks().forEach((track) => myPeerConnection.addTrack(track, myDisplayStream));
	}else{
		myDisplayStream.getTracks().forEach(function(track) {
  			track.stop();
		});
		myScreenShare = false;
		$('#myScreenDiv').remove()
	}
}

async function handleCameraChange() {
    //getMedia() 메소드로 현재 선택된 카메라 장치의 deviceId를 매게변수로 실행함. 
    await getMedia(camerasSelect.value);
    /**
     * myPeerConnection(new RTCPeerConnection()) 객체가 null이 아니면 조건문을 실행.
     * 아래 조건문은 연결된 상대방의 peer에도 내 브라우저에서 변경된 Stream을 전달하기 위함. 
    */
    if (myPeerConnection) {
        //videoTrack은 현재 변경하고 적용된 Track;
        const videoTrack = myStream.getVideoTracks()[0];
        
        /**
         * RTCPeerConnection()에서 제공하는 getSenders()를 콘손에 띄우면 RTCRtpSender객체를 배열형식으로 가져오는데 
         * find()메소드를 사용하여 sender.track.kind 가 "video" 인 데이터를 가져와서 videoSender에 할당함. 
         */
        const videoSender = myPeerConnection
            .getSenders()
            .find((sender) => sender.track.kind === "video");
        
        //replaceTrack으로 상대방의 peer에 변경된 Stream의 videoTrack을 전달함. 
        videoSender.replaceTrack(videoTrack);
    }
}

//음소거 이벤트
muteBtn.addEventListener("click",handleMuteClick);
//camera ofOff 이벤트
cameraBtn.addEventListener("click",handleCameraClick);
//videoTrack 변경 이벤트
camerasSelect.addEventListener("input",handleCameraChange);
//화면 공유 이벤트
shareBtn.addEventListener("click", handleScreenShareClick);
		
			
		
function contactListener(){
	console.log("users got contact")
	msg = {
		user:users[userIdx],
		msg:"contacted"
	}
	stompClient.send("/app/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/contactListener",{},JSON.stringify(msg));
}
async function initCall(){
	await getMedia()
	setTimeout(()=>{
		makeConnection()
		if(userIdx < anotherUser){
			localDescription()
		}
	},1500)
}
function makeConnection(){
	console.log("makeConnection")
	myPeerConnection = new RTCPeerConnection();
    myPeerConnection = new RTCPeerConnection({
    iceServers: [
            {
            urls: [
                "stun:stun.l.google.com:19302",
                "stun:stun1.l.google.com:19302",
                "stun:stun2.l.google.com:19302",
                "stun:stun3.l.google.com:19302",
                "stun:stun4.l.google.com:19302",
            ],
            },
        ],
    });
    myPeerConnection.addEventListener("icecandidate", handleIce);
    myPeerConnection.addEventListener("addstream", handleAddStream);
    console.log(myStream)
    myStream.getTracks().forEach((track) => myPeerConnection.addTrack(track, myStream));
}

function handleIce(data) {
    console.log("sent candidate");
    //#webSocket
    const iceMsg = {
		type : "offer",
		obj : data.candidate,
		from : users[userIdx].infrMmSeq, // me
		to : users[anotherUser].infrMmSeq // 상대방
	}
    stompClient.send("/app/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/ice",{},JSON.stringify(iceMsg));
}
function handleAddStream(data) {
	console.log("handleAddStream")
	console.log(data)
	if(data != null){
		yourStream = data.stream;
	}
	const yourFace = document.getElementById("yourFace");
	yourFace.srcObject = yourStream;
}

async function localDescription(){
    const offer = await myPeerConnection.createOffer();
    
    myPeerConnection.setLocalDescription(offer);
    
    const offerMsg = {
		type : "offer",
		obj : offer,
		from : users[userIdx].infrMmSeq, // me
		to : users[anotherUser].infrMmSeq // 상대방
	}
	
	console.log(offerMsg.obj);
	stompClient.send("/app/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/offer/"+offerMsg.to,{},JSON.stringify(offerMsg));
	console.log("sent the offer");
}

async function receiveAnswer(receivedoffer){
	myPeerConnection.setRemoteDescription(receivedoffer);
	
	const answer = await myPeerConnection.createAnswer();
	const answerMsg = {
		type : "answer",
		obj : answer,
		from : users[userIdx].infrMmSeq, // me
		to : users[anotherUser].infrMmSeq // 상대방
	}
	myPeerConnection.setLocalDescription(answer);
	console.log(answerMsg.obj);
	stompClient.send("/app/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/answer/"+answerMsg.to,{},JSON.stringify(answerMsg));
	console.log("sent the answer");
}

function remoteDescription(receivedAnswer){
	myPeerConnection.setRemoteDescription(receivedAnswer)
	console.log("setRemoteDescription");
}
		
		

function openFullCam(){
	
	$('#fullCamDiv').show();
	
	let yourFullFace = document.getElementById('yourFullFace');
	let myFullFace = document.getElementById('myFullFace');
	
	myFullFace.srcObject = myStream
	yourFullFace.srcObject = yourStream
	
	myFace.srcObject = null
	yourFace.srcObject = null
	
	
	
	
	
}
function fullCamDivOff(){
	$('#fullCamDiv').hide();
	
	let yourFullFace = document.getElementById('yourFullFace');
	let myFullFace = document.getElementById('myFullFace');
	
	myFace.srcObject = myStream
	yourFace.srcObject = yourStream
	
	yourFullFace.srcObject = null
	myFullFace.srcObject = null
	
	
	
	
}


function whosCam(){
	console.log(myFullFace)
	console.log(yourFullFace)
}