package report.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.mail.SendMail;
import report.dao.reportDao;
import report.domain.reportHistoryVO;
import report.domain.reportVO;
import syspage.paging.SearchCriteria;

@Service
public class ReportServiceImpl implements ReportService {
	
	private reportDao reportda;
	
	@Autowired
	private SendMail sm;
	
	public void setSm(SendMail sm) {
		this.sm = sm;
	}
	

	public void setreportDao(reportDao reportda) {
		this.reportda=reportda;
	}
	
	
	public void Insert(reportVO report) {
		reportda.Insert(report);
		
	}
	
	public List<reportVO> reportList(SearchCriteria scri){
		
		return reportda.reportList(scri);
	}
	
	public  List<reportHistoryVO> reportHistoryList(SearchCriteria scri){
		return reportda.reportHistoryList(scri);
		
	}

	
	
	public int listcount(SearchCriteria scri) {
		return reportda.listcount(scri);
	}
	
	public int listcount2(SearchCriteria scri) {
		return reportda.listcount2(scri);
	}
	
	public void selectEmail(String RREPORTEDID,int RNO,int punish,String REMAIL, String RID) {
		 
		 String Email=reportda.selectEmail(RREPORTEDID);
		 reportda.insertreportHistory(Email,RNO,punish,RREPORTEDID);
		 sm.personReport(Email, RREPORTEDID);
		 sm.personWhoReport(REMAIL, RID);
		 
//		 reportda.insertreportHistory(Email,RNO,punish,RREPORTEDID);
		 
	}
	
	public void update() {
		reportda.update();
		
	}

	public void delete(int RNO) {
		reportda.delete(RNO);
	}


	


	
	

}
