package board.adopt.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import board.adopt.domain.AdoptVO;
import board.adopt.service.AdoptService;
import member.domain.AuthInfo;
import syspage.paging.PageMaker;
import syspage.paging.SearchCriteria;

@Controller
public class AdoptController {

	private AdoptService adoptService;

	public void setAdoptService(AdoptService adoptService) {
		this.adoptService = adoptService;
	}	
		
	// list에 대한 중복코드
		private void listAdoptProc(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
			model.addAttribute("list", adoptService.list(scri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(adoptService.listCount(scri));
			
			

			model.addAttribute("pageMaker", pageMaker);
		}
		
		// read에 대한 중복코드
		private void readAdoptProc(AdoptVO adoptVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
			
			model.addAttribute("read", adoptService.read(adoptVO.getAANO()));
			model.addAttribute("scri", scri);
		}
		
		// update, delete에 대한 중복코드
		private void updateAndDeleteProc(@ModelAttribute("scri") SearchCriteria scri,
				RedirectAttributes rttr) throws Exception {		

			rttr.addAttribute("page", scri.getPage());
			rttr.addAttribute("perPageNum", scri.getPerPageNum());
			rttr.addAttribute("searchType", scri.getSearchType());
			rttr.addAttribute("keyword", scri.getKeyword());
		}
		
		// 입양신청내역 게시판
		// 입양신청내역 게시판 사용자 목록 조회
		@RequestMapping(value = "/adopt/listUser", method = RequestMethod.GET)
		public String listUser(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpSession session) throws Exception {
			
			AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");	
			String id = authInfo.getId();
			
			scri.setId(id);
			
			model.addAttribute("list", adoptService.listUser(scri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(adoptService.listCount(scri));
			
			

			model.addAttribute("pageMaker", pageMaker);

			return "/adopt/list";

		}
		
		@RequestMapping(value = "/adopt/listBuyer", method = RequestMethod.GET)
		public String listBuyer(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpSession session) throws Exception {
			
			AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");	
			String id = authInfo.getId();
			
			scri.setId(id);
			
			model.addAttribute("list", adoptService.listBuyer(scri));			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(scri);
			pageMaker.setTotalCount(adoptService.listCount(scri));			

			model.addAttribute("pageMaker", pageMaker);

			return "/adopt/listBuyer";

		}

		// 입양신청내역 게시판 관리자 목록 조회
		@RequestMapping(value = "/adopt/listSys", method = RequestMethod.GET)
		public String listSys(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

			listAdoptProc(model, scri);

			return "/adopt/list";

		}	

		// 입양신청내역 사용자 게시판 조회
		@RequestMapping(value = "/adopt/readViewUser", method = RequestMethod.GET)
		public String readUser(AdoptVO adoptVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
				throws Exception {

			readAdoptProc(adoptVO, scri, model);

			return "/adopt/readView";
		}

		//  관리자 게시판 조회
		@RequestMapping(value = "/adopt/readViewSys", method = RequestMethod.GET)
		public String readUserSys(AdoptVO adoptVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
				throws Exception {

			readAdoptProc(adoptVO, scri, model);

			return "/adopt/readView";
		}

		// 입양신청내역 게시판 수정뷰
		@RequestMapping(value = "/adopt/updateView", method = RequestMethod.GET)
		public String updateView(AdoptVO adoptVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
				throws Exception {

			model.addAttribute("update", adoptService.read(adoptVO.getAANO()));
			model.addAttribute("scri", scri);
			
			return "/adopt/updateView";
		}

		// 입양신청내역 게시판 수정
		@RequestMapping(value = "/adopt/update", method = RequestMethod.POST)
		public String update(AdoptVO adoptVO, @ModelAttribute("scri") SearchCriteria scri,
				RedirectAttributes rttr) throws Exception {		
			
			adoptService.update(adoptVO);
			
			updateAndDeleteProc(scri,rttr);

			return "redirect:/Adopt/listSys";
		}

		// 입양신청내역 게시판 삭제
		@RequestMapping(value = "/adopt/delete", method = RequestMethod.POST)
		public String delete(AdoptVO adoptVO, @ModelAttribute("scri") SearchCriteria scri,
				RedirectAttributes rttr) throws Exception {

			adoptService.delete(adoptVO.getAANO());

			updateAndDeleteProc(scri, rttr);
			
			return "redirect:/adopt/listSys";
		}
		
		@RequestMapping(value = "/adopt/deleteUser", method = RequestMethod.POST)
		public String deleteUser(AdoptVO adoptVO, @ModelAttribute("scri") SearchCriteria scri,
				RedirectAttributes rttr) throws Exception {

			adoptService.delete(adoptVO.getAANO());

			updateAndDeleteProc(scri, rttr);
			
			return "redirect:/adopt/listUser";
		}
		
		@RequestMapping(value = "/adopt/selection", method = RequestMethod.POST)
		public String selection(AdoptVO adoptVO, @ModelAttribute("scri") SearchCriteria scri,
				RedirectAttributes rttr) throws Exception {

						
			return "redirect:/adopt/listUser";
		}
		
		@RequestMapping(value = "/adopt/confirm", method = RequestMethod.POST)
		public String confirm(AdoptVO adoptVO, @ModelAttribute("scri") SearchCriteria scri,
		RedirectAttributes rttr, HttpSession session ) throws Exception {
			
			AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");	
			String id = authInfo.getId();				
			
			adoptService.confirm(adoptVO.getAANO(), id);
						
			return "redirect:/adopt/listUser";
		}
}
