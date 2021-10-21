package com.travel.dao;

import java.sql.Connection;

public class travelDao {
	
	Connection con = null;
	
	public travelDao() {
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("01. 드라이버 연결");
		} catch (ClassNotFoundException e) {
			System.out.println("01. 드라이버 연결 실패");
			e.printStackTrace();
		}
	}
	
	
	
	
	
}

