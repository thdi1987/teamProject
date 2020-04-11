package board.adopt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import board.adopt.dao.AdoptDao;
import board.adopt.domain.AdoptVO;
import member.dao.MemberDao;
import member.domain.MemberVO;
import member.mail.SendMail;
import member.seed.KISA_SEED;
import syspage.paging.SearchCriteria;

@Service
public class AdoptServiceImpl implements AdoptService{

	private AdoptDao adoptDao;
	private MemberDao memberDao;	
	private SendMail sm;	
	private KISA_SEED seed;
	
	
	public void setSeed(KISA_SEED seed) {
		this.seed = seed;
	}
	
	public void setSm(SendMail sm) {
		this.sm = sm;
	}
	
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}


	public void setAdoptDao(AdoptDao adoptDao) {
		this.adoptDao = adoptDao;
	}	
	

		// 게시물 목록 조회
		@Override
		public List<AdoptVO> list(SearchCriteria scri) throws Exception {

			return adoptDao.list(scri);
		}
		
		public List<AdoptVO> listUser(SearchCriteria scri) throws Exception {

			return adoptDao.listUser(scri);
		}
		
		
		public List<AdoptVO> listBuyer(SearchCriteria scri) throws Exception {

			return adoptDao.listBuyer(scri);
		}
		// 게시물 총 갯수
		@Override
		public int listCount(SearchCriteria scri) throws Exception{
			
			return adoptDao.listCount(scri);
		}
		
		// 게시물 목록 조회
		@Override
		public AdoptVO read(int AANO) throws Exception {

			return adoptDao.read(AANO);
		}
		
		@Override
		public void update(AdoptVO adoptVO) throws Exception {

			adoptDao.update(adoptVO);
		}
		

		@Override
		public void delete(int AANO) throws Exception {
			
			adoptDao.delete(AANO);
		}
		
		public void confirm(int AANO, String id) {
			
			MemberVO member = memberDao.selectBuyer(id);
			String buyerId = member.getMID();
			String buyerName = member.getMNAME();
			String buyerEmail = member.getMEMAIL();
			String buyerCode = member.getMBCODE();
			String buyerAccount = member.getMACCOUNT();
			String buyerRegistration = member.getMREGISTRATION();
			
			String buyerBank = seed.decrypt(buyerAccount);
			
			String buyerBA = buyerCode + " = " + buyerBank;
			
			MemberVO memberAdopt = memberDao.selectAdopt(AANO);		
			
			String adoptId = memberAdopt.getMID();
			String adoptName = memberAdopt.getMNAME();
			String adoptEmail = memberAdopt.getMEMAIL();
			
			AdoptVO adopt = adoptDao.selectPid(AANO);
			int pid = adopt.getAAPID();
			
			
			sm.adoptConfirm(buyerId, adoptId, buyerName, buyerEmail, adoptEmail, buyerBA, buyerRegistration);
			sm.buyerConfirm(buyerId, adoptId, adoptName, buyerEmail, adoptEmail);
			
			adoptDao.deletePet(pid);
			
			//분양게시판 동물 등록번호로 삭제
		}

	
}
