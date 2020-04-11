package board.service.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("ServiceVO")
public class ServiceVO {
	
	private int SCNUM;
	private String SCTITLE;
	private String SCWRITER;
	private String SCCONTENTS;
	private Date SCWRTIME;
	public int getSCNUM() {
		return SCNUM;
	}
	public void setSCNUM(int sCNUM) {
		SCNUM = sCNUM;
	}
	public String getSCTITLE() {
		return SCTITLE;
	}
	public void setSCTITLE(String sCTITLE) {
		SCTITLE = sCTITLE;
	}
	public String getSCWRITER() {
		return SCWRITER;
	}
	public void setSCWRITER(String sCWRITER) {
		SCWRITER = sCWRITER;
	}
	public String getSCCONTENTS() {
		return SCCONTENTS;
	}
	public void setSCCONTENTS(String sCCONTENTS) {
		SCCONTENTS = sCCONTENTS;
	}
	public Date getSCWRTIME() {
		return SCWRTIME;
	}
	public void setSCWRTIME(Date sCWRTIME) {
		SCWRTIME = sCWRTIME;
	}
	
	
	
}
