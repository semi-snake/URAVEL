package com.dto;

public class LocationDto {
	
	private int localcode;
	private String localname;
	public LocationDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LocationDto(int localcode, String localname) {
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
