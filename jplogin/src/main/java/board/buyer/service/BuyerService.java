package board.buyer.service;

import java.util.List;

import board.buyer.domain.BuyerVO;
import syspage.paging.SearchCriteria;

public interface BuyerService {
	
		// 게시글 작성
		public void write(BuyerVO buyerVO) throws Exception;
		
		// 게시물 목록 조회
		public List<BuyerVO> list(SearchCriteria scri) throws Exception;
		
		//게시물 총 갯수
		public int listCount(SearchCriteria scri) throws Exception;		
		
		// 게시물 수정
		public String select(int BNO) throws Exception;	
		
	
}
