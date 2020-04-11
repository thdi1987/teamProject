package board.quest.domain;

import org.apache.ibatis.type.Alias;

@Alias("QuestVO")
public class QuestVO {
	
	private int QNUM;
	private String QEMAIL;
	private String QTITLE;
	private String QCONTENT;
	
	
	public int getQNUM() {
		return QNUM;
	}
	public void setQNUM(int qNUM) {
		QNUM = qNUM;
	}
	public String getQEMAIL() {
		return QEMAIL;
	}
	public void setQEAMIL(String qEMAIL) {
		QEMAIL = qEMAIL;
	}
	public String getQTITLE() {
		return QTITLE;
	}
	public void setQTITLE(String qTITLE) {
		QTITLE = qTITLE;
	}
	public String getQCONTENT() {
		return QCONTENT;
	}
	public void setQCONTENT(String qCONTENT) {
		QCONTENT = qCONTENT;
	}
	
	
	
}
