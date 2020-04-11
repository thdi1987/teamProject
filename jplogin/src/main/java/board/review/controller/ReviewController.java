package board.review.controller;





import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import board.review.domain.CategoryVO;
import board.review.domain.ReplyListVO;
import board.review.domain.ReplyVO;
import board.review.domain.ReviewVO;
import board.review.domain.ReviewViewVO;
import board.review.service.ReviewService;
import board.review.utils.UploadFileUtils;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/Review/*")
public class ReviewController {	
	
	
	private ReviewService reviewService;
	
	public void setReviewService(ReviewService reviewService) {
		this.reviewService = reviewService;
	}

//	public void setUploadPath(String uploadPath) {
//		this.uploadPath = uploadPath;
//	}

	public void setUploadPath(String path) {
		this.uploadPath = path;
	}
	
	private String uploadPath;
	
	// 사용자화면
	@RequestMapping(value="/reviewIndex",method = RequestMethod.GET)
	public void getIndex() throws Exception {
		
	}
	
	// 동물 후기 등록 GET
	@RequestMapping(value = "/reviewRegister", method = RequestMethod.GET)
	public void getReviewsRegister(Model model) throws Exception {
	
	 
	 List<CategoryVO> category =null;
	 category = reviewService.category();
	 model.addAttribute("category",JSONArray.fromObject(category));
	 
	}
	
	//동물 후기 등록 POST
	@RequestMapping(value = "/reviewRegister", method = RequestMethod.POST)
	public String postReviewsRegister(ReviewVO vo, MultipartFile file) throws Exception {
		System.out.println("uploadPath="+uploadPath);
		String imgUploadPath = uploadPath + File.separator + "imgUpload";  // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
		 String ymdPath = UploadFileUtils.calcPath(imgUploadPath);  // 위의 폴더를 기준으로 연월일 폴더를 생성
		 String fileName = null;  // 기본 경로와 별개로 작성되는 경로 + 파일이름
		   
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
		  // 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
		  
		  fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

		  // gdsImg에 원본 파일 경로 + 파일명 저장
		  vo.setPetimage(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		  // gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
		  vo.setPetthumbimage(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		  
		 } else {  // 첨부된 파일이 없으면
		  fileName = File.separator + "images" + File.separator + "none.png";
		  // 미리 준비된 none.png파일을 대신 출력함
		  
		  vo.setPetimage(fileName);
		  vo.setPetthumbimage(fileName);
		 }
		 
		reviewService.register(vo);
		
		return "redirect:/Review/reviewIndex";
	}
		
	
	
	// 동물 후기 목록
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public void getReviewsList(Model model) throws Exception{
		
		
		List<ReviewVO> list = reviewService.reviewslist();
		
		model.addAttribute("list",list);
	}
	
	//동물 후기 조회
	@RequestMapping(value="/reviewView", method = RequestMethod.GET)
	public void getReviewsview(@RequestParam("n") int petnum, Model model) throws Exception {
		
		
	  //ReviewVO reviews = reviewService.reviewsView(petnum);
		ReviewViewVO reviews = reviewService.reviewsView(petnum);
		model.addAttribute("reviews",reviews);
	}
	
	//동물 후기 수정
	@RequestMapping(value="/reviewModify", method = RequestMethod.GET)
	public void getReviewsModify(@RequestParam("n") int petnum, Model model) throws Exception {
	
		
	  //ReviewVO reviews = reviewService.reviewsView(petnum);
		ReviewViewVO reviews = reviewService.reviewsView(petnum);
		model.addAttribute("reviews",reviews);
		
		List<CategoryVO> category = null;
		category = reviewService.category();
		model.addAttribute("category",JSONArray.fromObject(category));
		
	}
	
	//동물 후기 수정POST
	@RequestMapping(value="reviewModify", method = RequestMethod.POST)
	public String postReviewsModify(ReviewVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
		
		
		// 새로운 파일이 등록되었는지 확인
		 if(file.getOriginalFilename()!= null && !file.getOriginalFilename().equals("")) {
		  // 기존 파일을 삭제
		  new File(uploadPath + req.getParameter("petimage")).delete();
		  new File(uploadPath + req.getParameter("petthumbimage")).delete();
		  
		  // 새로 첨부한 파일을 등록
		  String imgUploadPath = uploadPath + File.separator + "imgUpload";
		  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		  
		  vo.setPetimage(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		  vo.setPetthumbimage(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		  
		 } else {  // 새로운 파일이 등록되지 않았다면
		  // 기존 이미지를 그대로 사용
		  vo.setPetimage(req.getParameter("petimage"));
		  vo.setPetthumbimage(req.getParameter("petthumbimage"));
		  
		 }
		
		reviewService.reviewsModify(vo);
		
		return "redirect:/Review/reviewIndex";
	}
	
	//동물 후기 삭제
	@RequestMapping(value="/reviewDelete", method = RequestMethod.POST)
	public String postReviewsDelete(@RequestParam("n") int petnum) throws Exception {
		
		
		
		reviewService.reviewsDelete(petnum);
		
		return "redirect:/Review/reviewIndex";
	}
	
	//모든 댓글
		@RequestMapping(value ="reviewAllReply", method = RequestMethod.GET)
		public void getAllReply(Model model) throws Exception {
				
			
				
			List<ReplyListVO> reply = reviewService.allReply();
				
			model.addAttribute("reply",reply);
		}
			
		// 모든 소감(댓글)
		@RequestMapping(value = "reviewAllReply", method = RequestMethod.POST)
		public String postAllReply(ReplyVO reply) throws Exception {
					
		
							
			reviewService.deleteReply(reply.getRepnum());
					
			return "redirect:/Review/reviewAllReply";
		}	
		
	
}