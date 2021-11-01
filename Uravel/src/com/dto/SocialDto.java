package com.dto;

public class SocialDto {
	private String userid;
	private String socialtype;
	public SocialDto() {
		super();
	}
	public SocialDto(String userid, String socialtype) {
		super();
		this.userid = userid;
		this.socialtype = socialtype;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getSocialtype() {
		return socialtype;
	}
	public void setSocialtype(String socialtype) {
		this.socialtype = socialtype;
	}

}
