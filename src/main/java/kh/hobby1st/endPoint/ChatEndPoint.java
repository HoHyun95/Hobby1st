package kh.hobby1st.endPoint;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.Message;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import kh.hobby1st.configurator.WSConfig;

@ServerEndpoint(value="/chat/{cl_id}", configurator = WSConfig.class)
public class ChatEndPoint {


	private static List<Session> sessionList = new ArrayList<>();
	private static Map<String, String> nameMap = new HashMap<>();
	
//	@OnOpen
//	public void onOpen(Session session, @PathParam("name") String name) throws IOException {
//	
//		sessionList.add(session);
//		nameMap.put(session.getId(), name);
//		
//		Message message = new Message();
//		message.setFromName(name);
//		message.setFromId(session.getId());
//		message.setContent("님이 채팅방에 참여하였습니다.");
//		
//		broadcast(session, message);
//	}
//	
//	// 
//	@OnMessage
//	public void onMessage(Session session, Message message) throws IOException {
//	    System.out.println(message);
//	    String name = nameMap.get(session.getId());
//		
//	    message.setFromName(name);
//	    message.setFromId(session.getId());
//	    
//		broadcast(session, message);
//	}
//	
//	// 
//	@OnClose
//	public void onClose(Session session) throws IOException {
//	    String name = nameMap.get(session.getId());
//	    System.out.println(name + "(" + session.getId() + ")와 연결이 끊어졌습니다.");
//		
//		Message message = new Message();
//		message.setFromName(name);
//		message.setFromId(session.getId());
//		message.setContent("님이 채팅방에서 나갔습니다.");
//		
//		broadcast(session, message);
//		
//		sessionList.remove(session);
//		nameMap.remove(session.getId());
//	}
//	
//	@OnError
//	public void onError(Session session, Throwable throwable) {
//		// Do error handling here
//	}
//	
//	private synchronized static void broadcast(Session selfSession, Message message) {
//	    
//		for (Session session : sessionList) {
//		    if (selfSession.getId().equals(session.getId())) {
//		        continue; // 
//		    }
//		    
//		    if (message.getToId() == null || message.getToId().equals("")) {
//                // 귓속말 상대 toId 값이 없으면 모두에게 메시지 전송
//                Basic basic = session.getBasicRemote();
//                try {
//                    basic.sendObject(message);
//                } catch (IOException | EncodeException e) {
//                    e.printStackTrace();
//                }
//		    } else {
//                
//                if (message.getToId().equals(session.getId())) {
//                    Basic basic = session.getBasicRemote();
//                    try {
//                        basic.sendObject(message);
//                    } catch (IOException | EncodeException e) {
//                        e.printStackTrace();
//                    }
//                    break; 
//                }
//		    }
//		} 
//	}
}


