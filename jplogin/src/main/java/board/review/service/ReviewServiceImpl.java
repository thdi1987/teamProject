package board.review.service;


import java.util.List;


import org.springframework.stereotype.Service;

import board.review.dao.ReviewDAO;
import board.review.domain.CategoryVO;
import board.review.domain.ReplyListVO;
import board.review.domain.ReviewVO;
import board.review.domain.ReviewViewVO;

@Service
public class ReviewServiceImpl implements ReviewService {


	private ReviewDAO reviewDAO;	
	
	
	public void setReviewDAO(ReviewDAO reviewDAO) {
		this.reviewDAO = reviewDAO;
	}

	//카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return reviewDAO.category();
	}
	
	//동물 후기 등록
	@Override
	public void register(ReviewVO vo) throws Exception {
		reviewDAO.register(vo);
	}
	
	//동물 후기 목록
	@Override
	public List<ReviewVO> reviewslist() throws Exception {
		System.out.println("서비스");
		return reviewDAO.reviewslist();
	}
	
	/*
	//동물 후기 조회
	@Override
	public ReviewVO reviewsView(int petnum) throws Exception {
		return dao.reviewsView(petnum);
	}
	*/
	
	//동물 후기 조회 + 카테고리 조인
	@Override
	public ReviewViewVO reviewsView(int petnum) throws Exception {
		return reviewDAO.reviewsView(petnum);
	}
	
	//동물 후기 수정
	@Override
	public void reviewsModify(ReviewVO vo) throws Exception{
		reviewDAO.reviewsModify(vo);
	}
	
	//동물 후기 삭제
	@Override
	public void reviewsDelete(int petnum) throws Exception {
		reviewDAO.reviewsDelete(petnum);
	}
	
	//모든 댓글
	@Override
	public List<ReplyListVO> allReply() throws Exception {
		return reviewDAO.allReply();
	}
	
	//댓글 삭제
	@Override
	public void deleteReply(int repnum) throws Exception {
		reviewDAO.deleteReply(repnum);
	}
}