package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.dto.ReviewDto;

import static common.JDBCTemplateDW.*;
import common.JDBCTemplateDW;

public class ReviewDao extends JDBCTemplateDW{
	
	
	
	public List<ReviewDto> searchReview(String keyword) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ReviewDto> res = new ArrayList<ReviewDto>();
	
		
		String sql = " SELECT * FROM REVIEW WHERE TITLE LIKE ? OR CONTENT LIKE ? ";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, "%"+keyword+"%");
			pstm.setString(2, "%"+keyword+"%");			
			System.out.println("03. 쿼리 준비 : " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. 쿼리 실행 및 리턴");
			System.out.println(rs.getRow());
			
			while(rs.next()) {
				ReviewDto dto = new ReviewDto();
				dto.setPostno(rs.getInt(1));
				dto.setUserno(rs.getInt(2));
				dto.setPostdate(rs.getDate(3));
				dto.setTravelno(rs.getInt(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				
				res.add(dto);
				}
			} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con);
			close(pstm);
			close(rs);
			System.out.println("05. db종료\n");
		}
		return res;
		}
	
	public List<ReviewDto> selectAll(){
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<ReviewDto> res = new ArrayList<ReviewDto>();
		
		String sql = " SELECT * FROM REVIEW ";
		
		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03. QUERY 준비: " + sql);
			
			rs = pstm.executeQuery();
			System.out.println("04. 쿼리 실행 및 리턴");
			
			while(rs.next()) {
				ReviewDto dto = new ReviewDto();
				dto.setPostno(rs.getInt(1));
				dto.setUserno(rs.getInt(2));
				dto.setPostdate(rs.getDate(3));
				dto.setTravelno(rs.getInt(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				
				res.add(dto);
			}
			
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
			
			while(rs.next()) {
				
				res.setPostno(rs.getInt(1));
				res.setUserno(rs.getInt(2));
				res.setPostdate(rs.getDate(3));
				res.setTravelno(rs.getInt(4));
				res.setTitle(rs.getString(5));
				res.setContent(rs.getString(6));
				
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
		
		String sql = " INSERT INTO REVIEW " +
		             " VALUES(POSTNOSQ.NEXTVAL, ?, SYSDATE, 1324,?,?) ";
		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, dto.getUserno());
			
			pstm.setString(2, dto.getTitle());
			pstm.setString(3, dto.getContent());
			System.out.println("03.query 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
				}else {
					rollback(con);
				}
		} catch (SQLException e) {
			System.out.println("3/4 단계 에러");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
		
		String sql = "UPDATE REVIEW SET TITLE=?, CONTENT=? WHERE POSTNO ";
		
		try {
			pstm = con.prepareStatement(sql);
			
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
		
			System.out.println("03. quert 준비: " + sql);
			
			res = pstm.executeUpdate();
			System.out.println("04. query 실행 및 리턴");
			
			if(res>0) {
				commit(con);
			}else {
				rollback(con);
			}
			} catch (SQLException e) {
				System.out.println("3/4 단계 오류");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(con);
			close(pstm);
			System.out.println("05. db종료\n");
		}
		return res;
		
		}
		public int delete(int postno) {
			Connection con = getConnection();
			PreparedStatement pstm = null;
			int res=0;
			
			String sql = "DELETE FROM REVIEW WHERE POSTNO=? ";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setInt(1, postno);
				System.out.println("03. query 준비: " + sql);
				
				res = pstm.executeUpdate();
				System.out.println("04. db 실행 및 리턴");
				
				if(res>0) {
					commit(con);
				}
			} catch (SQLException e) {
				System.out.println("3/4단계 에러");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(con);
				close(pstm);
				System.out.println("05. db종료\n");
			}
			
			return res;
			
		}
}
