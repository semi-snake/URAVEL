package com.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.NoticeDto;

public class NoticeDao {
	public List<NoticeDto> selectUnit(Connection conn, int begin, int end) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<NoticeDto> res = new ArrayList<NoticeDto>();

		String sql = "SELECT * " + "FROM (SELECT ROWNUM AS RN, NOTICE.* FROM NOTICE) "
				+ "WHERE RN BETWEEN ? AND ? ORDER BY NOTICENO";
		System.out.println("03. 쿼리 준비 : " + sql + ", 시작 : " + begin + ", 끝 : " + end);
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, begin);
			pstm.setInt(2, end);
			rs = pstm.executeQuery();

			System.out.println("04. 쿼리 실행 및 결과 리턴");

			while (rs.next()) {
				NoticeDto dto = new NoticeDto();

				dto.setNoticeno(rs.getInt("noticeno"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));

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

	public int countAll(Connection conn) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int res = 0;

		String sql = "select count(*) from notice";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();

			System.out.println("04. 쿼리 실행 및 결과 리턴");

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

	public NoticeDto selectOne(Connection conn, int noticeno) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		NoticeDto res = new NoticeDto();

		String sql = "select * from notice where noticeno=?";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, noticeno);

			rs = pstm.executeQuery();

			System.out.println("04. 쿼리 실행 및 결과 리턴");

			if (rs.next()) {
				res.setNoticeno(rs.getInt("noticeno"));
				res.setTitle(rs.getString("title"));
				res.setContent(rs.getString("content"));
				res.setPostdate(rs.getDate("postdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}

		return res;
	}

	public int insert(Connection conn, NoticeDto dto) {
		PreparedStatement pstm = null;
		int res = 0;

		String sql = "INSERT INTO NOTICE VALUES(NOTICESEQ.NEXTVAL,?,?,SYSDATE)";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());

			res = pstm.executeUpdate();

			System.out.println("04. 쿼리 실행 및 결과 리턴");

			if (res > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return res;
	}

	public int update(Connection conn, NoticeDto dto) {
		PreparedStatement pstm = null;
		int res = 0;

		String sql = "UPDATE NOTICE SET TITLE=?, CONTENT=? WHERE NOTICENO=?";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getNoticeno());

			res = pstm.executeUpdate();

			if (res > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return res;
	}

	public int delete(Connection conn, int noticeno) {
		PreparedStatement pstm = null;
		int res = 0;

		String sql = "DELETE FROM NOTICE WHERE NOTICENO=?";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, noticeno);

			res = pstm.executeUpdate();

			System.out.println("04. 쿼리 실행 및 결과 리턴");

			if (res > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return res;
	}

	public List<NoticeDto> search(Connection conn, String keyword) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<NoticeDto> res = new ArrayList<NoticeDto>();

		String sql = "SELECT * FROM NOTICE WHERE TITLE LIKE ? AND CONTENT LIKE ?";
		String keyword_sql = "%" + keyword + "%";
		System.out.println("03. 쿼리 준비 : " + sql + ", 키워드 : " + keyword);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, keyword_sql);
			pstm.setString(2, keyword_sql);
			rs = pstm.executeQuery();

			System.out.println("04. 쿼리 실행 및 결과 리턴");

			while (rs.next()) {
				NoticeDto dto = new NoticeDto();

				dto.setNoticeno(rs.getInt("noticeno"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));

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
}
