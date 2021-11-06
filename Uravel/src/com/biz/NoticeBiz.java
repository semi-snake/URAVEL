package com.biz;

import static common.JDBCTemplateDW.*;

import java.sql.Connection;
import java.util.List;

import com.dao.NoticeDao;
import com.dto.NoticeDto;

public class NoticeBiz {
	private NoticeDao dao = new NoticeDao();

	public List<NoticeDto> list(int begin, int end) {
		Connection conn = getConnection();

		List<NoticeDto> res = null;

		res = dao.selectUnit(conn, begin, end);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public int count() {
		Connection conn = getConnection();

		int res = 0;

		res = dao.countAll(conn);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public NoticeDto read(int noticeno) {
		Connection conn = getConnection();

		NoticeDto res = dao.selectOne(conn, noticeno);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public int insert(NoticeDto dto) {
		Connection conn = getConnection();

		int res = dao.insert(conn, dto);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public int update(NoticeDto dto) {
		Connection conn = getConnection();

		int res = dao.update(conn, dto);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public int delete(int noticeno) {
		Connection conn = getConnection();

		int res = dao.delete(conn, noticeno);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public List<NoticeDto> search(String keyword) {
		Connection conn = getConnection();

		List<NoticeDto> res = dao.search(conn, keyword);

		close(conn);
		System.out.println("05. db 종료\n");
		
		return res;
	}
}
