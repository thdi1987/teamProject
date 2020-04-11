package member.service;

import member.dao.MemberDao;
import member.domain.AuthInfo;
import member.domain.MemberVO;

public class AuthService {
	private MemberDao memberDao;	
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	//세션에 아이디, 이름, 이메일, 회원분류, 이메인인증 여부 저장
	public AuthInfo authenticate(String id) {		
		MemberVO member = memberDao.selectById(id);		
		return new AuthInfo(member.getMID(), member.getMNAME(), member.getMEMAIL(), member.getMDIVISION(), member.getMEMAILCHECK());
	}
}
