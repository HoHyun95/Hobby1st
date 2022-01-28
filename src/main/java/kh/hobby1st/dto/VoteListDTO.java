package kh.hobby1st.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class VoteListDTO {
	
	private int vl_seq;
	private String vl_title;
	private Timestamp vl_start_date;
	private Date vl_end_date;
	private int vl_type;
	
	public VoteListDTO() {}
	
	public VoteListDTO(int vl_seq, String vl_title, Timestamp vl_start_date, Date vl_end_date, int vl_type) {
		super();
		this.vl_seq = vl_seq;
		this.vl_title = vl_title;
		this.vl_start_date = vl_start_date;
		this.vl_end_date = vl_end_date;
		this.vl_type = vl_type;
	}
	public int getVl_seq() {
		return vl_seq;
	}
	public void setVl_seq(int vl_seq) {
		this.vl_seq = vl_seq;
	}
	public String getVl_title() {
		return vl_title;
	}
	public void setVl_title(String vl_title) {
		this.vl_title = vl_title;
	}
	public Timestamp getVl_start_date() {
		return vl_start_date;
	}
	public void setVl_start_date(Timestamp vl_start_date) {
		this.vl_start_date = vl_start_date;
	}
	public Date getVl_end_date() {
		return vl_end_date;
	}
	public void setVl_end_date(Date vl_end_date) {
		this.vl_end_date = vl_end_date;
	}
	public int getVl_type() {
		return vl_type;
	}
	public void setVl_type(int vl_type) {
		this.vl_type = vl_type;
	}
	

}
