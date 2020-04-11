package message.domain;

import java.util.Date;

public class MessageVO {

	private int msnum; //번호
	private String msid; //받는ID
	private String msid2; //보낸ID
	private String mstitle; //제목
	private String mscontens; //내용
	private Date mstime;
	
	public int getMsnum() {
		return msnum;
	}
	public void setMsnum(int msnum) {
		this.msnum = msnum;
	}
	public String getMsid() {
		return msid;
	}
	public void setMsid(String msid) {
		this.msid = msid;
	}
	public String getMsid2() {
		return msid2;
	}
	public void setMsid2(String msid2) {
		this.msid2 = msid2;
	}
	public String getMstitle() {
		return mstitle;
	}
	public void setMstitle(String mstitle) {
		this.mstitle = mstitle;
	}
	public String getMscontens() {
		return mscontens;
	}
	public void setMscontens(String mscontens) {
		this.mscontens = mscontens;
	}
	public Date getMstime() {
		return mstime;
	}
	public void setMstime(Date mstime) {
		this.mstime = mstime;
	}
	
	
	
}
