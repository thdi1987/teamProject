package board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import board.domain.NoticeVO;
import board.service.BoardService;
import syspage.paging.PageMaker;
import syspage.paging.SearchCriteria;

@Controller
public class BoardController {

	private BoardService boardService;

	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	// list에 대한 중복코드
	private void listNoticeProc(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		model.addAttribute("list", boardService.list(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
	}
	
	// read에 대한 중복코드
	private void readNoticeProc(NoticeVO NoticeVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		
		model.addAttribute("read", boardService.read(NoticeVO.getNBNUM()));
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
	
	// 공지사항 게시판
	// 공지사항 게시판 글 작성 화면
	@RequestMapping(value = "/Notice/writeView", method = RequestMethod.GET)
	public String writeView() throws Exception {

		return "/Notice/writeView";
	}

	// 공지사항 게시판 글 작성
	@RequestMapping(value = "/Notice/write", method = RequestMethod.POST)
	public String write(NoticeVO NoticeVO, HttpServletRequest request) throws Exception {

		boardService.write(NoticeVO);

		return "redirect:/Notice/listSys";
	}

	// 공지사항 게시판 사용자 목록 조회
	@RequestMapping(value = "/Notice/listUser", method = RequestMethod.GET)
	public String listUser(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		listNoticeProc(model, scri);

		return "/Notice/list";

	}

	// 공지사항 게시판 관리자 목록 조회
	@RequestMapping(value = "/Notice/listSys", method = RequestMethod.GET)
	public String listSys(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		listNoticeProc(model, scri);

		return "/Notice/list";

	}	

	// 공지사항 사용자 게시판 조회
	@RequestMapping(value = "/Notice/readViewUser", method = RequestMethod.GET)
	public String readUser(NoticeVO NoticeVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {

		readNoticeProc(NoticeVO, scri, model);

		return "/Notice/readView";
	}

	// 공지사항 관리자 게시판 조회
	@RequestMapping(value = "/Notice/readViewSys", method = RequestMethod.GET)
	public String readUserSys(NoticeVO NoticeVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {

		readNoticeProc(NoticeVO, scri, model);

		return "/Notice/readView";
	}

	// 공지사항 게시판 수정뷰
	@RequestMapping(value = "/Notice/updateView", method = RequestMethod.GET)
	public String updateView(NoticeVO NoticeVO, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {

		model.addAttribute("update", boardService.read(NoticeVO.getNBNUM()));
		model.addAttribute("scri", scri);
		
		return "/Notice/updateView";
	}

	// 공지사항 게시판 수정
	@RequestMapping(value = "/Notice/update", method = RequestMethod.POST)
	public String update(NoticeVO NoticeVO, @ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr) throws Exception {		
		
		boardService.update(NoticeVO);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/Notice/listSys";
	}

	// 공지사항 게시판 삭제
	@RequestMapping(value = "/Notice/delete", method = RequestMethod.POST)
	public String delete(NoticeVO NoticeVO, @ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr) throws Exception {

		boardService.delete(NoticeVO.getNBNUM());

		updateAndDeleteProc(scri, rttr);
		
		return "redirect:/Notice/listSys";
	}
}
