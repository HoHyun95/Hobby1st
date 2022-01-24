package kh.hobby1st.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

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
	
	// 날자 형식 변환
		public String getFormdDate() {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
			return sdf.format(this.cs_date.getTime());
		}

		public String getDetailDate() {
			long current_time = System.currentTimeMillis(); // 현재의 타임 스탬
			long write_time = this.cs_date.getTime(); // 글이 작성된 시청의 Timestamp

			long time_gap = current_time - write_time;

			if (time_gap < 6000) {
				return "1분 이내";
			} else if (time_gap < 300000) {
				return "5분 이내";
			} else if (time_gap < 3600000) {
				return "1시간 이내";
			} else if (time_gap < 7200000) {
				return "2시간 이내";
			} else {
				return getFormdDate();
			}
		}
	
	

}
