/**
 * 소켓 연결을 하기위한 socket.it 생성.
 * 만약 socket.io 환경이 아닌 다른 웹소켓 환경에서 사용한다면
 * #websocket 부분만 수정해서 서버와 통신하면 됨. 
 */
 
 
/**@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 * @@@@@ 컨트롤 할 Dom 요소들 start
 * @@@@@ 사용하고자 할 환경에 맞게 수정. 
 * @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 */

//video DOM 요소, video, checked
const myFace = document.getElementById("myFace");
//음소거 DOM 요소, button, checked
const muteBtn = document.getElementById("micOnOff");
//카메라 onOff DOM 요소, button, checked
const cameraBtn = document.getElementById("camOnOff");
//카메라 장치 선택 DOM 요소, select, checked
const camerasSelect = document.getElementById("cameras")
//화면공유 DOM 요소, buttom, checked
const shareBtn = document.getElementById("sreenShare")
//화면공유 화면을 담을 DOM 요소, video
const display = document.getElementById('myScreen');
const yourDisplay = document.getElementById('yourScreen');
const camDiv = document.getElementById("camDiv");
const myCamDiv = document.getElementById("myCamDiv");
const yourCamDiv = document.getElementById("yourCamDiv");

/**@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 * @@@@@ 컨트롤 할 Dom 요소들 end
 * @@@@@ 사용하고자 할 환경에 맞게 수정. 
 * @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 */


//Stream은 비디오와 오디오가 합쳐진것을 말한다. 
let myStream;
//디스플레이 화면 공유할 Stream 객체를 담을 변수. 
let mydisPlayStream;
//음소거 컨트롤 boolean
let muted = false;
//카메라 컨트롤 boolean
let cameraOff = false;
let myScreenShare = false;
let yourScreenShare = false;
//방이름을 담을 변수
let roomName;
//P2P 객체를 담을 변수
let myPeerConnection;
//P2P DataChannel 객체를 담을 변수 
let myDataChannel;


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


//getDisplayMedia() 메소드로 화면공유기능 구현
async function getDisplayMedia(){
    try{
        //getDisplayMedia의 contraints
        const options = {audio: true, video: true};
        //화면공유 Stream을 mydisPlayStream에 할당. 
        mydisPlayStream = await navigator.mediaDevices.getDisplayMedia(options);
        console.log("displayMedia :: " + mydisPlayStream);
        //video DOM 요소에 srcObject메소드를 사용하여 화면공유 Stream을 할당. 
        display.srcObject = mydisPlayStream;

        const videoTrack = mydisPlayStream.getVideoTracks()[0]

        console.info("Track settings:");
        console.info(JSON.stringify(videoTrack.getSettings(), null, 2));
        console.info("Track constraints:");
        console.info(JSON.stringify(videoTrack.getConstraints(), null, 2));
    }catch(e){
        console.log(e)
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
}



// 음소거 버튼 Controll 이벤트 
function handleMuteClick(){
    //Stream이 담겨진 myStream에서 getAudioTracks()에서 forEach(track)으로 접근하여 track의 enable 요소를 컨트롤 
    myStream
        .getAudioTracks()
        .forEach((track) => (track.enabled = !track.enabled))
        /**
         * track.enabled 에 새로운 value를 설정해주는 것
         * track.enabled이 true면 false로 설정해주고 false면 그 반대로 true로 설정해줌. 
         */
    // 동시에 음소거를 ui로 보여줄 수 있는 DOM 요소도 컨트롤
    if(!muted){
        muteBtn.innerHtml = '<i class="fa-solid fa-microphone-lines onOffMic" style="color:#4d9d85"></i>';
        muted = true;
    }else{
        muteBtn.innerHtml ='<i class="fa-solid fa-microphone-lines-slash onOffMic" style="color:#ac3b49"></i>';
        muted = false;
    }
}

// 카메라 버튼 Controll
function handleCameraClick(){
    //Stream이 담겨진 myStream에서 getVideoTracks()에서 forEach(track)으로 접근하여 track의 enable 요소를 컨트롤 
    myStream
        .getVideoTracks()
        .forEach((track) => (track.enabled = !track.enabled))
    // 동시에 카메라 onOff를 ui로 보여줄 수 있는 DOM 요소도 컨트롤
    if(!cameraOff){
        cameraBtn.innerHtml='<i class="fa-solid fa-video onOffCam" style="color:#4d9d85"></i>'
        cameraOff = true;
    }else{
        cameraBtn.innerHtml='<i class="fa-solid fa-video-slash onOffCam" style="color:#ac3b49"></i>'
        cameraOff = false;
    }
}

function disAbleStream(){
	myStream
    .getVideoTracks()
    .forEach((track) => (track.enabled = false))
    myStream
    .getAudioTracks()
    .forEach((track) => (track.enabled = false))
}

function handleScreenShareClick(){
	var html = ""
	html += '<div id ="myScreen" class="littleCamDiv cam myScreen" onclick="whosCam(this)">'
	html += '<video id="yourScreen" autoplay playsinline width="200" height="160"></video>'
	html += '</div>'
	
	if(!myScreenShare){
		myScreenShare = true;
		$('#myCamDiv').append($(html).fadeIn())
	}else{
		myScreenShare = false;
		$('#myScreen').remove()
	}
	 
}

// 변경한 카메라 장치의 Stream을 컨트롤하는 메소드. 
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


//방에 입장하면 실행될 메소드
async function initCall() {
    //getMedia() 메소드 실행, 유저의 카메라 장치 가져옴. 
    await getMedia();
    //makeConnection() 실행, P2P 연결시도. 
    
    makeConnection();
    
}

/**
 * @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 * @@@@@ Server와 통신하는 socket 메소드들 start
 * @@@@@ #webSocket 사용하고자 할 환경에 맞게 수정.
 * @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
*/
function contactListener(){
	console.log("users got contact")
	stompClient.send("/app/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/contactListener",{},"contacted");
}
//참가자의 브라우저에서 실행되는 메소드
async function sendOffer(){ // welcome으로 워딩된 소켓 서버를 구독하는 메소드 
    //p2p 연결상의 dataChannel을 만드는 메소드, 간단한 text를 보낼수 있음. 
    myDataChannel = myPeerConnection.createDataChannel("chat");
    myDataChannel.addEventListener("message", (event) => console.log(event.data));
    console.log("made data channel");
    //p2p 연결을 위한 offer을 만드는 메소드. 
    const offer = await myPeerConnection.createOffer();
    //본인의 브라우저의 LocalDescription을 정의
    myPeerConnection.setLocalDescription(offer);
    console.log("sent the offer");
    // 소켓서버에 본인 브라우저의 offer를 보냄. (signalling)
    stompClient.send("/app/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/offer",{},JSON.stringify(offer));
}

//주최자의 브라우저에서 실행되는 메소드.
async function sendAnswer(offer){ // offer으로 워딩된 소켓 서버를 구독하는 메소드. 발신자의 offer을 수신함. 
    // dataChannel에소 수신받기 위한 이벤트 등록. 
    myPeerConnection.addEventListener("datachannel",(event)=>{
        myDataChannel = event.channel;
        myDataChannel.addEventListener("message",(event) => console.log(event.data));
    });
    console.log("received the offer");
    //offer를 발신한 발신자의 정보를 setRemoteDescription에서 정의함. 
    myPeerConnection.setRemoteDescription(offer);
    //offer를 정의하고 answer을 정의 
    const answer = await myPeerConnection.createAnswer();
    //현재 브라우저의 LocalDescription을 정의 (answer)
    myPeerConnection.setLocalDescription(answer);
    //소켓으로 offer을 발신한 상대방에게 정의한 본인의 localDescription을 answer로 전달. 
    console.log("sent the answer");
    stompClient.send("/app/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/answer",{},JSON.stringify(answer));
}

////listenAnswer
//stompClient.subscribe("/topic/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/answer",function (listenAnswer) {
//    const answer = JSON.parse(listenAnswer)
//    console.log("received the answer");
//    myPeerConnection.setRemoteDescription(answer);
//});
////listenIceCandidate
//stompClient.subscribe("/topic/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/ice",function (iceCandidate) {
//	const ice = JSON.parse(iceCandidate)
//    console.log("received the answer");
//    myPeerConnection.setRemoteDescription(ice);
//});
//
/**
 * @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 * @@@@@ Server와 통신하는 socket 메소드들 end
 * @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
*/

//WebRTC 연결을 실행하는 메소드
function makeConnection() {
    myPeerConnection = new RTCPeerConnection();
    //임시 STUN Server를 만들어줌. 
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
    /**
     * makeConnection() 메소드가 실행이 되면 handleIce() 메소드와 handleAddStream() 실행이 됨
     * handleIce()메소드는 소켓서버에 iceCandidate를 p2p 연결을 시도하려는 상대방에게 보냄.
     * handleAddStream() 메소드는 상대방으로부터 받은 Stream을 데이터를 본인의 브라우저 상대방 카메라 화면에 띄워줌.
    */
    myPeerConnection.addEventListener("icecandidate", handleIce);
    
    myPeerConnection.addEventListener("addstream", handleAddStream);
    myStream
        .getTracks()
        .forEach((track) => myPeerConnection.addTrack(track, myStream));
        
//    myPeerConnection.addEventListener("addstream", handleAddStreamSreenShare);
//    
//    myStream
//	    .getTracks()
//	    .forEach((track) => myPeerConnection.addTrack(track, display));
}

function handleIce(data) {
    console.log("sent candidate");
    //#webSocket
    stompClient.send("/app/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/ice",{},JSON.stringify(data.candidate));
}
function handleAddStream(data) {
    const peerFace = document.getElementById("peerFace");
    peerFace.srcObject = data.stream;
}
function handleAddStreamSreenShare(data){
	const yourDisplay = document.getElementById("yourDisplay");
	yourDisplay.srcObject = data.stream
}