package report.service;

import java.util.HashMap;
import java.util.List;

import report.domain.reportHistoryVO;
import report.domain.reportVO;
import syspage.paging.SearchCriteria;

public interface ReportService {
	
	public void Insert(reportVO report);
	
	public List<reportVO> reportList(SearchCriteria scri);
	
	public  List<reportHistoryVO> reportHistoryList(SearchCriteria scri);

	
	public int listcount(SearchCriteria scri);
	
	public int listcount2(SearchCriteria scri);

	
	public void selectEmail(String RREPORTEDID,int RNO,int punish,String REMAIL,String RID);
	
	public void update();
	
	public void delete(int RNO);
	

}
