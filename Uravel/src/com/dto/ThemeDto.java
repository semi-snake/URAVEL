package com.dto;

public class ThemeDto {
	private int themecode;
	private String themename;
	public ThemeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ThemeDto(int themecode, String themename) {
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
