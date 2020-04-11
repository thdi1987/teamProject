package report.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import report.domain.reportHistoryVO;
import report.domain.reportVO;
import syspage.paging.SearchCriteria;

public class reportImpl implements reportDao{
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	public reportImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void Insert(reportVO report) {
		sqlSessionTemplate.insert("report.Insert",report);
		
	}
	
	public List<reportVO> reportList(SearchCriteria scri){
		
	return	sqlSessionTemplate.selectList("report.reportList",scri);
		
	}
	public List<reportHistoryVO>reportHistoryList(SearchCriteria scri){
		return	sqlSessionTemplate.selectList("report.reportHistoryList",scri);

	}
	
	public int listcount(SearchCriteria scri) {
		return sqlSessionTemplate.selectOne("report.count",scri);
	}
	
	public int listcount2(SearchCriteria scri) {
		return sqlSessionTemplate.selectOne("report.count2",scri);
	}
	
	
	public String selectEmail(String RREPORTEDID) {
		return sqlSessionTemplate.selectOne("report.selectEmail",RREPORTEDID);
	}
	
	 public void insertreportHistory(String Email,int RNO,int punish,String RREPORTEDID) {
		 HashMap<String,Object> hm = new HashMap<String,Object>();
		 hm.put("Email", Email);
		 hm.put("RNO", RNO);
		 hm.put("punish",punish);
		 hm.put("RHID",RREPORTEDID);
		 sqlSessionTemplate.insert("report.insertreportHistory",hm);
	 }
	 
	 public void update() {
		 sqlSessionTemplate.update("report.updateSch");
	 }


	 public void delete(int RNO) {
		 sqlSessionTemplate.delete("report.deleteReport",RNO);
	 }

	
	
	
	

}
