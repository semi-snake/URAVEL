package com.dto;

public class WeatherDto {
	private int w_id;
	private String description;
	private String icon;
	private double temp_cur;
	private double temp_min;
	private double temp_max;
	private int humidity;

	public WeatherDto(int w_id, String description, String icon, double temp_cur, double temp_min, double temp_max,
			int humidity) {
		super();
		this.w_id = w_id;
		this.description = description;
		this.icon = icon;
		this.temp_cur = temp_cur;
		this.temp_min = temp_min;
		this.temp_max = temp_max;
		this.humidity = humidity;
	}

	public WeatherDto() {
		super();
	}

	public int getW_id() {
		return w_id;
	}

	public void setW_id(int w_id) {
		this.w_id = w_id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public double getTemp_cur() {
		return temp_cur;
	}

	public void setTemp_cur(double temp_cur) {
		this.temp_cur = temp_cur;
	}

	public double getTemp_min() {
		return temp_min;
	}

	public void setTemp_min(double temp_min) {
		this.temp_min = temp_min;
	}

	public double getTemp_max() {
		return temp_max;
	}

	public void setTemp_max(double temp_max) {
		this.temp_max = temp_max;
	}

	public int getHumidity() {
		return humidity;
	}

	public void setHumidity(int humidity) {
		this.humidity = humidity;
	}
}
