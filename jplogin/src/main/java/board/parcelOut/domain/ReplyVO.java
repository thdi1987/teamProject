package board.parcelOut.domain;

public class ReplyVO {
	
	private int MPNO;
	private int PCNO;
	private int PCNUM;
	private String PCCONTENTS;
	private String PCTITLE;
	private String PCWRITER;
	private String PCTIME;
	private int page;
	
	
	
	
	
	
	
	public int getPCNUM() {
		return PCNUM;
	}
	public void setPCNUM(int pCNUM) {
		PCNUM = pCNUM;
	}
	public int getMPNO() {
		return MPNO;
	}
	public void setMPNO(int mPNO) {
		MPNO = mPNO;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPCNO() {
		return PCNO;
	}
	public void setPCNO(int PCNO) {
		PCNO = PCNO;
	}
	public String getPCCONTENTS() {
		return PCCONTENTS;
	}
	public void setPCCONTENTS(String pCCONTENTS) {
		PCCONTENTS = pCCONTENTS;
	}
	public String getPCTITLE() {
		return PCTITLE;
	}
	public void setPCTITLE(String pCTITLE) {
		PCTITLE = pCTITLE;
	}
	public String getPCWRITER() {
		return PCWRITER;
	}
	public void setPCWRITER(String pCWRITER) {
		PCWRITER = pCWRITER;
	}
	public String getPCTIME() {
		return PCTIME;
	}
	public void setPCTIME(String pCTIME) {
		PCTIME = pCTIME;
	}
	
	
	
	
	
}
