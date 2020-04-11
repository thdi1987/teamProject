package board.adopt.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("AdoptVO")
public class AdoptVO {	
	
	private int AANO;
	private int AAPID;	
	private String AAID;
	private String AATITLE;
	private String AACONTENTS;
	private String AADIVISION;
	private String AAKIND;
	private String AALOCATION;
	private String AAGENDER;
	private Date AATIME;
	private String AABUYID;
	
	
	
	
	public String getAABUYID() {
		return AABUYID;
	}
	public void setAABUYID(String aABUYID) {
		AABUYID = aABUYID;
	}
	public int getAANO() {
		return AANO;
	}
	public void setAANO(int aANO) {
		AANO = aANO;
	}
	public int getAAPID() {
		return AAPID;
	}
	public void setAAPID(int aAPID) {
		AAPID = aAPID;
	}	
	
	public String getAAID() {
		return AAID;
	}
	public void setAAID(String aAID) {
		AAID = aAID;
	}
	public String getAATITLE() {
		return AATITLE;
	}
	public void setAATITLE(String aATITLE) {
		AATITLE = aATITLE;
	}
	public String getAACONTENTS() {
		return AACONTENTS;
	}
	public void setAACONTENTS(String aACONTENTS) {
		AACONTENTS = aACONTENTS;
	}
	public String getAADIVISION() {
		return AADIVISION;
	}
	public void setAADIVISION(String aADIVISION) {
		AADIVISION = aADIVISION;
	}
	public String getAAKIND() {
		return AAKIND;
	}
	public void setAAKIND(String aAKIND) {
		AAKIND = aAKIND;
	}
	public String getAALOCATION() {
		return AALOCATION;
	}
	public void setAALOCATION(String aALOCATION) {
		AALOCATION = aALOCATION;
	}
	public String getAAGENDER() {
		return AAGENDER;
	}
	public void setAAGENDER(String aAGENDER) {
		AAGENDER = aAGENDER;
	}
	public Date getAATIME() {
		return AATIME;
	}
	public void setAATIME(Date aATIME) {
		AATIME = aATIME;
	}	
	
	
	
}
