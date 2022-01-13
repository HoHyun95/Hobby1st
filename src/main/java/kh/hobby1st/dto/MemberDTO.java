package kh.hobby1st.dto;

import java.sql.Date;

public class MemberDTO {

	public MemberDTO() {} 
	public MemberDTO(String mem_id, String mem_pass, String mem_name, String mem_nickname, String mem_birthday, String mem_gender,
	String mem_address, String mem_category_1, String mem_category_2, String mem_photo, String mem_lastlogin, String mem_phone, String mem_email) {
		super();
		this.mem_id = mem_id;
		this.mem_pass = mem_pass;
		this.mem_phone = mem_phone;
		this.mem_email = mem_email;
		this.mem_name = mem_name;
		this.mem_nickname = mem_nickname;
		this.mem_birthday = mem_birthday;
		this.mem_gender = mem_gender;
		this.mem_address = mem_address;
		this.mem_category_1 = mem_category_1;
		this.mem_category_2 = mem_category_2;
		this.mem_photo = mem_photo;
		this.mem_lastlogin = mem_lastlogin;
	}
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pass() {
		return mem_pass;
	}
	public void setMem_pass(String mem_pass) {
		this.mem_pass = mem_pass;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_email() {
		return mem_email;
	}
	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_birthday() {
		return mem_birthday;
	}
	public void setMem_birthday(String mem_birthday) {
		this.mem_birthday = mem_birthday;
	}
	public String getMem_gender() {
		return mem_gender;
	}
	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}
	public String getMem_address() {
		return mem_address;
	}
	public void setMem_address(String mem_address) {
		this.mem_address = mem_address;
	}
	public String getMem_category_1() {
		return mem_category_1;
	}
	public void setMem_category_1(String mem_category_1) {
		this.mem_category_1 = mem_category_1;
	}
	public String getMem_category_2() {
		return mem_category_2;
	}
	public void setMem_category_2(String mem_category_2) {
		this.mem_category_2 = mem_category_2;
	}
	public String getMem_photo() {
		return mem_photo;
	}
	public void setMem_photo(String mem_photo) {
		this.mem_photo = mem_photo;
	}
	public String getMem_lastlogin() {
		return mem_lastlogin;
	}
	public void setMem_lastlogin(String mem_lastlogin) {
		this.mem_lastlogin = mem_lastlogin;
	}

	private String mem_id;
    private String mem_pass;
    private String mem_phone;
    private String mem_email;
    private String mem_name;
    private String mem_nickname;
    private String mem_birthday;
    private String mem_gender;
    private String mem_address;
    private String mem_category_1;
    private String mem_category_2;
    private String mem_photo;
    private String mem_lastlogin;
}
