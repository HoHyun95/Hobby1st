package kh.hobby1st.dto;

import java.sql.Timestamp;

public class ClubBoardReplyDTO {
	
	private int cbr_par_seq;
	private int cbr_seq;
	private String cbr_writer;
	private String cbr_reply;
	private Timestamp cbr_write_date;
	
	
	public ClubBoardReplyDTO() {}
	
	public ClubBoardReplyDTO(int cbr_par_seq, int cbr_seq, String cbr_writer, String cbr_reply,
			Timestamp cbr_write_date) {
		super();
		this.cbr_par_seq = cbr_par_seq;
		this.cbr_seq = cbr_seq;
		this.cbr_writer = cbr_writer;
		this.cbr_reply = cbr_reply;
		this.cbr_write_date = cbr_write_date;
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
	

}
