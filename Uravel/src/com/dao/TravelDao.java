package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.TravelDto;

import static common.JDBCTemplate.*;

public class TravelDao {
	/*
	 * ######################################################## 메인페이지에서 사용되는 메소드
	 * search, selectPopular, selectPrefered
	 * ########################################################
	 */
	public List<TravelDto> search(Connection conn, String keyword) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<TravelDto> res = new ArrayList<TravelDto>();

		String sql = "SELECT * FROM TRAVEL t LEFT JOIN THEME t2 USING(themecode) " + "WHERE t.TRAVELNAME LIKE ? "
				+ "OR t.DESCRIPTION LIKE ? " + "OR t.ADDRESS LIKE ? " + "OR t2.THEMENAME LIKE ?";
		String keyword_sql = "%" + keyword + "%";
		System.out.println("03. 쿼리 준비 : " + sql + ", 키워드 : " + keyword);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, keyword_sql);
			pstm.setString(2, keyword_sql);
			pstm.setString(3, keyword_sql);
			pstm.setString(4, keyword_sql);

			rs = pstm.executeQuery();
			System.out.println("04. 쿼리 실행 및 결과 리턴");

			while (rs.next()) {
				TravelDto dto = new TravelDto();
				dto.setTravelno(rs.getInt("travelno"));
				dto.setTravelname(rs.getString("travelname"));
				dto.setLocalcode(rs.getInt("localcode"));
				dto.setThemecode(rs.getInt("themecode"));
				dto.setDescription(rs.getString("description"));
				dto.setAddress(rs.getString("address"));
				dto.setUrl_pic(rs.getString("url_pic"));

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

	public List<TravelDto> selectPopular(Connection conn) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<TravelDto> res = new ArrayList<TravelDto>();

		String sql = "SELECT * FROM " + "(SELECT * FROM TRAVEL t LEFT JOIN "
				+ "(SELECT travelno, count(travelno) FROM LIKE_COUNT lc GROUP BY TRAVELNO) USING(TRAVELNO) "
				+ "WHERE rownum BETWEEN 1 AND 16)";

		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);

			rs = pstm.executeQuery();
			System.out.println("04. 쿼리 실행 및 결과 리턴");

			while (rs.next()) {
				TravelDto dto = new TravelDto();
				dto.setTravelno(rs.getInt("travelno"));
				dto.setTravelname(rs.getString("travelname"));
				dto.setUrl_pic(rs.getString("url_pic"));

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

	public List<TravelDto> selectPrefered(Connection conn, int userno) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<TravelDto> res = new ArrayList<TravelDto>();

		String sql = "(SELECT * FROM travel JOIN usertheme using(themecode) WHERE userno=?) " + "UNION "
				+ "(SELECT * FROM travel JOIN USERLOCAL u using(localcode) WHERE userno=?)";

		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, userno);
			pstm.setInt(2, userno);

			rs = pstm.executeQuery();

			while (rs.next()) {
				TravelDto dto = new TravelDto();
				dto.setTravelno(rs.getInt("travelno"));
				dto.setTravelname(rs.getString("travelname"));
				dto.setUrl_pic(rs.getString("url_pic"));

				res.add(dto);
			}

			System.out.println("04. 쿼리 실행 및 리턴");
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
	 * ######################################################## 메인 페이지 끝
	 */

	/*
	 * ######################################################## 관리자페이지에서 사용되는 메소드
	 * selectUnit, selectLocalUnit, selectThemeUnit, countAll, selectOne,
	 * getTopNumber, insert, delete, update
	 * ########################################################
	 */
	public List<TravelDto> selectUnit(Connection conn, int begin, int end) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<TravelDto> res = new ArrayList<TravelDto>();

		String sql = "SELECT * " + "FROM (SELECT ROWNUM AS RN, TRAVEL.* FROM TRAVEL) "
				+ "WHERE RN BETWEEN ? AND ? ORDER BY TRAVELNO";
		System.out.println("03. 쿼리 준비 : " + sql + ", 시작 : " + begin + ", 끝" + end);
		try {
			pstm = conn.prepareStatement(sql);
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
		}
		return res;
	}

	public List<TravelDto> selectLocalUnit(Connection conn, int localcode, int begin, int end) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<TravelDto> res = new ArrayList<TravelDto>();

		String sql = "SELECT * " + "FROM (SELECT ROWNUM AS RN, TRAVEL.* FROM TRAVEL WHERE LOCALCODE = ?) "
				+ "WHERE RN BETWEEN ? AND ? ORDER BY TRAVELNO";
		System.out.println("03. 쿼리 준비 : " + sql + ", 시작 : " + begin + ", 끝" + end);
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, localcode);
			pstm.setInt(2, begin);
			pstm.setInt(3, end);
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
		}
		return res;
	}

	public List<TravelDto> selectThemeUnit(Connection conn, int themecode, int begin, int end) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<TravelDto> res = new ArrayList<TravelDto>();

		String sql = "SELECT * " + "FROM (SELECT ROWNUM AS RN, TRAVEL.* FROM TRAVEL WHERE THEMECODE = ?) "
				+ "WHERE RN BETWEEN ? AND ? ORDER BY TRAVELNO";
		System.out.println("03. 쿼리 준비 : " + sql + ", 시작 : " + begin + ", 끝" + end);
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, themecode);
			pstm.setInt(2, begin);
			pstm.setInt(3, end);
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
		}
		return res;
	}

	public int countAll(Connection conn) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int res = 0;

		String sql = "select count(*) from travel";
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

	public int countLocal(Connection conn, int localcode) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int res = 0;

		String sql = "select count(*) from travel where localcode=?";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, localcode);
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

	public int countTheme(Connection conn, int themecode) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int res = 0;

		String sql = "select count(*) from travel where themecode=?";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, themecode);
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

	public TravelDto selectOne(Connection conn, int travelno) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		TravelDto res = new TravelDto();

		String sql = "select * from travel where travelno = ?";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, travelno);
			rs = pstm.executeQuery();

			while (rs.next()) {
				res.setTravelno(rs.getInt("travelno"));
				res.setTravelname(rs.getString("travelname"));
				res.setLocalcode(rs.getInt("localcode"));
				res.setThemecode(rs.getInt("themecode"));
				res.setAddress(rs.getString("address"));
				res.setDescription(rs.getString("description"));
				res.setUrl_pic(rs.getString("url_pic"));
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

	public int insert(Connection conn, TravelDto dto) {
		PreparedStatement pstm = null;
		int res = 0;

		String sql = "INSERT INTO TRAVEL VALUES(?,?,?,?,?,?,?)";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, dto.getTravelno());
			pstm.setString(2, dto.getTravelname());
			pstm.setInt(3, dto.getLocalcode());
			pstm.setInt(4, dto.getThemecode());
			pstm.setString(5, dto.getAddress());
			pstm.setString(6, dto.getDescription());
			pstm.setString(7, dto.getUrl_pic());

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

	public int update(Connection conn, TravelDto dto) {
		PreparedStatement pstm = null;
		int res = 0;

		String sql = "UPDATE TRAVEL "
				+ "SET TRAVELNAME=?, LOCALCODE=?, THEMECODE=?, ADDRESS=?, DESCRIPTION=?, URL_PIC=? "
				+ "WHERE TRAVELNO = ?";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(7, dto.getTravelno());
			pstm.setString(1, dto.getTravelname());
			pstm.setInt(2, dto.getLocalcode());
			pstm.setInt(3, dto.getThemecode());
			pstm.setString(4, dto.getAddress());
			pstm.setString(5, dto.getDescription());
			pstm.setString(6, dto.getUrl_pic());

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

	public int delete(Connection conn, int travelno) {
		PreparedStatement pstm = null;
		int res = 0;

		String sql = "DELETE FROM TRAVEL WHERE TRAVELNO=?";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, travelno);

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

	/*
	 * insert시에 가장 큰 TRAVELNO를 반환
	 */

	public int getTopNumber(Connection conn) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int res = 0;

		String sql = "SELECT travelno " + "FROM (SELECT travelno FROM travel t ORDER BY travelno DESC) "
				+ "WHERE rownum = 1";
		System.out.println("03. 쿼리 준비 : " + sql);
		try {
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();
			System.out.println("04. 쿼리 실행 및 결과 리턴");

			while (rs.next()) {
				res = rs.getInt("travelno");
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(pstm);
		}

		return res;
	}
	/*
	 * ######################################################## 관리자 페이지 끝
	 */

}
