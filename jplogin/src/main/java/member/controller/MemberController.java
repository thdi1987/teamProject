package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import member.domain.AuthInfo;
import member.domain.MemberVO;
import member.service.MemberService;


@Controller
public class MemberController {		

	
	private MemberService memberService;

	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	//메인
	@RequestMapping(value = "/main")
	public String main() {
		return "/main";
	}
	
	//이용약관
	@RequestMapping(value = "/member/agreement")
	public String agreement() {
		return "/member/agreement";
	}
	//회원분류
	@RequestMapping(value = "/member/selectMember", method = RequestMethod.POST)
	public String selectMember(@RequestParam(value = "agree", defaultValue = "false") Boolean agree) {
		
		return "/member/selectMember";
	}
	//일반회원가입
	@RequestMapping(value = "/member/writeNormal", method = RequestMethod.GET)
	public String writeNormal(Model model) {
		model.addAttribute("memberVO", new MemberVO());
		return "/member/writeNormal";
	}
	//일반회원가입
	@RequestMapping(value = "/member/writeNormal", method = RequestMethod.POST)
	public String writeNormal(MemberVO memberVO,HttpServletRequest request, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "/member/writeNormal";
		}	
		
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		
		memberVO.setMADDRESS("우편번호  : "+ addr1 + ", 주소 : "+addr2+" "+addr3);
		
		String password = request.getParameter("MPASSWORD");
		String email = request.getParameter("MEMAIL");		
		String phnum = request.getParameter("phnum");
		String phone = request.getParameter("MPHONE");		
		String account = request.getParameter("MACCOUNT");			
		
		memberService.writeNormal(memberVO, password, email, phnum, phone, account);
		
		return "/member/emailAuthentication";
	}
	//분양회원가입
	@RequestMapping(value = "/member/writeParcelOut", method = RequestMethod.GET)
	public String writeParcelOut(Model model) {
		model.addAttribute("memberVO", new MemberVO());
		return "/member/writeParcelOut";
	}
	//분양회원가입
	@RequestMapping(value = "/member/writeParcelOut", method = RequestMethod.POST)
	public String writeParcelOut(MemberVO memberVO, HttpServletRequest request, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			return "/member/writeParcelOut";
		}	
		
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		
		memberVO.setMADDRESS("우편번호  : "+ addr1 + ", 주소 : "+addr2+" "+addr3);
		
		String password = request.getParameter("MPASSWORD");
		String email = request.getParameter("MEMAIL");		
		String phnum = request.getParameter("phnum");
		String phone = request.getParameter("MPHONE");		
		String account = request.getParameter("MACCOUNT");		
		
		memberService.writeParcelOut(memberVO, password, email, phnum, phone, account);
		
		return "/member/emailAuthentication";
	}
	//이메일 인증
	@RequestMapping(value = "/member/emailAuthentication", method = RequestMethod.GET)
	public String emailAuthentication(Model model) {
		
		return "/member/emailAuthentication";
	}
	//이메일 인증
	@RequestMapping(value = "/member/emailAuthentication", method = RequestMethod.POST)
	public String emailAuthentication(MemberVO memberVO) {
		
		String code = memberVO.getMEMAILCHECK();		
		memberService.emailAuthentication(code);		
		return "redirect:/main";
	}
	//이메일 재인증
	@RequestMapping(value = "/member/reEmailAuthentication", method = RequestMethod.GET)
	public String reEmailAuthentication(Model model) {
		
		return "/member/reEmailAuthentication";
	}
	//이메일 재인증
	@RequestMapping(value = "/member/reEmailAuthentication", method = RequestMethod.POST)
	public String reEmailAuthentication(HttpServletRequest request) {
		
		String code = request.getParameter("MEMAILCHECK");
		memberService.emailAuthentication(code);		
		return "redirect:/member/login";
	}
	//아이디 체크
	@RequestMapping(value = "/member/idCheck", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String idCheck(HttpServletRequest request) {
		
		String userId = (String) request.getParameter("MID");		
		int result = memberService.idCheck(userId);		
		return Integer.toString(result);
	}
	//이름 체크
	@RequestMapping(value = "/member/regCheck", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String regCheck(HttpServletRequest request) {
		String name = request.getParameter("MNAME");		
		String reg = (String) request.getParameter("MREGISTRATION");
		int result = memberService.regCheck(name,reg);
		return Integer.toString(result);
	}
	//이름과 동물등록번호가 DB에 저장되어있는 소유주 이름과 동물등록번호가 맞는지 확인
	@RequestMapping(value = "/member/buyerCheck", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String buyerCheck(HttpServletRequest request,HttpSession session) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");		
		String name = authInfo.getName();
		
		String reg = (String) request.getParameter("BPET");
		int result = memberService.regCheck(name,reg);
		return Integer.toString(result);
	}
	//이메일 체크
	@RequestMapping(value = "/member/emailCheck", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String emailChk(HttpServletRequest request) {
		String eck = (String) request.getParameter("MEMAILCHECK");		
		int result = 0;
		if(eck == null) {
			result = 2;
			return Integer.toString(result);
		}
		
		result = memberService.emailChk(eck);		
		return Integer.toString(result);
	}
	//이메일 전송
	@RequestMapping(value = "/member/sendEmail", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String sendEmail(HttpServletRequest request) {
		
		String MID = (String) request.getParameter("MID");		
		
		String result = memberService.sendEmail(MID);
		
		return result;
	}
	//아이디 찾기
	@RequestMapping(value = "/member/findId", method = RequestMethod.GET)
	public String findId(Model model) {
		
		return "/member/findId";
	}
	//아이디 찾기
	@RequestMapping(value = "/member/findId", method = RequestMethod.POST)
	public String findId(HttpServletRequest request) {
		
		String email = request.getParameter("MEMAIL");
		memberService.findId(email);
		
		return "redirect:/member/login";
	}	
	//아이디, 비밀번호 찾기 할때 이메일체크
	@RequestMapping(value = "/member/findIdEmailCheck", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String findIdEmailCheck(HttpServletRequest request) {
		String email = (String) request.getParameter("MEMAIL");
		int result = memberService.findIdEmailCheck(email);
		return Integer.toString(result);
	}
	//비밀번호 찾기
	@RequestMapping(value = "/member/findPassword", method = RequestMethod.GET)
	public String findPassword(Model model) {
		
		return "/member/findPassword";
	}
	
	//비밀번호 찾기
	@RequestMapping(value = "/member/findPassword", method = RequestMethod.POST)
	public String findPassword(HttpServletRequest request) {
		
		String email = (String) request.getParameter("MEMAIL");
		String id = (String) request.getParameter("MID");

		memberService.updatePassword(id, email);
		
		return "redirect:/member/login";
	}
	//비밀번호 찾기에서 아이디와 이메일이 같은지 확인
	@RequestMapping(value = "/member/findPasswordCheck", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String findPasswordCheck(HttpServletRequest request) {
		String email = (String) request.getParameter("MEMAIL");
		String id = (String) request.getParameter("MID");
		int result = memberService.findPasswordCheck(id ,email);
		return Integer.toString(result);
	}
	//로그인 체크
	@RequestMapping(value = "/member/loginCheck", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String loginCheck(HttpSession session, HttpServletRequest request) {
		String id = (String) request.getParameter("MID");
		String matchPassword = request.getParameter("MPASSWORD");		
		String result = memberService.loginCheck(id, matchPassword);
		
		return result;
	}
	
	//회원 삭제
	@RequestMapping(value = "/member/delete", method = RequestMethod.GET)
	public String deleteId(Model model) {
		
		return "/member/delete";
	}
	//회원 삭제
	@RequestMapping(value = "/member/delete", method = RequestMethod.POST)
	public String deleteId(HttpServletRequest request) {
		
		String id = request.getParameter("MID");
		memberService.delete(id);
		
		return "redirect:/Notice/listSys";
	}	
	// 비밀번호 확인
	@RequestMapping(value = "/member/passwordCheck", method = RequestMethod.GET)
	public String passwordCheck(Model model) {
		
		return "/member/passwordCheck";
	}
	//아이디와 비밀번호로 비밀번호 확인
	@RequestMapping(value = "/member/passwordCheck", method = RequestMethod.POST)
	@ResponseBody
	public String passwordCheck(HttpServletRequest request, HttpSession session) {
		
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");	
		String id = authInfo.getId();		
		String password = request.getParameter("MPASSWORD");		
		String result = memberService.passwordCheck(id, password);
		
		return result;
	}
	//회원 수정
	@RequestMapping(value = "/MyPage/infoModify", method = RequestMethod.GET)
	public String infoModipy(MemberVO member, Model model,HttpSession session) {
		
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");	
		String id = authInfo.getId();
		model.addAttribute("info", memberService.findBank(id));		
		
		return "/MyPage/infoModify";
	}
	//회원 수정
	@RequestMapping(value = "/member/infoUpdate", method = RequestMethod.POST)
	public String infoUpdate(HttpServletRequest request,HttpSession session) {
		
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");	
		String id = authInfo.getId();
		String password = request.getParameter("MPASSWORD");
		String email = request.getParameter("MEMAIL");
		String phnum = request.getParameter("phnum");
		String phone = request.getParameter("MPHONE");
		
		memberService.infoUpdate(id, password, email, phnum, phone);
		
		return "redirect:/MyPage/info";
	}	
	//세션저장된 아이디로 회원삭제
	@RequestMapping(value = "/member/secession", method = RequestMethod.GET)
		public String secession(HttpServletRequest request,HttpSession session) {
		
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");	
		String id = authInfo.getId();		
		
		memberService.delete(id);
		
		return "redirect:/MyPage/mypage";
	}
	//세션 아이디로 본인 정보 확인
	@RequestMapping(value = "/MyPage/info", method = RequestMethod.GET)
	public String info(HttpServletRequest request, HttpSession session, Model model) {
	
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");	
		String id = authInfo.getId();		
	
		model.addAttribute("info", memberService.info(id));	
	
		return "/MyPage/info";
	}
	//동물정보 
	@RequestMapping(value = "/animalinfo/petInfo", method = RequestMethod.GET)
	public String petInfo() {		
	
		return "/animalInfo/petInfo";
	}
	//동물정보(강아지)
	@RequestMapping(value = "/animalInfo/dog", method = RequestMethod.GET)
	public String dog() {		
	
		return "/animalInfo/dog";
	}
	//동물정보(고양이)
	@RequestMapping(value = "/animalInfo/cat", method = RequestMethod.GET)
	public String cat() {		
	
		return "/animalInfo/cat";
	}
	//동물정보(기타)
	@RequestMapping(value = "/animalInfo/etcpet", method = RequestMethod.GET)
	public String etcpet() {		
	
		return "/animalInfo/etcpet";
	}		
		
	
}
