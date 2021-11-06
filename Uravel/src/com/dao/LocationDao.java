package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.dto.LocationDto;

import common.JDBCTemplateDW;

import static common.JDBCTemplateDW.*;

public class LocationDao extends JDBCTemplateDW{
	
	//테마 설정
	public int insertLocal(LocationDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;
		
		String sql = " INSERT INTO USERLOCAL VLAUES(USERLOCALSEQ.NEXTVAL, ?) ";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getLocalname());
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
		}
		
		return res;
	}
}
