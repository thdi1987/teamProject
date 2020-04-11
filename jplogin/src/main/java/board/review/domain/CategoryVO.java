package board.review.domain;

public class CategoryVO {
	/*
	 petcatename     varchar2(20)    not null,
	 petcatecode     varchar2(30)    not null,
	 petcatecoderef  varchar2(30)    null,
	 */
	
	
	private String petcatename; //펫카테고리이름
	private String petcatecode; //펫카테고리별코드
	private String petcatecoderef;//펫카테고리코드 식별값
	private int level; //펫카테고리 계층값
	
	public String getPetcatename() {
		return petcatename;
	}
	public void setPetcatename(String petcatename) {
		this.petcatename = petcatename;
	}
	public String getPetcatecode() {
		return petcatecode;
	}
	public void setPetcatecode(String petcatecode) {
		this.petcatecode = petcatecode;
	}
	public String getPetcatecoderef() {
		return petcatecoderef;
	}
	public void setPetcatecoderef(String petcatecoderef) {
		this.petcatecoderef = petcatecoderef;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	
}
