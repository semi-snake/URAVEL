package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.FaqDto;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import api.TranslationAPI.PapagoNMT;
import static common.JDBCTemplate.*;

public class FaqDao {
	PapagoNMT papago = new PapagoNMT();

	public List<FaqDto> selectAll(String language) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<FaqDto> res = new ArrayList<FaqDto>();

		String sql = " SELECT * FROM FAQ ORDER BY FAQNO DESC ";

		try {
			pstm = con.prepareStatement(sql);
			System.out.println("03.query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");

			while (rs.next()) {
				FaqDto tmp = new FaqDto();
				tmp.setFaqno(rs.getInt(1));
				tmp.setTitle(rs.getString(2));
				tmp.setContent(rs.getString(3));

				if (language != null) {

					// translate(String source, String target, String text
					String titleTran = papago.translate(PapagoNMT.KOREAN, language, tmp.getTitle());
					JsonParser parser = new JsonParser();
					JsonElement element = parser.parse(titleTran);

					if (element.getAsJsonObject().get("errorMessage") != null) {
						System.out.println("번역 오류가 발생했습니다. " + "[오류코드 : "
								+ element.getAsJsonObject().get("errorCode").getAsString() + "]");
					} else if (element.getAsJsonObject().get("message") != null) {
						System.out.println("번역 결과: ");
						System.out.println(element.getAsJsonObject().get("message").getAsJsonObject().get("result")
								.getAsJsonObject().get("translatedText").getAsString());
					}
					tmp.setTitle(element.getAsJsonObject().get("message").getAsJsonObject().get("result")
							.getAsJsonObject().get("translatedText").getAsString());

					String contentTran = papago.translate(PapagoNMT.KOREAN, language, tmp.getContent());
					element = parser.parse(contentTran);

					if (element.getAsJsonObject().get("errorMessage") != null) {
						System.out.println("번역 오류가 발생했습니다. " + "[오류코드 : "
								+ element.getAsJsonObject().get("errorCode").getAsString() + "]");
					} else if (element.getAsJsonObject().get("message") != null) {
						System.out.println("번역 결과: ");
						System.out.println(element.getAsJsonObject().get("message").getAsJsonObject().get("result")
								.getAsJsonObject().get("translatedText").getAsString());
					}
					tmp.setContent(element.getAsJsonObject().get("message").getAsJsonObject().get("result")
							.getAsJsonObject().get("translatedText").getAsString());
				}

				res.add(tmp);
			}

		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05.db종료\n");
		}

		return res;
	}

	public FaqDto selectOne(int faqno, String language) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		FaqDto res = new FaqDto();

		String sql = " SELECT * FROM FAQ WHERE FAQNO=? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, faqno);
			System.out.println("03.query 준비: " + sql);

			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");

			while (rs.next()) {
				res.setFaqno(rs.getInt(1));
				res.setTitle(rs.getString(2));
				res.setContent(rs.getString(3));

			}
			if (language != null) {

				// translate(String source, String target, String text
				String titleTran = papago.translate(PapagoNMT.KOREAN, language, res.getTitle());
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(titleTran);

				if (element.getAsJsonObject().get("errorMessage") != null) {
					System.out.println("번역 오류가 발생했습니다. " + "[오류코드 : "
							+ element.getAsJsonObject().get("errorCode").getAsString() + "]");
				} else if (element.getAsJsonObject().get("message") != null) {
					System.out.println("번역 결과: ");
					System.out.println(element.getAsJsonObject().get("message").getAsJsonObject().get("result")
							.getAsJsonObject().get("translatedText").getAsString());
				}
				res.setTitle(element.getAsJsonObject().get("message").getAsJsonObject().get("result").getAsJsonObject()
						.get("translatedText").getAsString());

				String contentTran = papago.translate(PapagoNMT.KOREAN, language, res.getContent());
				element = parser.parse(contentTran);

				if (element.getAsJsonObject().get("errorMessage") != null) {
					System.out.println("번역 오류가 발생했습니다. " + "[오류코드 : "
							+ element.getAsJsonObject().get("errorCode").getAsString() + "]");
				} else if (element.getAsJsonObject().get("message") != null) {
					System.out.println("번역 결과: ");
					System.out.println(element.getAsJsonObject().get("message").getAsJsonObject().get("result")
							.getAsJsonObject().get("translatedText").getAsString());
				}
				res.setContent(element.getAsJsonObject().get("message").getAsJsonObject().get("result")
						.getAsJsonObject().get("translatedText").getAsString());

			}

		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			System.out.println("05.db종료\n");
		}

		return res;
	}

	public int insert(FaqDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql = " INSERT INTO FAQ(FAQNO,TITLE,CONTENT) VALUES(FAQSEQ.NEXTVAL,?,?) ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			System.out.println("03.query 준비: " + sql);

			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");

			if (res > 0) {
				commit(con);
			} else {
				rollback(con);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");
		}

		return res;
	}

	public int update(FaqDto dto) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql = " UPDATE FAQ SET TITLE=?, CONTENT=? WHERE FAQNO=? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, dto.getTitle());
			pstm.setString(2, dto.getContent());
			pstm.setInt(3, dto.getFaqno());
			System.out.println("03.query 준비: " + sql);

			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");

			if (res > 0) {
				commit(con);
			} else {
				rollback(con);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");
		}

		return res;
	}

	public int delete(int faqno) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		int res = 0;

		String sql = " DELETE FROM FAQ WHERE FAQNO=? ";

		try {
			pstm = con.prepareStatement(sql);
			pstm.setInt(1, faqno);
			System.out.println("03.query 준비: " + sql);

			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");

			if (res > 0) {
				commit(con);
			} else {
				rollback(con);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
			System.out.println("05.db 종료\n");
		}

		return res;
	}

}
