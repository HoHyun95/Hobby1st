package kh.hobby1st.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ChatPlusUserPhotoDTO {

	private int chat_seq;
	private int chat_cl_id;
	private String chat_cl_name;
	private String chat_contents;
	private String chat_writer;
	private String chat_writer_id;
	private Timestamp chat_write_date;
	private String chat_user_photo;
	
	public ChatPlusUserPhotoDTO() {}
	public ChatPlusUserPhotoDTO(int chat_seq, int chat_cl_id, String chat_cl_name, String chat_contents,
			String chat_writer, String chat_writer_id, Timestamp chat_write_date, String chat_user_photo) {
		super();
		this.chat_seq = chat_seq;
		this.chat_cl_id = chat_cl_id;
		this.chat_cl_name = chat_cl_name;
		this.chat_contents = chat_contents;
		this.chat_writer = chat_writer;
		this.chat_writer_id = chat_writer_id;
		this.chat_write_date = chat_write_date;
		this.chat_user_photo = chat_user_photo;
	}
	public int getChat_seq() {
		return chat_seq;
	}
	public void setChat_seq(int chat_seq) {
		this.chat_seq = chat_seq;
	}
	public int getChat_cl_id() {
		return chat_cl_id;
	}
	public void setChat_cl_id(int chat_cl_id) {
		this.chat_cl_id = chat_cl_id;
	}
	public String getChat_cl_name() {
		return chat_cl_name;
	}
	public void setChat_cl_name(String chat_cl_name) {
		this.chat_cl_name = chat_cl_name;
	}
	public String getChat_contents() {
		return chat_contents;
	}
	public void setChat_contents(String chat_contents) {
		this.chat_contents = chat_contents;
	}
	public String getChat_writer() {
		return chat_writer;
	}
	public void setChat_writer(String chat_writer) {
		this.chat_writer = chat_writer;
	}
	public String getChat_writer_id() {
		return chat_writer_id;
	}
	public void setChat_writer_id(String chat_writer_id) {
		this.chat_writer_id = chat_writer_id;
	}
	public Timestamp getChat_write_date() {
		return chat_write_date;
	}
	public void setChat_write_date(Timestamp chat_write_date) {
		this.chat_write_date = chat_write_date;
	}
	public String getChat_user_photo() {
		return chat_user_photo;
	}
	public void setChat_user_photo(String chat_user_photo) {
		this.chat_user_photo = chat_user_photo;
	}
	
	public String getFormDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
		return sdf.format(this.getChat_write_date());
	}
}
