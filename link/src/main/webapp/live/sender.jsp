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

	  // �ڽ��� video, audio track�� ��� �ڽ��� RTCPeerConnection�� ����Ѵ�.
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

	  // �ڽ��� video, audio track�� ��� �ڽ��� RTCPeerConnection�� ����� �Ŀ� room�� �����ߴٰ� Signaling Server�� �˸���.
	  // �ֳ��ϸ� offer or answer�� �ְ���� ���� RTCSessionDescription�� �ش� video, audio track�� ���� ������ ��� �ֱ� ������ 
	  // ������ ���� ������ MediaStream�� ���� �� ����
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