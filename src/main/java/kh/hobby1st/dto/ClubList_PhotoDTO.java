package kh.hobby1st.dto;

public class ClubList_PhotoDTO {

	private int clp_seq;
	private int clp_id;
	private String clp_photo;
	public ClubList_PhotoDTO() {}
	public ClubList_PhotoDTO(int clp_seq, int clp_id, String clp_photo) {
		super();
		this.clp_seq = clp_seq;
		this.clp_id = clp_id;
		this.clp_photo = clp_photo;
	}
	public int getClp_seq() {
		return clp_seq;
	}
	public void setClp_seq(int clp_seq) {
		this.clp_seq = clp_seq;
	}
	public int getClp_id() {
		return clp_id;
	}
	public void setClp_id(int clp_id) {
		this.clp_id = clp_id;
	}
	public String getClp_photo() {
		return clp_photo;
	}
	public void setClp_photo(String clp_photo) {
		this.clp_photo = clp_photo;
	}
}
