package board.parcelOut.service;

import java.util.List;
import java.util.Map;

import board.parcelOut.domain.Insert;
import board.parcelOut.domain.ReplyVO;
import board.parcelOut.domain.Seach;
import board.parcelOut.domain.TotalBoardVO;
import board.parcelOut.domain.fileVo;
import syspage.paging.SearchCriteria;



public interface BoardService {


	//게시글 목록
	public abstract List<TotalBoardVO> list2(SearchCriteria scri);
	
	public abstract List<TotalBoardVO> listMyPage(SearchCriteria scri);
	
	//사진
	public abstract List<TotalBoardVO> boardPicture();
	
	//게시글 정보
	public abstract List<TotalBoardVO> info(int mpno);
	
	//사진가져오기
	public abstract List<fileVo> multi(int mpno);
	
	/*      		댓글관련				 */

	public List<ReplyVO> selectCommentList(int mpno) throws Exception;
	
	public List<ReplyVO> insertComment(ReplyVO reply);

	/*   							 */

	//페이징(갯수)
	public int count(SearchCriteria scri);
	
	//검색조건(게시글)
	public abstract List<Map<Integer,String>> select(Seach seach);
	
	//정보입력(게시글)
	public List<Insert> insertNew(Insert insert);

	//파일 업로드
	public void fileUpload(String originalfileName, String saveFileName, long fileSize);
		
	//입양신청 입력
	public void insertADOPTION(int MPNO,String MPTITLE,String MPCOMTENT,String adoptId);
	
	//동물정보
	public abstract int regCheck(String MREGISTRATION);
	
	//업데이트
	public void update2(String originalfileName, String saveFileName, long fileSize,TotalBoardVO total,int i);
	
	
	public void delete(String MPNO);


}
