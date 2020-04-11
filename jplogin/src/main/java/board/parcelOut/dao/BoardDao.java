package board.parcelOut.dao;

import java.util.List;
import java.util.Map;

import board.parcelOut.domain.Insert;
import board.parcelOut.domain.ReplyVO;
import board.parcelOut.domain.Seach;
import board.parcelOut.domain.TotalBoardVO;
import board.parcelOut.domain.fileVo;
import syspage.paging.SearchCriteria;


public interface BoardDao {
		
	//게시글목록
	public abstract List<TotalBoardVO> list2(SearchCriteria scri);
	
	public abstract List<TotalBoardVO> listMyPage(SearchCriteria scri);
	
	//사진파일
	public abstract List<TotalBoardVO> boardPicture();
	
	//게시글 정보
	public abstract List<TotalBoardVO> info(int mpno);

	//멀티파일
	public abstract List<fileVo> multi(int mpno);

	/*댓글 관련       */
	public List<ReplyVO> selectCommandList(int mpno);
	
	public List<ReplyVO>insertComment(ReplyVO reply);
	/* 			*/
	
	//검색조건
	public abstract List<Map<Integer,String>> select(Seach seach);
	
	//페이징 관련 갯수
	public int count();
	
	
	public abstract List<Insert> insertNew(Insert insert);
	
	//동물정보
	 public abstract int regCheck(String MREGISTRATION);

	 //파일 정보 저장
	public void fileUpload(String originalfileName, String saveFileName, long fileSize);

	
	//입양신청 나머지 정보 가져오기
	public List<TotalBoardVO> select1(int MPNO);
	
	
	//입양신청 insert
	public void insertADOPTION(TotalBoardVO total);
	
	public void update(TotalBoardVO total);

	public void delete(int MPNO);
	
	public void deletePicture(int mpno);
	
	public void insertFile(String originalfileName,String saveFileName,long fileSize,TotalBoardVO total);
		
	public List<TotalBoardVO> selectFile(int mpno);


}
