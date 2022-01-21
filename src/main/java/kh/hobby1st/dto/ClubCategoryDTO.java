package kh.hobby1st.dto;

public class ClubCategoryDTO {

	private String cc_category_id;
	private String cc_category_name;
	
	public ClubCategoryDTO() {}
	
	public ClubCategoryDTO(String cc_category_id, String cc_category_name) {
		super();
		this.cc_category_id = cc_category_id;
		this.cc_category_name = cc_category_name;
	}

	public String getCc_category_id() {
		return cc_category_id;
	}

	public void setCc_category_id(String cc_category_id) {
		this.cc_category_id = cc_category_id;
	}

	public String getCc_category_name() {
		return cc_category_name;
	}

	public void setCc_category_name(String cc_category_name) {
		this.cc_category_name = cc_category_name;
	}
	
	
	
	
	
	
}
