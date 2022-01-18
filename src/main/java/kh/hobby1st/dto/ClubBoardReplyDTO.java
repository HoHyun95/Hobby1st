package kh.hobby1st.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class ClubBoardReplyDTO {

	private int cbr_par_seq;
	private int cbr_seq;
	private String cbr_writer;
	private String cbr_reply;
	private Timestamp cbr_write_date;
	private int cbr_r_seq;
	private int deep;

	public ClubBoardReplyDTO(int cbr_par_seq, int cbr_seq, String cbr_writer, String cbr_reply,
			Timestamp cbr_write_date, int cbr_r_seq, int deep) {
		super();
		this.cbr_par_seq = cbr_par_seq;
		this.cbr_seq = cbr_seq;
		this.cbr_writer = cbr_writer;
		this.cbr_reply = cbr_reply;
		this.cbr_write_date = cbr_write_date;
		this.cbr_r_seq = cbr_r_seq;
		this.deep = deep;
	}

	public int getCbr_par_seq() {
		return cbr_par_seq;
	}

	public void setCbr_par_seq(int cbr_par_seq) {
		this.cbr_par_seq = cbr_par_seq;
	}

	public int getCbr_seq() {
		return cbr_seq;
	}

	public void setCbr_seq(int cbr_seq) {
		this.cbr_seq = cbr_seq;
	}

	public String getCbr_writer() {
		return cbr_writer;
	}

	public void setCbr_writer(String cbr_writer) {
		this.cbr_writer = cbr_writer;
	}

	public String getCbr_reply() {
		return cbr_reply;
	}

	public void setCbr_reply(String cbr_reply) {
		this.cbr_reply = cbr_reply;
	}

	public Timestamp getCbr_write_date() {
		return cbr_write_date;
	}

	public void setCbr_write_date(Timestamp cbr_write_date) {
		this.cbr_write_date = cbr_write_date;
	}

	public int getCbr_r_seq() {
		return cbr_r_seq;
	}

	public void setCbr_r_seq(int cbr_r_seq) {
		this.cbr_r_seq = cbr_r_seq;
	}

	public int getDeep() {
		return deep;
	}

	public void setDeep(int deep) {
		this.deep = deep;
	}

	public ClubBoardReplyDTO() {
	}

	// 날자 형식 변환
	public String getFormdDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
		return sdf.format(this.cbr_write_date.getTime());
	}

	public String getDetailDate() {
		long current_time = System.currentTimeMillis(); // 현재의 타임 스탬
		long write_time = this.cbr_write_date.getTime(); // 글이 작성된 시청의 Timestamp

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
