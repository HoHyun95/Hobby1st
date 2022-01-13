package kh.hobby1st.dto;

import java.sql.Date;

public class ClubListDTO {
	private String club_id;
	private String club_name;
	private String club_description;
	private String club_master;	//동호회 대표
	private String club_master_phone;
	private int club_member_max; //동호회 정원
	private String club_area;
	private Date club_created_date;
	private int club_member_count;
	private String club_oriName;
	private String club_sysName;

	public ClubListDTO() {}
	
	public ClubListDTO(String club_id, String club_name, String club_description, String club_master,
			String club_master_phone, int club_member_max, String club_area, Date club_created_date,
			int club_member_count, String club_oriName, String club_sysName) {
		super();
		this.club_id = club_id;
		this.club_name = club_name;
		this.club_description = club_description;
		this.club_master = club_master;
		this.club_master_phone = club_master_phone;
		this.club_member_max = club_member_max;
		this.club_area = club_area;
		this.club_created_date = club_created_date;
		this.club_member_count = club_member_count;
		this.club_oriName = club_oriName;
		this.club_sysName = club_sysName;
	}
	public String getClub_id() {
		return club_id;
	}
	public void setClub_id(String club_id) {
		this.club_id = club_id;
	}
	public String getClub_name() {
		return club_name;
	}
	public void setClub_name(String club_name) {
		this.club_name = club_name;
	}
	public String getClub_description() {
		return club_description;
	}
	public void setClub_description(String club_description) {
		this.club_description = club_description;
	}
	public String getClub_master() {
		return club_master;
	}
	public void setClub_master(String club_master) {
		this.club_master = club_master;
	}
	public String getClub_master_phone() {
		return club_master_phone;
	}
	public void setClub_master_phone(String club_master_phone) {
		this.club_master_phone = club_master_phone;
	}
	public int getClub_member_max() {
		return club_member_max;
	}
	public void setClub_member_max(int club_member_max) {
		this.club_member_max = club_member_max;
	}
	public String getClub_area() {
		return club_area;
	}
	public void setClub_area(String club_area) {
		this.club_area = club_area;
	}
	public Date getClub_created_date() {
		return club_created_date;
	}
	public void setClub_created_date(Date club_created_date) {
		this.club_created_date = club_created_date;
	}
	public int getClub_member_count() {
		return club_member_count;
	}
	public void setClub_member_count(int club_member_count) {
		this.club_member_count = club_member_count;
	}
	public String getClub_oriName() {
		return club_oriName;
	}
	public void setClub_oriName(String club_oriName) {
		this.club_oriName = club_oriName;
	}
	public String getClub_sysName() {
		return club_sysName;
	}
	public void setClub_sysName(String club_sysName) {
		this.club_sysName = club_sysName;
	}


}
