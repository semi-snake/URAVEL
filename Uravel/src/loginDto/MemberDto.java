package loginDto;

import java.sql.Date;

public class MemberDto {

	private int userno;
	private String userid;
	private String userpw;
	private String username;
	private Date birth;
	private String email;
	private String phone;
	private String role;
	private String enabled;
	
	public MemberDto() {
		super();
	}

	public MemberDto(int userno, String userid, String userpw, String username, Date birth, String email, String phone,
			String role, String enabled) {
		super();
		this.userno = userno;
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.role = role;
		this.enabled = enabled;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}
	
	
}
