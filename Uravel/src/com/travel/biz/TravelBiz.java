package com.travel.biz;

import java.util.List;

import com.travel.dao.TravelDwDao;
import com.travel.dto.TravelDetailDto;
import com.travel.dto.TravelListDto;

public class TravelBiz {
	
	TravelDwDao travelDao = new TravelDwDao();
	
	// 지역구명 호출
	public String selectLocalName(int localcode) {
		return travelDao.selectLocalName(localcode);
	}
	
	// 테마명 호출
	public String selectThemeName(int themecode) {
		return travelDao.selectThemeName(themecode);
	}
	
	// 지역별 리스트 호출
	public List<TravelListDto> selectTravelList(int areaListCode) {
		return travelDao.selectTravelList(areaListCode);
	}
	
	// 테마별 여행지 리스트 호출
	public List<TravelListDto> selectThemeList(int themeListCode) {
		return travelDao.selectThemeList(themeListCode);
	}
	
	// 여행지 리스트 상세보기
	public TravelDetailDto selectTravelDetail(int travelno) {
		return travelDao.selectTravelDetail(travelno);
	}
	

}
