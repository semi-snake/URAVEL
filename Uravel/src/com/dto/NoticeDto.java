package com.dto;

public class NoticeDto {
	
	private int noticeno;
	private String title;
	private String content;
	public NoticeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public NoticeDto(int noticeno, String title, String content) {
		super();
		this.noticeno = noticeno;
		this.title = title;
		this.content = content;
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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
	