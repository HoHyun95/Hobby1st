package kh.hobby1st.dto;

public class VoteOptionDTO {
	
	private int vo_seq;
	private int vo_vote_seq;
	private String vo_option;
	private int vo_count;
	
	public VoteOptionDTO() {}
	
	public VoteOptionDTO(int vo_seq, int vo_vote_seq, String vo_option, int vo_count) {
		super();
		this.vo_seq = vo_seq;
		this.vo_vote_seq = vo_vote_seq;
		this.vo_option = vo_option;
		this.vo_count = vo_count;
	}
	public int getVo_seq() {
		return vo_seq;
	}
	public void setVo_seq(int vo_seq) {
		this.vo_seq = vo_seq;
	}
	public int getVo_vote_seq() {
		return vo_vote_seq;
	}
	public void setVo_vote_seq(int vo_vote_seq) {
		this.vo_vote_seq = vo_vote_seq;
	}
	public String getVo_option() {
		return vo_option;
	}
	public void setVo_option(String vo_option) {
		this.vo_option = vo_option;
	}
	public int getVo_count() {
		return vo_count;
	}
	public void setVo_count(int vo_count) {
		this.vo_count = vo_count;
	}
	

}
