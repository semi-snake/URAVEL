package com.travel.dto;


public class TravelListDto {
	
	private String url_pic;
	private String[] pic_arr;
	private int travelno;
	private String themename;
	private String travelname;
	private int like_count;
	
	
	public TravelListDto() {
		super();
	}

	

	public TravelListDto(String url_pic, String[] pic_arr, int travelno, String themename, String travelname,
			int like_count) {
		super();
		this.url_pic = url_pic;
		this.setPic_arr();
		this.travelno = travelno;
		this.themename = themename;
		this.travelname = travelname;
		this.like_count = like_count;
	}



	public String getUrl_pic() {
		return url_pic;
	}


	public void setUrl_pic(String url_pic) {
		this.url_pic = url_pic;
		this.setPic_arr();
	}


	public String[] getPic_arr() {
		return pic_arr;
	}


	public void setPic_arr(String[] pic_arr) {
		this.pic_arr = pic_arr;
	}


	public int getTravelno() {
		return travelno;
	}


	public void setTravelno(int travelno) {
		this.travelno = travelno;
	}


	public String getThemename() {
		return themename;
	}


	public void setThemename(String themename) {
		this.themename = themename;
	}


	public String getTravelname() {
		return travelname;
	}


	public void setTravelname(String travelname) {
		this.travelname = travelname;
	}


	public int getLike_count() {
		return like_count;
	}


	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	
	public void setPic_arr() {
		this.pic_arr = url_pic.split(","); 
	}	

	
	
	
}
