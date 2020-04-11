package board.review.domain;

import java.util.Date;

public class ReviewViewVO {
/*
	petnum       number          not null,
    petname      varchar2(50)    not null,
    petcatecode  varchar2(30)    not null,
    petcontents  varchar(500)    null,
    petimage     varchar(200)    null,
    petdate      date            default sysdate,
    primary key(petnum)  

*/
	private int petnum;
	private String petname;
	private String petcatecode;
	private String petcontents;
	private String petimage;
	private Date petdate;
	
	private String petcatecoderef;
	private String petcatename;
	
	private String petthumbimage;
	
	public int getPetnum() {
		return petnum;
	}
	public void setPetnum(int petnum) {
		this.petnum = petnum;
	}
	public String getPetname() {
		return petname;
	}
	public void setPetname(String petname) {
		this.petname = petname;
	}
	public String getPetcatecode() {
		return petcatecode;
	}
	public void setPetcatecode(String petcatecode) {
		this.petcatecode = petcatecode;
	}
	
	public String getPetcontents() {
		return petcontents;
	}
	public void setPetcontents(String petcontents) {
		this.petcontents = petcontents;
	}
	public String getPetimage() {
		return petimage;
	}
	public void setPetimage(String petimage) {
		this.petimage = petimage;
	}
	public Date getPetdate() {
		return petdate;
	}
	public void setPetdate(Date petdate) {
		this.petdate = petdate;
	}
	public String getPetcatecoderef() {
		return petcatecoderef;
	}
	public void setPetcatecoderef(String petcatecoderef) {
		this.petcatecoderef = petcatecoderef;
	}
	public String getPetcatename() {
		return petcatename;
	}
	public void setPetcatename(String petcatename) {
		this.petcatename = petcatename;
	}
	public String getPetthumbimage() {
		return petthumbimage;
	}
	public void setPetthumbimage(String petthumbimage) {
		this.petthumbimage = petthumbimage;
	}
	
	
	
	
	
	
	
	
	
	}
