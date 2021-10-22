package com.dao;

import java.sql.Connection;
import java.util.List;

import com.dto.HistoryDto;

public interface HistoryDao {
	
	String selectAllSql = " SELECT HISTORYNO, TRAVELNAME, URL_PIC1 FROM HISTORY ORDER BY HISTORYNO DESC ";
	String selectOneSql = " SELECT TRAVELNAME, URL_PIC1, URL_PIC2, DESCRIPTION, SOURCE FROM HISTORY WHERE HISTORYNO=? ";
	String insertSql = " INSERT INTO HISTORY(TRAVELSEQ.NEXTVAL,HISTORYSEQ.NEXTVAL,TRAVELNAME,URL_PIC1,URL_PIC2,DESCRIPTION,SOURCE) VALUES(?,?,?,?,?) ";
	String updateSql = " UPDATE HISTORY SET TRAVELNAME=?, URL_PIC1=?, URL_PIC2=?, DESCRIPTION=? WHERE HISTORYNO=? ";
	String deleteSql = " DELETE FROM HISTORY WHERE HISTORYNO=? ";
	
	public List<HistoryDto> selectAll(Connection con);
	public HistoryDto selectOne(Connection con, int historyno);
	public boolean insert(Connection con, HistoryDto dto);
	public boolean update(Connection con, HistoryDto dto);
	public boolean delete(Connection con, int dto);
	
}
