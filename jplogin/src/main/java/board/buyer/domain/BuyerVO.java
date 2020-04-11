package board.buyer.domain;



import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("BuyerVO")
public class BuyerVO {
	
	private int BNO;
	private String BID;
	private String BPET;
	private String BCODE;
	private String BBANK;
	private Date BTIME;
	
	
	
	public Date getBTIME() {
		return BTIME;
	}
	public void setBTIME(Date bTIME) {
		BTIME = bTIME;
	}
	public int getBNO() {
		return BNO;
	}
	public void setBNO(int bNO) {
		BNO = bNO;
	}
	public String getBID() {
		return BID;
	}
	public void setBID(String bID) {
		BID = bID;
	}
	public String getBPET() {
		return BPET;
	}
	public void setBPET(String bPET) {
		BPET = bPET;
	}
	public String getBCODE() {
		return BCODE;
	}
	public void setBCODE(String bCODE) {
		BCODE = bCODE;
	}
	public String getBBANK() {
		return BBANK;
	}
	public void setBBANK(String bBANK) {
		BBANK = bBANK;
	}
	
	
}
