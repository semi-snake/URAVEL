package com.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.HistoryDto;
import com.dto.TravelDto;

public class HistoryDao {
	/*
	 * ######################################################## 메인페이지에서 사용되는 메소드
	 * search ########################################################
	 */
	public List<HistoryDto> search(Connection conn, String keyword) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<HistoryDto> res = new ArrayList<HistoryDto>();

		String sql = "SELECT * FROM HISTORY h WHERE TRAVELNAME LIKE ? OR DESCRIPTION LIKE ?";
		String keyword_sql = "%" + keyword + "%";
		System.out.println("03. 쿼리 준비 : " + sql + ", 키워드 : " + keyword);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, keyword_sql);
			pstm.setString(2, keyword_sql);

			rs = pstm.executeQuery();
			System.out.println("04. 쿼리 실행 및 결과 리턴");

			while (rs.next()) {
				HistoryDto dto = new HistoryDto();
				dto.setHistoryno(rs.getInt("historyno"));
				dto.setTravelname(rs.getString("travelname"));
				dto.setDescription(rs.getString("description"));
				dto.setUrl_pic1(rs.getString("url_pic1"));

				res.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		return res;
	}

	/*
	 * ########################################################
	 */
}
