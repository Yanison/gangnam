//const socket = io();
const myFace = document.getElementById('myFace')

//Stream은 비디오와 오디오가 합쳐진것을 말한다. 
let myStream;
let muted = false;
let cameraOff = false;

async function getMedia(){
	try{
		myStream = await navigator.mediaDevices.getUserMedia({
            audio:true,
            video:true,
        });
		myFace.srcObject = myStream;
        console.log("####################### " + JSON.stringify(myStream))
	}catch(e){
	 	console.log(e);
	}
}

// 음소거 버튼 Controll

function fullCamDiv(){
	$('#fullCamDiv').fadeIn("fast")
}
function fullCamDivOff(){
	$('#fullCamDiv').fadeOut("fast")
}
function whosCam(e){
	console.log("whosCam :: "+$(e).val())
}

function onoff(e){
	var option = $(e).attr("id")
	
	switch(option){
		case "micOff":
			myStream
		        .getAudioTracks()
		        .forEach((track) => (track.enabled = !track.enabled))
		    muted = false;
			console.log("micOff")
			$('.onOffMic').css("color","#fff")
			$('#'+option).css("color","#ac3b49")
			break;
		case "micOn":
			myStream
		        .getAudioTracks()
		        .forEach((track) => (track.enabled = !track.enabled))
			console.log("micOn")
			muted = true;
			$('.onOffMic').css("color","#fff")
			$('#'+option).css("color","#4d9d85")
			break;
		case "camOff":
			myStream
		        .getVideoTracks()
		        .forEach((track) => (track.enabled = !track.enabled))
			console.log("camOff")
			cameraOff = false;
			$('.onOffCam').css("color","#fff")
			$('#'+option).css("color","#ac3b49")
			break;
		case "camOn":
			myStream
		        .getVideoTracks()
		        .forEach((track) => (track.enabled = !track.enabled))
			console.log("camOn")
			cameraOff = true;
			$('.onOffCam').css("color","#fff")
			$('#'+option).css("color","#4d9d85")
			break;
	}
}