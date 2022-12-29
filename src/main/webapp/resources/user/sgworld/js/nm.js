

$(document).ready(function(){
	await getMedia(camerasSelect.value);
})

let pcUser;
let pcUsers = [users[userIdx]];

const pcConfig = {
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
}

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
        stream = await navigator.mediaDevices.getUserMedia(
            //getUserMedia() 에 매개변수로 들어갈 contraints 조건문, deviceId가 cameraConstraints과 일치하면 해당 장치로 보여주게 하기 위함. 
            deviceId ? cameraConstraints : initialConstrains
        );
        //deviceId가 비어있으면 getCameras()메소드를 호출하여  deviceId를 가져옴. 
        if (!deviceId) {
        await getCameras();
        }
    } catch (e) {
        console.log(e);
    }
    
    return stream
}


/*
pcUser 접촉한 멤버들. 

pcUser = {
	infrMmSeq :udatepcUserList[q].infrMmSeq,
	infrMmNickname : udatepcUserList[q].infrMmNickname,
	pcUserColor :  udatepcUserList[q].pcUserColor,
	x :  udatepcUserList[q].x,
	y :  udatepcUserList[q].y,
	avatarSeq : udatepcUserList[q].avatarSeqx,
	userStatus : "normal",
	userStream : null
}
*/
/**
mesh에서는 RTCPeerConnection을 유저 수 만큼 연결한다.
 */
let peerConnection;

async function creatAllConnection(pcUsers){
	
	for(let i = 0 ; i < len ; i++){
		
		makeConnection(pcUsers[i])
		
		let pc = pcUsers[i]
		
		if(pc.userStream){
			let offer = await peerConnection.createOffer()
			peerConnection.setLocalDescription(offer)
			
			const offerMsg = {
				sdp : offer.sdp,
				pcUser : pcUser.infrMmSeq
			}
			//send offer
			stompClient.send("/app/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/offer/"+pcUser.infrMmSeq,{},JSON.stringify(offerMsg));
		}
	}
}

function makeConnection(pcUser){
	peerConnection = new RTCPeerConnection(pcConfig)
	
	if(pcUser.infrMmSeq == infrMmSeq){
		pcUser.userStream = myStream
	}
	 
	peerConnection.addEventListener("icecandidate", (data) =>{
		console.log("sent candidate");
	    //#webSocket
	    const iceMsg = {
			type : "offer",
			obj : data.candidate,
			pcUser : pcUser.infrMmSeq
		}
	    stompClient.send("/app/sgWorld/" +endPoint+"/avatarWSControll/WebRTC/ice/"+pcUser.infrMmSeq,{},JSON.stringify(iceMsg));
	});
	peerConnection.addEventListener("addstream", data =>{
		console.log("handleAddStream")
		console.log(data)
		if(data != null){
			pcUser.userStream = data.stream;
		}
	});
	
	pcUser.userStream.getTracks().forEach((track) => peerConnection.addTrack(track, pcUser.userStream));
}