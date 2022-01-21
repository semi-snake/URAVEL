package com.biz;

import java.sql.Connection;
import java.util.List;

import com.dao.MemberDao;
import com.dao.TravelDao;
import com.dto.MemberDto;
import com.dto.TravelDto;

import static common.JDBCTemplate.*;

public class AdminBiz {
	private TravelDao t_dao = new TravelDao();
	private MemberDao m_dao = new MemberDao();

	public List<?> list(int begin, int end) {
		Connection conn = getConnection();

		List<?> res = null;

		res = t_dao.selectUnit(conn, begin, end);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public List<?> list(String type, int begin, int end) {
		Connection conn = getConnection();

		List<?> res = null;

		if (type.equals("ma")) {
			res = m_dao.selectUnit(conn, begin, end);
		} else if (type.equals("me")) {
			res = m_dao.selectEnabled(conn, begin, end);
		}

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public List<?> list(int type, int code, int begin, int end) {
		Connection conn = getConnection();

		List<?> res = null;

		if (type == 1) {
			res = t_dao.selectLocalUnit(conn, code, begin, end);
		} else {
			res = t_dao.selectThemeUnit(conn, code, begin, end);
		}

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public int count() {
		Connection conn = getConnection();

		int res = 0;

		res = t_dao.countAll(conn);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public int count(int type, int code) {
		Connection conn = getConnection();

		int res = 0;

		if (type == 1) {
			res = t_dao.countLocal(conn, code);
		} else {
			res = t_dao.countTheme(conn, code);
		}
		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public int count(String type) {
		Connection conn = getConnection();

		int res = 0;

		if (type.equals("ma")) {
			res = m_dao.countAll(conn);
		} else if (type.equals("me")) {
			res = m_dao.countEnabled(conn);
		}

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public TravelDto read(int travelno) {
		Connection conn = getConnection();

		TravelDto res = t_dao.selectOne(conn, travelno);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public int update(TravelDto dto) {
		Connection conn = getConnection();

		int res = t_dao.update(conn, dto);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public int insert(TravelDto dto) {
		Connection conn = getConnection();

		dto.setTravelno(t_dao.getTopNumber(conn) + 1);

		int res = t_dao.insert(conn, dto);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public int delete(int travelno) {
		Connection conn = getConnection();

		int res = t_dao.delete(conn, travelno);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public List<TravelDto> search(String keyword) {
		Connection conn = getConnection();

		List<TravelDto> res = t_dao.search(conn, keyword);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public List<MemberDto> search(String keyword, String isMemberMethod) {
		Connection conn = getConnection();

		List<MemberDto> res = m_dao.search(conn, keyword);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public int[] disable(String[] users) {
		Connection conn = getConnection();

		int[] res = m_dao.disableBatch(conn, users);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}
}
