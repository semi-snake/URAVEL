package com.dto;

public class LocationDto {
	
	private int localcode;
	private String localname;
	
	   public String getLocalname(int localcode) {
		      switch (localcode) {
		      case 1:
		         this.localname = "강남구";
		         break;
		      case 2:
		         this.localname = "강동구";
		         break;
		      case 3:
		         this.localname = "강북구";
		         break;
		      case 4:
		         this.localname = "강서구";
		         break;
		      case 5:
		         this.localname = "관악구";
		         break;
		      case 6:
		         this.localname = "광진구";
		         break;
		      case 7:
		         this.localname = "구로구";
		         break;
		      case 8:
		         this.localname = "금천구";
		         break;
		      case 9:
		         this.localname = "노원구";
		         break;
		      case 10:
		         this.localname = "도봉구";
		         break;
		      case 11:
		         this.localname = "동대문구";
		         break;
		      case 12:
		         this.localname = "동작구";
		         break;
		      case 13:
		         this.localname = "마포구";
		         break;
		      case 14:
		         this.localname = "서대문구";
		         break;
		      case 15:
		         this.localname = "서초";
		         break;
		      case 16:
		         this.localname = "성동구";
		         break;
		      case 17:
		         this.localname = "성북구";
		         break;
		      case 18:
		         this.localname = "송파구";
		         break;
		      case 19:
		         this.localname = "양천구";
		         break;
		      case 20:
		         this.localname = "영등포구";
		         break;
		      case 21:
		         this.localname = "용산구";
		         break;
		      case 22:
		         this.localname = "은평구";
		         break;
		      case 23:
		         this.localname = "종로구";
		         break;
		      case 24:
		         this.localname = "중구";
		         break;
		      case 25:
		         this.localname = "중랑구";
		         break;
		      }
		      return localname;
		   }
	public LocationDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LocationDto(int localcode, String localname) {
		super();
		this.localcode = localcode;
		this.localname = localname;
	}
	public int getLocalcode() {
		return localcode;
	}
	public void setLocalcode(int localcode) {
		this.localcode = localcode;
	}
	public String getLocalname() {
		return localname;
	}
	public void setLocalname(String localname) {
		this.localname = localname;
	}
	
	

}
