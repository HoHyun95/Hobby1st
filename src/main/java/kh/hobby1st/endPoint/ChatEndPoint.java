package kh.hobby1st.endPoint;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import kh.hobby1st.configurator.WSConfig;

@ServerEndpoint(value="/chat", configurator = WSConfig.class)
public class ChatEndPoint {

	private HttpSession session;
	private static List<Session> clients = Collections.synchronizedList(new ArrayList<>());

	@OnOpen
	public void onConnect(Session session, EndpointConfig config) {
		clients.add(session);
		this.session = (HttpSession)config.getUserProperties().get("user_name");

		System.out.println("연결 확인");

	}

	@OnMessage
	public void onMessage(String msg) {
	
		//사용자 아이디 넘어오지만 동호회 채팅은 실명으로 사용하는 게 좋다.
		String incomingMsgID = (String)this.session.getAttribute("user_name");

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
	
	}
}

