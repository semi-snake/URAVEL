package com.travel.dto;

public class themeDto {
	
	private int themecode;
	private String themename;
	
	//생성자
	public themeDto() {
		super();
	}

	public themeDto(int themecode, String themename) {
		super();
		this.themecode = themecode;
		this.themename = themename;
	}

	public int getThemecode() {
		return themecode;
	}

	public void setThemecode(int themecode) {
		this.themecode = themecode;
	}

	public String getThemename() {
		return themename;
	}

	public void setThemename(String themename) {
		this.themename = themename;
	}
	
	
	

	
	
	
}
