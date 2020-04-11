package member.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import board.notice.domain.NoticeVO;
import member.domain.MemberVO;

@Repository
public class MemberDaoMybatis implements MemberDao{

	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberDaoMybatis(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}	

	@Override
	public void insertNormal(MemberVO memberVO) {		
		sqlSessionTemplate.insert("memberDao.insertNormal", memberVO);
	}

	@Override
	public void insertParcelOut(MemberVO memberVO) {		
		sqlSessionTemplate.insert("memberDao.insertParcelOut", memberVO);
	}	
	
	public int updateEmailAuthentication(String MEMAILCHECK) {		
		return sqlSessionTemplate.update("memberDao.updateEmailAuthentication", MEMAILCHECK);
	}

	public MemberVO selectById(String id) {			
		List<MemberVO> result = sqlSessionTemplate.selectList("memberDao.selectById", id);
		return result.isEmpty()?null:result.get(0);
	}
	
	public int idCheck(String MID) {		
		int result = sqlSessionTemplate.selectOne("memberDao.idCheck", MID); 
		return result;
	}
	
	public int regCheck(String name, String MREGISTRATION) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("MNAME", name);
		map.put("MREGISTRATION", MREGISTRATION);	
		int result = sqlSessionTemplate.selectOne("memberDao.regCheck", map); 
		return result;
	}
	
	public int emailChk(String MEMAILCHECK) {		
		int result = sqlSessionTemplate.selectOne("memberDao.emailChk",MEMAILCHECK); 		
		return result;
	}
	
	public MemberVO sendEmail(String MID) {		
		List<MemberVO> result = sqlSessionTemplate.selectList("memberDao.sendEmail", MID);
		return result.isEmpty()?null:result.get(0);
	}
	
	public MemberVO loginCheck(String MID) {		
		List<MemberVO> result = sqlSessionTemplate.selectList("memberDao.loginCheck", MID);
		return result.isEmpty()?null:result.get(0);
	}
	
	public int updateEmailCode(String code, String email) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("code", code);
		map.put("email", email);		
		return sqlSessionTemplate.update("memberDao.updateEmailCode", map); 
		
	}
	
	public int findIdEmailCheck(String email) {		
		int result = sqlSessionTemplate.selectOne("memberDao.findIdEmailCheck", email); 
		return result;
	}
	
	public int findPasswordCheck(String id, String email) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);		
		int result = sqlSessionTemplate.selectOne("memberDao.findPasswordCheck", map);
		return result;
	}
	
	public MemberVO findId(String email) {		
		MemberVO result = sqlSessionTemplate.selectOne("memberDao.findId", email); 
		return result;
	}
	
	public MemberVO findPassword(String id, String email) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);		
		MemberVO password = sqlSessionTemplate.selectOne("memberDao.findPassword", map);
		return password;
	}
	
	public int updatePassword(String id, String email, String temporaryPass) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("email", email);
		map.put("temporaryPass", temporaryPass);
		int result = sqlSessionTemplate.update("memberDao.updatePassword", map);
		return result;
	}
	
	public void delete(String id) {
		sqlSessionTemplate.delete("memberDao.delete", id);
	}
	
	public MemberVO findPasswordId(String id) {
		MemberVO result = sqlSessionTemplate.selectOne("memberDao.findPasswordId", id);
		
		return result;
	}
	
	public MemberVO findBank(String id) {
		
		return sqlSessionTemplate.selectOne("memberDao.findBank",id);
	}
	
	public void infoUpdate(String id, String pwd, String email, String phones) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pwd", pwd);
		map.put("email", email);
		map.put("phones", phones);
		
		sqlSessionTemplate.update("memberDao.infoUpdate", map);
	}
	
	public MemberVO info(String id) {
		return sqlSessionTemplate.selectOne("memberDao.info", id);
	}
	
	public MemberVO selectBuyer(String id) {
		return sqlSessionTemplate.selectOne("memberDao.selectBuyer", id);
	}
	
	public MemberVO selectAdopt(int AANO) {
		return sqlSessionTemplate.selectOne("memberDao.selectAdopt", AANO);
	}
	
	// 메인 공지사항 테스트
	public List<NoticeVO> noticeList(){
		return sqlSessionTemplate.selectList("memberDao.noticeList");
	}
}
