package board.adopt.service;

import java.util.List;

import board.adopt.domain.AdoptVO;
import board.notice.domain.NoticeVO;
import syspage.paging.SearchCriteria;

public interface AdoptService {
	
		// 게시물 목록 조회
		public List<AdoptVO> list(SearchCriteria scri) throws Exception;
		
		public List<AdoptVO> listUser(SearchCriteria scri) throws Exception;
		
		public List<AdoptVO> listBuyer(SearchCriteria scri) throws Exception;
		
		//게시물 총 갯수
		public int listCount(SearchCriteria scri) throws Exception;
		
		// 게시물 목록 조회
		public AdoptVO read(int AANO) throws Exception;	
		
		// 게시물 수정
		public void update(AdoptVO adoptVO) throws Exception;
		
		// 게시물 삭제
		public void delete(int AANO) throws Exception;
		
		public void confirm(int AANO, String id);
	
}
