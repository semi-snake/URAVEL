package com.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.MemberDto;

public class MemberDao {
	/*
	 * ######################################################## 관리자페이지에서 사용되는 메소드
	 * selectUnit, countAll, selectEnabled , countEnabled, disableBatch, search
	 * ########################################################
	 */
	public List<MemberDto> selectUnit(Connection conn, int begin, int end) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<MemberDto> res = new ArrayList<MemberDto>();

		String sql = "SELECT * " + "FROM (SELECT ROWNUM AS RN, MEMBER.* FROM MEMBER) " + "WHERE RN BETWEEN ? AND ?"
				+ " ORDER BY USERNO";
		System.out.println("03. 쿼리 준비 : " + sql + ", 시작 : " + begin + ", 끝" + end);
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, begin);
			pstm.setInt(2, end);
			rs = pstm.executeQuery();

			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setUserno(rs.getInt("userno"));
				dto.setUsername(rs.getString("username"));
				dto.setUserid(rs.getString("userid"));
				dto.setRole(rs.getString("role"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setEnabled(rs.getString("enabled"));
				dto.setBirth(rs.getString("birth"));

				res.add(dto);
			}
			System.out.println("쿼리 실행 및 리턴");
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		return res;
	}

	public int countAll(Connection conn) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int res = 0;

		String sql = "select count(*) from member";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
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
		}

		return res;
	}

	public List<MemberDto> selectEnabled(Connection conn, int begin, int end) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<MemberDto> res = new ArrayList<MemberDto>();

		String sql = "SELECT * " + "FROM (SELECT ROWNUM AS RN, MEMBER.* FROM MEMBER) "
				+ "WHERE ENABLED = 'Y' AND RN BETWEEN ? AND ?" + " ORDER BY USERNO";
		System.out.println("03. 쿼리 준비 : " + sql + ", 시작 : " + begin + ", 끝" + end);
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, begin);
			pstm.setInt(2, end);
			rs = pstm.executeQuery();

			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setUserno(rs.getInt("userno"));
				dto.setUsername(rs.getString("username"));
				dto.setUserid(rs.getString("userid"));
				dto.setRole(rs.getString("role"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setEnabled(rs.getString("enabled"));
				dto.setBirth(rs.getString("birth"));

				res.add(dto);
			}
			System.out.println("쿼리 실행 및 리턴");
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		return res;
	}

	public int countEnabled(Connection conn) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int res = 0;

		String sql = "select count(*) from member where enabled='Y'";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
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
		}

		return res;
	}

	public int[] disableBatch(Connection conn, String[] userArray) {
		PreparedStatement pstm = null;
		int res = 0;
		int[] cnt = null;

		String sql = "UPDATE MEMBER SET ENABLED='N' WHERE USERNO = ?";

		try {
			pstm = conn.prepareStatement(sql);
			for (int i = 0; i < userArray.length; i++) {
				pstm.setInt(1, Integer.parseInt(userArray[i]));
				pstm.addBatch();
				System.out.println("03. 쿼리 준비 :" + sql + " (삭제할 번호 : " + userArray[i] + ")");
			}

			cnt = pstm.executeBatch();
			System.out.println("04. 쿼리 실행 및 결과 리턴");

			for (int i = 0; i < cnt.length; i++) {
				if (cnt[i] > 0) {
					res += 1;
				}
			}

			if (userArray.length == res) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
		}

		return cnt;
	}

	public List<MemberDto> search(Connection conn, String keyword) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<MemberDto> res = new ArrayList<MemberDto>();

		String sql = "SELECT * FROM MEMBER WHERE USERID LIKE ? OR USERNAME LIKE ? ORDER BY USERNO";
		String keyword_sql = "%" + keyword + "%";
		System.out.println("03. 쿼리 준비 : " + sql + ", 키워드 : " + keyword);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, keyword_sql);
			pstm.setString(2, keyword_sql);

			rs = pstm.executeQuery();
			System.out.println("04. 쿼리 실행 및 결과 리턴");

			while (rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setUserno(rs.getInt("userno"));
				dto.setUsername(rs.getString("username"));
				dto.setUserid(rs.getString("userid"));
				dto.setRole(rs.getString("role"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setEnabled(rs.getString("enabled"));
				dto.setBirth(rs.getString("birth"));

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
	 * ######################################################## 관리자 페이지 끝
	 */

}
