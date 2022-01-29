package kh.hobby1st.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class QnaReplyDTO {
private int qnar_par_seq;
private int qnar_seq;
private String qnar_writer;
private String qnar_reply;
private Timestamp qnar_write_date;
public QnaReplyDTO() {}
public QnaReplyDTO(int qnar_par_seq, int qnar_seq, String qnar_writer, String qnar_reply, Timestamp qnar_write_date) {
	super();
	this.qnar_par_seq = qnar_par_seq;
	this.qnar_seq = qnar_seq;
	this.qnar_writer = qnar_writer;
	this.qnar_reply = qnar_reply;
	this.qnar_write_date = qnar_write_date;
}
public int getQnar_par_seq() {
	return qnar_par_seq;
}
public void setQnar_par_seq(int qnar_par_seq) {
	this.qnar_par_seq = qnar_par_seq;
}
public int getQnar_seq() {
	return qnar_seq;
}
public void setQnar_seq(int qnar_seq) {
	this.qnar_seq = qnar_seq;
}
public String getQnar_writer() {
	return qnar_writer;
}
public void setQnar_writer(String qnar_writer) {
	this.qnar_writer = qnar_writer;
}
public String getQnar_reply() {
	return qnar_reply;
}
public void setQnar_reply(String qnar_reply) {
	this.qnar_reply = qnar_reply;
}
public Timestamp getQnar_write_date() {
	return qnar_write_date;
}
public void setQnar_write_date(Timestamp qnar_write_date) {
	this.qnar_write_date = qnar_write_date;
}

//날자 형식 변환
	public String getFormDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
		return sdf.format(this.getQnar_write_date().getTime());
	}

	public String getDetailDate() {
		long current_time = System.currentTimeMillis(); // 현재의 타임 스탬
		long write_time = this.qnar_write_date.getTime(); // 글이 작성된 시청의 Timestamp

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
			return getFormDate();
		}
	}

}
