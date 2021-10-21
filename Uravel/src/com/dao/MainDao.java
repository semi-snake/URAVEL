package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.TravelDto;

import static common.JDBCTemplate.getConnection;

public class MainDao {
	public List<TravelDto> search(String keyword) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<TravelDto> res = new ArrayList<TravelDto>();

		String sql = "SELECT * FROM TRAVEL t LEFT JOIN THEME t2 USING(themecode) "
				+ "WHERE t.DESCRIPTION LIKE ? OR t.ADDRESS LIKE ? OR t2.THEMENAME LIKE ?";
		String keyword_sql = "%" + keyword + "%";
		System.out.println("03. 쿼리 준비 : " + sql + ", 키워드 : " + keyword);

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, keyword_sql);
			pstm.setString(2, keyword_sql);
			pstm.setString(3, keyword_sql);

			rs = pstm.executeQuery();
			
			while(rs.next()) {
				TravelDto dto = new TravelDto();
				dto.setTravelno(rs.getInt("travelno"));
				dto.setTravelname(rs.getString("travelname"));
				dto.setDescription(rs.getString("description"));
				dto.setAddress(rs.getString("address"));
				dto.setUrl_pic(rs.getString("url_pic"));
				
				res.add(dto);
			}
			
			System.out.println("쿼리 실행 및 리턴");
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		}
		return res;
	}
}
