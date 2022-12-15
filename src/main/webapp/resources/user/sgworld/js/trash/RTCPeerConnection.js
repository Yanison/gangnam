let offer;
let answer;


function localDiscription(){
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
    
    offer = await myPeerConnection.createOffer();
    myPeerConnection.setLocalDescription(offer);
}

function sendOffer(){
	const offerMsg = {
		type : "offer",
		obj : offer
	}
	console.log(offerMsg.obj);
	stompClient.send("/app/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/offer",{},JSON.stringify(offerMsg));
	console.log("sent the offer");
}

function receiveAnswer(){
	myPeerConnection.setRemoteDescription(offer);
	answer = await myPeerConnection.createAnswer();
	const answerMsg = {
		type : "answer",
		obj : answer
	}
	console.log(answerMsg.obj);
	stompClient.send("/app/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/answer",{},JSON.stringify(answerMsg));
	console.log("sent the answer");
}

function remoteDescription(asnwer){
	myPeerConnection.setRemoteDescription(asnwer)
	generateCandidate()
}

function handleIce(data) {
    console.log("sent candidate");
    //#webSocket
    stompClient.send("/app/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/ice",{},JSON.stringify(data.candidate));
}
function handleAddStream(data) {
	const yourFace = document.getElementById("yourFace");
	yourFace.srcObject = data.stream;
    
	myStream
		.getTracks()
		.forEach((track) => myPeerConnection.addTrack(track, myStream));
}