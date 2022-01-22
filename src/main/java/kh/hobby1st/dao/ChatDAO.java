package kh.hobby1st.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.ChatDTO;
import kh.hobby1st.dto.ChatPlusUserPhotoDTO;

@Repository
public class ChatDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public int insertChatIntoDB(ChatDTO dto) {
		return mybatis.insert("Chat.insertChatIntoDB", dto);
	}

	public List<ChatDTO> chatSelectAll(String cl_id){
		return mybatis.selectList("Chat.chatSelectAll", cl_id);
	}

	public List<ChatDTO> whoIsLastChat(String chat_cl_id) {
		return mybatis.selectList("Chat.whoIsLastChat", chat_cl_id);
	}
	
	public String getUserProfile(String mem_id) {
		return mybatis.selectOne("Chat.getUserProfile", mem_id);
	}
	
	public 	List<ChatPlusUserPhotoDTO> selectAll(String cl_id){		
		return mybatis.selectList("Chat.selectAll", cl_id);
	}
	
	public int isThisMyChat(String chat_writer) {
		System.out.println("DAO 도착 ! ");
		return mybatis.selectOne("Chat.isThisMyChat", chat_writer);
	}
}
