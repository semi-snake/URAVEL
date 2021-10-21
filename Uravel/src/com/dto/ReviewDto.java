package com.dto;

import java.util.Date;

public class ReviewDto {

	private int postno;
	private int userno;
	private Date postdate;
	private int travelno;
	private String title;
	private String content;
	public ReviewDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ReviewDto(int postno, int userno, Date postdate, int travelno, String title, String content) {
		super();
		this.postno = postno;
		this.userno = userno;
		this.postdate = postdate;
		this.travelno = travelno;
		this.title = title;
		this.content = content;
	}
	public int getPostno() {
		return postno;
	}
	public void setPostno(int postno) {
		this.postno = postno;
	}
	public int getUserno() {
		return userno;
	}
	public void setUserno(int userno) {
		this.userno = userno;
	}
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	public int getTravelno() {
		return travelno;
	}
	public void setTravelno(int travelno) {
		this.travelno = travelno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
