package kh.hobby1st.configurator;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

public class WSConfig extends Configurator {
	
	@Override
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
		
		
		HttpSession session = (HttpSession)request.getHttpSession();
		
		sec.getUserProperties().put("user_name", session);
		
		super.modifyHandshake(sec, request, response);
	}
}
