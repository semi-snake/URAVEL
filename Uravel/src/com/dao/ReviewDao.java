package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.ReviewDto;
import com.dto.LocationDto;
import com.dto.ThemeDto;
import com.dto.TravelDto;

import static common.JDBCTemplate.*;

public class ReviewDao {

	public List<ReviewDto> searchReview(String keyword) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ReviewDto> res = new ArrayList<ReviewDto>();

		String sql = " SELECT * FROM REVIEW WHERE TITLE LIKE ? OR CONTENT LIKE ? ";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, "%" + keyword + "%");
			pstm.setString(2, "%" + keyword + "%");
			System.out.println("03. 쿼리 준비 : " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 쿼리 실행 및 리턴");
			System.out.println(rs.getRow());

			while (rs.next()) {
				ReviewDto dto = new ReviewDto();
				dto.setPostno(rs.getInt(1));
				dto.setUserno(rs.getInt(2));
				dto.setPostdate(rs.getDate(3));
				dto.setTravelno(rs.getInt(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));

				dto.setUsername(new MemberDao().selectUser(dto.getUserno()).getUsername());

				res.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");

			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con);
			close(pstm);
			close(rs);
			System.out.println("05. db종료\n");
		}
		return res;
	}

	public List<ReviewDto> findReview(String localname, String themename) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ReviewDto> res = new ArrayList<ReviewDto>();

		String sql = " SELECT * FROM REVIEW WHERE LOCALNAME=? OR THEMENAME=? ";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, localname);
			pstm.setString(2, themename);
			System.out.println("03. 쿼리 준비 : " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 쿼리 실행 및 리턴");
			System.out.println(rs.getRow());

			while (rs.next()) {
				ReviewDto dto = new ReviewDto();
				dto.setPostno(rs.getInt(1));
				dto.setUserno(rs.getInt(2));
				dto.setPostdate(rs.getDate(3));
				dto.setTravelno(rs.getInt(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setLocalname(rs.getString(7));
				dto.setThemename(rs.getString(8));

				dto.setUsername(new MemberDao().selectUser(dto.getUserno()).getUsername());

				res.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");

			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con);
			close(pstm);
			close(rs);
			System.out.println("05. db종료\n");
		}
		return res;
	}

	public List<ReviewDto> selectAll() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ReviewDto> res = new ArrayList<ReviewDto>();

		String sql = " SELECT * FROM REVIEW ORDER BY POSTNO ";

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. QUERY 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. 쿼리 실행 및 리턴");

			while (rs.next()) {
				ReviewDto dto = new ReviewDto();
				dto.setPostno(rs.getInt(1));
				dto.setUserno(rs.getInt(2));
				dto.setPostdate(rs.getDate(3));
				dto.setTravelno(rs.getInt(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));

				dto.setUsername(new MemberDao().selectUser(dto.getUserno()).getUsername());

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con);
			close(pstm);
			close(rs);
			System.out.println("05. db종료\n");
		}
		return res;
	}

	public ReviewDto selectOne(int postno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		ReviewDto res = new ReviewDto();

		String sql = " SELECT * FROM REVIEW WHERE POSTNO=? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, postno);

			System.out.println("03. query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04. query 실행 및 리턴");

			while (rs.next()) {

				res.setPostno(rs.getInt(1));
				res.setUserno(rs.getInt(2));
				res.setPostdate(rs.getDate(3));
				res.setTravelno(rs.getInt(4));
				res.setTitle(rs.getString(5));
				res.setContent(rs.getString(6));
				res.setFilename(rs.getString(7));
				res.setFilesize(rs.getLong(8));
				res.setLocalname(rs.getString(9));
				res.setThemename(rs.getString(10));

				res.setUsername(new MemberDao().selectUser(res.getUserno()).getUsername());
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con);
			close(pstm);
			close(rs);
			System.out.println("05. db종료\n");
		}
		return res;
	}

	public List<TravelDto> selectTravel() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<TravelDto> res = new ArrayList<TravelDto>();

		String sql = " SELECT TRAVELNO, TRAVELNAME FROM TRAVEL ";

		System.out.println("03. query 준비 : " + sql);

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("04. query 실행 및 리턴");

			rs = pstm.executeQuery();

			while (rs.next()) {
				TravelDto dto = new TravelDto();
				dto.setTravelno(rs.getInt(1));
				dto.setTravelname(rs.getString(2));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con);
			close(pstm);
			close(rs);
			System.out.println("05. db종료\n");
		}

		return res;

	}

	public List<LocationDto> selectLocation() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<LocationDto> res = new ArrayList<LocationDto>();

		String sql = " SELECT LOCALCODE, LOCALNAME FROM LOCATION ";

		System.out.println("03. query 준비 : " + sql);

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("04. query 실행 및 리턴");

			rs = pstm.executeQuery();

			while (rs.next()) {
				LocationDto dto = new LocationDto();
				dto.setLocalcode(rs.getInt(1));
				dto.setLocalname(rs.getString(2));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con);
			close(pstm);
			close(rs);
			System.out.println("05. db종료\n");
		}

		return res;

	}

	public List<ThemeDto> selectTheme() {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<ThemeDto> res = new ArrayList<ThemeDto>();

		String sql = " SELECT THEMECODE, THEMENAME FROM THEME ";

		System.out.println("03. query 준비 : " + sql);

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("04. query 실행 및 리턴");

			rs = pstm.executeQuery();

			while (rs.next()) {
				ThemeDto dto = new ThemeDto();
				dto.setThemecode(rs.getInt(1));
				dto.setThemename(rs.getString(2));

				res.add(dto);
			}

		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con);
			close(pstm);
			close(rs);
			System.out.println("05. db종료\n");
		}

		return res;

	}

	public int insert(ReviewDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		// POSTNO USERNO POSTDATE TRAVELNO TITLE CONTENT FILENAME FILESIZE localname
		// themename travelname
		String sql = " INSERT INTO REVIEW " + " VALUES(POSTNOSEQ.NEXTVAL, ?, SYSDATE, ?,?,?,?,?,?,? ) ";

		try {

			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dto.getUserno());
			pstm.setInt(2, dto.getTravelno());
			pstm.setString(3, dto.getTitle());
			pstm.setString(4, dto.getContent());

			pstm.setString(5, dto.getFilename());
			pstm.setLong(6, dto.getFilesize());
			pstm.setString(7, dto.getLocalname());
			pstm.setString(8, dto.getThemename());

			System.out.println("03.query 준비: " + sql);

			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");

			if (res > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			e.printStackTrace();
		} finally {
			close(con);
			close(pstm);
			System.out.println("05. db종료\n");
		}
		return res;

	}

	public int update(ReviewDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql = " UPDATE REVIEW " + " SET TITLE=?, CONTENT=?, FILENAME=?, FILESIZE=?, LOCALNAME=?, THEMENAME=? "
				+ " WHERE POSTNO=? ";

		try {
			pstm = con.prepareStatement(sql);

			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setString(3, dto.getFilename());
			pstm.setLong(4, dto.getFilesize());
			pstm.setString(5, dto.getLocalname());
			pstm.setString(6, dto.getThemename());
			pstm.setInt(7, dto.getPostno());
			System.out.println("03. quert 준비: " + sql);

			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");

			if (res > 0) {
				commit(con);
			} else {
				rollback(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db종료\n");
		}

		return res;

	}

	public int delete(int postno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql = "DELETE FROM REVIEW WHERE POSTNO=? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, postno);
			System.out.println("03. query 준비: " + sql);

			res = pstm.executeUpdate();
			System.out.println("04. db 실행 및 리턴");

			if (res > 0) {
				commit(con);
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(con);
			close(pstm);
			System.out.println("05. db종료\n");
		}

		return res;

	}

	public String getTravelname(int travelno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;

		String travelname = null;

		String sql = "select travelname from travel where travelno = ?";

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. query 준비: " + sql);

			pstm.setInt(1, travelno);
			rs = pstm.executeQuery();

			System.out.println("04. db 실행 및 리턴");

			if (rs.next()) {
				travelname = rs.getString(1);
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05. db종료\n");
		}

		return travelname;
	}
}
