package board.buyer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import board.buyer.domain.BuyerVO;
import board.buyer.service.BuyerService;
import member.domain.AuthInfo;
import syspage.paging.PageMaker;
import syspage.paging.SearchCriteria;

@Controller
public class BuyerController {

	private BuyerService buyerService;

	public void setBuyerService(BuyerService buyerService) {
		this.buyerService = buyerService;
	}
	
	// list에 대한 중복코드
	private void listNoticeProc(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		model.addAttribute("list", buyerService.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(buyerService.listCount(scri));
		
		

		model.addAttribute("pageMaker", pageMaker);
	}	
	
	
	// update, delete에 대한 중복코드
	private void updateAndDeleteProc(@ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr) throws Exception {		

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
	}
	
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/Buyer/writeView", method = RequestMethod.GET)
	public String writeView() throws Exception {

		return "/Buyer/writeView";
	}

	// 게시판 글 작성
	@RequestMapping(value = "/Buyer/write", method = RequestMethod.POST)
	public String write(BuyerVO buyerVO, HttpServletRequest request, HttpSession session) throws Exception {
		
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");		
		String id = authInfo.getId();
		System.out.println(id + "1");
		buyerVO.setBID(id);	
		
		buyerService.write(buyerVO);
		System.out.println(id + "2");
		return "redirect:/message/list";
	}
	
	// 게시판 관리자 목록 조회
	@RequestMapping(value = "/Buyer/listSys", method = RequestMethod.GET)
	public String listSys(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		listNoticeProc(model, scri);

		return "/Buyer/list";

	}	

	// 게시판 수정
	@RequestMapping(value = "/Buyer/update", method = RequestMethod.POST)
	public String update(BuyerVO buyerVO, @ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr) throws Exception {		
		
		buyerService.select(buyerVO.getBNO());
		
		updateAndDeleteProc(scri,rttr);

		return "redirect:/Buyer/listSys";
	}
	
}
