package board.buyer.dao;

import java.util.List;

import board.buyer.domain.BuyerVO;
import syspage.paging.SearchCriteria;

public interface BuyerDao {
	
		// 게시글 작성
		public void write(BuyerVO buyerVO) throws Exception;
		
		// 게시물 목록 조회
		public List<BuyerVO> list(SearchCriteria scri) throws Exception;
		
		// 게시물 총 갯수
		public int listCount(SearchCriteria scri) throws Exception;		
		
		// 정보 셀렉
		public BuyerVO select(int BNO) throws Exception;		
		
		// 업데이트
		public void update(String BID, String BPET, String BCODE, String BBANK);
		
		public void delete(String BID);
	
}
