package kr.ac.hs.controller.counsel;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.common.Counsel2RegistCommand;
import kr.ac.hs.command.common.CounselContentModifyCommand;
import kr.ac.hs.command.common.CounselDetailCommand;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.common.AdvisorVO;
import kr.ac.hs.dto.common.AnnounceVO;
import kr.ac.hs.dto.common.Counsel2VO;
import kr.ac.hs.service.AccountService;
import kr.ac.hs.service.StudentService;
import kr.ac.hs.service.common.AnnounceService;
import kr.ac.hs.service.counsel.Counsel2Service;

@Controller
public class Counsel2Controller {

	@Autowired
	private Counsel2Service counsel2Service;

	@Autowired
	private StudentService studentService;
	
	@Autowired
	private AnnounceService announceService;
	
	@Autowired
	private AccountService accountService;

	// 학생
	@RequestMapping("/counsel/management_st")
	public ModelAndView main(ModelAndView mnv, SearchCriteria cri, HttpSession session) throws SQLException {
		String url = "/counsel2/stuMain";

		AccountVO account = (AccountVO) session.getAttribute("loginUser");
		String student_no = account.getStudent_no();

		Map<String, Object> dataMap = counsel2Service.selectAllByStudent_no(student_no, cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}


	@RequestMapping(value = "/counsel/management_st/modify", method = RequestMethod.POST)
	public String regist(Counsel2RegistCommand regReq, HttpSession session, RedirectAttributes rttr) throws Exception {
		String url = "redirect:/counsel/management_st";
		try {

			Counsel2VO counsel = regReq.toVo();
			Date date1 = regReq.getDate1();
			String time1 = regReq.getTime1();
			String hour =time1.substring(0, 2);
			String min = time1.substring(3, 5);
			String time2 = hour + ":" + min + ":00";
			
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			String to = transFormat.format(date1);
			
			String added = to + " " +time2;
			

			SimpleDateFormat transFormat2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			Date to2 = transFormat2.parse(added);

			
			AccountVO account = (AccountVO) session.getAttribute("loginUser");
			String student_no = account.getStudent_no();
			String pro_no = null;
			List<AdvisorVO> advisor = studentService.getAdvisor(student_no);
			for (AdvisorVO a : advisor) {
				pro_no = a.getPro_no();
			}
			counsel.setCounsel_date(to2);
			counsel.setStudent_no(student_no);
			counsel.setPro_no(pro_no);

			counsel2Service.insertCounsel(counsel);

		} catch (Exception e) {
			e.printStackTrace();
		}
		rttr.addFlashAttribute("from", "regist");

		return url;
	}
	
	
	// 교수
	@RequestMapping("/counsel/management_prof")
	public ModelAndView main2(ModelAndView mnv, SearchCriteria cri, HttpSession session) throws SQLException {
		String url = "/counsel2/proMain";

		AccountVO account = (AccountVO) session.getAttribute("loginUser");
		String pro_no = account.getPro_no();

		Map<String, Object> dataMap = counsel2Service.selectAllByPro_no(pro_no, cri);

		mnv.addObject("dataMap", dataMap);
		mnv.setViewName(url);

		return mnv;
	}
	
	@RequestMapping("/counsel/management_prof/accept")
	@ResponseBody
	public ResponseEntity<String> accept(String counsel_no)throws Exception{
		ResponseEntity<String> entity = null;
		try {
			counsel2Service.updateAccept(counsel_no);
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/counsel/management_prof/deny")
	@ResponseBody
	public ResponseEntity<String> deny(String counsel_no, String refuse_content, String student_no)throws Exception{
		System.out.println("------------------"+student_no);
		ResponseEntity<String> entity = null;
		try {
			counsel2Service.updateDeny(counsel_no);
			counsel2Service.updateRefuse_content(refuse_content, counsel_no);
			String account_no = counsel2Service.selectAccount_noByStudent_no(student_no);
			System.out.println("------------------"+account_no);
			
			AnnounceVO vo = new AnnounceVO();
			vo.setAccount_no(account_no);
			vo.setAnno_check_cd("N");
			vo.setAnno_content("상담이 거절되었습니다.");
			vo.setMcode("M090100");
			announceService.regist(vo);
			
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/counsel/denyForm")
	public ModelAndView denyForm(String counsel_no, ModelAndView mnv)throws Exception {
		String url = "/counsel2/denyForm";
	
		mnv.addObject("counsel_no",counsel_no);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/counsel/detail")
	public ModelAndView detail(String counsel_no, ModelAndView mnv)throws Exception {
		String url = "/counsel2/detail";
		
		List<Counsel2VO> detailList = counsel2Service.detailList(counsel_no);
		
		mnv.addObject("detailList",detailList);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	
	
	
	@RequestMapping(value = "/counsel/updateCounselContent", method=RequestMethod.POST)
	public ModelAndView test(ModelAndView mnv, CounselContentModifyCommand cmd) throws Exception {
		String url = "counsel2/counselContentmodify";
		Counsel2VO counsel2vo = cmd.toCounsel2VO();
		counsel2Service.updateCounselContent(counsel2vo);
		
		mnv.setViewName(url);
		return mnv;
	} 
	
	@RequestMapping(value = "/counsel/counselContentDetail")
	public ModelAndView counselContentDetail(CounselDetailCommand cmd, ModelAndView mnv) {
		String url = "counsel2/counselContentDetail";
		
		mnv.addObject("cmd",cmd);
		mnv.setViewName(url);
		return mnv;
	}
	

}
