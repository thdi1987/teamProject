package board.parcelOut.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import board.parcelOut.domain.Insert;
import board.parcelOut.domain.ReplyVO;
import board.parcelOut.domain.Seach;
import board.parcelOut.domain.TotalBoardVO;
import board.parcelOut.domain.fileVo;
import syspage.paging.SearchCriteria;


@Repository
public class BoardDaoMybatis  implements BoardDao{
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public BoardDaoMybatis(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public void setSqlMapClient(SqlSessionTemplate sqlSessionTemplate) {
			this.sqlSessionTemplate = sqlSessionTemplate;
	}
		
	@Override
	public List<TotalBoardVO> list2(SearchCriteria scri){
		sqlSessionTemplate.selectList("boardDao.boardPicture");
		
		return sqlSessionTemplate.selectList("boardDao.list2",scri);
		
	}
	
	public List<TotalBoardVO> listMyPage(SearchCriteria scri){
		sqlSessionTemplate.selectList("boardDao.boardPicture");
		
		return sqlSessionTemplate.selectList("boardDao.listMyPage",scri);
		
	}
	
	@Override
	public List<TotalBoardVO> boardPicture(){
			
		 return sqlSessionTemplate.selectList("boardDao.boardPicture");
		 
	}
	
	@Override
	public List<TotalBoardVO> info(int mpno){
		return sqlSessionTemplate.selectList("boardDao.info",mpno);
	}
	
	@Override
	public List<fileVo> multi(int mpno){
		return sqlSessionTemplate.selectList("boardDao.multi",mpno);
	}
	
	/*	댓글관련	*/
	//@SuppressWarnings("unchecked")
	public List<ReplyVO> selectCommandList(int mpno ){	

		
		return sqlSessionTemplate.selectList("boardDao.selectCommentList",mpno);
	}
	
	//@SuppressWarnings("unchecked")
	public List<ReplyVO> insertComment(ReplyVO reply){	
		
		return sqlSessionTemplate.selectList("boardDao.insertComment",reply);
	}
	
	@Override
	public int count(){
		
		return sqlSessionTemplate.selectOne("boardDao.count");
	}
	

	@Override
	public List<Map<Integer,String>> select(Seach seach){
		return sqlSessionTemplate.selectList("boardDao.select",seach);
	}
	
	@Override
	public List<Insert> insertNew(Insert insert){
		return sqlSessionTemplate.selectList("boardDao.insert",insert);
	}
	
	
	@Override
	public int regCheck(String MREGISTRATION) {		
		int result = sqlSessionTemplate.selectOne("boardDao.regCheck",MREGISTRATION);
		return result;
	}
	

	@Override
	public void fileUpload(String originalfileName, String saveFileName, long fileSize) {
		// TODO Auto-generated method stub
		HashMap<String,Object> aa =new HashMap<String,Object>();
		aa.put("originalfileName",originalfileName);
		aa.put("saveFileName", saveFileName);
		aa.put("fileSize", fileSize);
		
		sqlSessionTemplate.selectList("boardDao.insert3", aa);
		
	}
	
	//입양신청정보
	
	@Override
	public List<TotalBoardVO> select1(int MPNO) {
	 return	sqlSessionTemplate.selectList("boardDao.select1",MPNO);
		
	}
	
	//입양신청 INSERT
	@Override
	public void insertADOPTION(TotalBoardVO total) {
		
		
		sqlSessionTemplate.selectList("boardDao.insertADOPTION",total);
	}

	public void delete(int MPNO) {
		sqlSessionTemplate.delete("boardDao.delete", MPNO);
	}
	
	//파일 이름 가져오기(삭제,수정)
		public List<TotalBoardVO> selectFile(int mpno){
			
			return sqlSessionTemplate.selectList("multi",mpno);
			
		}
		//업데이트
		public void update(TotalBoardVO total){
			sqlSessionTemplate.update("updateBoard",total);
			 
		}
		
		//사진db delete
		public void deletePicture(int mpno) {
			sqlSessionTemplate.delete("deleteFile",mpno);
		}
		
		public void insertFile(String originalfileName, String saveFileName, long fileSize, TotalBoardVO total) {
			System.out.println("mpno="+total.getMPNO());
			HashMap<String,Object> aa =new HashMap<String,Object>();
			aa.put("originalfileName",originalfileName);
			aa.put("saveFileName", saveFileName);
			aa.put("fileSize", fileSize);
			aa.put("PBPID", total.getMPNO());
			sqlSessionTemplate.insert("insertFile",aa);	
			}


		
		public void update2(String originalfileName, String saveFileName, long fileSize,TotalBoardVO total) {
			HashMap<String,Object> aa =new HashMap<String,Object>();
			aa.put("originalfileName",originalfileName);
			aa.put("saveFileName", saveFileName);
			aa.put("fileSize", fileSize);
			aa.put("PBPID", total.getMPNO());
			sqlSessionTemplate.update("updateFile",aa);
		}
	
	




	
	
	

}
