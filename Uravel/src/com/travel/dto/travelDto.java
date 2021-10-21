package com.travel.dto;

public class travelDto {

	private int travelno, localcode, themecode;
	private String travelname, address, description, url_pic;
	
	//생성자
	public travelDto() {
		super();
	}

	public travelDto(int travelno, int localcode, int themecode, String travelname, String address, String description,
			String url_pic) {
		super();
		this.travelno = travelno;
		this.localcode = localcode;
		this.themecode = themecode;
		this.travelname = travelname;
		this.address = address;
		this.description = description;
		this.url_pic = url_pic;
	}

	public int getTravelno() {
		return travelno;
	}

	public void setTravelno(int travelno) {
		this.travelno = travelno;
	}

	public int getLocalcode() {
		return localcode;
	}

	public void setLocalcode(int localcode) {
		this.localcode = localcode;
	}

	public int getThemecode() {
		return themecode;
	}

	public void setThemecode(int themecode) {
		this.themecode = themecode;
	}

	public String getTravelname() {
		return travelname;
	}

	public void setTravelname(String travelname) {
		this.travelname = travelname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUrl_pic() {
		return url_pic;
	}

	public void setUrl_pic(String url_pic) {
		this.url_pic = url_pic;
	}
	
	
	
}