package board.review.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import board.review.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	
	private SqlSessionTemplate sqlSessionTemplate;	
	
	
	public ReplyDAOImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	// 댓글 조회
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception{
		
		return sqlSessionTemplate.selectList("replyMapper.readReply",bno);
	}
	
	//댓글 작성
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		sqlSessionTemplate.insert("replyMapper.writeReply", vo);
	}
	
	//댓글 수정
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		sqlSessionTemplate.update("replyMapper.updateReply", vo);
			
	}
	
	//댓글 삭제
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		sqlSessionTemplate.delete("replyMapper.deleteReply", vo);
	}
	
	//선택된 댓글 조회
	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		return sqlSessionTemplate.selectOne("replyMapper.selectReply",rno);
	}
	
	

}