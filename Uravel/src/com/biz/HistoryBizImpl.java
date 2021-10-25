package com.biz;

import static common.JDBCTemplateNOA.*;

import java.sql.Connection;
import java.util.List;

import com.dao.HistoryDao;
import com.dao.HistoryDaoImpl;
import com.dto.HistoryDto;

public class HistoryBizImpl implements HistoryBiz{
	
	HistoryDao dao = new HistoryDaoImpl();
	Connection con = getConnection();
	
	@Override
	public List<HistoryDto> selectAll() {
		List<HistoryDto> res = dao.selectAll(con);
		close(con);
		System.out.println("05.db종료\n");
		
		return res;
	}

	@Override
	public HistoryDto selectOne(int historyno) {
		
		HistoryDto res = dao.selectOne(con, historyno);
		
		close(con);
		System.out.println("05.db종료\n");
		
		return res;
	}

	@Override
	public boolean insert(HistoryDto dto) {
		boolean res = dao.insert(con, dto);
		
		if(res) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		System.out.println("05.db종료\n");
		
		return res;
	}

	@Override
	public boolean update(HistoryDto dto) {
		boolean res = dao.update(con, dto);
		
		if(res) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		System.out.println("05.db 종료\n");
		
		return res;
	}

	@Override
	public boolean delete(int historyno) {
		// TODO Auto-generated method stub
		return false;
	}

	
	
	
	
	
}
