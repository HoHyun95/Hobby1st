package kh.hobby1st.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ClubBoardDTO {

	private int cb_club_id;
	private int cb_seq;
	private String cb_writer;
	private String cb_title;
	private String cb_contents;
	private String cb_file;
	private Timestamp cb_write_date;
	private int cb_view_count;
	private int cb_like_count;
	private int cb_reply_count;
	private String cb_nickname;

	public ClubBoardDTO(int cb_club_id, int cb_seq, String cb_writer, String cb_title, String cb_contents,
			String cb_file, Timestamp cb_write_date, int cb_view_count, int cb_like_count, int cb_reply_count,
			String cb_nickname) {
		super();
		this.cb_club_id = cb_club_id;
		this.cb_seq = cb_seq;
		this.cb_writer = cb_writer;
		this.cb_title = cb_title;
		this.cb_contents = cb_contents;
		this.cb_file = cb_file;
		this.cb_write_date = cb_write_date;
		this.cb_view_count = cb_view_count;
		this.cb_like_count = cb_like_count;
		this.cb_reply_count = cb_reply_count;
		this.cb_nickname = cb_nickname;
	}

	public int getCb_club_id() {
		return cb_club_id;
	}

	public void setCb_club_id(int cb_club_id) {
		this.cb_club_id = cb_club_id;
	}

	public int getCb_seq() {
		return cb_seq;
	}

	public void setCb_seq(int cb_seq) {
		this.cb_seq = cb_seq;
	}

	public String getCb_writer() {
		return cb_writer;
	}

	public void setCb_writer(String cb_writer) {
		this.cb_writer = cb_writer;
	}

	public String getCb_title() {
		return cb_title;
	}

	public void setCb_title(String cb_title) {
		this.cb_title = cb_title;
	}

	public String getCb_contents() {
		return cb_contents;
	}

	public void setCb_contents(String cb_contents) {
		this.cb_contents = cb_contents;
	}

	public String getCb_file() {
		return cb_file;
	}

	public void setCb_file(String cb_file) {
		this.cb_file = cb_file;
	}

	public Timestamp getCb_write_date() {
		return cb_write_date;
	}

	public void setCb_write_date(Timestamp cb_write_date) {
		this.cb_write_date = cb_write_date;
	}

	public int getCb_view_count() {
		return cb_view_count;
	}

	public void setCb_view_count(int cb_view_count) {
		this.cb_view_count = cb_view_count;
	}

	public int getCb_like_count() {
		return cb_like_count;
	}

	public void setCb_like_count(int cb_like_count) {
		this.cb_like_count = cb_like_count;
	}

	public int getCb_reply_count() {
		return cb_reply_count;
	}

	public void setCb_reply_count(int cb_reply_count) {
		this.cb_reply_count = cb_reply_count;
	}

	public String getCb_nickname() {
		return cb_nickname;
	}

	public void setCb_nickname(String cb_nickname) {
		this.cb_nickname = cb_nickname;
	}

	public ClubBoardDTO() {
	}

	// 날자 형식 변환
	public String getFormdDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
		return sdf.format(this.cb_write_date.getTime());
	}

	public String getDetailDate() {
		long current_time = System.currentTimeMillis(); // 현재의 타임 스탬
		long write_time = this.cb_write_date.getTime(); // 글이 작성된 시청의 Timestamp

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
