package kh.hobby1st.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class NoticeDTO {
	private int not_seq;
	private String not_writer;
	private String not_title;
	private String not_contents;
	private Timestamp not_write_date;
	private int view_count;
	
	public NoticeDTO() {}
	public NoticeDTO(int not_seq, String not_writer, String not_title, String not_contents, Timestamp not_write_date,
			int view_count) {
		super();
		this.not_seq = not_seq;
		this.not_writer = not_writer;
		this.not_title = not_title;
		this.not_contents = not_contents;
		this.not_write_date = not_write_date;
		this.view_count = view_count;
	}
	public int getNot_seq() {
		return not_seq;
	}
	public void setNot_seq(int not_seq) {
		this.not_seq = not_seq;
	}
	public String getNot_writer() {
		return not_writer;
	}
	public void setNot_writer(String not_writer) {
		this.not_writer = not_writer;
	}
	public String getNot_title() {
		return not_title;
	}
	public void setNot_title(String not_title) {
		this.not_title = not_title;
	}
	public String getNot_contents() {
		return not_contents;
	}
	public void setNot_contents(String not_contents) {
		this.not_contents = not_contents;
	}
	public Timestamp getNot_write_date() {
		return not_write_date;
	}
	public void setNot_write_date(Timestamp not_write_date) {
		this.not_write_date = not_write_date;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	
	public String getFormDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 DD일");
		return sdf.format(this.getNot_write_date());
	}
	
}
