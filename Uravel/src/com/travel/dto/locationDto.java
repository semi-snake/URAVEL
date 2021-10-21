package com.travel.dto;

public class locationDto {
	
	private int LOCALCODE;
	private String LOCALNAME;
	
	
	
	
	public locationDto(int lOCALCODE, String lOCALNAME) {
		super();
		this.LOCALCODE = lOCALCODE;
		this.LOCALNAME = lOCALNAME;
	}

	//생성자
	public locationDto() {
		super();
	}
	
	//g&s
	public int getLOCALCODE() {
		return LOCALCODE;
	}

	public void setLOCALCODE(int lOCALCODE) {
		LOCALCODE = lOCALCODE;
	}

	public String getLOCALNAME() {
		return LOCALNAME;
	}

	public void setLOCALNAME(String lOCALNAME) {
		LOCALNAME = lOCALNAME;
	}
	
	
}
