package kh.hobby1st.dto;

import java.security.Timestamp;

public class ClubJoinStateDTO {

	private int cs_seq;
	private int cs_board_seq;
	private String cs_boss_id;
	private String cs_join_id;
	private int cs_state;
	private Timestamp cs_date;
	
	public ClubJoinStateDTO() {}
	
	public ClubJoinStateDTO(int cs_seq, int cs_board_seq, String cs_boss_id, String cs_join_id, int cs_state,
			Timestamp cs_date) {
		super();
		this.cs_seq = cs_seq;
		this.cs_board_seq = cs_board_seq;
		this.cs_boss_id = cs_boss_id;
		this.cs_join_id = cs_join_id;
		this.cs_state = cs_state;
		this.cs_date = cs_date;
	}
	public int getCs_seq() {
		return cs_seq;
	}
	public void setCs_seq(int cs_seq) {
		this.cs_seq = cs_seq;
	}
	public int getCs_board_seq() {
		return cs_board_seq;
	}
	public void setCs_board_seq(int cs_board_seq) {
		this.cs_board_seq = cs_board_seq;
	}
	public String getCs_boss_id() {
		return cs_boss_id;
	}
	public void setCs_boss_id(String cs_boss_id) {
		this.cs_boss_id = cs_boss_id;
	}
	public String getCs_join_id() {
		return cs_join_id;
	}
	public void setCs_join_id(String cs_join_id) {
		this.cs_join_id = cs_join_id;
	}
	public int getCs_state() {
		return cs_state;
	}
	public void setCs_state(int cs_state) {
		this.cs_state = cs_state;
	}
	public Timestamp getCs_date() {
		return cs_date;
	}
	public void setCs_date(Timestamp cs_date) {
		this.cs_date = cs_date;
	}
	
	

}
