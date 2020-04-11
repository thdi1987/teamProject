package board.review.controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import board.review.domain.ReplyListVO;
import board.review.domain.ReplyVO;
import board.review.domain.ReviewViewVO;
import board.review.service.ReviewBoardService;
import member.domain.AuthInfo;


@Controller

public class ReviewBoardController {
	
	
	private ReviewBoardService reviewBoardService;	
	
	public void setReviewBoardService(ReviewBoardService reviewBoardService) {
		this.reviewBoardService = reviewBoardService;
	}

	//카테고리별 리스트
	@RequestMapping(value ="/Review/boardList", method = RequestMethod.GET)
	public void getList(@RequestParam("c") int petcatecode,
						@RequestParam("l") int level, Model model) throws Exception {		
		
		
		List<ReviewViewVO> list = null;
		
		list = reviewBoardService.list(petcatecode, level);
		
		model.addAttribute("list",list);
	}
	
	//카테고리 조회
	@RequestMapping(value ="/Review/boardView", method = RequestMethod.GET)
	public void getView(@RequestParam("n") int petnum , Model model) throws Exception {		
		
		ReviewViewVO view = reviewBoardService.reviewsView(petnum);
		model.addAttribute("view",view);
		
		List<ReplyListVO> reply = reviewBoardService.replyList(petnum);
		model.addAttribute("reply",reply);
	}
	
	//후기 조회 - 댓글 작성
	@RequestMapping(value ="/Review/boardView", method = RequestMethod.POST)
	public String registReply(ReplyVO reply, HttpSession session) throws Exception {	
		
		AuthInfo authinfo = (AuthInfo) session.getAttribute("authInfo");
		reply.setMid(authinfo.getId());
		
		reviewBoardService.registReply(reply);
		
		return "redirect:/Review/boardView?n=" + reply.getPetnum();
	}
	/*
	//후기 소감(댓글) 작성
	@ResponseBody
	@RequestMapping(value = "/view/registReply", method = RequestMethod.POST)
	public void registReply(ReplyVO reply,  HttpSession session) throws Exception {
		logger.info("regist reply");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		reply.setMid(member.getMid());
		
		boardService.registReply(reply);
	}*/
	
	//후기 소감(댓글) 목록
	@ResponseBody
	@RequestMapping(value = "/Review/view/replyList", method = RequestMethod.GET)
	public List<ReplyListVO> getReplyList(@RequestParam("n") int petnum) throws Exception {	
	   
	 List<ReplyListVO> reply = reviewBoardService.replyList(petnum);
	 
	 return reply;
	} 
	
	}