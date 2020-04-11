package board.free.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import board.free.domain.FreeReplyVO;

@Repository
public class FreeReplyDaoImpl implements FreeReplyDao {

	private SqlSessionTemplate sqlSessionTemplate;

	public FreeReplyDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	// 댓글 조회
	@Override
	public List<FreeReplyVO> readReply(int fbnumber) throws Exception{
		
		return sqlSessionTemplate.selectList("freeReplyMapper.readReply",fbnumber);
	}
	
	//댓글 작성
	@Override
	public void writeReply(FreeReplyVO vo) throws Exception {
		sqlSessionTemplate.insert("freeReplyMapper.writeReply", vo);
	}
	
	//댓글 수정
	@Override
	public void updateReply(FreeReplyVO vo) throws Exception {
		sqlSessionTemplate.update("freeReplyMapper.updateReply", vo);
			
	}
	
	//댓글 삭제
	@Override
	public void deleteReply(FreeReplyVO vo) throws Exception {
		sqlSessionTemplate.delete("freeReplyMapper.deleteReply", vo);
	}
	
	//선택된 댓글 조회
	@Override
	public FreeReplyVO selectReply(int frnumber) throws Exception {
		return sqlSessionTemplate.selectOne("freeReplyMapper.selectReply",frnumber);
	}
	
	

}