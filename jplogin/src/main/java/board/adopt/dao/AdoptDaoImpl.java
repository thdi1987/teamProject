package board.adopt.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import board.adopt.domain.AdoptVO;
import board.notice.domain.NoticeVO;
import syspage.paging.SearchCriteria;

@Repository
public class AdoptDaoImpl implements AdoptDao {

	private SqlSessionTemplate sqlSessionTemplate;

	public AdoptDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	// 게시물 목록 조회
	@Override
	public List<AdoptVO> list(SearchCriteria scri) throws Exception {

		return sqlSessionTemplate.selectList("AdoptDao.listPage", scri);

	}
	
	public List<AdoptVO> listUser(SearchCriteria scri) throws Exception {	

		return sqlSessionTemplate.selectList("AdoptDao.listUserPage", scri);

	}
	
	public List<AdoptVO> listBuyer(SearchCriteria scri) throws Exception {	

		return sqlSessionTemplate.selectList("AdoptDao.listBuyerPage", scri);

	}

	// 게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSessionTemplate.selectOne("AdoptDao.listCount");
	}

	// 게시물 조회
	@Override
	public AdoptVO read(int AANO) throws Exception {

		return sqlSessionTemplate.selectOne("AdoptDao.read", AANO);
	}

	// 게시물 수정
	@Override
	public void update(AdoptVO adoptVO) throws Exception {

		sqlSessionTemplate.update("AdoptDao.Update", adoptVO);
	}

	// 게시물 삭제
	@Override
	public void delete(int AANO) throws Exception {

		sqlSessionTemplate.delete("AdoptDao.delete", AANO);
	}
	
	public AdoptVO selectPid (int AANO) {
		return sqlSessionTemplate.selectOne("AdoptDao.selectPid", AANO);

	}
	
	public void deletePet (int pid) {
		sqlSessionTemplate.delete("AdoptDao.deletePid", pid);
	}

}
