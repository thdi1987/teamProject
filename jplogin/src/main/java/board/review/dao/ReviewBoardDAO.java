package board.review.dao;

import java.util.List;

import board.review.domain.ReplyListVO;
import board.review.domain.ReplyVO;
import board.review.domain.ReviewViewVO;

public interface ReviewBoardDAO {

	//카테고리 별 리스트 : 1차 분류
	public List<ReviewViewVO> list(int petcatecode, int petcatecoderef) throws Exception;
	
	//카테고리 별 리스트 : 2차 분류
	public List<ReviewViewVO> list(int petcatecode) throws Exception;
	
	//후기 조회
	public ReviewViewVO reviewsView(int petnum) throws Exception;
	
	//후기 댓글 작성
	public void registReply(ReplyVO reply) throws Exception;
	
	//후기 댓글 리스트
	public List<ReplyListVO> replyList(int petnum) throws Exception;
	
	
}