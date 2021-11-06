package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.dto.UserLocalDto;

import common.JDBCTemplate;

public class UserLocalDao extends JDBCTemplate{
	//유저별 선호지역 저장
	public int insertLocal(String userId, String localCode) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO USER_LOCATION (USERID,LOCALCODE) VALUES (?,?) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, userId);
			pstm.setString(2, localCode);
			
			res = pstm.executeUpdate();
			
			if(res>0) {
				commit(con);
			}else {
				rollback(con);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		
		return res;
	}
	
	// 유저별 손호지역 삭제
	public void deleteUserLocal(String userId) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql = " DELETE FROM USER_LOCATION WHERE USERID = ? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, userId);

			res = pstm.executeUpdate();

			if (res > 0) {
				commit(con);
			} else {
				rollback(con);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
	}
	
	//유저별 선호지역 조회
	public List<UserLocalDto> selectUserLocal(String userId) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		StringBuffer sbf = new StringBuffer();
		sbf.append(" SELECT");
		sbf.append("  A.LOCALCODE");
		sbf.append("  ,B.LOCALNAME");
		sbf.append(" FROM USER_LOCATION A");
		sbf.append(" LEFT JOIN LOCATION B ON A.LOCALCODE = B.LOCALCODE");
		sbf.append(" WHERE A.USERID = ?");
		
		List<UserLocalDto> rtnList = new ArrayList<UserLocalDto>();
		
		try {
			pstm = con.prepareStatement(sbf.toString());
			pstm.setString(1, userId);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				UserLocalDto userLocalDto = new UserLocalDto();
				userLocalDto.setLocalcode(rs.getInt("LOCALCODE"));
				userLocalDto.setLocalname(rs.getString("LOCALNAME"));
				rtnList.add(userLocalDto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		
		return rtnList;
	}
}
