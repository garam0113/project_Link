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

let newSocket = io.connect('http://localhost:8080');
let newPC = new RTCPeerConnection(pc_config);

newSocket.on('all_users', (allUsers: Array<{id: string, email: string}>) => {
  let len = allUsers.length;   
  if (len > 0) {
    createOffer();
  }
});
  
newSocket.on('getOffer', (sdp: RTCSessionDescription) => {
  //console.log(sdp);
  console.log('get offer');
  createAnswer(sdp);
});
  
newSocket.on('getAnswer', (sdp: RTCSessionDescription) => {
  console.log('get answer');
  newPC.setRemoteDescription(new RTCSessionDescription(sdp));
  //console.log(sdp);
});
  
newSocket.on('getCandidate', (candidate: RTCIceCandidateInit) => {
  newPC.addIceCandidate(new RTCIceCandidate(candidate)).then(() => {
    console.log('candidate add success');
  })
});

setSocket(newSocket);
setPc(newPC);

const [pc, setPc] = useState<RTCPeerConnection>();
const [socket, setSocket] = useState<SocketIOClient.Socket>();
  
let remoteVideoRef = useRef<HTMLVideoElement>(null);
  
const pc_config = {
  "iceServers": [
    // {
    //   urls: 'stun:[STUN_IP]:[PORT]',
    //   'credentials': '[YOR CREDENTIALS]',
    //   'username': '[USERNAME]'
    // },
    {
      urls : 'stun:stun.l.google.com:19302'
    }
  ]
}

</script>
</body>
</html>