package kh.hobby1st.dto;

public class MemberDTO {

	public MemberDTO() {} 
	public MemberDTO(String mem_id, String mem_pass, String mem_phone, String mem_email, String mem_name, String mem_nickname, String mem_birthday, String mem_gender
			,String mem_address, String mem_category_1, String mem_category_2, String mem_photo, String mem_lastlogin) {
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
