package com.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.InquiryDto;

public class InquiryDao {
	public List<InquiryDto> selectUnit(Connection conn, int begin, int end) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<InquiryDto> res = new ArrayList<InquiryDto>();

		String sql = "SELECT * FROM (SELECT ROWNUM AS RN, INQUIRY.* FROM INQUIRY) "
				+ "WHERE STATUS != 'DISCARD' AND RN BETWEEN ? AND ? ORDER BY GROUPNO, INQNO";
		System.out.println("03. 쿼리 준비 : " + sql + ", 시작 : " + begin + ", 끝 : " + end);
		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, begin);
			pstm.setInt(2, end);
			rs = pstm.executeQuery();

			System.out.println("04. 쿼리 실행 및 결과 리턴");

			while (rs.next()) {
				InquiryDto dto = new InquiryDto();
				dto.setInqno(rs.getInt("inqno"));
				dto.setGroupno(rs.getInt("groupno"));
				dto.setUserno(rs.getInt("userno"));
				dto.setQue_type(rs.getString("que_type"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostDate(rs.getDate("postdate"));
				dto.setStatus(rs.getString("status"));

				dto.setUsername(getUsername(conn, dto.getUserno()));

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

		String sql = "select count(*) from inquiry";
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

	public List<InquiryDto> selectByGroup(Connection conn, int groupno) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<InquiryDto> resList = new ArrayList<InquiryDto>();

		String sql = "select * from inquiry where groupno=? order by inqno";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, groupno);

			rs = pstm.executeQuery();

			System.out.println("04. 쿼리 실행 및 결과 리턴");

			while (rs.next()) {
				InquiryDto res = new InquiryDto();
				res.setInqno(rs.getInt("inqno"));
				res.setGroupno(rs.getInt("groupno"));
				res.setUserno(rs.getInt("userno"));
				res.setQue_type(rs.getString("que_type"));
				res.setTitle(rs.getString("title"));
				res.setContent(rs.getString("content"));
				res.setPostDate(rs.getDate("postdate"));
				res.setStatus(rs.getString("status"));

				res.setUsername(getUsername(conn, res.getUserno()));

				resList.add(res);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}

		return resList;
	}

	public InquiryDto selectOne(Connection conn, int inqno) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		InquiryDto res = new InquiryDto();

		String sql = "select * from inquiry where inqno=?";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, inqno);

			rs = pstm.executeQuery();

			System.out.println("04. 쿼리 실행 및 결과 리턴");

			if (rs.next()) {
				res.setInqno(inqno);
				res.setGroupno(rs.getInt("groupno"));
				res.setUserno(rs.getInt("userno"));
				res.setQue_type(rs.getString("que_type"));
				res.setTitle(rs.getString("title"));
				res.setContent(rs.getString("content"));
				res.setPostDate(rs.getDate("postdate"));
				res.setStatus(rs.getString("status"));

				res.setUsername(getUsername(conn, res.getUserno()));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}

		return res;
	}

	/*
	 * 사용자가 문의 게시글을 작성하기 위해 사용
	 */
	public int insert(Connection conn, InquiryDto dto) {
		PreparedStatement pstm = null;
		int res = 0;

		// INQNO GROUPNO USERNO QUE_TYPE TITLE CONTENT POSTDATE STATUS
		String sql = "INSERT INTO INQUIRY VALUES(INQSEQ.NEXTVAL,INQ_G_SEQ.NEXTVAL,?,?,?,?,SYSDATE, DEFAULT)";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, dto.getUserno());
			pstm.setString(2, dto.getQue_type());
			pstm.setString(3, dto.getTitle());
			pstm.setString(4, dto.getContent());

			res = pstm.executeUpdate();

			System.out.println("04. 쿼리 실행 및 결과 리턴");

			if (res > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}

		return res;
	}

	/*
	 * 관리자가 답변 글을 작성하기 위해 사용
	 */
	public int insert(Connection conn, InquiryDto dto, int groupno) {
		PreparedStatement pstm = null;
		int res = 0;

		// INQNO GROUPNO USERNO QUETYPE TITLE CONTENT POSTDATE, STATUS
		String sql = "INSERT INTO INQUIRY VALUES(INQSEQ.NEXTVAL, ?,?,?,?,?, SYSDATE, DEFAULT)";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, groupno);
			pstm.setInt(2, dto.getUserno());
			pstm.setString(3, dto.getQue_type());
			pstm.setString(4, dto.getTitle());
			pstm.setString(5, dto.getContent());

			res = pstm.executeUpdate();

			System.out.println("04. 쿼리 실행 및 결과 리턴");

			if (res > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}

		return res;
	}

	/*
	 * 사용자가 게시글 내용을 수정할 때 사용
	 */
	public int update(Connection conn, InquiryDto dto) {
		PreparedStatement pstm = null;
		int res = 0;

		String sql = "UPDATE INQUIRY SET TITLE=?, CONTENT=?, QUE_TYPE=? WHERE INQNO=?";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setString(3, dto.getQue_type());
			pstm.setInt(4, dto.getInqno());

			res = pstm.executeUpdate();

			if (res > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstm);
		}

		return res;
	}

	/*
	 * 관리자가 답변을 달면 상태를 변화시키기 위해 사용
	 */
	public int update(Connection conn, int groupno) {
		PreparedStatement pstm = null;
		int res = 0;

		String sql = "UPDATE INQUIRY SET STATUS='COMPLETE' WHERE GROUPNO = ?";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, groupno);

			res = pstm.executeUpdate();
			System.out.println("04. 쿼리 실행 및 결과 리턴");

			if (res > 0) {
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

		return res;
	}

	/*
	 * 문의 게시판에서 사용자 글을 제거(DB에는 존재)
	 */
	public int discard(Connection conn, int groupno) {
		PreparedStatement pstm = null;
		int res = 0;

		String sql = "UPDATE INQUIRY SET STATUS = 'DISCARD' WHERE GROUPNO = ?";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, groupno);

			res = pstm.executeUpdate();
			System.out.println("04. 쿼리 실행 및 결과 리턴");

			if (res > 0) {
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

		return res;
	}

	/*
	 * 로그인한 사용자의 게시글 중 검색된 키워드를 포함하는 글만 조회
	 */
	public List<InquiryDto> search(Connection conn, String keyword, int userno) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<InquiryDto> res = new ArrayList<InquiryDto>();

		String sql = "SELECT * FROM INQUIRY WHERE TITLE LIKE ? AND CONTENT LIKE ? WHERE USERNO = ?";
		String keyword_sql = "%" + keyword + "%";
		System.out.println("03. 쿼리 준비 : " + sql + ", 키워드 : " + keyword);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, keyword_sql);
			pstm.setString(2, keyword_sql);
			rs = pstm.executeQuery();

			System.out.println("04. 쿼리 실행 및 결과 리턴");

			while (rs.next()) {
				InquiryDto dto = new InquiryDto();
				dto.setInqno(rs.getInt("inqno"));
				dto.setGroupno(rs.getInt("inq_g_no"));
				dto.setUserno(rs.getInt("userno"));
				dto.setQue_type(rs.getString("que_type"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostDate(rs.getDate("postdate"));
				dto.setStatus(rs.getString("status"));

				dto.setUsername(getUsername(conn, userno));

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

	public static String getUsername(Connection conn, int userno) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		String res = null;

		String sql = "SELECT USERNAME FROM MEMBER WHERE USERNO = ?";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, userno);

			rs = pstm.executeQuery();
			System.out.println("04. 쿼리 실행 및 결과 리턴");

			if (rs.next()) {
				res = rs.getString("username");
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

	public static int getGroupno(Connection conn, int inqno) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		int res = 0;

		String sql = "SELECT GROUPNO FROM INQUIRY WHERE INQNO = ?";
		System.out.println("03. 쿼리 준비 : " + sql);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, inqno);

			rs = pstm.executeQuery();
			System.out.println("04. 쿼리 실행 및 결과 리턴");

			if (rs.next()) {
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
}