package loginDto;

public class SocialMemberDto {

	private int userid;
	private String social_type;
	
	public SocialMemberDto() {
		super();
	}

	public SocialMemberDto(int userid, String social_type) {
		super();
		this.userid = userid;
		this.social_type = social_type;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getSocial_type() {
		return social_type;
	}

	public void setSocial_type(String social_type) {
		this.social_type = social_type;
	}
	
	
	
}
