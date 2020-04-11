package board.notice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import board.notice.dao.NoticeDao;
import board.notice.domain.NoticeVO;
import syspage.paging.SearchCriteria;

@Service
public class NoticeServiceImpl implements NoticeService{

	private NoticeDao noticeDao;

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}
	// 공지사항
	// 게시글 작성
		@Override
		public void write(NoticeVO noticeVO) throws Exception {
			noticeDao.write(noticeVO);
		}

		// 게시물 목록 조회
		@Override
		public List<NoticeVO> list(SearchCriteria scri) throws Exception {

			return noticeDao.list(scri);
		}
		
		// 게시물 총 갯수
		@Override
		public int listCount(SearchCriteria scri) throws Exception{
			
			return noticeDao.listCount(scri);
		}
		
		// 게시물 목록 조회
		@Override
		public NoticeVO read(int NBNUM) throws Exception {

			return noticeDao.read(NBNUM);
		}
		
		@Override
		public void update(NoticeVO noticeVO) throws Exception {

			noticeDao.update(noticeVO);
		}

		@Override
		public void delete(int NBNUM) throws Exception {
			
			noticeDao.delete(NBNUM);
		}

	
}
