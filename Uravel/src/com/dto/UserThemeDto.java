package com.dto;

public class UserThemeDto {
	private int userno;
	private int themecode;
	private String themename;
	
	public UserThemeDto() {
		super();
	}

	public UserThemeDto(int userno, int themecode) {
		super();
		this.userno = userno;
		this.themecode = themecode;
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
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
