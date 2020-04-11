package board.parcelOut.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import board.parcelOut.dao.BoardDao;
import board.parcelOut.domain.Insert;
import board.parcelOut.domain.ReplyVO;
import board.parcelOut.domain.Seach;
import board.parcelOut.domain.TotalBoardVO;
import board.parcelOut.domain.fileVo;
import syspage.paging.SearchCriteria;


public class BoardServiceImple implements BoardService {
	
		private BoardDao boardDao;
		
		public BoardDao getBoardDao() {			

			return boardDao;
		}
		
		public void setBoardDao(BoardDao boardDao) {
			
			this.boardDao = boardDao;
		}
		
	
	

	@Override
	public int count(SearchCriteria scri) {
		return boardDao.count();
	}
	
	
	@Override public List<TotalBoardVO>list2(SearchCriteria scri){
		boardDao.boardPicture();
		
		
		return boardDao.list2(scri);
	}
	
	public List<TotalBoardVO>listMyPage(SearchCriteria scri){
		boardDao.boardPicture();
		
		
		return boardDao.listMyPage(scri);
	}
			 
    @Override public List<TotalBoardVO> boardPicture(){
			  
			  return boardDao.boardPicture(); 
   }
    @Override
	public List<TotalBoardVO> info(int mpno){
        	return boardDao.info(mpno);
    }
    
    @Override
	public List<fileVo> multi(int mpno){
		return boardDao.multi(mpno);
	}
	
	/* 	댓글관련	*/
	@Override
	public List<ReplyVO> selectCommentList(int mpno ) throws Exception {
		return boardDao.selectCommandList(mpno);
	}
	
	@Override
	public List<ReplyVO> insertComment(ReplyVO reply){
		
		return boardDao.insertComment(reply);
	}
	
/*			*/
	
	@Override
	public void insertADOPTION(int MPNO,String MPTITLE,String MPCONTENT,String adoptId){
		TotalBoardVO total= new TotalBoardVO();
	 List<TotalBoardVO> list=boardDao.select1(MPNO);	 
	
	 total.setAdoptId(adoptId);
	 total.setMPNO(MPNO);
	 total.setMPTITLE(MPTITLE);
	 total.setMPCONTENT(MPCONTENT);
	 total.setMPID(list.get(0).getMPID());
	 total.setMPDIVISION(list.get(0).getMPID());
	 total.setMPKIND(list.get(0).getMPID());
	 total.setMPLOCATION(list.get(0).getMPID());
	 total.setMPGENDER(list.get(0).getMPGENDER());	 

	boardDao.insertADOPTION(total);
		
	}

	
	@Override
	public List<Map<Integer,String>>select(Seach seach){
		return boardDao.select(seach);
	}
	
	@Override
	public List<Insert> insertNew(Insert insert){
		
		return boardDao.insertNew(insert);
	}
	
	@Override
	public int regCheck(String MREGISTRATION) {
		int result = boardDao.regCheck(MREGISTRATION);
		return result;
	}
	
	@Override
	public void fileUpload(String originalfileName, String saveFileName, long fileSize) {		
		 boardDao.fileUpload(originalfileName,saveFileName,fileSize);
		
		
	}
	
	public void update2(String originalfileName, String saveFileName, long fileSize,TotalBoardVO total,int j) {	
		if(j==0) {
				List<TotalBoardVO> hm=boardDao.selectFile(total.getMPNO());				
				for(int i=0; i<hm.size(); i++) {
				String filePath="C:\\JSP(eclipse)\\Picture\\upload\\"+hm.get(i).getPFILENAME();
				File delete=new File(filePath);
				delete.delete();
				boardDao.deletePicture(total.getMPNO());
				}
		}
				boardDao.update(total);
				boardDao.insertFile(originalfileName,  saveFileName,  fileSize, total);

	}
	
	
	public void delete(String MPNO2) {
		int MPNO=Integer.parseInt(MPNO2);
		List<TotalBoardVO> hm=boardDao.selectFile(MPNO);				
		for(int i=0; i<hm.size(); i++) {
		System.out.println(hm.get(i).getPFILENAME());
		String filePath="C:\\JSP(eclipse)\\Picture\\upload\\"+hm.get(i).getPFILENAME();
		File delete=new File(filePath);
		delete.delete();
		}
		
		
		boardDao.delete(MPNO);
	}
	
	
	
	
	
	
	
	


}
