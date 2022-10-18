<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">

var constraints = { audio: true, video: { width: 1280, height: 720 } };

const openMediaDevices = async(constraints) =>{
	
	return await navigator.mediaDevices.getUserMedia(constraints);
}

try{
	const stream = openMediaDevices({'video' : true, 'audio' : true});
	console.log('Got MediaStream : '+stream);
} catch (e) {
	console.error('Error accessing media devices.',e);
}
/*
async function getConnectedDevices(type){
	const devices = await navigator.mediaDevices.enumerateDevices();
	return devices.filter(device => device.kind === type)
}
const videoCameras = getConnectedDevices('videoinput');
console.log('Cameras found : ', videoCameras);
*/

function updateCameraList(cameras) {
	const listElement = document.querySelector('select#availableCameras');
	listElement.innerHTML = '';
	cameras.map(camera => {
		const cameraOption = document.createElement('option');
		cameraOption.label = camera.label;
		cameraOption.value = camera.deviceId;
	}).forEach(cameraOption => listElement.add(cameraOption));
}

async function getConnectedDevices(type) {
	const devices = await navigator.mediaDevices.enumerateDevices();
	return devices.filter(device => device.kind ===type)
}

const videoCameras = getConnectedDevices('videoinput');
updateCameraList(videoCameras);

navigator.mediaDevices.addEventListener('devicechange', event => {
	const newCameraList = getConnectedDevices('video');
	updateCameraList(newCameraList);
});

async function playVideoFromCamera() {
	try{
		const constraints = {'video' : true, 'audio': true};
		const stream = await navigator.mediaDevices.getUserMedia(constraints);
		const videoElement = document.querySelector('video#localVideo');
		videoElement.srcObject = stream;
	} catch(error){
		console.error('Error opening video cameara.', error);
	}
}

const signalingChannel = new SignalingChannel(remoteClientId);
signalingChannel.addEventListener('message', message => {
});

signalingChannel.send('Hello!');

async function makeCall() {
	const congiguration = {'iceServers' : [{'urls': 'stun:stun.l.google.com:19302'}]}
	const peerConnection = new RTCPeerConnection(congiguration);
	signalingChannel.addEventListener('message', async message =>{
		if(message.answer){
			const remoteDesc = new RTCSessionDescription(message.answer);
			await peerConnecttion.setRemoteDescripttion(remoteDesc);
		}
	});
	const offer = await peerConnection.createOffer();
	await peerConnection.setLocalDescription(offer);
	signalingChannel.send({'ofer': offer});
}

peerConnection.addEventListener('icecandidate', event => {
    if (event.candidate) {
        signalingChannel.send({'new-ice-candidate': event.candidate});
    }
});

// Listen for remote ICE candidates and add them to the local RTCPeerConnection
signalingChannel.addEventListener('message', async message => {
    if (message.iceCandidate) {
        try {
            await peerConnection.addIceCandidate(message.iceCandidate);
        } catch (e) {
            console.error('Error adding received ice candidate', e);
        }
    }
});

peerConnection.addEventListener('connectionstatechange', event => {
    if (peerConnection.connectionState === 'connected') {
        // Peers connected!
    }
});

const localStream = await getUserMedia({vide: true, audio: true});
const peerConnection = new RTCPeerConnection(iceConfig);
localStream.getTracks().forEach(track => {
    peerConnection.addTrack(track, localStream);
});
</script>
</body>
</html>