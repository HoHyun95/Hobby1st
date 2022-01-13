package kh.hobby1st.dto;

import java.sql.Date;

public class ClubMemberDTO {
	
	private int cm_seq;
	private String cm_name;
	private String cm_mem_id;
	private int cm_par_seq;
	private Date cm_sign_date;
	
	public ClubMemberDTO() {}
	
	public ClubMemberDTO(int cm_seq, String cm_name, String cm_mem_id, int cm_par_seq, Date cm_sign_date) {
		super();
		this.cm_seq = cm_seq;
		this.cm_name = cm_name;
		this.cm_mem_id = cm_mem_id;
		this.cm_par_seq = cm_par_seq;
		this.cm_sign_date = cm_sign_date;
	}
	public int getCm_seq() {
		return cm_seq;
	}
	public void setCm_seq(int cm_seq) {
		this.cm_seq = cm_seq;
	}
	public String getCm_name() {
		return cm_name;
	}
	public void setCm_name(String cm_name) {
		this.cm_name = cm_name;
	}
	public String getCm_mem_id() {
		return cm_mem_id;
	}
	public void setCm_mem_id(String cm_mem_id) {
		this.cm_mem_id = cm_mem_id;
	}
	public int getCm_par_seq() {
		return cm_par_seq;
	}
	public void setCm_par_seq(int cm_par_seq) {
		this.cm_par_seq = cm_par_seq;
	}
	public Date getCm_sign_date() {
		return cm_sign_date;
	}
	public void setCm_sign_date(Date cm_sign_date) {
		this.cm_sign_date = cm_sign_date;
	}
	

}
