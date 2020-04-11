package member.service;


import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import board.notice.domain.NoticeVO;
import member.dao.MemberDao;
import member.domain.MemberVO;
import member.mail.MailService;
import member.mail.SendMail;
import member.seed.KISA_SEED;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	@Autowired
	private SendMail sm;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private KISA_SEED seed;
	
	
	
	public void setMailService(MailService mailService) {
		this.mailService = mailService;
	}


	public void setSeed(KISA_SEED seed) {
		this.seed = seed;
	}	
	
	
	public void setPwdEncoder(BCryptPasswordEncoder pwdEncoder) {
		this.pwdEncoder = pwdEncoder;
	}	

	
	public void setSm(SendMail sm) {
		this.sm = sm;
	}
	
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}	
	
	public void writeNormal(MemberVO memberVO, String password, String email, String phnum, String phone, String account) {		
		//비밀번호 해싱
		String pass = pwdEncoder.encode(password);
		memberVO.setMPASSWORD(pass);
		//핸드폰번호 
		String phones = phnum + "-" + phone;
		memberVO.setMPHONE(phones);		
		//계좌번호 암호화
		if (account != null) {			
			try {
				String seedAccount = seed.encrypt(account);
				memberVO.setMACCOUNT(seedAccount);				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}		
		//숫자 랜덤코드
		String code = Integer.toString((int) ((Math.random()*999999)+100000));
		memberVO.setMEMAILCHECK(code);
		//이메일전송
		sm.sendmail(email, code);
		memberDao.insertNormal(memberVO);		
		
	}
	
	public void writeParcelOut(MemberVO memberVO, String password, String email, String phnum, String phone, String account) {
		//비밀번호 해싱
		String pass = pwdEncoder.encode(password);
		memberVO.setMPASSWORD(pass);
		//핸드폰번호 
		String phones = phnum + "-" + phone;
		memberVO.setMPHONE(phones);		
		//계좌번호 암호화
		if (account != null) {			
			try {
				String seedAccount = seed.encrypt(account);
				memberVO.setMACCOUNT(seedAccount);				
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}		
		//숫자 랜덤코드
		String code = Integer.toString((int) ((Math.random()*999999)+100000));
		memberVO.setMEMAILCHECK(code);
		//이메일전송
		sm.sendmail(email, code);
		memberDao.insertParcelOut(memberVO);		
		
	}
	
	public void emailAuthentication(String MEMAILCHECK) {
		memberDao.updateEmailAuthentication(MEMAILCHECK);
	}
	
	public int idCheck(String MID) {
		int result = memberDao.idCheck(MID);
		return result;
	}
	
	public int regCheck(String name, String MREGISTRATION) {
		int result = memberDao.regCheck(name, MREGISTRATION);
		return result;
	}
	
	public int emailChk(String MEMAILCHECK) {
		int result = memberDao.emailChk(MEMAILCHECK);
		
		return result;
	}
	
	public String sendEmail(String MID) {
		
		MemberVO member = memberDao.sendEmail(MID);
		int result = 0;
		if(member==null) {
			result = 0;
			return Integer.toString(result);
		}
		String email = member.getMEMAIL();
		String emailCheck = member.getMEMAILCHECK();
		
		if(emailCheck.equals("Y")) {
			 result = 2;
			return Integer.toString(result);
		}
		
		String code = Integer.toString((int) ((Math.random()*999999)+100000));
		
		memberDao.updateEmailCode(code, email);
		
		String subject = "Safety Pet 재인증메일입니다."; 
		StringBuilder text = new StringBuilder();
		text.append("회원님의 재인증메일 코드는 [ "+ code +" ]입니다.");
		
		mailService.send(subject, text.toString(), email, null);
//		sm.sendmail(email, code);		
		result = 1;
		
		return Integer.toString(result);
	}
	
	public String loginCheck(String id, String matchPassword) {
		
		MemberVO member = memberDao.loginCheck(id);			
		
		int result = 0;		
		if(member == null) {
			result = 0;
			return Integer.toString(result);
		}
		String oldPassword = member.getMPASSWORD();
		String emailCheck = member.getMEMAILCHECK();
		
		if(!pwdEncoder.matches(matchPassword,oldPassword)) {
			 result = 0;
		}else if(!emailCheck.equals("Y")){
			 result = 1;
		}else {
			 result = 2;
		}
		return Integer.toString(result);
		
	}
	
	public MemberVO findPassword(String id, String email) {
		MemberVO result = memberDao.findPassword(id, email);
		return result;
	}
	
	
	public int updateEmailCode(String code , String email) {
		int result = memberDao.updateEmailCode(code, email);
		return result;
	}
	
	public int findIdEmailCheck(String email) {
		int result = memberDao.findIdEmailCheck(email);
		return result;
	}
	
	public MemberVO findId(String email) {
		MemberVO member = memberDao.findId(email);
		String id = member.getMID();		
		sm.sendmailFindId(email, id);
		return member;
	}
	
	public int findPasswordCheck(String id, String email) {
		int result = memberDao.findPasswordCheck(id, email);
		return result;
	}
	
	public int updatePassword(String id, String email) {
		
		String code = Integer.toString((int) ((Math.random()*999999)+100000));
		
		sm.temporaryPassword(email, id, code);
		
		String temporaryPass = pwdEncoder.encode(code);
		int result = memberDao.updatePassword(id, email, temporaryPass);
		return result;
	}
	
	public void delete(String id) {
		memberDao.delete(id);
	}
	
	public String passwordCheck(String id, String password) {		
		int result = 0;
		MemberVO member = memberDao.findPasswordId(id);		
		String oldPassword = member.getMPASSWORD();	
		
		if(!pwdEncoder.matches(password,oldPassword)) {
			 result = 0;
		}else {
			 result = 1;		}
		
		
		return Integer.toString(result);
	}
	
	public MemberVO findBank(String id) {
		
		MemberVO member = memberDao.findBank(id);
		
		String account = seed.decrypt(member.getMACCOUNT());
		member.setMACCOUNT(account);
		return member ; 
	}
	
	public void infoUpdate(String id, String password, String email, String phnum, String phone) {
		String pwd = pwdEncoder.encode(password);
		String phones = phnum + "-" + phone;
		
		memberDao.infoUpdate(id, pwd, email, phones);
	}
	
	public MemberVO info(String id) {
		
		MemberVO member = memberDao.info(id);
		String account = member.getMACCOUNT();
		String registration = member.getMREGISTRATION();
		String bcode = member.getMBCODE();
		if(bcode.equals("NULL")) {
			account = "등록된 계좌번호가 없습니다.";
			member.setMACCOUNT(account);
		}else {
			String seedAccount = bcode +"-"+seed.decrypt(account);
			member.setMACCOUNT(seedAccount);
		}	
		
		if(registration == null) {
			registration = "등록된 동물번호가 없습니다.";
			member.setMREGISTRATION(registration);
		}
		
		return member;
	}
	
	// 메인 공지사항 test
	public List<NoticeVO> noticeList(){
		return memberDao.noticeList();
	}
		
}
