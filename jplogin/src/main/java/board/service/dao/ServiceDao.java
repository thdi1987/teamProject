package board.service.dao;

import java.util.List;

import board.service.domain.ServiceVO;
import syspage.paging.SearchCriteria;

public interface ServiceDao {
	
	// 게시글 작성
		public void write(ServiceVO serviceVO) throws Exception;
		
		// 게시물 목록 조회
		public List<ServiceVO> list(SearchCriteria scri) throws Exception;
		
		// 게시물 총 갯수
		public int listCount(SearchCriteria scri) throws Exception;
		// 게시물 조회
		public ServiceVO read(int SCNUM) throws Exception;
		
		// 게시물 수정
		public void update(ServiceVO serviceVO) throws Exception;
		
		// 게시물 삭제
		public void delete(int SCNUM) throws Exception;
	
}
