package board.quest.service;

import java.util.List;

import board.notice.domain.NoticeVO;
import board.quest.domain.QuestVO;
import syspage.paging.SearchCriteria;

public interface QuestService {
	
	// 게시글 작성
		public void write(QuestVO questVO) throws Exception;
		
		// 게시물 목록 조회
		public List<QuestVO> list(SearchCriteria scri) throws Exception;
		
		//게시물 총 갯수
		public int listCount(SearchCriteria scri) throws Exception;
		
		// 게시물 목록 조회
		public QuestVO read(int QNUM) throws Exception;
		
		// 게시물 수정
		public void update(QuestVO questVO) throws Exception;
		
		// 게시물 삭제
		public void delete(int QNUM) throws Exception;
	
}
