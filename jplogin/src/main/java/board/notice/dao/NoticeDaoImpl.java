package board.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import board.notice.domain.NoticeVO;
import syspage.paging.SearchCriteria;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	private SqlSessionTemplate sqlSessionTemplate;
	
	public NoticeDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}	
	// 공지사항
	// 게시글 작성
		@Override
		public void write(NoticeVO noticeVO) throws Exception {
			sqlSessionTemplate.insert("NoticeDao.noticeInsert", noticeVO);
			
		}
		
		// 게시물 목록 조회
		@Override
		public List<NoticeVO> list(SearchCriteria scri) throws Exception {
		
			return sqlSessionTemplate.selectList("NoticeDao.noticeListPage", scri);

		}
		
		// 게시물 총 갯수
		@Override
		public int listCount(SearchCriteria scri) throws Exception{
			return sqlSessionTemplate.selectOne("NoticeDao.noticeListCount");
		}
		
		// 게시물 조회
		@Override
		public NoticeVO read(int NBNUM) throws Exception {
				
			return sqlSessionTemplate.selectOne("NoticeDao.noticeRead", NBNUM);
		}
		
		// 게시물 수정
		@Override
		public void update(NoticeVO noticeVO) throws Exception {
			
			sqlSessionTemplate.update("NoticeDao.noticeUpdate", noticeVO);
		}

		// 게시물 삭제
		@Override
		public void delete(int NBNUM) throws Exception {
			
			sqlSessionTemplate.delete("NoticeDao.noticeDelete", NBNUM);
		}
	
}
