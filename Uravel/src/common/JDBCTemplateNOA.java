package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCTemplateNOA {
	
	//Connection
	public static Connection getConnection() {
		
		//Driver 연결
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("01.Driver 연결");
		} catch (ClassNotFoundException e) {
			System.out.println("01.Driver 연결 실패");
			e.printStackTrace();
		}
		
		//url, id, pw
		String url = "jdbc:oracle:thin:@118.130.245.226:1521:xe";
		String id = "NOA";
		String pw = "NOA";
		
		//put into Connection Variable
		Connection con = null;
		
		//Connect!
		try {
			con = DriverManager.getConnection(url,id,pw);
			System.out.println("02.계정 연결");
			
			//avoid auto commit
			con.setAutoCommit(false);
			
		} catch (SQLException e) {
			System.out.println("02.계정 연결 실패");
			e.printStackTrace();
		}
		
		return con;
	}
	
	//Close
	public static void close(Connection con) {
		try {
			con.close();
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
	
	//Commit
	public static void commit(Connection con) {
		try {
			con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//Rollback
	public static void rollback(Connection con) {
		try {
			con.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
