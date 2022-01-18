package kh.hobby1st.service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

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
	
}
