package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplateDW {

		public static Connection getConnection() {
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				System.out.println("01. 드라이버 연결");
			} catch (ClassNotFoundException e) {
				System.out.println("01. 드라이버 연결 실패");
				e.printStackTrace();
			}
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "DW";
			String pw = "DW";
			
			Connection conn = null;
			
			try {
				conn = DriverManager.getConnection(url,id,pw);
				System.out.println("02. 계정 연결");
				
				conn.setAutoCommit(false);
				
			} catch (SQLException e) {
				System.out.println("02. 계정 연결 실패");
				e.printStackTrace();
			}
					
			
					
					return conn;
		}
		
		public static void close(Connection conn) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		public static void close(Statement stmt) {
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		public static void close(ResultSet rs) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		public static void commit(Connection conn) {
			try {
				conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		public static void rollback(Connection conn) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		
}
