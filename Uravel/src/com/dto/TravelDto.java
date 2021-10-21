package com.dto;

public class TravelDto {
	private int travelno;
	private String travelname;
	private int localcode;
	private int themecode;
	private String address;
	private String description;
	private String urlpic;
	public TravelDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TravelDto(int travelno, String travelname, int localcode, int themecode, String address, String description,
			String urlpic) {
		super();
		this.travelno = travelno;
		this.travelname = travelname;
		this.localcode = localcode;
		this.themecode = themecode;
		this.address = address;
		this.description = description;
		this.urlpic = urlpic;
	}
	public int getTravelno() {
		return travelno;
	}
	public void setTravelno(int travelno) {
		this.travelno = travelno;
	}
	public String getTravelname() {
		return travelname;
	}
	public void setTravelname(String travelname) {
		this.travelname = travelname;
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
	public String getUrlpic() {
		return urlpic;
	}
	public void setUrlpic(String urlpic) {
		this.urlpic = urlpic;
	}
	
	
	

}
