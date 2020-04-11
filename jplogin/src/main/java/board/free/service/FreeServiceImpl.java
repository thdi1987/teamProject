package board.free.service;


import java.util.List;

import org.springframework.stereotype.Service;

import board.free.dao.FreeDao;
import board.free.domain.FreeBoardVO;
import syspage.paging.SearchCriteria;

@Service
public class FreeServiceImpl implements FreeService {

	
	private FreeDao freeDao;
		
	
	public void setFreeDao(FreeDao freeDao) {
		this.freeDao = freeDao;
	}

	// 게시글 작성
	@Override
	public void write(FreeBoardVO boardVO) throws Exception {
		freeDao.write(boardVO);
	}

	// 게시물 목록 조회
	@Override
	public List<FreeBoardVO> list(SearchCriteria scri) throws Exception {

		return freeDao.list(scri);
	}
	
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		
		return freeDao.listCount(scri);
	}
	
	// 게시물 목록 조회
	@Override
	public FreeBoardVO read(int fbnumber) throws Exception {

		return freeDao.read(fbnumber);
	}
	
	@Override
	public int updateCheck(int fbnumber , String fbpwd) throws Exception {

		return freeDao.updateCheck(fbnumber, fbpwd);
	}
	
	@Override
	public void update(FreeBoardVO boardVO) throws Exception {

		freeDao.update(boardVO);
	}

	@Override
	public void delete(int fbnumber , String fbpwd) throws Exception {
		
		freeDao.delete(fbnumber , fbpwd);
	}
	

	
}