package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.FaqDto;

import common.JDBCTemplateNOA;

public class FaqDao extends JDBCTemplateNOA{
	
	public List<FaqDto> selectAll(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<FaqDto> res = new ArrayList<FaqDto>();
		
		String sql = " SELECT * FROM FAQ ORDER BY FAQNO DESC ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03.query 준비: "+sql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			while(rs.next()) {
				FaqDto tmp = new FaqDto();
				tmp.setFaqno(rs.getInt(1));
				tmp.setTitle(rs.getString(2));
				tmp.setContent(rs.getString(3));
				
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05.db종료\n");
		}
		
		return res;
	}
	
	public FaqDto selectOne(int faqno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		FaqDto res = new FaqDto();
		
		String sql = " SELECT * FROM FAQ WHERE FAQNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, faqno);
			System.out.println("03.query 준비: "+sql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			if(rs.next()) {
				res.setFaqno(rs.getInt(1));
				res.setTitle(rs.getString(2));
				res.setContent(rs.getString(3));
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05.db종료\n");
		}
		
		return res;
	}
	
	public int insert(FaqDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,?,?) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			System.out.println("03.query 준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}else {
				rollback(con);
			}
			
			
			
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");
		}
		
		
		
		return res;
	}
	
	public int update(FaqDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " UPDATE FAQ SET TITLE=?, CONTENT=? WHERE FAQNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getFaqno());
			System.out.println("03.query 준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}else {
				rollback(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		}finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");
		}
		
		return res;
	}
	
	public int delete(int faqno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " DELETE FROM FAQ WHERE FAQNO=? ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, faqno);
			System.out.println("03.query 준비: "+sql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}else {
				rollback(con);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");
		}
		
		return res;
	}
	
}
