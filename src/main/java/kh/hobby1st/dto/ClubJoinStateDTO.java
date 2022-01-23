package kh.hobby1st.dto;

public class ClubJoinStateDTO {
	
	private int cs_seq;
	private int cs_board_seq;
	private String cs_club_name;
	private String cs_boss_name;
	private String cs_join_name;
	private int cs_state;
	
	
	public ClubJoinStateDTO() {};
	
	public ClubJoinStateDTO(int cs_seq, int cs_board_seq, String cs_club_name, String cs_boss_name, String cs_join_name,
			int cs_state) {
		super();
		this.cs_seq = cs_seq;
		this.cs_board_seq = cs_board_seq;
		this.cs_club_name = cs_club_name;
		this.cs_boss_name = cs_boss_name;
		this.cs_join_name = cs_join_name;
		this.cs_state = cs_state;
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
	public String getCs_club_name() {
		return cs_club_name;
	}
	public void setCs_club_name(String cs_club_name) {
		this.cs_club_name = cs_club_name;
	}
	public String getCs_boss_name() {
		return cs_boss_name;
	}
	public void setCs_boss_name(String cs_boss_name) {
		this.cs_boss_name = cs_boss_name;
	}
	public String getCs_join_name() {
		return cs_join_name;
	}
	public void setCs_join_name(String cs_join_name) {
		this.cs_join_name = cs_join_name;
	}
	public int getCs_state() {
		return cs_state;
	}
	public void setCs_state(int cs_state) {
		this.cs_state = cs_state;
	}
	

}
