package com.biz;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.dao.InquiryDao;
import com.dto.InquiryDto;

public class InquiryBiz {
	private InquiryDao dao = new InquiryDao();

	public List<InquiryDto> list(int begin, int end) {
		Connection conn = getConnection();

		List<InquiryDto> res = null;

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

	/*
	 * 사용자 기능 - 사용자 게시글 조회, 게시글 작성 / 수정 / 삭제(제거)
	 */

	public List<InquiryDto> readList(int inqno) {
		Connection conn = getConnection();

		int groupno = InquiryDao.getGroupno(conn, inqno);
		List<InquiryDto> res = dao.selectByGroup(conn, groupno);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;

	}

	public InquiryDto read(int inqno) {
		Connection conn = getConnection();

		InquiryDto res = dao.selectOne(conn, inqno);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public int write(InquiryDto dto) {
		Connection conn = getConnection();

		int res = dao.insert(conn, dto);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public int modify(InquiryDto dto) {
		Connection conn = getConnection();

		int res = dao.update(conn, dto);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public int discard(int groupno) {
		Connection conn = getConnection();

		int res = dao.discard(conn, groupno);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	/*
	 * 관리자 기능 - 게시글 전체 조회, 답변 작성
	 */

	public int reply(InquiryDto dto) {
		Connection conn = getConnection();

		int[] execute_res = { 0, 0 };
		int res = 0;

		execute_res[0] = dao.insert(conn, dto, dto.getGroupno());

		if (execute_res[0] > 0) {
			commit(conn);
			execute_res[1] = dao.update(conn, dto.getGroupno());
		} else {
			rollback(conn);
		}

		if (execute_res[1] > 0) {
			commit(conn);
			res = 1;
		} else {
			rollback(conn);
		}

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}

	public List<InquiryDto> search(String keyword, int userno) {
		Connection conn = getConnection();

		List<InquiryDto> res = dao.search(conn, keyword, userno);

		close(conn);
		System.out.println("05. db 종료\n");

		return res;
	}
}
