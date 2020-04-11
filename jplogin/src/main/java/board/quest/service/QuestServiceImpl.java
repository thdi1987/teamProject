package board.quest.service;

import java.util.List;

import org.springframework.stereotype.Service;

import board.quest.dao.QuestDao;
import board.quest.domain.QuestVO;
import syspage.paging.SearchCriteria;

@Service
public class QuestServiceImpl implements QuestService{

	private QuestDao questDao;

	public void setQuestDao(QuestDao questDao) {
		this.questDao = questDao;
	}
	
	// 게시글 작성
		@Override
		public void write(QuestVO questVO) throws Exception {
			questDao.write(questVO);
		}

		// 게시물 목록 조회
		@Override
		public List<QuestVO> list(SearchCriteria scri) throws Exception {

			return questDao.list(scri);
		}
		
		// 게시물 총 갯수
		@Override
		public int listCount(SearchCriteria scri) throws Exception{
			
			return questDao.listCount(scri);
		}
		
		// 게시물 목록 조회
		@Override
		public QuestVO read(int QNUM) throws Exception {

			return questDao.read(QNUM);
		}
		
		@Override
		public void update(QuestVO questVO) throws Exception {

			questDao.update(questVO);
		}

		@Override
		public void delete(int QNUM) throws Exception {
			
			questDao.delete(QNUM);
		}

	
}
