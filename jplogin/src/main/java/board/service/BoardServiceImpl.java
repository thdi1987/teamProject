package board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import board.dao.BoardDao;
import board.domain.NoticeVO;
import syspage.paging.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService{

	private BoardDao boardDao;

	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}
	// 공지사항
	// 게시글 작성
		@Override
		public void write(NoticeVO NoticeVO) throws Exception {
			boardDao.write(NoticeVO);
		}

		// 게시물 목록 조회
		@Override
		public List<NoticeVO> list(SearchCriteria scri) throws Exception {

			return boardDao.list(scri);
		}
		
		// 게시물 총 갯수
		@Override
		public int listCount(SearchCriteria scri) throws Exception{
			
			return boardDao.listCount(scri);
		}
		
		// 게시물 목록 조회
		@Override
		public NoticeVO read(int NBNUM) throws Exception {

			return boardDao.read(NBNUM);
		}
		
		@Override
		public void update(NoticeVO NoticeVO) throws Exception {

			boardDao.update(NoticeVO);
		}

		@Override
		public void delete(int NBNUM) throws Exception {
			
			boardDao.delete(NBNUM);
		}

	
}
