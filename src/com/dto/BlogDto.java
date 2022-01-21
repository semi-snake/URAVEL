package com.dto;

import java.util.Date;

public class BlogDto {
	private String url;
	private String title;
	private String content;
	private Date postdate;
	private String thumbnail;
	public BlogDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BlogDto(String url, String title, String content, Date postdate, String thumbnail) {
		super();
		this.url = url;
		this.title = title;
		this.content = content;
		this.postdate = postdate;
		this.thumbnail = thumbnail;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	
	
	
	
	
	
	
	
	
	
	
}
