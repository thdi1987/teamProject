package message.dao;

import java.util.List;

import message.domain.MessageVO;
import syspage.paging.SearchCriteria;


public interface MessageDao {

	// 쪽지 작성
	public void writemessage(MessageVO messageVO) throws Exception;
	
	//쪽지 내역 보기
	public List<MessageVO> list(SearchCriteria scri) throws Exception;
	
	//쪽지 총 갯수
	public int messageCount(SearchCriteria scri) throws Exception;
	//쪽지 내용 조회
	public MessageVO read(int msnum) throws Exception;
	
	//쪽지 삭제
	public void delete(int msnum) throws Exception;
}
