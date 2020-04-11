package board.free.service;

import java.util.List;

import board.free.domain.FreeReplyVO;

public interface FreeReplyService {
	
	//댓글 조회
	public List<FreeReplyVO> readReply(int fbnumber) throws Exception;
	
	//댓글 작성
	public void writeReply(FreeReplyVO vo) throws Exception;
	
	//댓글 수정
	public void updateReply(FreeReplyVO vo) throws Exception;
	
	//댓글 삭제
	public void deleteReply(FreeReplyVO vo) throws Exception;
	
	//선택된 댓글 조회
	public FreeReplyVO selectReply(int frnumber) throws Exception;
}