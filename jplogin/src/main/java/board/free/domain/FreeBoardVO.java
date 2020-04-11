package board.free.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;


@Alias("FreeBoardVO")
public class FreeBoardVO {

	private int fbnumber; //fbnumber(번호) --bno에서 변경
	private	String fbtitle;	//fbtitle(제목) -- 새롭게 하나 추가
	private String fbcontent;  //fbcontent(글내용) -- writer에서 변경
	private String fbwriter; //fbwriter(작성자) -- title에서 변경
	private String fbpwd; //fbpwd(비밀번호) -- content에서 변경
	private Date fbregdate;  //fbregdate(날짜) -- regdate에서 변경
	
	public int getFbnumber() {
		return fbnumber;
	}
	public void setFbnumber(int fbnumber) {
		this.fbnumber = fbnumber;
	}
	public String getFbtitle() {
		return fbtitle;
	}
	public void setFbtitle(String fbtitle) {
		this.fbtitle = fbtitle;
	}
	public String getFbcontent() {
		return fbcontent;
	}
	public void setFbcontent(String fbcontent) {
		this.fbcontent = fbcontent;
	}
	public String getFbwriter() {
		return fbwriter;
	}
	public void setFbwriter(String fbwriter) {
		this.fbwriter = fbwriter;
	}
	public String getFbpwd() {
		return fbpwd;
	}
	public void setFbpwd(String fbpwd) {
		this.fbpwd = fbpwd;
	}
	public Date getFbregdate() {
		return fbregdate;
	}
	public void setFbregdate(Date fbregdate) {
		this.fbregdate = fbregdate;
	}
	
	@Override
	public String toString() {
		return "BoardVO [fbnumber=" + fbnumber + ", fbtitle=" + fbtitle + ", fbcontent=" + fbcontent + ", fbwriter="
				+ fbwriter + ", fbpwd=" + fbpwd + ", fbregdate=" + fbregdate + "]";
	}
	
}
