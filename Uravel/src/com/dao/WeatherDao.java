package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.WeatherDto;
import com.google.gson.JsonObject;

import api.weather.WeatherAPI;
import static common.JDBCTemplate.getConnection;

public class WeatherDao {
	public WeatherDto forecast() {
		WeatherDto dto = null;
		WeatherAPI api = new WeatherAPI();

		JsonObject weather = api.requestInfo("weather");
		JsonObject main = api.requestInfo("main");

		int w_id = weather.get("id").getAsInt();
		String description = translate(w_id);
		String icon = weather.get("icon").getAsString();
		double temp_cur = Math.round((main.get("temp").getAsDouble() - 273.15) * 10) / 10.0;
		double temp_min = Math.round((main.get("temp_min").getAsDouble() - 273.15) * 10) / 10.0;
		double temp_max = Math.round((main.get("temp_max").getAsDouble() - 273.15) * 10) / 10.0;
		int humidity = main.get("humidity").getAsInt();

		dto = new WeatherDto(w_id, description, icon, temp_cur, temp_min, temp_max, humidity);

		return dto;
	}

	public static String translate(int w_id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String res = "";

		String sql = "select * from weatherkr where id = ?";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, Integer.toString(w_id));
			rs = pstm.executeQuery();

			while (rs.next()) {
				res = rs.getString(3);
			}

			System.out.println("04. 쿼리 실행 및 리턴");
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}

		return res;
	}
}