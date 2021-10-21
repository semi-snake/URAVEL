package com.travel.dto;

public class travelDto {

	private int TRAVELNO, LOCALCODE, THEMECODE;
	private String TRAVELNAME, ADDRESS, DESCRIPTION, URL_PIC;
	
	//생성자
	public travelDto() {
		super();
	}
	
	
	
	public travelDto(int tRAVELNO, int lOCALCODE, int tHEMECODE, String tRAVELNAME, String aDDRESS, String dESCRIPTION,
			String uRL_PIC) {
		super();
		this.TRAVELNO = tRAVELNO;
		this.LOCALCODE = lOCALCODE;
		this.THEMECODE = tHEMECODE;
		this.TRAVELNAME = tRAVELNAME;
		this.ADDRESS = aDDRESS;
		this.DESCRIPTION = dESCRIPTION;
		this.URL_PIC = uRL_PIC;
	}



	//G&S
	public int getTRAVELNO() {
		return TRAVELNO;
	}
	public void setTRAVELNO(int tRAVELNO) {
		TRAVELNO = tRAVELNO;
	}
	public int getLOCALCODE() {
		return LOCALCODE;
	}
	public void setLOCALCODE(int lOCALCODE) {
		LOCALCODE = lOCALCODE;
	}
	public int getTHEMECODE() {
		return THEMECODE;
	}
	public void setTHEMECODE(int tHEMECODE) {
		THEMECODE = tHEMECODE;
	}
	public String getTRAVELNAME() {
		return TRAVELNAME;
	}
	public void setTRAVELNAME(String tRAVELNAME) {
		TRAVELNAME = tRAVELNAME;
	}
	public String getADDRESS() {
		return ADDRESS;
	}
	public void setADDRESS(String aDDRESS) {
		ADDRESS = aDDRESS;
	}
	public String getDESCRIPTION() {
		return DESCRIPTION;
	}
	public void setDESCRIPTION(String dESCRIPTION) {
		DESCRIPTION = dESCRIPTION;
	}
	public String getURL_PIC() {
		return URL_PIC;
	}
	public void setURL_PIC(String uRL_PIC) {
		URL_PIC = uRL_PIC;
	}
	
	
}
