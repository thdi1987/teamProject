package board.review.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import board.review.domain.CategoryVO;
import board.review.domain.ReplyListVO;
import board.review.domain.ReviewVO;
import board.review.domain.ReviewViewVO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	private SqlSessionTemplate sqlSessionTemplate;	
	
	
	public ReviewDAOImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	//매퍼
	private static String namespace="reviewMapper";	
	
	
	public static void setNamespace(String namespace) {
		ReviewDAOImpl.namespace = namespace;
	}

	//카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".category");
	}
	
	//동물 후기 등록
	@Override
	public void register(ReviewVO vo) throws Exception {
		sqlSessionTemplate.insert(namespace + ".register",vo);
	}
	
	//동물 후기 목록
	@Override
	public List<ReviewVO> reviewslist() throws Exception {
		return sqlSessionTemplate.selectList(namespace + ".reviewslist");
	}
	/*
	//동물 후기 조회
	@Override
	public ReviewVO reviewsView(int petnum) throws Exception {
		return sql.selectOne(namespace +".reviewsView",petnum);
	}
	*/
	//동물 후기 조회 + 카테고리 조인
	@Override
	public ReviewViewVO reviewsView(int petnum) throws Exception {
		return sqlSessionTemplate.selectOne(namespace +".reviewsView",petnum);
	}
	
	//동물 후기 수정
	@Override
	public void reviewsModify(ReviewVO vo) throws Exception{
		sqlSessionTemplate.update(namespace +".reviewsModify",vo);
	}
	
	//동물 후기 삭제
	@Override
	public void reviewsDelete(int petnum) throws Exception{
		sqlSessionTemplate.delete(namespace +".reviewsDelete",petnum);
	}
	//모든 댓글
	@Override
	public List<ReplyListVO> allReply() throws Exception {
				
		return sqlSessionTemplate.selectList(namespace + ".allReply");
	}
			
	//댓글 삭제
	@Override
	public void deleteReply(int repnum) throws Exception {
		sqlSessionTemplate.delete(namespace +".deleteReply", repnum);
	}
}