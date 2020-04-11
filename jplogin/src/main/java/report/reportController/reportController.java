package report.reportController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.service.service.ServiceService;
import report.domain.reportVO;
import report.service.ReportService;
import syspage.paging.PageMaker;
import syspage.paging.SearchCriteria;


@Controller
public class reportController {
	
	private ReportService reportService;

	public void setReportService(ReportService reportService) {
		this.reportService = reportService;
	}
	
	@RequestMapping(value="/report/writeReport")
	public String reportInsert() {
	
	
		return "/report/writerReport";
	}
//	@RequestMapping(value="/report/writeReport/NO.{RPID}/MP.{MPID}")
//	public ModelAndView reportInsert(@PathVariable("RPID")int RPID ,@PathVariable("MPID")String RREPORTEDID, @ModelAttribute reportVO report,Model model) {
//		System.out.println(RPID+""+RREPORTEDID);
//		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("report/writerReport");
//		mv.addObject("RPID",RPID);
//		mv.addObject("RREPORTEDID",RREPORTEDID);
//	
//		return mv;
//	}
	
	
	@RequestMapping("/report/insert")
	public String insertReport(@ModelAttribute reportVO report) {
		System.out.println("테스트용"+report.toString());				
		
		reportService.Insert(report);
		return "report/reportList";
	}
	
	@RequestMapping("/report/list")
	public String reportList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		
		listNoticeProc(model, scri);
		
		return "/report/reportList";
	}
	
	@RequestMapping("/report/HistoryList")
	public String reportHistoryList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		listNoticeProc2(model, scri);	
		return "/report/reportHistoryList";

	}
	
	private void listNoticeProc2(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		
		model.addAttribute("reportHistoryList",reportService.reportHistoryList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(reportService.listcount2(scri));	

		model.addAttribute("pageMaker", pageMaker);
	}
	
	
	
	
	private void listNoticeProc(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		
		model.addAttribute("reportList",reportService.reportList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(reportService.listcount(scri));	

		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/report/punish{RNO}")
	public ModelAndView punish(@PathVariable("RNO")int RNO) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("RNO",RNO);
		mv.setViewName("report/process");
		
		return mv;
	}
	
	
	@RequestMapping("/report/process")
	public void process(int RNO,String RREPORTEDID,int punish,String REMAIL,String RID) {
		reportService.selectEmail(RREPORTEDID,RNO,punish,REMAIL,RID);
			
	}
	
	@RequestMapping("/report/delete")
	public void delete(int RNO) {
		reportService.delete(RNO);
	}

	@Scheduled(cron="0 0/30 * * * *")//초 분 시
	public void schedule(){
		System.out.println("실행!");
		reportService.update();
		
	}
	
	
	

	
	
	
	
	
	

}
