package com.dto;

import java.util.Date;

public class ReviewDto {

	private int postno;
	private int userno;
	private Date postdate;
	private int travelno;
	private String title;
	private String content;
	private String filename;
	private long filesize;
	private String localname;
	private String themename;
	private String travelname;
	private String username;

	public ReviewDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewDto(int postno, int userno, Date postdate, int travelno, String title, String content, String filename,
			long filesize, String localname, String themename, String travelname) {
		super();
		this.postno = postno;
		this.userno = userno;
		this.postdate = postdate;
		this.travelno = travelno;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.filesize = filesize;
		this.localname = localname;
		this.themename = themename;
		this.travelname = travelname;
	}

	public ReviewDto(int postno, int userno, Date postdate, int travelno, String title, String content, String filename,
			long filesize, String localname, String themename, String travelname, String username) {
		super();
		this.postno = postno;
		this.userno = userno;
		this.postdate = postdate;
		this.travelno = travelno;
		this.title = title;
		this.content = content;
		this.filename = filename;
		this.filesize = filesize;
		this.localname = localname;
		this.themename = themename;
		this.travelname = travelname;
		this.username = username;
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}

	public String getLocalname() {
		return localname;
	}

	public void setLocalname(String localname) {
		this.localname = localname;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
