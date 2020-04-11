package board.review.domain;

import java.util.Date;

public class ReplyListVO {

	/*
	petnum number not null,
	mid varchar2(50) not null,
	repnum number not null,
	repcon varchar2(4000) not null,
	repdate date default sysdate,
	*/
	
	private int petnum;
	private String mid;
	private int repnum;
	private String repcon;
	private Date repdate;
	
	private String mname;
	
	public int getPetnum() {
		return petnum;
	}
	public void setPetnum(int petnum) {
		this.petnum = petnum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getRepnum() {
		return repnum;
	}
	public void setRepnum(int repnum) {
		this.repnum = repnum;
	}
	public String getRepcon() {
		return repcon;
	}
	public void setRepcon(String repcon) {
		this.repcon = repcon;
	}
	public Date getRepdate() {
		return repdate;
	}
	public void setRepdate(Date repdate) {
		this.repdate = repdate;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	
	
	
}
