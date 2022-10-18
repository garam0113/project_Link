<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script src=""></script>
	<script type="text/javascript">
navigator.mediaDevices.getUserMedia({
	  video: true,
	  audio: true
	}).then(stream => {
	  if (localVideoRef.current) localVideoRef.current.srcObject = stream;

	  // 자신의 video, audio track을 모두 자신의 RTCPeerConnection에 등록한다.
	  stream.getTracks().forEach(track => {
	    newPC.addTrack(track, stream);
	  })
	  newPC.onicecandidate = (e) => {
	    if (e.candidate) {
	      console.log('onicecandidate');
	      newSocket.emit('candidate', e.candidate);
	    }
	  }
	  newPC.oniceconnectionstatechange = (e) => {
	    console.log(e);
	  }
	      
	  newPC.ontrack = (ev) => {
	    console.log('add remotetrack success');
	    if(remoteVideoRef.current) remoteVideoRef.current.srcObject = ev.streams[0];
	  } 

	  // 자신의 video, audio track을 모두 자신의 RTCPeerConnection에 등록한 후에 room에 접속했다고 Signaling Server에 알린다.
	  // 왜냐하면 offer or answer을 주고받을 때의 RTCSessionDescription에 해당 video, audio track에 대한 정보가 담겨 있기 때문에 
	  // 순서를 어기면 상대방의 MediaStream을 받을 수 없음
	  newSocket.emit('join_room', {room: '1234', email: 'sample@naver.com'});
	      
	}).catch(error => {
	  console.log(`getUserMedia error: ${error}`);
	});
	
const createOffer = () => {
  console.log('create offer');
  newPC.createOffer({offerToReceiveAudio: true, offerToReceiveVideo: true})
    .then(sdp => {
      newPC.setLocalDescription(new RTCSessionDescription(sdp));
      newSocket.emit('offer', sdp);
    })
    .catch(error => {
      console.log(error);
    })
}

const createAnswer = (sdp: RTCSessionDescription) => {
	  newPC.setRemoteDescription(new RTCSessionDescription(sdp)).then(() => {
	    console.log('answer set remote description success');
	    newPC.createAnswer({offerToReceiveVideo: true, offerToReceiveAudio: true})
	      .then(sdp1 => {
	            
	         console.log('create answer');
	         newPC.setLocalDescription(new RTCSessionDescription(sdp1));
	         newSocket.emit('answer', sdp1);
	      })
	      .catch(error => {
	         console.log(error);
	      });
	    });
	      
	}

return (
		  <div>
		      <video
		        style={{
		          width: 240,
		          height: 240,
		          margin: 5,
		          backgroundColor: 'black'
		        }}
		        muted
		        ref={ localVideoRef }
		        autoPlay>
		      </video>
		      <video
		        id='remotevideo'
		        style={{
		          width: 240,
		          height: 240,
		          margin: 5,
		          backgroundColor: 'black'
		        }}
		        ref={ remoteVideoRef }
		        autoPlay>
		      </video>
		    </div>
		);
</script>


</body>
</html>