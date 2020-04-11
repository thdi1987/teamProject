package report.dao;

import java.util.HashMap;
import java.util.List;

import report.domain.reportHistoryVO;
import report.domain.reportVO;
import syspage.paging.SearchCriteria;

public interface reportDao {
	
	public void Insert(reportVO report);
	
	public List<reportVO>reportList(SearchCriteria scri);
	
	public  List<reportHistoryVO>reportHistoryList(SearchCriteria scri);

	
	public int listcount(SearchCriteria scri);
	
	public int listcount2(SearchCriteria scri); 

	
	public String selectEmail(String RREPORTEDID); 
	
	 public void insertreportHistory(String Email,int RNO,int punish,String RREPORTEDID);
	 
	 public void update();
	 
	 public void delete(int RNO);


}
