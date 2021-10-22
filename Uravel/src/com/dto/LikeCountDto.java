package com.dto;

public class LikeCountDto {
	private int userno;
	private int travelno;
	private int likecount;
	public LikeCountDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LikeCountDto(int userno, int travelno, int likecount) {
		super();
		this.userno = userno;
		this.travelno = travelno;
		this.likecount = likecount;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public int getTravelno() {
		return travelno;
	}
	public void setTravelno(int travelno) {
		this.travelno = travelno;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	
	
	
	
	
	
	
	
}
