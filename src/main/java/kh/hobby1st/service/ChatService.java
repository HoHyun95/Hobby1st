package kh.hobby1st.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.hobby1st.dao.ChatDAO;
import kh.hobby1st.dto.ChatDTO;
import kh.hobby1st.dto.ChatPlusUserPhotoDTO;

@Service
public class ChatService {

	@Autowired
	private ChatDAO chatDao;
	
	public int insertChatIntoDB(ChatDTO dto) {
		return chatDao.insertChatIntoDB(dto);
	}
	
	public List<ChatDTO> chatSelectAll(String cl_id){
		return chatDao.chatSelectAll(cl_id);
	}
	
	public 	List<ChatPlusUserPhotoDTO> selectAll(String cl_id){
		return chatDao.selectAll(cl_id);
	}
	
	public List<ChatDTO> whoIsLastChat(String chat_cl_id) {
		return chatDao.whoIsLastChat(chat_cl_id);
	}
	public String getUserProfile(String mem_id) {
		return chatDao.getUserProfile(mem_id);
	}
	
	
	public int isThisMyChat(String chat_writer) {
		return chatDao.isThisMyChat(chat_writer);
	}
	
}
