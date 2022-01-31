package kh.hobby1st.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class VoteListDTO {

	private int vl_seq;
	private String vl_title;
	private Timestamp vl_start_date;
	private Date vl_end_date;
	private int vl_type;
	private int vl_count;

	public VoteListDTO() {
	}

	public VoteListDTO(int vl_seq, String vl_title, Timestamp vl_start_date, Date vl_end_date, int vl_type,
			int vl_count) {
		super();
		this.vl_seq = vl_seq;
		this.vl_title = vl_title;
		this.vl_start_date = vl_start_date;
		this.vl_end_date = vl_end_date;
		this.vl_type = vl_type;
		this.vl_count = vl_count;
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

	public int getVl_count() {
		return vl_count;
	}

	public void setVl_count(int vl_count) {
		this.vl_count = vl_count;
	}

	// 날자 형식 변환
	public String getFormdDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.vl_start_date.getTime());
	}
	
	public String getFormdDateDetail() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 aa hh:mm");
		return sdf.format(this.vl_start_date.getTime());
	}

	public String getDetailDate() {
		long current_time = System.currentTimeMillis(); // 현재의 타임 스탬
		long write_time = this.vl_start_date.getTime(); // 글이 작성된 시청의 Timestamp

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
