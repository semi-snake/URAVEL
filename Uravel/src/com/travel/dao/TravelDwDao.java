package com.travel.dao;


import static common.JDBCTemplateDW.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.travel.dto.TravelDetailDto;
import com.travel.dto.TravelListDto;

public class TravelDwDao {
	
	public String selectLocalName(int localcode){
		Connection conn = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String localName = "";
		try {
			String sql = "SELECT LOCALNAME FROM LOCATION WHERE LOCALCODE = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1,localcode);
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
	
	public String selectThemeName(int themecode){
		Connection conn = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String themeName = "";
		try {
			String sql = "SELECT THEMENAME FROM THEME WHERE THEMECODE = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, themecode);
			rs = pstm.executeQuery();
			while (rs.next()) {
				themeName = rs.getString("THEMENAME");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		
		return themeName;
	}

	public List<TravelListDto> selectTravelList(int areaListCode) {
		Connection conn = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<TravelListDto> travelList = new ArrayList<TravelListDto>();
		try {
			String sql = " SELECT * FROM TRAVEL "
					+ " LEFT JOIN THEME USING(THEMECODE) " 
					+ " LEFT JOIN (SELECT TRAVELNO, COUNT(*) AS LIKE_COUNT FROM LIKE_COUNT GROUP BY TRAVELNO) USING(TRAVELNO) " 
					+ " WHERE LOCALCODE=? " 
					+ " ORDER BY TRAVELNO ";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, areaListCode);
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
	
	public List<TravelListDto> selectThemeList(int themeListCode) {
		
		Connection conn = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<TravelListDto> themeList = new ArrayList<TravelListDto>();
		
		try {
			String sql =  " SELECT * FROM TRAVEL " 
					+ " LEFT JOIN THEME USING(THEMECODE) " 
					+ " LEFT JOIN (SELECT TRAVELNO, COUNT(*) AS LIKE_COUNT FROM LIKE_COUNT GROUP BY TRAVELNO) USING(TRAVELNO) " 
					+ " WHERE THEMECODE=? "
					+ " ORDER BY TRAVELNO ";
			
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, themeListCode);
			rs = pstm.executeQuery();
		
			while (rs.next()) {
				TravelListDto travelDto = new TravelListDto();
				travelDto.setUrl_pic(rs.getString("URL_PIC"));
				travelDto.setTravelno(rs.getInt("TRAVELNO"));
				travelDto.setThemename(rs.getString("THEMENAME"));
				travelDto.setTravelname(rs.getString("TRAVELNAME"));
				travelDto.setLike_count(rs.getInt("LIKE_COUNT"));
				
				themeList.add(travelDto);
				}
		}
		catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		};
		
		return themeList;
	}

	public TravelDetailDto selectTravelDetail(int travelno) {
		
		Connection conn = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		TravelDetailDto travelDetail = new TravelDetailDto();
		
		//여기서 받는 code의 값은 DB의 travelno의 값
		try {
			String sql = "SELECT TR.travelname, COUNTNO, ADDRESS, URL_PIC, TRAVELNO "
					+ " FROM TRAVEL TR "
					+ " LEFT JOIN (SELECT travelno, COUNT(travelno) AS COUNTNO FROM like_count GROUP BY travelno) using(travelno)"
					+ " WHERE TRAVELNO = ? "
					+ " ORDER BY TRAVELNO ASC";
			
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, travelno);
			//여기서 받는 code의 값은 DB의 travelno의 값, 즉 파라미터 code == travelno
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				
				travelDetail.setTravelName(rs.getString("TRAVELNAME"));
				travelDetail.setLike_count(rs.getInt("COUNTNO"));
				travelDetail.setTravelAddress(rs.getString("ADDRESS"));
				travelDetail.setUrl_pic(rs.getString("URL_PIC"));
				travelDetail.setTravelno(rs.getInt("TRAVELNO"));
				
				return travelDetail;
				
				
			}
			
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
			finally {
			close(rs);
			close(pstm);
		}
		
		return null;
		
	}

	public TravelDetailDto selectThemeDetail(int travelno) {
		
		Connection conn = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		TravelDetailDto themeDetail = new TravelDetailDto();
		
		//여기서 받는 code의 값은 DB의 travelno의 값
		try {
			String sql = "SELECT TR.travelname, COUNTNO, ADDRESS, URL_PIC, TRAVELNO "
					+ " FROM TRAVEL TR "
					+ " LEFT JOIN (SELECT travelno, COUNT(travelno) AS COUNTNO FROM like_count GROUP BY travelno) using(travelno)"
					+ " WHERE TRAVELNO = ? "
					+ " ORDER BY TRAVELNO ASC";
			
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, travelno);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				
				themeDetail.setTravelName(rs.getString("TRAVELNAME"));
				themeDetail.setLike_count(rs.getInt("COUNTNO"));
				themeDetail.setTravelAddress(rs.getString("ADDRESS"));
				themeDetail.setUrl_pic(rs.getString("URL_PIC"));
				themeDetail.setTravelno(rs.getInt("TRAVELNO"));
				
				return themeDetail;
				
				
			}
			
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
			finally {
			close(rs);
			close(pstm);
		}
		
		return null;
		
	}

	public int selectLikeYn(int travelno, int userno) {
		
		Connection conn = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int result = 0;
		try {
			String sql = " SELECT COUNT(*) AS COUNT"
					+ " FROM LIKE_COUNT LC "
					+ " WHERE TRAVELNO = ? AND USERNO = ?";
			
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, travelno);
			pstm.setInt(2, userno);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				result = rs.getInt("COUNT");
			}

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		
		return result;
	}

	public int insertLikeYn(int travelno, int userno) {
		
		Connection conn = getConnection();
		PreparedStatement pstm = null;
		int rs = 0;
		try {
			
			String sql = "INSERT INTO LIKE_COUNT VALUES (?, ?)";
			
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, userno);
			pstm.setInt(2, travelno);
			
			rs = pstm.executeUpdate();

			if (rs > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return rs;
	}

	public int deleteLikeYn(int travelno, int userno) {
		
		Connection conn = getConnection();
		PreparedStatement pstm = null;
		int rs = 0;
		
		try {
			
			String sql = "DELETE FROM LIKE_COUNT WHERE USERNO = ? AND TRAVELNO = ?";
			
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, userno);
			pstm.setInt(2, travelno);
			
			rs = pstm.executeUpdate();

			if (rs > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return rs;
		
	}

	
}


