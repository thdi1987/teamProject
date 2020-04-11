package board.notice.service;

import java.util.List;

import board.notice.domain.NoticeVO;
import syspage.paging.SearchCriteria;

public interface NoticeService {
	// 공지사항
	// 게시글 작성
		public void write(NoticeVO noticeVO) throws Exception;
		
		// 게시물 목록 조회
		public List<NoticeVO> list(SearchCriteria scri) throws Exception;
		
		//게시물 총 갯수
		public int listCount(SearchCriteria scri) throws Exception;
		
		// 게시물 목록 조회
		public NoticeVO read(int NBNUM) throws Exception;
		
		// 게시물 수정
		public void update(NoticeVO noticeVO) throws Exception;
		
		// 게시물 삭제
		public void delete(int NBNUM) throws Exception;
	
}
