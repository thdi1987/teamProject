package board.free.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import board.free.domain.FreeBoardVO;
import syspage.paging.SearchCriteria;

@Repository
public class FreeDaoImpl implements FreeDao {

	private SqlSessionTemplate sqlSessionTemplate;

	public FreeDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	
	// 게시글 작성
	@Override
	public void write(FreeBoardVO boardVO) throws Exception {
		sqlSessionTemplate.insert("freeBoardMapper.insert", boardVO);
		
	}
	
	// 게시물 목록 조회
	@Override
	public List<FreeBoardVO> list(SearchCriteria scri) throws Exception {
	
		return sqlSessionTemplate.selectList("freeBoardMapper.listPage", scri);

	}
	
	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception{
		return sqlSessionTemplate.selectOne("freeBoardMapper.listCount");
	}
	
	// 게시물 조회
	@Override
	public FreeBoardVO read(int fbnumber) throws Exception {
			
		
		return sqlSessionTemplate.selectOne("freeBoardMapper.read", fbnumber);
	}
	
	public int updateCheck(int fbnumber , String fbpwd) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fbnumber", fbnumber);
		map.put("fbpwd", fbpwd);
		
		return sqlSessionTemplate.selectOne("freeBoardMapper.updateCheck", map);
	}
	
	// 게시물 수정
	@Override
	public void update(FreeBoardVO boardVO) throws Exception {
		
		sqlSessionTemplate.update("freeBoardMapper.update", boardVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int fbnumber , String fbpwd) throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("fbnumber", fbnumber);
		map.put("fbpwd", fbpwd);
		
		sqlSessionTemplate.delete("freeBoardMapper.delete", map);
	}
	
}