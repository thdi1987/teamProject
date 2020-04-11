package board.service.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import board.service.domain.ServiceVO;
import board.service.service.ServiceService;
import syspage.paging.PageMaker;
import syspage.paging.SearchCriteria;

@Controller
public class ServiceController {

	private ServiceService serviceService;

	public void setServiceService(ServiceService serviceService) {
		this.serviceService = serviceService;
	}
	
	// list에 대한 중복코드
	private void listServiceProc(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		model.addAttribute("list", serviceService.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(serviceService.listCount(scri));		
		

		model.addAttribute("pageMaker", pageMaker);
	}
	
	// read에 대한 중복코드
	private void readServiceProc(ServiceVO serviceVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		
		model.addAttribute("read", serviceService.read(serviceVO.getSCNUM()));
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
	
	
	//  게시판 글 작성 화면
	@RequestMapping(value = "/Service/writeView", method = RequestMethod.GET)
	public String writeView() throws Exception {

		return "/Service/writeView";
	}

	//  게시판 글 작성
	@RequestMapping(value = "/Service/write", method = RequestMethod.POST)
	public String write(ServiceVO serviceVO, HttpServletRequest request) throws Exception {

		serviceService.write(serviceVO);

		return "redirect:/Service/listSys";
	}

	//  게시판 사용자 목록 조회
	@RequestMapping(value = "/Service/listUser", method = RequestMethod.GET)
	public String listUser(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		System.out.println("??");
		listServiceProc(model, scri);

		return "/Service/list";

	}

	//  게시판 관리자 목록 조회
	@RequestMapping(value = "/Service/listSys", method = RequestMethod.GET)
	public String listSys(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		listServiceProc(model, scri);

		return "/Service/list";

	}	

	//  사용자 게시판 조회
	@RequestMapping(value = "/Service/readViewUser", method = RequestMethod.GET)
	public String readUser(ServiceVO serviceVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {

		readServiceProc(serviceVO, scri, model);

		return "/Service/readView";
	}

	//  관리자 게시판 조회
	@RequestMapping(value = "/Service/readViewSys", method = RequestMethod.GET)
	public String readUserSys(ServiceVO serviceVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {

		readServiceProc(serviceVO, scri, model);

		return "/Service/readView";
	}

	//  게시판 수정뷰
	@RequestMapping(value = "/Service/updateView", method = RequestMethod.GET)
	public String updateView(ServiceVO serviceVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {

		model.addAttribute("update", serviceService.read(serviceVO.getSCNUM()));
		model.addAttribute("scri", scri);
		
		return "/Service/updateView";
	}

	//  게시판 수정
	@RequestMapping(value = "/Service/update", method = RequestMethod.POST)
	public String update(ServiceVO serviceVO, @ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr) throws Exception {		
		
		serviceService.update(serviceVO);
		
		updateAndDeleteProc(scri,rttr);

		return "redirect:/Service/listSys";
	}

	//  게시판 삭제
	@RequestMapping(value = "/Service/delete", method = RequestMethod.POST)
	public String delete(ServiceVO serviceVO, @ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr) throws Exception {

		serviceService.delete(serviceVO.getSCNUM());

		updateAndDeleteProc(scri, rttr);
		
		return "redirect:/Service/listSys";
	}
}
