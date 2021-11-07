package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.WeatherDto;
import com.google.gson.JsonObject;

import api.weather.WeatherAPI;
import static common.JDBCTemplateDW.*;

public class WeatherDao {
	public String translate(Connection conn, int w_id) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String res = "";

		String sql = "select * from weatherkr where id = ?";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
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