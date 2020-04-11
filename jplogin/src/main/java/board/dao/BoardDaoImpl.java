package board.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import board.domain.NoticeVO;
import syspage.paging.SearchCriteria;

@Repository
public class BoardDaoImpl implements BoardDao {

	private SqlSessionTemplate sqlSessionTemplate;
	
	public BoardDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}	
	// 공지사항
	// 게시글 작성
		@Override
		public void write(NoticeVO NoticeVO) throws Exception {
			sqlSessionTemplate.insert("BoardDao.noticeInsert", NoticeVO);
			
		}
		
		// 게시물 목록 조회
		@Override
		public List<NoticeVO> list(SearchCriteria scri) throws Exception {
		
			return sqlSessionTemplate.selectList("BoardDao.noticeListPage", scri);

		}
		
		// 게시물 총 갯수
		@Override
		public int listCount(SearchCriteria scri) throws Exception{
			return sqlSessionTemplate.selectOne("BoardDao.noticeListCount");
		}
		
		// 게시물 조회
		@Override
		public NoticeVO read(int NBNUM) throws Exception {
				
			return sqlSessionTemplate.selectOne("BoardDao.noticeRead", NBNUM);
		}
		
		// 게시물 수정
		@Override
		public void update(NoticeVO NoticeVO) throws Exception {
			
			sqlSessionTemplate.update("BoardDao.noticeUpdate", NoticeVO);
		}

		// 게시물 삭제
		@Override
		public void delete(int NBNUM) throws Exception {
			
			sqlSessionTemplate.delete("BoardDao.noticeDelete", NBNUM);
		}
	
}
