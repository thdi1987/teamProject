package message.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import message.domain.MessageVO;
import syspage.paging.SearchCriteria;



@Repository
public class MessageDaoImpl implements MessageDao {
	
	private SqlSessionTemplate sqlSessionTemplate;

	public MessageDaoImpl (SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	// 쪽지 작성
	@Override
	public void writemessage(MessageVO messageVO) throws Exception {
		sqlSessionTemplate.insert("messageMapper.insert", messageVO);
		
	}
	
	// 쪽지 내역 보기
	@Override
	public List<MessageVO> list(SearchCriteria scri) throws Exception {
		
		return sqlSessionTemplate.selectList("messageMapper.listpage", scri);
	}
	
	// 쪽지 총 갯수
	@Override
	public int messageCount(SearchCriteria scri) throws Exception{
		
		return sqlSessionTemplate.selectOne("messageMapper.messageCount", scri);
	}
	
	//쪽지 내용 읽기
	@Override
	public MessageVO read(int msnum) throws Exception {
		
		return sqlSessionTemplate.selectOne("messageMapper.read",msnum);
	}
	
	//쪽지 삭제
	@Override
	public void delete(int msnum) throws Exception {
		
		sqlSessionTemplate.delete("messageMapper.delete", msnum);
	}
}
