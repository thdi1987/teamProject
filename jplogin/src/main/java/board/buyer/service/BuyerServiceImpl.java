package board.buyer.service;

import java.util.List;

import org.springframework.stereotype.Service;

import board.buyer.dao.BuyerDao;
import board.buyer.domain.BuyerVO;
import member.seed.KISA_SEED;
import syspage.paging.SearchCriteria;

@Service
public class BuyerServiceImpl implements BuyerService{

	private BuyerDao buyerDao;

	private KISA_SEED seed;
	
	
	public void setBuyerDao(BuyerDao buyerDao) {
		this.buyerDao = buyerDao;
	}
	
	
	public void setSeed(KISA_SEED seed) {
		this.seed = seed;
	}



		// 게시글 작성
		@Override
		public void write(BuyerVO buyerVO) throws Exception {
			buyerDao.write(buyerVO);
		}

		// 게시물 목록 조회
		@Override
		public List<BuyerVO> list(SearchCriteria scri) throws Exception {

			return buyerDao.list(scri);
		}
		
		// 게시물 총 갯수
		@Override
		public int listCount(SearchCriteria scri) throws Exception{
			
			return buyerDao.listCount(scri);
		}		
		
		
		@Override
		public String select(int BNO) throws Exception {

			BuyerVO buyer = buyerDao.select(BNO);
			String BID = buyer.getBID();
			String BPET = buyer.getBPET();
			String BCODE = buyer.getBCODE();
			String BACCOUNT = buyer.getBBANK();
			
			String BBANK = seed.encrypt(BACCOUNT);
			
			buyerDao.update(BID, BPET, BCODE, BBANK);
			
			buyerDao.delete(BID);
			
			return null;
		}	
		
		
	
}
