package com.biz;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.dao.HistoryDao;
import com.dao.HistoryDaoImpl;
import com.dao.TravelDao;
import com.dto.HistoryDto;
import com.dto.TravelDto;

public class HistoryBizImpl implements HistoryBiz {

	HistoryDao dao = new HistoryDaoImpl();

	@Override
	public List<HistoryDto> selectAll(String language) {
		Connection con = getConnection();
		List<HistoryDto> res = dao.selectAll(con, language);
		close(con);
		System.out.println("05.db종료\n");

		return res;
	}

	@Override
	public HistoryDto selectOne(int historyno, String language) {
		Connection con = getConnection();
		HistoryDto res = dao.selectOne(con, historyno, language);

		close(con);
		System.out.println("05.db종료\n");

		return res;
	}

	@Override
	public boolean insert(HistoryDto dto, TravelDto tdto) {
		Connection con = getConnection();
		TravelDao tdao = new TravelDao();
		tdto.setTravelno(tdao.getTopNumber(con) + 1);

		boolean res = dao.insert(con, dto, tdto);

		if (res) {
			commit(con);
		} else {
			rollback(con);
		}

		close(con);
		System.out.println("05.db종료\n");

		return res;
	}

	@Override
	public boolean update(HistoryDto dto) {
		Connection con = getConnection();
		boolean res = dao.update(con, dto);

		if (res) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		System.out.println("05.db 종료\n");

		return res;
	}

	@Override
	public boolean delete(int historyno) {
		Connection con = getConnection();
		boolean res = dao.delete(con, historyno);

		if (res) {
			commit(con);
		} else {
			rollback(con);
		}
		close(con);
		System.out.println("05.db종료\n");

		return res;
	}

}
