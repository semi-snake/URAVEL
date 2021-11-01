package com.biz;

import java.util.List;

import com.dto.HistoryDto;
import com.dto.TravelDto;

public interface HistoryBiz {
	public List<HistoryDto> selectAll(String language);
	public HistoryDto selectOne(int historyno, String language);
	public boolean insert(HistoryDto dto,TravelDto tdto);
	public boolean update(HistoryDto dto);
	public boolean delete(int historyno);
}
