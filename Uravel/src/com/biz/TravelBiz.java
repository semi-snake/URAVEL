package com.biz;

import java.util.List;

import com.dao.TravelDwDao;
import com.dto.TravelDetailDto;
import com.dto.TravelListDto;

public class TravelBiz {
	
	TravelDwDao travelDao = new TravelDwDao();
	
	// 지역구명, 여행지 목록 호출
	public String selectLocalName(int localcode) {
		return travelDao.selectLocalName(localcode);
	}

	public List<TravelListDto> selectTravelList(int listcode) {
		return travelDao.selectTravelList(listcode);
	}

	public TravelDetailDto selectTravelDetail(int travelno) {
		return travelDao.selectTravelDetail(travelno);
	}

	public List<TravelListDto> selectThemeList(int themecode) {
		return travelDao.selectThemeName(themecode);
	}
}
