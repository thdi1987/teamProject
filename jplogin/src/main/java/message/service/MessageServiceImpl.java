package message.service;

import java.util.List;

import org.springframework.stereotype.Service;

import message.dao.MessageDao;
import message.domain.MessageVO;
import syspage.paging.SearchCriteria;

@Service
public class MessageServiceImpl implements MessageService {
	
	private MessageDao messageDao;	
	
	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}

	// 쪽지 작성
	@Override
	public void writemessage(MessageVO messageVO) throws Exception {
		messageDao.writemessage(messageVO);
	}
	
	//쪽지 내역 조회
	@Override
	public List<MessageVO> list(SearchCriteria scri) throws Exception {
		
		return messageDao.list(scri);
	}
	
	//쪽지 내용 읽기
	@Override
	public MessageVO read(int msnum) throws Exception {
		
		return messageDao.read(msnum);
	}
	
	//쪽지 총 갯수
	@Override
	public int messageCount(SearchCriteria scri) throws Exception {
		
		return messageDao.messageCount(scri);
	}
	//쪽지 삭제
	@Override
	public void delete(int msnum) throws Exception {
		
		messageDao.delete(msnum);
	}

}
