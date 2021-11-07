package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.UserLocalDto;
import com.dto.UserThemeDto;

import common.JDBCTemplate;

public class UserThemeDao extends JDBCTemplate {

	// 유저별 선호테마 저장
	public int insertTheme(String userId, String themeCode) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql = " INSERT INTO USER_THEMA (USERID,THEMECODE)VALUES(?,?) ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, userId);
			pstm.setString(2, themeCode);

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

		return res;
	}

	// 유저별 선호테마 삭제
	public void deleteUserTheme(String userId) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql = " DELETE FROM USER_THEMA WHERE USERID = ? ";

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

	// 유저별 선호테마 조회
	public List<UserThemeDto> selectUserTheme(String userId) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;

		StringBuffer sbf = new StringBuffer();
		sbf.append(" SELECT");
		sbf.append("   A.THEMECODE");
		sbf.append("   ,B.THEMENAME");
		sbf.append(" FROM USER_THEMA A");
		sbf.append(" LEFT JOIN THEME B ON A.THEMECODE = B.THEMECODE");
		sbf.append(" WHERE A.USERID = ?");

		List<UserThemeDto> rtnList = new ArrayList<UserThemeDto>();

		try {
			pstm = con.prepareStatement(sbf.toString());
			pstm.setString(1, userId);

			rs = pstm.executeQuery();

			while (rs.next()) {
				UserThemeDto userThemeDto = new UserThemeDto();
				userThemeDto.setThemecode(rs.getInt("THEMECODE"));
				userThemeDto.setThemename(rs.getString("THEMENAME"));
				rtnList.add(userThemeDto);
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
