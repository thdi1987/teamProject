package member.dao;

import java.util.List;

import board.notice.domain.NoticeVO;
import member.domain.MemberVO;

public interface MemberDao {
	
	 public abstract void insertNormal(MemberVO memberVO);
	 
	 public abstract void insertParcelOut(MemberVO memberVO);
	 
	 public abstract int updateEmailAuthentication(String MEMAILCHECK);
	 
	 public abstract int idCheck(String MID);
	 
	 public abstract int regCheck(String name, String MREGISTRATION);	
	 
	 public abstract int emailChk(String MEMAILCHECK);
	 
	 public abstract int findIdEmailCheck(String email);
	 
	 public abstract int findPasswordCheck(String id, String email);
	 
	 public abstract int updatePassword(String id, String email, String temporaryPass);
	 
	 public abstract MemberVO findPassword(String id, String email);
	 
	 public abstract MemberVO sendEmail(String MID);
	 
	 public abstract MemberVO selectById(String id);
	
	 public abstract MemberVO loginCheck(String id);

	 public abstract int updateEmailCode(String code, String email);
	 
	 public abstract MemberVO findId(String email);
	 
	 public abstract void delete(String id);
	 
	 public abstract MemberVO findPasswordId(String id);
	 
	 public abstract MemberVO findBank(String id);
	 
	 public abstract void infoUpdate(String id, String pwd, String email, String phones);
	 
	 public abstract MemberVO info (String id);
	 
	 public MemberVO selectBuyer(String id);
	 
	 public MemberVO selectAdopt(int AANO);
	 
	 public abstract List<NoticeVO> noticeList();
}
