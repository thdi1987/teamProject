package board.free.service;

import java.util.List;

import board.free.domain.FreeBoardVO;
import syspage.paging.SearchCriteria;

public interface FreeService {

	// 게시글 작성
	public void write(FreeBoardVO boardVO) throws Exception;
		
	// 게시물 목록 조회
	public List<FreeBoardVO> list(SearchCriteria scri) throws Exception;
		
	//게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
		
	// 게시물 목록 조회
	public FreeBoardVO read(int fbnumber) throws Exception;
		
	public int updateCheck(int fbnumber , String fbpwd ) throws Exception;
		
	// 게시물 수정
	public void update(FreeBoardVO boardVO) throws Exception;
	
	// 게시물 삭제
	public void delete(int fbnumber , String fbpwd ) throws Exception;
	

    
}