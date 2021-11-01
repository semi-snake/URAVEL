package com.dto;

public class HistoryDto {
	
	private int historyno;
	private int travelno;
	private String travelname;
	private String description;
	private String url_pic1;
	private String url_pic2;
	private String source;
	
	public HistoryDto() {
		super();
	}
	
	public HistoryDto(int historyno, int travelno, String travelname, String description, String url_pic1, String url_pic2,
			String source) {
		super();
		this.historyno = historyno;
		this.travelno = travelno;
		this.travelname = travelname;
		this.description = description;
		this.url_pic1 = url_pic1;
		this.url_pic2 = url_pic2;
		this.source = source;
	}
	
	public HistoryDto(int historyno, String travelname, String description, String url_pic1, String url_pic2,
			String source) {
		super();
		this.historyno = historyno;
		this.travelname = travelname;
		this.description = description;
		this.url_pic1 = url_pic1;
		this.url_pic2 = url_pic2;
		this.source = source;
	}
	
	public HistoryDto(String travelname, String description, String url_pic1, String url_pic2,
			String source) {
		super();
		this.travelname = travelname;
		this.description = description;
		this.url_pic1 = url_pic1;
		this.url_pic2 = url_pic2;
		this.source = source;
	}
	
	public int getHistoryno() {
		return historyno;
	}

	public void setHistoryno(int historyno) {
		this.historyno = historyno;
	}

	public int getTravelno() {
		return travelno;
	}
	
	public void setTravelno(int travelno) {
		this.travelno = travelno;
	}
	
	public String getTravelname() {
		return travelname;
	}
	public void setTravelname(String travelname) {
		this.travelname = travelname;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUrl_pic1() {
		return url_pic1;
	}

	public void setUrl_pic1(String url_pic1) {
		this.url_pic1 = url_pic1;
	}

	public String getUrl_pic2() {
		return url_pic2;
	}

	public void setUrl_pic2(String url_pic2) {
		this.url_pic2 = url_pic2;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}
	
	
}
