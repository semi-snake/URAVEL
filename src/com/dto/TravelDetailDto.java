package com.dto;

import java.util.Arrays;

public class TravelDetailDto {
	
	private String travelName;
	private int like_count;
	private String travelAddress;
	private String url_pic;
	private String review;
	private String[] pic_arr;
	private int travelno;
	private String userName;
	
	public TravelDetailDto() {
		super();
	}



	public TravelDetailDto(String travelName, int like_count, String travelAddress, String url_pic, String[] pic_arr,
			String review, int travelno, String userName) {
		super();
		this.travelName = travelName;
		this.like_count = like_count;
		this.travelAddress = travelAddress;
		this.url_pic = url_pic;
		this.setPic_arr();
		this.review = review;
		this.travelno = travelno;
		this.userName = userName;
	}



	

	public String getTravelName() {
		return travelName;
	}

	public void setTravelName(String travelName) {
		this.travelName = travelName;
	}

	public int getLike_count() {
		return like_count;
	}

	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}

	public String getTravelAddress() {
		return travelAddress;
	}

	public void setTravelAddress(String travelAddress) {
		this.travelAddress = travelAddress;
	}

	public String getUrl_pic() {
		return url_pic;
	}

	public void setUrl_pic(String url_pic) {
		this.url_pic = url_pic;
		this.setPic_arr();
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public int getTravelno() {
		return travelno;
	}

	public void setTravelno(int travelno) {
		this.travelno = travelno;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String[] getPic_arr() {
		return pic_arr;
	}



	public void setPic_arr(String[] pic_arr) {
		this.pic_arr = pic_arr;
	}
	
	public void setPic_arr() {
		this.pic_arr = url_pic.split(","); 
	}	



	@Override
	public String toString() {
		return "TravelDetailDto [travelName=" + travelName + ", like_count=" + like_count + ", travelAddress="
				+ travelAddress + ", url_pic=" + url_pic + ", review=" + review + ", pic_arr="
				+ Arrays.toString(pic_arr) + ", travelno=" + travelno + "]";
	}
	
}
