package com.dto;

import java.util.Date;

public class InquiryDto {

	private int inqno;
	private int groupno;
	private int userno;
	private String que_type;
	private String title;
	private String content;
	private Date postDate;
	private String status;

	private String username;

	public InquiryDto() {
		super();
	}

	public InquiryDto(int inqno, int groupno, int userno, String que_type, String title, String content, Date postDate,
			String status) {
		super();
		this.inqno = inqno;
		this.groupno = groupno;
		this.userno = userno;
		this.que_type = que_type;
		this.title = title;
		this.content = content;
		this.postDate = postDate;
		this.status = status;
	}

	public int getInqno() {
		return inqno;
	}

	public void setInqno(int inqno) {
		this.inqno = inqno;
	}

	public int getGroupno() {
		return groupno;
	}

	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getQue_type() {
		return que_type;
	}

	public void setQue_type(String que_type) {
		switch (que_type) {
		case "login":
			this.que_type = "로그인";
			break;
		case "board":
			this.que_type = "게시판";
			break;
		case "etc":
			this.que_type = "기타";
			break;
		default:
			this.que_type = que_type;
			break;
		}
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

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		switch (status) {
		case "PROCEEDING":
			this.status = "처리중";
			break;
		case "COMPLETE":
			this.status = "답변완료";
			break;
		case "DISCARD":
			this.status = "삭제";
			break;
		default:
			this.status = status;
			break;
		}
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

}
