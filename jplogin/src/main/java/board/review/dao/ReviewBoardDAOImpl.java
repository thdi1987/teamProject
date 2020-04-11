package board.review.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import board.review.domain.ReplyListVO;
import board.review.domain.ReplyVO;
import board.review.domain.ReviewViewVO;

@Repository
public class ReviewBoardDAOImpl implements ReviewBoardDAO {

	
	private SqlSessionTemplate sqlSessionTemplate;	
	
	
	public ReviewBoardDAOImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	/* private static String namespace="boardMapper"; */
	
	

	//카테고리 별 리스트 : 1차 분류
	@Override
	public List<ReviewViewVO> list(int petcatecode, int petcatecoderef) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("petcatecode", petcatecode);
		map.put("petcatecoderef", petcatecoderef);
		
		return sqlSessionTemplate.selectList("boardMapper.list_1",map);
		
	}
	
	//카테고리 별 리스트 : 2차분류
	@Override
	public List<ReviewViewVO> list(int petcatecode) throws Exception {
		return sqlSessionTemplate.selectList("boardMapper.list_2",petcatecode);
		
	}
	
	//후기 조회
	@Override
	public ReviewViewVO reviewsView(int petnum) throws Exception {
		return sqlSessionTemplate.selectOne("boardMapper.reviewsView",petnum);
	}
	
	//후기 댓글 작성
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		
		sqlSessionTemplate.insert("boardMapper.registReply", reply);
	}
	
	//후기 댓글 리스트
	@Override
	public List<ReplyListVO> replyList(int petnum) throws Exception {
		return sqlSessionTemplate.selectList("boardMapper.replyList", petnum);
	}
	
	
}