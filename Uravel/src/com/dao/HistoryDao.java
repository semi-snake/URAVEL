package com.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.HistoryDto;
import com.dto.TravelDto;

public interface HistoryDao {

	String selectAllSql = " SELECT HISTORYNO, TRAVELNAME, URL_PIC1 FROM HISTORY ORDER BY HISTORYNO DESC ";
	String selectOneSql = " SELECT HISTORYNO, TRAVELNAME, URL_PIC1, URL_PIC2, DESCRIPTION, SOURCE FROM HISTORY WHERE HISTORYNO=?";

	String insertTravelSql = " INSERT INTO TRAVEL(TRAVELNO,TRAVELNAME,LOCALCODE,THEMECODE,ADDRESS,DESCRIPTION,URL_PIC) VALUES(?,?,?,6,?,?,?) ";
	String insertHistorySql = " INSERT INTO HISTORY(TRAVELNO,HISTORYNO,TRAVELNAME,URL_PIC1,URL_PIC2,DESCRIPTION,SOURCE) VALUES(?,HISTORYSEQ.NEXTVAL,?,?,?,?,?) ";

	String updateHistorySql = " UPDATE HISTORY SET TRAVELNAME=?, URL_PIC1=?, URL_PIC2=?, DESCRIPTION=?, SOURCE=? WHERE HISTORYNO=?";

	String deleteSql = " DELETE FROM HISTORY WHERE HISTORYNO=? ";

	public List<HistoryDto> selectAll(Connection con, String language);

	public HistoryDto selectOne(Connection con, int historyno, String language);

	public boolean insert(Connection con, HistoryDto dto, TravelDto tdto);

	public int insertTravel(Connection con, TravelDto dto);

	public boolean update(Connection con, HistoryDto dto);

	public boolean delete(Connection con, int dto);

	public List<HistoryDto> search(Connection conn, String keyword);

}
