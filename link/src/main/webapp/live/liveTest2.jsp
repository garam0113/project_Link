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
let users = {};
let socketToRoom = {};
const maximum = 2;

io.on('connection', socket => {
    // 1:1 ������ �̷� ������ �������� �ʾƵ� ������ �۾��̴� 1:N�� ���� �����ؼ� �� ���·� ���ܵ׽��ϴ�.
    // email �κ��� �����ϼŵ� �����մϴ�.
    socket.on('join_room', data => {
        // user[room]���� room�� �ִ� ����ڵ��� �迭 ���·� ����ȴ�.
        // room�� �����Ѵٸ�
        if (users[data.room]) {
            const length = users[data.room].length;
            // �ִ� �ο��� ������������ �� �̻� ���� �Ұ�
            if (length === maximum) {
                socket.to(socket.id).emit('room_full');
                return;
            }
            // �ο��� �ִ� �ο����� ������ ���� ����
            users[data.room].push({id: socket.id, email: data.email});
        } else { // room�� �������� �ʴ´ٸ� ���� ����
            users[data.room] = [{id: socket.id, email: data.email}];
        }
        // �ش� ������ ��� room�� �����ִ� �� �˱� ���� ����
        socketToRoom[socket.id] = data.room;
      
        socket.join(data.room);
        console.log(`[${socketToRoom[socket.id]}]: ${socket.id} enter`);

        // ������ ������ ���� room�� user array
        const usersInThisRoom = users[data.room].filter(user => user.id !== socket.id);

        console.log(usersInThisRoom);

        // ���ο��� �ش� user array�� ����
        // ���� �����ϴ� user�� �̹� �濡 �ִ� user�鿡�� offer(signal)�� ������ ����
        io.sockets.to(socket.id).emit('all_users', usersInThisRoom);
    });

    // �ٸ� user�鿡�� offer�� ���� (�ڽ��� RTCSessionDescription)
    socket.on('offer', sdp => {
        console.log('offer: ' + socket.id);
        // room���� �� �� �ۿ� �����Ƿ� broadcast ����ؼ� ����
        // ���� �� �ִ� ó���� ���� ����Ʈ 1:N����...
        socket.broadcast.emit('getOffer', sdp);
    });

    // offer�� ���� user���� answer�� ���� (�ڽ��� RTCSessionDescription)
    socket.on('answer', sdp => {
        console.log('answer: ' + socket.id);
        // room���� �� �� �ۿ� �����Ƿ� broadcast ����ؼ� ����
        // ���� �� �ִ� ó���� ���� ����Ʈ 1:N����...
        socket.broadcast.emit('getAnswer', sdp);
    });

    // �ڽ��� ICECandidate ������ signal(offer �Ǵ� answer)�� �ְ� ���� ��뿡�� ����
    socket.on('candidate', candidate => {
        console.log('candidate: ' + socket.id);
        // room���� �� �� �ۿ� �����Ƿ� broadcast ����ؼ� ����
        // ���� �� �ִ� ó���� ���� ����Ʈ 1:N����...
        socket.broadcast.emit('getCandidate', candidate);
    })

    // user�� ������ ������ �� ó��
    socket.on('disconnect', () => {
        console.log(`[${socketToRoom[socket.id]}]: ${socket.id} exit`);
        // disconnect�� user�� ���Ե� roomID
        const roomID = socketToRoom[socket.id];
        // room�� ���Ե� ����
        let room = users[roomID];
        // room�� �����Ѵٸ�(user���� ���Ե�)
        if (room) {
            // disconnect user�� ����
            room = room.filter(user => user.id !== socket.id);
            users[roomID] = room;
        }
        // � user�� ������ �� room�� �ٸ� user�鿡�� �뺸
        socket.broadcast.to(room).emit('user_exit', {id: socket.id});
        console.log(users);
    })
});
</script>
</body>
</html>