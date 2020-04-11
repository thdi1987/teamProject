package board.free.domain;

import java.util.Date;

import org.apache.ibatis.type.Alias;

@Alias("FreeReplyVO")
public class FreeReplyVO {

	private int fbnumber; //FBNUMER(댓글 넘버) --bno에서 변경
	private int frnumber; //FRNUMBER(번호) --rno에서 변경
	private String frnick; // FRNICK(작성자) -- writer에서 변경
	private String frcontent; //FRCONTENT(댓글내용) -- content에서 변경
	private Date frregdate; // FRREGDATE(날짜) -- regdate에서 변경

	public int getFbnumber() {
		return fbnumber;
	}

	public void setFbnumber(int fbnumber) {
		this.fbnumber = fbnumber;
	}

	public int getFrnumber() {
		return frnumber;
	}

	public void setFrnumber(int frnumber) {
		this.frnumber = frnumber;
	}

	public String getFrnick() {
		return frnick;
	}

	public void setFrnick(String frnick) {
		this.frnick = frnick;
	}

	public String getFrcontent() {
		return frcontent;
	}

	public void setFrcontent(String frcontent) {
		this.frcontent = frcontent;
	}

	public Date getFrregdate() {
		return frregdate;
	}

	public void setFrregdate(Date frregdate) {
		this.frregdate = frregdate;
	}

	@Override
	public String toString() {
		return "ReplyVO [fbnumber=" + fbnumber + ", frnumber=" + frnumber + ", frnick=" + frnick + ", frcontent=" + frcontent + ", frregdate="
				+ frregdate + "]";
	}

}