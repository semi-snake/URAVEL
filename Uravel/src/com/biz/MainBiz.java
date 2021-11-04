package com.biz;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.dao.HistoryDao;
import com.dao.HistoryDaoImpl;
import com.dao.TravelDao;
import com.dao.WeatherDao;
import com.dto.BlogDto;
import com.dto.HistoryDto;
import com.dto.TravelDto;
import com.dto.WeatherDto;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import api.weather.WeatherAPI;

public class MainBiz {
	private TravelDao t_dao = new TravelDao();
	private HistoryDao h_dao = new HistoryDaoImpl();
	private WeatherDao w_dao = new WeatherDao();

	public List<TravelDto> search(String keyword) {
		Connection conn = getConnection();

		List<TravelDto> res = t_dao.search(conn, keyword);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public List<HistoryDto> search(String keyword, String isHistorySearch) {
		Connection conn = getConnection();

		List<HistoryDto> res = h_dao.search(conn, keyword);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public List<TravelDto> list(String type, int userno) {
		Connection conn = getConnection();

		List<TravelDto> res = null;

		if (type.equals("pp")) {
			res = t_dao.selectPopular(conn);
		} else if (type.equals("pf")) {
			res = t_dao.selectPrefered(conn, userno);
		}

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public WeatherDto forecast() {
		WeatherDto dto = null;
		WeatherAPI api = new WeatherAPI();

		JsonObject weather = api.requestInfo("weather");
		JsonObject main = api.requestInfo("main");

		/*
		 * DB에 접근하지 않아도 설정 가능한 날씨 정보
		 */
		int w_id = weather.get("id").getAsInt();
		String icon = weather.get("icon").getAsString();
		double temp_cur = Math.round((main.get("temp").getAsDouble() - 273.15) * 10) / 10.0;
		double temp_min = Math.round((main.get("temp_min").getAsDouble() - 273.15) * 10) / 10.0;
		double temp_max = Math.round((main.get("temp_max").getAsDouble() - 273.15) * 10) / 10.0;
		int humidity = main.get("humidity").getAsInt();

		Connection conn = getConnection();

		/*
		 * DB에 접속하여 번역 정보를 받아옴
		 */
		String description = w_dao.translate(conn, w_id);

		close(conn);
		System.out.println("05. db 종료\n");

		dto = new WeatherDto(w_id, description, icon, temp_cur, temp_min, temp_max, humidity);

		return dto;
	}
}
