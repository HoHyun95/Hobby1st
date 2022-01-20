package kh.hobby1st.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.hobby1st.dto.ChatDTO;

@Repository
public class ChatDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertChatIntoDB(ChatDTO dto) {
		return mybatis.insert("Chat.insertChatIntoDB", dto);
	}
	
	public List<ChatDTO> chatSelectAll(){
		return mybatis.selectList("Chat.chatSelectAll");
	}
	
	public int isThisMyChat(String chat_writer) {
		System.out.println("DAO 도착 ! ");
		return mybatis.selectOne("Chat.isThisMyChat", chat_writer);
	}
}
