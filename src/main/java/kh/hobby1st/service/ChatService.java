package kh.hobby1st.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.ChatDAO;
import kh.hobby1st.dto.ChatDTO;

@Service
public class ChatService {

	@Autowired
	private ChatDAO chatDao;
	
	public int insertChatIntoDB(ChatDTO dto) {
		return chatDao.insertChatIntoDB(dto);
	}
	
	public List<ChatDTO> chatSelectAll(){
		return chatDao.chatSelectAll();
	}
	
	public List<ChatDTO> whoIsLastChat() {
		return chatDao.whoIsLastChat();
	}
	public String getUserProfile(String mem_id) {
		return chatDao.getUserProfile(mem_id);
	}
	
	
	public int isThisMyChat(String chat_writer) {
		return chatDao.isThisMyChat(chat_writer);
	}
	
	public 	List<Map<String, Object>> selectAll(String cl_id, String user_id){
		return chatDao.selectAll(cl_id,user_id);
	}
	
}
