package board.quest.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import board.notice.domain.NoticeVO;
import board.quest.domain.QuestVO;
import syspage.paging.SearchCriteria;

@Repository
public class QuestDaoImpl implements QuestDao {

	private SqlSessionTemplate sqlSessionTemplate;
	
	public QuestDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}	
	
	// 게시글 작성
		@Override
		public void write(QuestVO questVO) throws Exception {
			sqlSessionTemplate.insert("QuestDao.Insert", questVO);
			
		}
		
		// 게시물 목록 조회
		@Override
		public List<QuestVO> list(SearchCriteria scri) throws Exception {
		
			return sqlSessionTemplate.selectList("QuestDao.ListPage", scri);

		}
		
		// 게시물 총 갯수
		@Override
		public int listCount(SearchCriteria scri) throws Exception{
			return sqlSessionTemplate.selectOne("QuestDao.ListCount");
		}
		
		// 게시물 조회
		@Override
		public QuestVO read(int QNUM) throws Exception {
				
			return sqlSessionTemplate.selectOne("QuestDao.Read", QNUM);
		}
		
		// 게시물 수정
		@Override
		public void update(QuestVO questVO) throws Exception {
			
			sqlSessionTemplate.update("QuestDao.Update", questVO);
		}

		// 게시물 삭제
		@Override
		public void delete(int QNUM) throws Exception {
			
			sqlSessionTemplate.delete("QuestDao.Delete", QNUM);
		}
	
}
