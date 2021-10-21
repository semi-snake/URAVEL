package com.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.TravelDto;

public class AdminDao {
	public List<TravelDto> selectTravel(int begin, int end) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<TravelDto> res = new ArrayList<TravelDto>();

		String sql = "SELECT * FROM travel WHERE TRAVELNO BETWEEN ? AND ?";
		System.out.println("03. 쿼리 준비 : " + sql + ", 시작 : " + begin + ", 끝" + end);
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, begin);
			pstm.setInt(2, end);
			rs = pstm.executeQuery();

			while (rs.next()) {
				TravelDto dto = new TravelDto();
				dto.setTravelno(rs.getInt("travelno"));
				dto.setTravelname(rs.getString("travelname"));
				dto.setLocalcode(rs.getInt("localcode"));
				dto.setThemecode(rs.getInt("themecode"));
				res.add(dto);
			}
			System.out.println("쿼리 실행 및 리턴");
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}
		return res;
	}

	public int countTravel() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int res = 0;

		String sql = "select count(*) from travel";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();

			while (rs.next()) {
				res = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}

		return res;
	}

	public TravelDto selectInfo(int travelno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		TravelDto res = new TravelDto();

		String sql = "select * from travel where travelno = ?";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, travelno);
			rs = pstm.executeQuery();

			while (rs.next()) {
				res.setTravelno(rs.getInt("travelno"));
				res.setTravelname(rs.getString("travelname"));
				res.setLocalcode(rs.getInt("localcode"));
				res.setThemecode(rs.getInt("themecode"));
				res.setDescription(rs.getString("description"));
				res.setUrl_pic(rs.getString("url_pic"));
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}

		return res;
	}
	
	public List<TravelDto> selectUser() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<TravelDto> res = new ArrayList<TravelDto>();

		String sql = "SELECT * FROM MEMBER";
		System.out.println("03. 쿼리 준비 : " + sql);
		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();

			while (rs.next()) {
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
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}
		return res;
	}
}
