package board.quest.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import board.quest.domain.QuestVO;
import board.quest.service.QuestService;
import syspage.paging.PageMaker;
import syspage.paging.SearchCriteria;

@Controller
public class QuestController {

	private QuestService questService;

	public void setQuestService(QuestService questService) {
		this.questService = questService;
	}
	
	// list에 대한 중복코드
	private void listQuestProc(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		model.addAttribute("list", questService.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(questService.listCount(scri));
		
		

		model.addAttribute("pageMaker", pageMaker);
	}
	
	// read에 대한 중복코드
	private void readQuestProc(QuestVO questVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		
		model.addAttribute("read", questService.read(questVO.getQNUM()));
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
	
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/Quest/writeView", method = RequestMethod.GET)
	public String writeView() throws Exception {

		return "/Quest/writeView";
	}

	//  게시판 글 작성
	@RequestMapping(value = "/Quest/write", method = RequestMethod.POST)
	public String write(QuestVO questVO, HttpServletRequest request) throws Exception {

		questService.write(questVO);

		return "redirect:/Service/listUser";
	}

	// 게시판 사용자 목록 조회
	@RequestMapping(value = "/Quest/listUser", method = RequestMethod.GET)
	public String listUser(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		listQuestProc(model, scri);

		return "/Quest/list";

	}

	// 게시판 관리자 목록 조회
	@RequestMapping(value = "/Quest/listSys", method = RequestMethod.GET)
	public String listSys(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		listQuestProc(model, scri);

		return "/Quest/list";

	}	

	//  사용자 게시판 조회
	@RequestMapping(value = "/Quest/readViewUser", method = RequestMethod.GET)
	public String readUser(QuestVO questVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {

		readQuestProc(questVO, scri, model);

		return "/Quest/readView";
	}

	//  관리자 게시판 조회
	@RequestMapping(value = "/Quest/readViewSys", method = RequestMethod.GET)
	public String readUserSys(QuestVO questVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {

		readQuestProc(questVO, scri, model);

		return "/Quest/readView";
	}

	// 게시판 수정뷰
	@RequestMapping(value = "/Quest/updateView", method = RequestMethod.GET)
	public String updateView(QuestVO questVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {

		model.addAttribute("update", questService.read(questVO.getQNUM()));
		model.addAttribute("scri", scri);
		
		return "/Quest/updateView";
	}

	// 게시판 수정
	@RequestMapping(value = "/Quest/update", method = RequestMethod.POST)
	public String update(QuestVO questVO, @ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr) throws Exception {		
		
		questService.update(questVO);
		
		updateAndDeleteProc(scri,rttr);

		return "redirect:/Quest/listSys";
	}

	//  게시판 삭제
	@RequestMapping(value = "/Quest/delete", method = RequestMethod.GET)
	public String delete(QuestVO questVO, @ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr) throws Exception {

		questService.delete(questVO.getQNUM());

		updateAndDeleteProc(scri, rttr);
		
		return "redirect:/Quest/listSys";
	}
}
