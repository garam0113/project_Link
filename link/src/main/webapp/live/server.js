var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
 
io.on('connection', socket => {
    // 1:1 에서는 이런 식으로 구현하지 않아도 되지만 글쓴이는 1:N을 먼저 구현해서 이 형태로 남겨뒀습니다.
    // email 부분은 무시하셔도 무방합니다.
    socket.on('join_room', data => {
        // user[room]에는 room에 있는 사용자들이 배열 형태로 저장된다.
        // room이 존재한다면
        if (users[data.room]) {
            const length = users[data.room].length;
            // 최대 인원을 충족시켰으면 더 이상 접속 불가
            if (length === maximum) {
                socket.to(socket.id).emit('room_full');
                return;
            }
            // 인원이 최대 인원보다 적으면 접속 가능
            users[data.room].push({id: socket.id, email: data.email});
        } else { // room이 존재하지 않는다면 새로 생성
            users[data.room] = [{id: socket.id, email: data.email}];
        }
        // 해당 소켓이 어느 room에 속해있는 지 알기 위해 저장
        socketToRoom[socket.id] = data.room;
      
        socket.join(data.room);
        console.log(`[${socketToRoom[socket.id]}]: ${socket.id} enter`);

        // 본인을 제외한 같은 room의 user array
        const usersInThisRoom = users[data.room].filter(user => user.id !== socket.id);

        console.log(usersInThisRoom);

        // 본인에게 해당 user array를 전송
        // 새로 접속하는 user가 이미 방에 있는 user들에게 offer(signal)를 보내기 위해
        io.sockets.to(socket.id).emit('all_users', usersInThisRoom);
    });

    // 다른 user들에게 offer를 보냄 (자신의 RTCSessionDescription)
    socket.on('offer', sdp => {
        console.log('offer: ' + socket.id);
        // room에는 두 명 밖에 없으므로 broadcast 사용해서 전달
        // 여러 명 있는 처리는 다음 포스트 1:N에서...
        socket.broadcast.emit('getOffer', sdp);
    });

    // offer를 보낸 user에게 answer을 보냄 (자신의 RTCSessionDescription)
    socket.on('answer', sdp => {
        console.log('answer: ' + socket.id);
        // room에는 두 명 밖에 없으므로 broadcast 사용해서 전달
        // 여러 명 있는 처리는 다음 포스트 1:N에서...
        socket.broadcast.emit('getAnswer', sdp);
    });

    // 자신의 ICECandidate 정보를 signal(offer 또는 answer)을 주고 받은 상대에게 전달
    socket.on('candidate', candidate => {
        console.log('candidate: ' + socket.id);
        // room에는 두 명 밖에 없으므로 broadcast 사용해서 전달
        // 여러 명 있는 처리는 다음 포스트 1:N에서...
        socket.broadcast.emit('getCandidate', candidate);
    })

    // user가 연결이 끊겼을 때 처리
    socket.on('disconnect', () => {
        console.log(`[${socketToRoom[socket.id]}]: ${socket.id} exit`);
        // disconnect한 user가 포함된 roomID
        const roomID = socketToRoom[socket.id];
        // room에 포함된 유저
        let room = users[roomID];
        // room이 존재한다면(user들이 포함된)
        if (room) {
            // disconnect user를 제외
            room = room.filter(user => user.id !== socket.id);
            users[roomID] = room;
        }
        // 어떤 user가 나갔는 지 room의 다른 user들에게 통보
        socket.broadcast.to(room).emit('user_exit', {id: socket.id});
        console.log(users);
    })
});

http.listen(4000, function(){
  console.log('listening on *:4000');
});

const [pc, setPc] = useState<RTCPeerConnection>();
const [socket, setSocket] = useState<SocketIOClient.Socket>();
  
let localVideoRef = useRef<HTMLVideoElement>(null);
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

let newSocket = io.connect('http://localhost:4000');
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