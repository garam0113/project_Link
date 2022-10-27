package com.link.common.socket;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.link.service.domain.User;

public class EchoHandler extends TextWebSocketHandler {
	
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	// 로그인중인 개별유저
	Map<String, WebSocketSession> users = new HashMap<String, WebSocketSession>();
	
	
	
	// 클라이언트가 서버로 연결 시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		// 접속한 유저의 http 세션을 조회하여 id를 얻는 함수
		sessions.add(session);
		String senderId = getMemberId(session);
		
		// 로그인 값이 있는 경우만
		
		if(senderId != null) {
			System.out.println(senderId + " 연결 됨");
			users.put(senderId, session);	// 로그인중 개별 유저 저장
		}
	}
	
	// 클라이언트가 메세지를 보냈을 때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String senderId = getMemberId(session);
		
		// 특정 유저에게 보내기
		String msg = message.getPayload();
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 4) {
				String type = strs[0];
				String target = strs[1]; // m_id 저장
				String content = strs[2];
				String url = strs[3];
				WebSocketSession targetSession = users.get(target);
				
				// 실시간 접속 시
				if(targetSession != null) {
					// ex :  [XXX] 신청이 들어왔습니다.
					
					System.out.println("실시간 접속시 확인 : " + strs[0] + strs[1] + strs[2] + strs[3]);
					TextMessage tmpMsg = new TextMessage(target + "님이 게시글을 남겼습니다.");
					System.out.println("메시지 출력 확인 : " + tmpMsg);
					targetSession.sendMessage(tmpMsg);
				}
			}
		}
	}

	// 연결 해제 시
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		String senderId = getMemberId(session);
		if(senderId!=null) {	// 로그인 값이 있는 경우만
			log(senderId + " 연결 종료됨");
			users.remove(senderId);
			sessions.remove(session);
		}
	}
	
	
	// 에러 발생 시
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		log(session.getId() + " 오류 발생 : " + exception.getMessage());
	}

	private String getMemberId(WebSocketSession session) {
		// TODO Auto-generated method stub
		Map<String, Object> httpSession = session.getAttributes();
		String m_id = ((User)httpSession.get("user")).getUserId();
		
		return m_id == null? null : m_id;
	}
	
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}

}
