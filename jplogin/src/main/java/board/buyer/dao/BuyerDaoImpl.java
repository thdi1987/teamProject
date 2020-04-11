package board.buyer.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import board.buyer.domain.BuyerVO;
import member.domain.MemberVO;
import syspage.paging.SearchCriteria;

@Repository
public class BuyerDaoImpl implements BuyerDao {

	private SqlSessionTemplate sqlSessionTemplate;
	
	public BuyerDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}	
	
	// 게시글 작성
		@Override
		public void write(BuyerVO buyerVO) throws Exception {
			sqlSessionTemplate.insert("BuyerDao.Insert", buyerVO);
			
		}
		
		// 게시물 목록 조회
		@Override
		public List<BuyerVO> list(SearchCriteria scri) throws Exception {
		
			return sqlSessionTemplate.selectList("BuyerDao.ListPage", scri);

		}
		
		// 게시물 총 갯수
		@Override
		public int listCount(SearchCriteria scri) throws Exception{
			return sqlSessionTemplate.selectOne("BuyerDao.ListCount");
		}		
		
		
		// 정보가져오기
		@Override
		public BuyerVO select(int BNO) throws Exception {
			
			List<BuyerVO> result = sqlSessionTemplate.selectList("BuyerDao.select", BNO);
			return result.isEmpty()?null:result.get(0);
		}
		
		public void update(String BID, String BPET, String BCODE, String BBANK) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("BID", BID);
			map.put("BPET", BPET);
			map.put("BCODE", BCODE);
			map.put("BBANK", BBANK);
			sqlSessionTemplate.update("BuyerDao.update", map);
			return ;
		}
		
		public void delete(String BID) {
			sqlSessionTemplate.delete("BuyerDao.delete", BID);
		}

		
}
