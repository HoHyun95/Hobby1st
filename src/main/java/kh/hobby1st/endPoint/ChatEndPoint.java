
package kh.hobby1st.endPoint;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kh.hobby1st.configurator.WSConfig;

@ServerEndpoint(value="/chat/{cl_id}", configurator = WSConfig.class)
public class ChatEndPoint {

	private HttpSession session;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private static List<Session> clients = Collections.synchronizedList(new ArrayList<>());

	static HashMap<String, Session> messageUserList = new HashMap<String, Session>();

	@OnOpen
	public void onConnect(Session session, EndpointConfig config, @PathParam("cl_id") String cl_id) {
		clients.add(session);


		this.session = (HttpSession)config.getUserProperties().get("user_name");

		//		messageUserList.put(cl_id, session);
		//		broadCast("동호회 채팅방이 열렸습니다.");
	}

	@OnMessage
	public void onMessage(String msg) {

		String incomingMsgID = (String)this.session.getAttribute("user_name");

		clients.size();

		synchronized(clients) {
			for(Session client : clients) {
				try {
					client.getBasicRemote().sendText(msg);

				}catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}


	@OnClose
	public void onClose(Session session) {
		clients.remove(session);

		
		//메시지 전체 전송
		//    private void broadCast(String text){
		//        logger.info("전달 대상 : "+messageUserList.size());
		//        Set<String>keys =  messageUserList.keySet();
		//        try {            
		//            for(String key : keys) {
		//                logger.info("key : "+key);
		//                Session session = messageUserList.get(key);    
		//                session.getBasicRemote().sendText(text);
		
		//            }
		//        } catch (IOException e) {
		//            e.printStackTrace();
		//        }
		//    }
	}
}


//package kh.hobby1st.endPoint;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.mail.Message;
//import javax.websocket.EncodeException;
//import javax.websocket.OnClose;
//import javax.websocket.OnError;
//import javax.websocket.OnMessage;
//import javax.websocket.OnOpen;
//import javax.websocket.RemoteEndpoint.Basic;
//import javax.websocket.Session;
//import javax.websocket.server.PathParam;
//import javax.websocket.server.ServerEndpoint;
//
//import kh.hobby1st.configurator.WSConfig;
//
//@ServerEndpoint(value="/chat/{cl_id}", configurator = WSConfig.class)
//public class ChatEndPoint {
//
//
//	private static List<Session> sessionList = new ArrayList<>();
//	private static Map<String, String> nameMap = new HashMap<>();
	
//	@OnOpen
//	public void onOpen(Session session, @PathParam("name") String name) throws IOException {
//	
//		sessionList.add(session);
//		nameMap.put(session.getId(), name);
//		
//		Message message = new Message();
//		message.setFromName(name);
//		message.setFromId(session.getId());
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
//		
//		Message message = new Message();
//		message.setFromName(name);
//		message.setFromId(session.getId());
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
//}


