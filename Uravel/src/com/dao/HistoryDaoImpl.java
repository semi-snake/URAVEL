package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.HistoryDto;

import static common.JDBCTemplateNOA.*;

public class HistoryDaoImpl implements HistoryDao {
	
	PreparedStatement pstm = null;
	ResultSet rs = null;
	
	@Override
	public List<HistoryDto> selectAll(Connection con){ // history list
		
		List<HistoryDto> res = new ArrayList<HistoryDto>();
		
		try {
			pstm = con.prepareStatement(selectAllSql);
			System.out.println("03.query 준비: "+selectAllSql);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			while(rs.next()) {
				// SELECT HISTORYNO, TRAVELNAME, URL_PIC1 FROM HISTORY ORDER BY HISTORYNO DESC
				HistoryDto tmp = new HistoryDto();
				tmp.setHistoryno(rs.getInt("historyno"));
				tmp.setTravelname(rs.getString("travelname"));
				tmp.setUrl_pic1(rs.getString("url_pic1"));
				
				res.add(tmp);
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		
		return res;
		
	}
	
	@Override
	public HistoryDto selectOne(Connection con, int historyno) { // description
		
		HistoryDto res = null;
		
		try {
			//SELECT TRAVELNAME, URL_PIC1, URL_PIC2, DESCRIPTION,SOURCE FROM HISTORY WHERE HISTORYNO=?
			pstm = con.prepareStatement(selectOneSql);
			pstm.setInt(1, historyno);
			System.out.println("03.query 준비: "+selectOneSql);
			System.out.println("historyno: "+historyno);
			
			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");
			
			while(rs.next()) {
				res = new HistoryDto();
				res.setTravelname(rs.getString("travelname"));
				res.setUrl_pic1(rs.getString("url_pic1"));
				res.setUrl_pic2(rs.getString("url_pic2"));
				res.setDescription(rs.getString("description"));
				res.setSource(rs.getString("source"));
				
			}
			
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		
		return res;
	}
	
	@Override
	public boolean insert(Connection con, HistoryDto dto) {
		int res = 0;
		try {
			// INSERT INTO HISTORY(TRAVELNO,TRAVELNAME,URL_PIC1,URL_PIC2,DESCRIPTION,SOURCE) VALUES(?,?,?,?,?)
			pstm = con.prepareStatement(insertSql);
			pstm.setString(1, dto.getTravelname());
			pstm.setString(2, dto.getUrl_pic1());
			pstm.setString(3, dto.getUrl_pic2());
			pstm.setString(4, dto.getDescription());
			System.out.println("03.query 준비: "+insertSql);
			
			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");
			
		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
		}
		
		
		return (res>0)? true:false;
	}

	@Override
	public boolean update(Connection con, HistoryDto dto) {
		
		
		return false;
	}

	@Override
	public boolean delete(Connection con, int dto) {
		
		
		return false;
	}
	
	
	
	
}
