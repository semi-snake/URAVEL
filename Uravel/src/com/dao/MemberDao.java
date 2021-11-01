package com.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.MemberDto;


public class MemberDao extends JDBCTemplate{
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

	//로그인
	public MemberDto login(String id, String pw) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto res = new MemberDto();
		
		String sql = " SELECT * FROM MEMBER WHERE USERID=? AND USERPW=? AND ENABLED=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			pstm.setString(2, pw);
			pstm.setString(3, "Y");
			System.out.println("03.query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			while(rs.next()) {
				res.setUserno(rs.getInt(1));
				res.setUserid(rs.getString(2));
				res.setUserpw(rs.getString(3));
				res.setUsername(rs.getString(4));
				res.setBirth(rs.getString(5));
				res.setEmail(rs.getString(6));
				res.setPhone(rs.getString(7));
				res.setRole(rs.getString(8));
				res.setEnabled(rs.getString(9));
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
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
			close(con);
			System.out.println("05. db 종료");
		}
		
		return res;
	}
	
	// 아이디 중복체크
	public String idChk(String id) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String res = null;
		
		String sql = " SELECT * FROM MEMBER WHERE USERID=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, id);
			System.out.println("03.query 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04.qeury 실행 및 리턴");
			
			while(rs.next()) {
				res = rs.getString(2);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
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
			close(con);
			System.out.println("05.db 종료");
		}
		
		return res;
	}
	
	// 회원가입
	public int insertuser(MemberDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO MEMBER VALUES(MEMBERSEQ.NEXTVAL, ?,?,?,?,?,?,'USER','Y') ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getUserid());
			pstm.setString(2, dto.getUserpw());
			pstm.setString(3, dto.getUsername());
			pstm.setString(4, dto.getBirth());
			pstm.setString(5, dto.getEmail());
			pstm.setString(6, dto.getPhone());
			System.out.println("03.query 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}else {
				rollback(con);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("3/4 단계 오류");
		} finally {
			close(pstm);
			close(con);
			System.out.println("05. db 종료");
		}
		
		return res;
	}
	
	// 내 정보 조회
	public MemberDto selectUser(int userno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberDto res = null;
		
		String sql = " SELECT * FROM MEMBER WHERE USERNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, userno);
			System.out.println("03.query 준비: + " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			while(rs.next()) {
				res = new MemberDto();
				res.setUserno(rs.getInt(1));
				res.setUserid(rs.getString(2));
				res.setUserpw(rs.getString(3));
				res.setUsername(rs.getString(4));
				res.setBirth(rs.getString(5));
				res.setEmail(rs.getString(6));
				res.setPhone(rs.getString(7));
				res.setRole(rs.getString(8));
				res.setEnabled(rs.getString(9));
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
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

			close(con);
			System.out.println("05.db 종료");
		}
		
		return res;
	}
	
	// 내 정보 수정
	public boolean updateUser(MemberDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE MEMBER SET USERPW=?, EMAIL=?, PHONE=? WHERE USERNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getUserpw());
			pstm.setString(2, dto.getEmail());
			pstm.setString(3, dto.getPhone());
			pstm.setInt(4, dto.getUserno());
			System.out.println("03.query 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}else {
				rollback(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료");
		}
		
		return (res>0)?true:false;
	}
	
	// 회원 탈퇴
	public boolean deleteUser(int userno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE MEMBER SET ENABLED='N' WHERE USERNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, userno);
			System.out.println("03.query 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}else {
				rollback(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료");
		}
		
		return (res>0)?true:false;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
