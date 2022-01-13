package kh.hobby1st.dto;

import java.sql.Date;

public class ClubListDTO {
	private String cl_id;
	private String cl_name;
	private String cl_desc;
	private String cl_boss_id;	//동호회 대표
	private String cl_boss_name;
	private int cl_maxMem; //동호회 정원
	private String cl_local;
	private Date cl_openDate;
	private int cl_memCount;
	private String cl_photo;
	private String cl_category_id;
	private String cl_dCategory_id;
	public ClubListDTO() {}
	public ClubListDTO(String cl_id, String cl_name, String cl_desc, String cl_boss_id, String cl_boss_name,
			int cl_maxMem, String cl_local, Date cl_openDate, int cl_memCount, String cl_photo, String cl_category_id,
			String cl_dCategory_id) {
		super();
		this.cl_id = cl_id;
		this.cl_name = cl_name;
		this.cl_desc = cl_desc;
		this.cl_boss_id = cl_boss_id;
		this.cl_boss_name = cl_boss_name;
		this.cl_maxMem = cl_maxMem;
		this.cl_local = cl_local;
		this.cl_openDate = cl_openDate;
		this.cl_memCount = cl_memCount;
		this.cl_photo = cl_photo;
		this.cl_category_id = cl_category_id;
		this.cl_dCategory_id = cl_dCategory_id;
	}
	public String getCl_id() {
		return cl_id;
	}
	public void setCl_id(String cl_id) {
		this.cl_id = cl_id;
	}
	public String getCl_name() {
		return cl_name;
	}
	public void setCl_name(String cl_name) {
		this.cl_name = cl_name;
	}
	public String getCl_desc() {
		return cl_desc;
	}
	public void setCl_desc(String cl_desc) {
		this.cl_desc = cl_desc;
	}
	public String getCl_boss_id() {
		return cl_boss_id;
	}
	public void setCl_boss_id(String cl_boss_id) {
		this.cl_boss_id = cl_boss_id;
	}
	public String getCl_boss_name() {
		return cl_boss_name;
	}
	public void setCl_boss_name(String cl_boss_name) {
		this.cl_boss_name = cl_boss_name;
	}
	public int getCl_maxMem() {
		return cl_maxMem;
	}
	public void setCl_maxMem(int cl_maxMem) {
		this.cl_maxMem = cl_maxMem;
	}
	public String getCl_local() {
		return cl_local;
	}
	public void setCl_local(String cl_local) {
		this.cl_local = cl_local;
	}
	public Date getCl_openDate() {
		return cl_openDate;
	}
	public void setCl_openDate(Date cl_openDate) {
		this.cl_openDate = cl_openDate;
	}
	public int getCl_memCount() {
		return cl_memCount;
	}
	public void setCl_memCount(int cl_memCount) {
		this.cl_memCount = cl_memCount;
	}
	public String getCl_photo() {
		return cl_photo;
	}
	public void setCl_photo(String cl_photo) {
		this.cl_photo = cl_photo;
	}
	public String getCl_category_id() {
		return cl_category_id;
	}
	public void setCl_category_id(String cl_category_id) {
		this.cl_category_id = cl_category_id;
	}
	public String getCl_dCategory_id() {
		return cl_dCategory_id;
	}
	public void setCl_dCategory_id(String cl_dCategory_id) {
		this.cl_dCategory_id = cl_dCategory_id;
	}


}
