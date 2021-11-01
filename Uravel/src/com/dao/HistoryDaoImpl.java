package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dto.HistoryDto;
import com.dto.TravelDto;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import api.TranslationAPI.PapagoNMT;

import static common.JDBCTemplate.close;
import static common.JDBCTemplateNOA.*;

public class HistoryDaoImpl implements HistoryDao {
	PapagoNMT papago = new PapagoNMT();

	@Override
	public List<HistoryDto> selectAll(Connection con, String language) { // history list
		PreparedStatement pstm = null;
		List<HistoryDto> res = new ArrayList<HistoryDto>();
		ResultSet rs = null;

		try {
			pstm = con.prepareStatement(selectAllSql);
			System.out.println("03.query 준비: " + selectAllSql);

			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");

			while (rs.next()) {
				// SELECT HISTORYNO, TRAVELNAME, URL_PIC1 FROM HISTORY ORDER BY HISTORYNO DESC
				HistoryDto tmp = new HistoryDto();
				tmp.setHistoryno(rs.getInt("historyno"));
				tmp.setTravelname(rs.getString("travelname"));
				tmp.setUrl_pic1(rs.getString("url_pic1"));
				if (language != null) {

					// translate(String source, String target, String text
					String travelNameTran = papago.translate(PapagoNMT.KOREAN, language, tmp.getTravelname());
					JsonParser parser = new JsonParser();
					JsonElement element = parser.parse(travelNameTran);

					if (element.getAsJsonObject().get("errorMessage") != null) {
						System.out.println("번역 오류가 발생했습니다. " + "[오류코드 : "
								+ element.getAsJsonObject().get("errorCode").getAsString() + "]");
					} else if (element.getAsJsonObject().get("message") != null) {
						System.out.println("번역 결과: ");
						System.out.println(element.getAsJsonObject().get("message").getAsJsonObject().get("result")
								.getAsJsonObject().get("translatedText").getAsString());
					}
					tmp.setTravelname(element.getAsJsonObject().get("message").getAsJsonObject().get("result")
							.getAsJsonObject().get("translatedText").getAsString());
				}
				res.add(tmp);
			}

		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}

		return res;

	}

	@Override
	public HistoryDto selectOne(Connection con, int historyno, String language) { // description
		PreparedStatement pstm = null;
		HistoryDto res = null;
		ResultSet rs = null;

		try {
			// SELECT TRAVELNAME, URL_PIC1, URL_PIC2, DESCRIPTION,SOURCE FROM HISTORY WHERE
			// HISTORYNO=?
			pstm = con.prepareStatement(selectOneSql);
			pstm.setInt(1, historyno);
			System.out.println("03.query 준비: " + selectOneSql);
			System.out.println("historyno: " + historyno);

			rs = pstm.executeQuery();
			System.out.println("04.query 실행 및 리턴");

			while (rs.next()) {
				res = new HistoryDto();
				res.setHistoryno(rs.getInt("historyno"));
				res.setTravelname(rs.getString("travelname"));
				res.setUrl_pic1(rs.getString("url_pic1"));
				res.setUrl_pic2(rs.getString("url_pic2"));
				res.setDescription(rs.getString("description"));
				res.setSource(rs.getString("source"));

			}
			if (language != null) {

				// translate(String source, String target, String text
				String descTran = papago.translate(PapagoNMT.KOREAN, language, res.getDescription());
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(descTran);

				if (element.getAsJsonObject().get("errorMessage") != null) {
					System.out.println("번역 오류가 발생했습니다. " + "[오류코드 : "
							+ element.getAsJsonObject().get("errorCode").getAsString() + "]");
				} else if (element.getAsJsonObject().get("message") != null) {
					System.out.println("번역 결과: ");
					System.out.println(element.getAsJsonObject().get("message").getAsJsonObject().get("result")
							.getAsJsonObject().get("translatedText").getAsString());
				}
				res.setDescription(element.getAsJsonObject().get("message").getAsJsonObject().get("result")
						.getAsJsonObject().get("translatedText").getAsString());

				String travelNameTran = papago.translate(PapagoNMT.KOREAN, language, res.getTravelname());
				element = parser.parse(travelNameTran);

				if (element.getAsJsonObject().get("errorMessage") != null) {
					System.out.println("번역 오류가 발생했습니다. " + "[오류코드 : "
							+ element.getAsJsonObject().get("errorCode").getAsString() + "]");
				} else if (element.getAsJsonObject().get("message") != null) {
					System.out.println("번역 결과: ");
					System.out.println(element.getAsJsonObject().get("message").getAsJsonObject().get("result")
							.getAsJsonObject().get("translatedText").getAsString());
				}

				res.setTravelname(element.getAsJsonObject().get("message").getAsJsonObject().get("result")
						.getAsJsonObject().get("translatedText").getAsString());
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}

		return res;
	}

	@Override
	public boolean insert(Connection con, HistoryDto dto, TravelDto tdto) {

		PreparedStatement pstm2 = null;
		int res = 0;

		try {
			// INSERT INTO
			// HISTORY(TRAVELNO,HISTORYNO,TRAVELNAME,URL_PIC1,URL_PIC2,DESCRIPTION,SOURCE)
			// VALUES(?,HISTORYSEQ.NEXTVAL,?,?,?,?,?)

			int tmp = insertTravel(con, tdto);

			pstm2 = con.prepareStatement(insertHistorySql);
			pstm2.setInt(1, tmp);
			pstm2.setString(2, dto.getTravelname());
			pstm2.setString(3, dto.getUrl_pic1());
			pstm2.setString(4, dto.getUrl_pic2());
			pstm2.setString(5, dto.getDescription());
			pstm2.setString(6, dto.getSource());
			System.out.println("03.query 준비: " + insertHistorySql);

			res = pstm2.executeUpdate();
			System.out.println("04.query 실행 및 리턴");

		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm2);
		}

		return (res > 0) ? true : false;
	}

	@Override
	public int insertTravel(Connection con, TravelDto dto) {

		PreparedStatement pstm1 = null;
		ResultSet rs = null;
		int res = 0;

		try {
			// INSERT INTO
			// TRAVEL(TRAVELNO,TRAVELNAME,LOCALCODE,THEMECODE,ADDRESS,DESCRIPTION,URL_PIC)
			// VALUES(TRAVELSEQ.NEXTVAL,?,?,6,?,?,?)
			pstm1 = con.prepareStatement(insertTravelSql);
			System.out.println(dto.getTravelname());
			System.out.println(dto.getDescription());
			System.out.println(dto.getUrl_pic());

			System.out.println(dto.getLocalcode());
			System.out.println(dto.getAddress());

			pstm1.setString(1, dto.getTravelname());
			pstm1.setInt(2, dto.getLocalcode());

			pstm1.setString(3, dto.getAddress());
			pstm1.setString(4, dto.getDescription());
			pstm1.setString(5, dto.getUrl_pic());
			System.out.println("03.query 준비: " + insertTravelSql);

			res = pstm1.executeUpdate();
			rs = pstm1.getGeneratedKeys();

			if (rs.next()) {
				res = rs.getInt("TRAVELNO");
				System.out.println(res);
			}

			System.out.println("04.query 실행 및 리턴");

		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm1);
		}

		return (res > 0) ? res : 0;
	}

	@Override
	public boolean update(Connection con, HistoryDto dto) {
		PreparedStatement pstm = null;
		int res = 0;

		try {
			// UPDATE HISTORY SET TRAVELNAME=?, URL_PIC1=?, URL_PIC2=?, DESCRIPTION=?,
			// SOURCE=? WHERE HISTORYNO=?
			pstm = con.prepareStatement(updateHistorySql);
			pstm.setString(1, dto.getTravelname());
			pstm.setString(2, dto.getUrl_pic1());
			pstm.setString(3, dto.getUrl_pic2());
			pstm.setString(4, dto.getDescription());
			pstm.setString(5, dto.getSource());
			pstm.setInt(6, dto.getHistoryno());
			System.out.println("03.query 준비: " + updateHistorySql);

			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");

		} catch (SQLException e) {
			System.out.println("3/4 단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
		}

		return (res > 0) ? true : false;
	}

	@Override
	public boolean delete(Connection con, int historyno) {
		PreparedStatement pstm = null;
		int res = 0;

		try {
			// DELETE FROM HISTORY WHERE HISTORYNO=?
			pstm = con.prepareStatement(deleteSql);
			pstm.setInt(1, historyno);
			System.out.println("03.query 준비: " + deleteSql);

			res = pstm.executeUpdate();
			System.out.println("04.query 실행 및 리턴");

		} catch (SQLException e) {
			System.out.println("3/4단계 오류");
			e.printStackTrace();
		} finally {
			close(pstm);
		}

		return (res > 0) ? true : false;
	}

	public List<HistoryDto> search(Connection conn, String keyword) {
		PreparedStatement pstm = null;
		ResultSet rs = null;

		List<HistoryDto> res = new ArrayList<HistoryDto>();

		String sql = "SELECT * FROM HISTORY h WHERE TRAVELNAME LIKE ? OR DESCRIPTION LIKE ?";
		String keyword_sql = "%" + keyword + "%";
		System.out.println("03. 쿼리 준비 : " + sql + ", 키워드 : " + keyword);

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, keyword_sql);
			pstm.setString(2, keyword_sql);

			rs = pstm.executeQuery();
			System.out.println("04. 쿼리 실행 및 결과 리턴");

			while (rs.next()) {
				HistoryDto dto = new HistoryDto();
				dto.setDescription(rs.getString("description"));
				dto.setHistoryno(rs.getInt("historyno"));
				dto.setTravelname(rs.getString("travelname"));
				dto.setUrl_pic1(rs.getString("url_pic1"));

				res.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("3/4단계 에러");
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
		}
		return res;
	}

}
