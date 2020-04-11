package board.review.service;


import java.util.List;

import org.springframework.stereotype.Service;

import board.review.dao.ReplyDAO;
import board.review.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	
	private ReplyDAO replyDAO;	
	
	
	public void setReplyDAO(ReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}

	//댓글 조회
	@Override
	public List<ReplyVO> readReply(int bno) throws Exception{
		
		return replyDAO.readReply(bno);
	}
	
	//댓글 작성
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		
		replyDAO.writeReply(vo);
	}
	
	//댓글 수정
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		
		replyDAO.updateReply(vo);
	}
	
	//댓글 삭제
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		
		replyDAO.deleteReply(vo);
	}
	
	//선택된 댓글 조회
	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		
		return replyDAO.selectReply(rno);
	}
	
}