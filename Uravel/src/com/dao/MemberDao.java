package com.dao;

import java.sql.Connection;  
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.dto.MemberDto;

import common.JDBCTemplate;
import oracle.jdbc.proxy.annotation.Pre;

public class MemberDao extends JDBCTemplate{

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
