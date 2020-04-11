package board.parcelOut.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import board.parcelOut.domain.Insert;
import board.parcelOut.domain.ReplyVO;
import board.parcelOut.domain.Seach;
import board.parcelOut.domain.TotalBoardVO;
import board.parcelOut.service.BoardService;
import member.domain.AuthInfo;
import member.service.MemberService;
import syspage.paging.PageMaker;
import syspage.paging.SearchCriteria;

@Controller
public class boardController {
	private BoardService boardService;
	private MemberService memberService;

	public void setBoardService(BoardService boardservice) {
		this.boardService = boardservice;
	}	

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}


	// 게시글 목록+페이징
	@RequestMapping(value = "/ParcelOut/list", method = RequestMethod.GET)
	public String listUser(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {		
		listNoticeProc(model, scri);

		return "/ParcelOut/board";

	}
	
	@RequestMapping(value = "/ParcelOut/listSys", method = RequestMethod.GET)
	public String listSys(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {		
		listNoticeProc(model, scri);

		return "/ParcelOut/boardSys";

	}
	
	@RequestMapping(value = "/ParcelOut/listMyPage", method = RequestMethod.GET)
	public String listMyPage(Model model, @ModelAttribute("scri") SearchCriteria scri, HttpSession session) throws Exception {	
		
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");	
		String id = authInfo.getId();
		
		scri.setId(id);
		
		model.addAttribute("boardList2", boardService.listMyPage(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.count(scri));	

		model.addAttribute("pageMaker", pageMaker);

		return "/ParcelOut/boardMyPage";

	}

	// 페이징 관련
	private void listNoticeProc(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		
		model.addAttribute("boardList2", boardService.list2(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(boardService.count(scri));	

		model.addAttribute("pageMaker", pageMaker);
	}

	// 게시글 정보 불러오기+댓글
	@RequestMapping(value = "/ParcelOut/info/{MPNO}")
	public String info(@PathVariable("MPNO") int mpno, Model model) throws Exception {
		
		model.addAttribute("petInfo", boardService.info(mpno));
		model.addAttribute("multiPic", boardService.multi(mpno));
		model.addAttribute("replyList", boardService.selectCommentList(mpno));
		
		return "/ParcelOut/info";
	}
	
	@RequestMapping(value = "/ParcelOut/info/{MPNO}/myPage")
	public String infomyPage(@PathVariable("MPNO") int mpno, Model model) throws Exception {
		
		model.addAttribute("petInfo", boardService.info(mpno));
		model.addAttribute("multiPic", boardService.multi(mpno));
		model.addAttribute("replyList", boardService.selectCommentList(mpno));
		
		return "/ParcelOut/infoMyPage";
	}

	@RequestMapping(value = "/ParcelOut/bbs/insertComment")
	@ResponseBody
	public String insertCommentMap(@ModelAttribute ReplyVO reply, Model model) throws Exception {
		
		boardService.insertComment(reply);

		return "";

	}

	// 인양신청 내용 불러오기
	@RequestMapping(value = "/ParcelOut/adoption/num={num}")
	public String adoption(@PathVariable("num") int num, Model model) {
		
		model.addAttribute("petInfo", boardService.info(num));
		return "/ParcelOut/adoption";
	}

	// 입양신청 insert
	@RequestMapping(value = "/ParcelOut/adoptionInsert")
	public String adoptionInsert(@ModelAttribute TotalBoardVO total) {
		
		boardService.insertADOPTION(total.getMPNO(), total.getMPTITLE(), total.getMPCONTENT(),total.getAdoptId());

		return "redirect:/adopt/listUser";
	}

	@RequestMapping(value = "/ParcelOut/ee", method = RequestMethod.GET)
	public String select2(@ModelAttribute Seach seach, Model model) {		

		model.addAttribute("boardList2", boardService.select(seach));

		return "/ParcelOut/board";
	}

	@RequestMapping(value = "/ParcelOut/insert", method = RequestMethod.GET)
	public String insertNew() {
		return "/ParcelOut/InsertNew2";
	}

	@RequestMapping(value = "/ParcelOut/regCheck.do", method = RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String regCheck(HttpServletRequest request) {

		String reg = (String) request.getParameter("MREGISTRATION");
	
		int result = boardService.regCheck(reg);
		
		return Integer.toString(result);

	}

	@RequestMapping(value = "/ParcelOut/insertfake", method = RequestMethod.POST)
	public String insertfake(MultipartHttpServletRequest multi, @ModelAttribute Insert insert)
			throws IllegalStateException, IOException {
		System.out.println("1");
		boardService.insertNew(insert);	

		String realPath = "C:\\JSP(eclipse)\\Picture\\upload\\";
		File dir = new File(realPath);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}

		List<MultipartFile> mf = multi.getFiles("pic");
		if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {

		} else {
			for (int i = 0; i < mf.size(); i++) {
				String genId = UUID.randomUUID().toString(); // 파일 중복명 처리
				String originalfileName = mf.get(i).getOriginalFilename();
				
				String saveFileName = (i + 1) + genId + "." + FilenameUtils.getExtension(originalfileName); // 저장 파일 이름
				String savePath = realPath + saveFileName; // 저장 될 파일 경로
			
				long fileSize = mf.get(i).getSize(); // 파일사이즈
				mf.get(i).transferTo(new File(savePath));
				boardService.fileUpload(originalfileName, saveFileName, fileSize);

			}
		}
		return "redirect:/ParcelOut/list";

	}
	
	@RequestMapping(value = "/parcelOut/delete" ,method = RequestMethod.POST)
	@ResponseBody
	public String delete(HttpServletRequest request) {
		
		String MPNO = request.getParameter("MPNO");
		
		boardService.delete(MPNO);

		return "redirect:/ParcelOut/listSys";
	}
	
	@RequestMapping(value = "/parcelOut/deleteMyPage" ,method = RequestMethod.POST)
	@ResponseBody
	public String deleteMyPage(HttpServletRequest request) {
		
		String MPNO = request.getParameter("MPNO");
		
		boardService.delete(MPNO);

		return "redirect:/ParcelOut/listMyPage";
	}
	
	@RequestMapping(value="/parcelOut/updateForm/{MPNO}")
	public String updateForm(@PathVariable("MPNO") int mpno,Model model) {
		 model.addAttribute("petInfo", boardService.info(mpno));
		 
		 return "/ParcelOut/update";
	
	}
	
	
	
	
	@RequestMapping(value="/parcelOut/update")
	public String update(MultipartHttpServletRequest multi,@ModelAttribute TotalBoardVO total) throws IllegalStateException, IOException {
		System.out.println(total.getMPNO());
		//boardService.update(total);
		
		String realPath = "C:\\JSP(eclipse)\\Picture\\upload\\";
		File dir = new File(realPath);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}

		List<MultipartFile> mf = multi.getFiles("pic");
		if (mf.size() == 1 && mf.get(0).getOriginalFilename().equals("")) {

		} else {
			for (int i = 0; i < mf.size(); i++) {
				String genId = UUID.randomUUID().toString(); // 파일 중복명 처리
				String originalfileName = mf.get(i).getOriginalFilename();
				
				String saveFileName = (i + 1) + genId + "." + FilenameUtils.getExtension(originalfileName); // 저장 파일 이름
				String savePath = realPath + saveFileName; // 저장 될 파일 경로
			
				long fileSize = mf.get(i).getSize(); // 파일사이즈
				mf.get(i).transferTo(new File(savePath));
				boardService.update2(originalfileName, saveFileName, fileSize,total,i);
			}
		}

		return "/ParcelOut/board";
	}
	
	
	
	
	
	
	
	@RequestMapping(value = "/parcelOut/regCheck", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String regChk(HttpServletRequest request, HttpSession session) {
		
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");	
		String name = authInfo.getName();			
		String reg = (String) request.getParameter("registration");
		int result = memberService.regCheck(name,reg);
		return Integer.toString(result);
	}

}
