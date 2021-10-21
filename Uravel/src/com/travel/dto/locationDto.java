package com.travel.dto;

public class locationDto {
	
	private int localcode;
	private String localname;
	
	
	public locationDto(int localcode, String localname) {
		super();
		this.localcode = localcode;
		this.localname = localname;
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
