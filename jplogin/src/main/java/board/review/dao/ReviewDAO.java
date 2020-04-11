package board.review.dao;

import java.util.List;

import board.review.domain.CategoryVO;
import board.review.domain.ReplyListVO;
import board.review.domain.ReviewVO;
import board.review.domain.ReviewViewVO;

public interface ReviewDAO {

	//카테고리
	public List<CategoryVO> category() throws Exception;
	
	//동물 후기 등록
	public void register(ReviewVO vo) throws Exception;
	
	//동물 후기 목록
	public List<ReviewVO> reviewslist() throws Exception;
	/*
	//동물 후기 조회
	public ReviewVO reviewsView(int petnum) throws Exception;
	*/
	//동물 후기 조회 + 카테고리 조인
	public ReviewViewVO reviewsView(int petnum) throws Exception;
	
	//후기 수정
	public void reviewsModify(ReviewVO vo) throws Exception;
	
	//후기 삭제
	public void reviewsDelete(int petnum) throws Exception;
	
	//모든 댓글
	public List<ReplyListVO> allReply() throws Exception;
			
	//댓글 삭제
	public void deleteReply(int repnum) throws Exception;
}
