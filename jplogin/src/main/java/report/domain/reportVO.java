package report.domain;

import org.apache.ibatis.type.Alias;

public class reportVO {
	
	private int RNO;
	private String RREPORTEDID;
	private String RDECLAR;
	private int RPID;
	private String RTITLE;	
	private String RREPORT;
	private String RID;
	private String REMAIL;
	private String RDATE;
	
	reportVO(){}
	
	
	public int getRNO() {
		return RNO;
	}
	public void setRNO(int rNO) {
		RNO = rNO;
	}
	
	public String getRREPORTEDID() {
		return RREPORTEDID;
	}
	public void setRREPORTEDID(String rREPORTEDID) {
		RREPORTEDID = rREPORTEDID;
	}
	public String getRDECLAR() {
		return RDECLAR;
	}
	public void setRDECLAR(String rDECLAR) {
		RDECLAR = rDECLAR;
	}
	public int getRPID() {
		return RPID;
	}
	public void setRPID(int rPID) {
		RPID = rPID;
	}
	public String getRTITLE() {
		return RTITLE;
	}
	public void setRTITLE(String rTITLE) {
		RTITLE = rTITLE;
	}
	
	public String getRREPORT() {
		return RREPORT;
	}
	public void setRREPORT(String rREPORT) {
		RREPORT = rREPORT;
	}
	public String getRID() {
		return RID;
	}
	public void setRID(String rID) {
		RID = rID;
	}
	public String getREMAIL() {
		return REMAIL;
	}
	public void setREMAIL(String rEMAIL) {
		this.REMAIL = rEMAIL;
	}
	public String getRDATE() {
		return RDATE;
	}
	public void setRDATE(String rDATE) {
		RDATE = rDATE;
	}
	
	@Override
	public String toString() {
		return "reportVO [RNO(글번호)=" + RNO + ", RREPORTEDID(신고된 아이디)=" + RREPORTEDID + " RDECLAR(신고)=" + RDECLAR + ", RPID(게시판번호)=" + RPID
				+ ", RTITLE(제목)=" + RTITLE + ", REPORT(내용)=" + RREPORT + ", RID(신고 ID)=" + RID + ", REMAIL(이메일)=" + REMAIL + ", RDATE="
				+ RDATE + "]";
	}
	
	
	
	
	
	

}
