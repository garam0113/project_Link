const app = require("express")();
const http = require("http").createServer(app);
const io = require("socket.io")(http);

// 소켓 서버 구동
io.on("connection", (socket) => {
  console.log("user connected");
});

// 클라이언트 화면 노출
app.get("/", (req, res) => {
  res.sendFile(__dirname + "/index.html");
});

// push api 정의
app.get("/push", (req, res) => {
  // 소켓 연결된 모든 클라이언트에 전송
  io.emit("noti");

  // 화면 출력
  res.send("푸시!!");
});

// express 서버 구동
http.listen(3000, () => {
  console.log("listening on *:3000");
});
