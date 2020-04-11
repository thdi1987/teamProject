package board.parcelOut.domain;

import org.apache.ibatis.type.Alias;

@Alias("TotalBoardVO")
public class TotalBoardVO {
	
	public TotalBoardVO() {}
	
	private int MPNO;
	private String MPTITLE;
	private String MPID; 
	private String MPDIVISION;
	private String MPKIND;
	private String MPSIZE;
	private String MPGENDER;
	private String MPLOCATION;
	private	String MPNEUTRAL;
	private	String MPDEPOSIT;
	private String MPREGISTRATION;
	private String PFILENAME;
	private String PORINAME;
	private long filesize;
	private int PBNUM;
	private String MPCONTENT;
	private String MPTIME;
	private String adoptId;
	
	

//	public TotalBoardVO(int mPNO, String mPTITLE, String mPCONTENT) {
//		super();
//		this.MPNO = mPNO;
//		this.MPTITLE = mPTITLE;
//		this.MPCONTENT = mPCONTENT;
//	}
	
	public String getAdoptId() {
		return adoptId;
	}
	public void setAdoptId(String adoptId) {
		this.adoptId = adoptId;
	}
	public String getMPTITLE() {
		return MPTITLE;
	}
	public void setMPTITLE(String mPTITLE) {
		this.MPTITLE = mPTITLE;
	}


	public int getPBNUM() {
		return PBNUM;
	}
	public void setPBNUM(int pBNUM) {
		this.PBNUM = pBNUM;
	}
	public String getMPCONTENT() {
		return MPCONTENT;
	}
	public void setMPCONTENT(String MPCONTENT) {
		this.MPCONTENT = MPCONTENT;
	}
	public String getMPTIME() {
		return MPTIME;
	}
	public void setMPTIME(String MPTIME) {
		this.MPTIME = MPTIME;
	}
	public String getPFILENAME() {
		return PFILENAME;
	}
	public void setPFILENAME(String pFILENAME) {
		this.PFILENAME = pFILENAME;
	}
	
	
	public String getPORINAME() {
		return PORINAME;
	}
	public void setPORINAME(String pORINAME) {
		this.PORINAME = pORINAME;
	}
	public long getFilesize() {
		return filesize;
	}
	public void setFilesize(long filesize) {
		this.filesize = filesize;
	}
	public int getMPNO() {
		return MPNO;
	}
	public void setMPNO(int mPNO) {
		this.MPNO = mPNO;
	}
	public String getMPID() {
		return MPID;
	}
	public void setMPID(String mPID) {
		this.MPID = mPID;
	}
	public String getMPDIVISION() {
		return MPDIVISION;
	}
	public void setMPDIVISION(String mPDIVISION) {
		this.MPDIVISION = mPDIVISION;
	}
	public String getMPKIND() {
		return MPKIND;
	}
	public void setMPKIND(String mPKIND) {
		this.MPKIND = mPKIND;
	}
	public String getMPSIZE() {
		return MPSIZE;
	}
	public void setMPSIZE(String mPSIZE) {
		this.MPSIZE = mPSIZE;
	}
	public String getMPGENDER() {
		return MPGENDER;
	}
	public void setMPGENDER(String mPGENDER) {
		this.MPGENDER = mPGENDER;
	}
	public String getMPLOCATION() {
		return MPLOCATION;
	}
	public void setMPLOCATION(String mPLOCATION) {
		this.MPLOCATION = mPLOCATION;
	}
	public String getMPNEUTRAL() {
		return MPNEUTRAL;
	}
	public void setMPNEUTRAL(String mPNEUTRAL) {
		this.MPNEUTRAL = mPNEUTRAL;
	}
	public String getMPDEPOSIT() {
		return MPDEPOSIT;
	}
	public void setMPDEPOSIT(String mPDEPOSIT) {
		this.MPDEPOSIT = mPDEPOSIT;
	}
	public String getMPREGISTRATION() {
		return MPREGISTRATION;
	}
	public void setMPREGISTRATION(String mPREGISTRATION) {
		this.MPREGISTRATION = mPREGISTRATION;
	}
	
	
	

	

	
	
	
	
}
