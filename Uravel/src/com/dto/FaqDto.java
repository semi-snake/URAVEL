package com.dto;

public class FaqDto {
	private int faqno;
	private String title;
	private String content;
	public FaqDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FaqDto(int faqno, String title, String content) {
		super();
		this.faqno = faqno;
		this.title = title;
		this.content = content;
	}
	public int getFaqno() {
		return faqno;
	}
	public void setFaqno(int faqno) {
		this.faqno = faqno;
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
