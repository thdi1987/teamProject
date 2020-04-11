package board.review.service;


import java.util.List;

import org.springframework.stereotype.Service;

import board.review.dao.ReviewBoardDAO;
import board.review.domain.ReplyListVO;
import board.review.domain.ReplyVO;
import board.review.domain.ReviewViewVO;

@Service
public class ReviewBoardServiceImpl implements ReviewBoardService {

	
	private ReviewBoardDAO reviewBoardDAO;
	

	

	public void setReviewBoardDAO(ReviewBoardDAO reviewBoardDAO) {
		this.reviewBoardDAO = reviewBoardDAO;
	}

	//카테고리별 리스트
	@Override
	public List<ReviewViewVO> list(int petcatecode, int level) throws Exception {
		
		int petcatecoderef = 0;
		
		if(level == 1) { //1차 분류
			
			petcatecoderef = petcatecode;
			
			return reviewBoardDAO.list(petcatecode,petcatecoderef);
		} else { //2차 분류
			
			return reviewBoardDAO.list(petcatecode);
		}
		
	}
	
	//후기 조회
	@Override
	public ReviewViewVO reviewsView(int petnum) throws Exception {
		
		return reviewBoardDAO.reviewsView(petnum);
	}
	
	//후기 댓글 작성
	@Override
	public void registReply(ReplyVO reply) throws Exception {
		reviewBoardDAO.registReply(reply);
	}
	
	//후기 댓글 리스트
	@Override
	public List<ReplyListVO> replyList(int petnum) throws Exception{
		return reviewBoardDAO.replyList(petnum);
	}
	
	
}