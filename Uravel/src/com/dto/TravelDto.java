package com.dto;

public class TravelDto {
	   private int travelno;
	   private String travelname;
	   private int localcode;
	   private int themecode;
	   private String address;
	   private String description;
	   private String url_pic;
	   private String[] pic_arr;

	   public TravelDto() {
	      super();
	   }

	   public TravelDto(int travelno, String travelname, int localcode, int themecode, String address, String description,
	         String url_pic) {
	      super();
	      this.travelno = travelno;
	      this.travelname = travelname;
	      this.localcode = localcode;
	      this.themecode = themecode;
	      this.address = address;
	      this.description = description;
	      this.url_pic = url_pic;
	      this.setPic_arr();
	   }

	   public int getTravelno() {
	      return travelno;
	   }

	   public void setTravelno(int travelno) {
	      this.travelno = travelno;
	   }

	   public String getTravelname() {
	      return travelname;
	   }

	   public void setTravelname(String travelname) {
	      this.travelname = travelname;
	   }

	   public int getLocalcode() {
	      return localcode;
	   }

	   public void setLocalcode(int localcode) {
	      this.localcode = localcode;
	   }

	   public int getThemecode() {
	      return themecode;
	   }

	   public void setThemecode(int themecode) {
	      this.themecode = themecode;
	   }

	   public String getAddress() {
	      return address;
	   }

	   public void setAddress(String address) {
	      this.address = address;
	   }

	   public String getDescription() {
	      return description;
	   }

	   public void setDescription(String description) {
	      this.description = description;
	   }

	   public String getUrl_pic() {
	      return url_pic;
	   }

	   public void setUrl_pic(String url_pic) {
	      this.url_pic = url_pic;
	      this.setPic_arr();
	   }

	   public String[] getPic_arr() {
	      return pic_arr;
	   }

	   public void setPic_arr() {
	      this.pic_arr = url_pic.split(","); 
	   }

}
