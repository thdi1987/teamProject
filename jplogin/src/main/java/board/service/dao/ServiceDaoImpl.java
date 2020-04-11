package board.service.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import board.service.domain.ServiceVO;
import syspage.paging.SearchCriteria;

@Repository
public class ServiceDaoImpl implements ServiceDao {

	private SqlSessionTemplate sqlSessionTemplate;
	
	public ServiceDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}	
	// 게시글 작성
		@Override
		public void write(ServiceVO serviceVO) throws Exception {
			sqlSessionTemplate.insert("ServiceDao.Insert", serviceVO);
			
		}
		
		// 게시물 목록 조회
		@Override
		public List<ServiceVO> list(SearchCriteria scri) throws Exception {
		
			return sqlSessionTemplate.selectList("ServiceDao.ListPage", scri);

		}
		
		// 게시물 총 갯수
		@Override
		public int listCount(SearchCriteria scri) throws Exception{
			return sqlSessionTemplate.selectOne("ServiceDao.ListCount");
		}
		
		// 게시물 조회
		@Override
		public ServiceVO read(int SCNUM) throws Exception {
				
			return sqlSessionTemplate.selectOne("ServiceDao.Read", SCNUM);
		}
		
		// 게시물 수정
		@Override
		public void update(ServiceVO serviceVO) throws Exception {
			
			sqlSessionTemplate.update("ServiceDao.Update", serviceVO);
		}

		// 게시물 삭제
		@Override
		public void delete(int SCNUM) throws Exception {
			
			sqlSessionTemplate.delete("ServiceDao.Delete", SCNUM);
		}
	
}
