package com.travel.dto;

public class themeDto {
	
	private int THEMECODE;
	private String THEMENAME;
	
	//생성자
	public themeDto() {
		super();
	}
	
	
	
	public themeDto(int tHEMECODE, String tHEMENAME) {
		super();
		this.THEMECODE = tHEMECODE;
		this.THEMENAME = tHEMENAME;
	}



	//g&s
	public int getTHEMECODE() {
		return THEMECODE;
	}

	public void setTHEMECODE(int tHEMECODE) {
		THEMECODE = tHEMECODE;
	}

	public String getTHEMENAME() {
		return THEMENAME;
	}

	public void setTHEMENAME(String tHEMENAME) {
		THEMENAME = tHEMENAME;
	}
	
	
	
}
