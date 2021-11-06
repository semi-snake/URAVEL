package com.dto;

public class UserLocalDto {
	private int userno;
	private int localcode;
	private String localname;

	public UserLocalDto() {
		super();
	}

	public UserLocalDto(int userno, int localcode) {
		super();
		this.userno = userno;
		this.localcode = localcode;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public int getLocalcode() {
		return localcode;
	}

	public void setLocalcode(int localcode) {
		this.localcode = localcode;
	}

	public String getLocalname() {
		return localname;
	}

	public void setLocalname(String localname) {
		this.localname = localname;
	}
	
}

