package board.free.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import board.free.domain.FreeBoardVO;
import board.free.domain.FreeReplyVO;
import board.free.service.FreeReplyService;
import board.free.service.FreeService;
import syspage.paging.PageMaker;
import syspage.paging.SearchCriteria;

@Controller
@RequestMapping("/freeboard/*")
public class FreeController {	

	private FreeService freeService;		

	private FreeReplyService freeReplyService;
	
	public void setFreeService(FreeService freeService) {
		this.freeService = freeService;
	}

	public void setFreeReplyService(FreeReplyService freeReplyService) {
		this.freeReplyService = freeReplyService;
	}
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "/freeboard/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{		
		
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "/freeboard/write", method = RequestMethod.POST)
	public String write(FreeBoardVO FreeVO) throws Exception{	
		
		freeService.write(FreeVO);
		
		return "redirect:/freeboard/list";
	}
	
	//댓글 작성
	@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
	public String replyWrite(FreeReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {		
	
		
		freeReplyService.writeReply(vo);
		
		rttr.addAttribute("fbnumber",vo.getFbnumber());
		rttr.addAttribute("page",scri.getPage());
		rttr.addAttribute("perPageNum",scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/freeboard/readView";
	}
	
	// 게시판 목록 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{	
			
		model.addAttribute("list", freeService.list(scri));
			
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(freeService.listCount(scri));
			
		model.addAttribute("pageMaker", pageMaker);
			
		return "freeboard/list";
			
		}
	
	// 게시판 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(FreeBoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{		
		
		model.addAttribute("read", freeService.read(boardVO.getFbnumber()));
		model.addAttribute("scri", scri);
		
		//댓글 조회 추가
		List<FreeReplyVO> replyList = freeReplyService.readReply(boardVO.getFbnumber());
		model.addAttribute("replyList",replyList);
		return "freeboard/readView";
		}
		
	@RequestMapping(value="/updateCheck", method = RequestMethod.POST)
	@ResponseBody
	public String updateCheck(FreeBoardVO boardVO) throws Exception {		
	
		
		int result = freeService.updateCheck(boardVO.getFbnumber(), boardVO.getFbpwd());
		
			System.out.println(result);
			return Integer.toString(result);
	}	
	
	// 게시판 수정뷰
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(FreeBoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		
						
		model.addAttribute("update", freeService.read(boardVO.getFbnumber()));
		model.addAttribute("scri", scri);
			
		return "freeboard/updateView";
		}
		
	// 게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(FreeBoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		
			
		freeService.update(boardVO);
			
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
		return "redirect:/freeboard/list";
		}
	
	// 댓글 수정 GET
	@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(FreeReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		
			
		model.addAttribute("replyUpdate", freeReplyService.selectReply(vo.getFrnumber()));
		model.addAttribute("scri", scri);
			
		return "freeboard/replyUpdateView";
		}
		
	// 댓글 수정 POST
	@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(FreeReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
	
			
		freeReplyService.updateReply(vo);
			
		rttr.addAttribute("fbnumber", vo.getFbnumber());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
		return "redirect:/freeboard/readView";
		}

	// 게시글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(FreeBoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		
			
		freeService.delete(boardVO.getFbnumber() , boardVO.getFbpwd());
			
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
		return "redirect:/freeboard/list";
		}
	
	// 댓글 삭제 GET
	@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
	public String replyDeleteView(FreeReplyVO vo, SearchCriteria scri, Model model) throws Exception {		
			
		model.addAttribute("replyDelete", freeReplyService.selectReply(vo.getFrnumber()));
		model.addAttribute("scri", scri);
			

		return "freeboard/replyDeleteView";
		}
		
	// 댓글 삭제 POST
	@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
	public String replyDelete(FreeReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {	
			
		freeReplyService.deleteReply(vo);
			
		rttr.addAttribute("fbnumber", vo.getFrnumber());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
			
		return "redirect:/freeboard/readView";
		}
	
	
	
}