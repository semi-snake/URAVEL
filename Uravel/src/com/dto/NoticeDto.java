package com.dto;

import java.util.Date;

public class NoticeDto {
	
	private int noticeno;
	private String title;
	private String content;
	private Date postdate;
	public NoticeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeDto(int noticeno, String title, String content, Date postdate) {
		super();
		this.noticeno = noticeno;
		this.title = title;
		this.content = content;
		this.postdate = postdate;
	}
	public int getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
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
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	
	

}
