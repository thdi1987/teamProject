package board.free.service;


import java.util.List;

import org.springframework.stereotype.Service;

import board.free.dao.FreeReplyDao;
import board.free.domain.FreeReplyVO;

@Service
public class FreeReplyServiceImpl implements FreeReplyService {
	
	
	private FreeReplyDao freeReplydao;	
	
	public void setFreeReplyDao(FreeReplyDao freeReplydao) {
		this.freeReplydao = freeReplydao;
	}

	//댓글 조회
	@Override
	public List<FreeReplyVO> readReply(int fbnumber) throws Exception{
		
		return freeReplydao.readReply(fbnumber);
	}
	
	//댓글 작성
	@Override
	public void writeReply(FreeReplyVO vo) throws Exception {
		
		freeReplydao.writeReply(vo);
	}
	
	//댓글 수정
	@Override
	public void updateReply(FreeReplyVO vo) throws Exception {
		
		freeReplydao.updateReply(vo);
	}
	
	//댓글 삭제
	@Override
	public void deleteReply(FreeReplyVO vo) throws Exception {
		
		freeReplydao.deleteReply(vo);
	}
	
	//선택된 댓글 조회
	@Override
	public FreeReplyVO selectReply(int frnumber) throws Exception {
		
		return freeReplydao.selectReply(frnumber);
	}
	
}