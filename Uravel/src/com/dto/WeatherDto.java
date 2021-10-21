package com.dto;

public class WeatherDto {
	private String id;
	private String description;
	private String korean;
	public WeatherDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WeatherDto(String id, String description, String korean) {
		super();
		this.id = id;
		this.description = description;
		this.korean = korean;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getKorean() {
		return korean;
	}
	public void setKorean(String korean) {
		this.korean = korean;
	}
	
}
