package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.TravelDetailDto;
import com.dto.TravelListDto;

import static common.JDBCTemplate.*;

public class TravelDwDao {

	public String selectLocalName(int localcode) {
		Connection conn = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String localName = "";
		try {
			String sql = "SELECT LOCALNAME FROM LOCATION WHERE LOCALCODE = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, localcode);
			rs = pstm.executeQuery();
			while (rs.next()) {
				localName = rs.getString("LOCALNAME");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}

		return localName;
	}

	public List<TravelListDto> selectTravelList(int listcode) {
		Connection conn = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<TravelListDto> travelList = new ArrayList<TravelListDto>();
		try {
			String sql = "SELECT * FROM TRAVEL " + "LEFT JOIN THEME USING(THEMECODE) "
					+ "LEFT JOIN (SELECT TRAVELNO, COUNT(*) AS LIKE_COUNT FROM LIKE_COUNT GROUP BY TRAVELNO) USING(TRAVELNO) "
					+ "WHERE LOCALCODE=? ORDER BY TRAVELNO";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, listcode);
			rs = pstm.executeQuery();

			while (rs.next()) {
				TravelListDto travelDto = new TravelListDto();
				travelDto.setUrl_pic(rs.getString("URL_PIC"));
				travelDto.setTravelno(rs.getInt("TRAVELNO"));
				travelDto.setThemename(rs.getString("THEMENAME"));
				travelDto.setTravelname(rs.getString("TRAVELNAME"));
				travelDto.setLike_count(rs.getInt("LIKE_COUNT"));

				travelList.add(travelDto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}

		return travelList;
	}

	public TravelDetailDto selectTravelDetail(int travelno) {

		Connection conn = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		TravelDetailDto travelDetail = new TravelDetailDto();

		// 여기서 받는 code의 값은 DB의 travelno의 값
		try {
			String sql = "SELECT TR.travelname, COUNTNO, ADDRESS, URL_PIC, TRAVELNO " + " FROM TRAVEL TR "
					+ " LEFT JOIN (SELECT travelno, COUNT(travelno) AS COUNTNO FROM like_count GROUP BY travelno) using(travelno)"
					+ " WHERE TRAVELNO = ? " + " ORDER BY TRAVELNO ASC";

			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, travelno);
			// 여기서 받는 code의 값은 DB의 travelno의 값, 즉 파라미터 code == travelno
			rs = pstm.executeQuery();

			while (rs.next()) {

				travelDetail.setTravelName(rs.getString("TRAVELNAME"));
				travelDetail.setLike_count(rs.getInt("COUNTNO"));
				travelDetail.setTravelAddress(rs.getString("ADDRESS"));
				travelDetail.setUrl_pic(rs.getString("URL_PIC"));
				travelDetail.setTravelno(rs.getInt("TRAVELNO"));

				return travelDetail;

			}
			System.out.println(rs.getRow());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}

		return null;

	}

	public List<TravelListDto> selectThemeName(int themecode) {

		Connection conn = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<TravelListDto> travelList = new ArrayList<TravelListDto>();

		try {
			String sql = "SELECT TR.URL_PIC, TR.TRAVELNO,TH.THEMENAME, TR.TRAVELNAME, LIKE_COUNT, TH.THEMECODE "
					+ " FROM THEME TH " + " JOIN TRAVEL TR ON TH.THEMECODE = TR.THEMECODE "
					+ " LEFT JOIN LIKE_COUNT L ON TR.TRAVELNO = L.TRAVELNO " + " WHERE TH.THEMECODE = ? "
					+ " ORDER BY TR.TRAVELNO ASC ";

			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, themecode);
			rs = pstm.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		;

		return null;
	}
}
