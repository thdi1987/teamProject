package message.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import member.domain.AuthInfo;
import message.domain.MessageVO;
import message.service.MessageService;
import syspage.paging.PageMaker;
import syspage.paging.SearchCriteria;



@Controller
public class MessageController {
	
	
	MessageService messageService;	
	
	
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}

	//쪽지 작성 화면
	@RequestMapping(value = "/message/writerViewMypage", method = RequestMethod.GET)
	public String writerViewMypage() throws Exception{
		
		return "/message/writerViewMypage";
	}
	
	//쪽지 작성 화면
	@RequestMapping(value = "/message/writeViewPopUp", method = RequestMethod.GET)
	public String writerViewPopUp() throws Exception{
		return "/message/writeViewPopUp";
	}
	
	// 쪽지 작성
	@RequestMapping(value = "/message/writemessageMypage", method = RequestMethod.POST)
		public String writemessageMypage(MessageVO messageVO, HttpSession session) throws Exception{			
			AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");	
			String id = authInfo.getId();	
			
			messageVO.setMsid2(id);
		
			messageService.writemessage(messageVO);
			
			return "redirect:/message/list";
	}
	// 쪽지 작성
	@RequestMapping(value = "/message/writemessagePopUp", method = RequestMethod.POST)
		public String writemessagePopUp(MessageVO messageVO, HttpSession session) throws Exception{			
				
			AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");	
			String id = authInfo.getId();	
			
			messageVO.setMsid2(id);
			
			messageService.writemessage(messageVO);
				
			return "redirect:/ParcelOut/list";
		}
	
	//쪽지 내역 조회
	@RequestMapping(value = "/message/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpSession session) throws Exception{		
		
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");	
		String id = authInfo.getId();
		
		scri.setId(id);		
		
		model.addAttribute("list", messageService.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(messageService.messageCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "message/list";
	}
	
	//쪽지 내용 읽기
	@RequestMapping(value = "/message/readView", method = RequestMethod.GET)
	public String read(MessageVO messageVO, Model model) throws Exception{		
		
		model.addAttribute("read",messageService.read(messageVO.getMsnum()));
		
		return "message/readView";
	}
	
	//쪽지 삭제
	@RequestMapping(value = "/message/delete", method = RequestMethod.POST)
	public String delete(MessageVO messageVO) throws Exception{	
		
		messageService.delete(messageVO.getMsnum());
		
		return "redirect:/message/list";
	}
	
}
