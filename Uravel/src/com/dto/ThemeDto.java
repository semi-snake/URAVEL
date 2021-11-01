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

	public String getThemename(int themecode) {
		switch (themecode) {
		case 1:
			this.themename = "공원";
			break;
		case 2:
			this.themename = "등산";
			break;
		case 3:
			this.themename = "맛집";
			break;
		case 4:
			this.themename = "산책";
			break;
		case 5:
			this.themename = "야경";
			break;
		case 6:
			this.themename = "역사/문화";
			break;
		case 7:
			this.themename = "책방";
			break;
		case 8:
			this.themename = "카페";
			break;
		case 9:
			this.themename = "캠핑";
			break;
		case 10:
			this.themename = "호캉스";
			break;
		}
		return themename;
	}

	public void setThemename(String themename) {
		this.themename = themename;
	}

}
