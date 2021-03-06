package kr.ac.hs.controller.academic;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hs.dto.AcademicCalendarVO;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.academic.AcademicStateStaffCommand;
import kr.ac.hs.dto.AcademicStateVO;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.ProfessorVO;
import kr.ac.hs.dto.StudentInformationVO;
import kr.ac.hs.dto.academic.AcademicStateStaffVO;
import kr.ac.hs.dto.academic.StudentVO;
import kr.ac.hs.dto.common.AdvisorVO;
import kr.ac.hs.dto.common.StaffVO;
import kr.ac.hs.service.AcademicCalendarService;
import kr.ac.hs.service.AcademicStateService;
import kr.ac.hs.service.StudentService;
import kr.ac.hs.service.academic.PluralMajorService;
import kr.ac.hs.service.academic.StaffAcademicStateService;
import kr.ac.hs.service.academic.StudentInformationService;
import kr.ac.hs.service.common.ProfessorService;
import kr.ac.hs.service.common.StaffService;

//학적변경 Controller
@Controller
public class AcademicManagementController {

	@Autowired
	private AcademicCalendarService calender;

	@Autowired
	private PluralMajorService pluralService;

	@Autowired
	private AcademicStateService academicService;

	@Autowired
	private StudentInformationService stdInforService;
	
	@Autowired
	private StaffAcademicStateService service;

	@Autowired
	private StaffService staffService;

	@Autowired
	private StudentService studentService;

	@Autowired
	private ProfessorService professorService;
	
	@RequestMapping("/academic/fluctuation_st")
	public String student_main(Model model, HttpSession session) throws Exception {
		String url = "academic/student/academicManagement";
		AccountVO loginUser = (AccountVO) session.getAttribute("loginUser");

		List<StudentInformationVO> acuntList = stdInforService.getStdAcunt(loginUser.getAccount_no());
		model.addAttribute("acuntList", acuntList);

		List<AcademicCalendarVO> calendarList = calender.getAcasemicCalendarListOnlyAcademicSchedule();
		model.addAttribute("calendarList", calendarList);
		
		List<AdvisorVO> advisorList = studentService.getAdvisor(loginUser.getId());
		StudentVO student = studentService.getStudent(loginUser.getId());
		
		for (AdvisorVO advisor : advisorList) {
			ProfessorVO professor = professorService.getProfessor(advisor.getPro_no());
			if(professor.getDept_cd().equals(student.getDept_cd())){
				model.addAttribute("advisor", advisor);
			}
		}
		
		//List<PluralMajorVO> pluralList = pluralService.selectStudentInfoByPlural(loginUser.getId());
		//List<AcademicStateVO> leaveList = academicService.getListByStudentNO(loginUser.getId());

		// 자퇴신청내역조회
		//		List<AcademicStateVO> dropList = academicService.getListAcademicDropByStudentNO(loginUser.getId());

		//model.addAttribute("pluralList", pluralList);
		//model.addAttribute("leaveList", leaveList);
		//		model.addAttribute("dropList", dropList);

		return url;
	}
	
	@RequestMapping("/academic/fluctuation_as")
	public ModelAndView staff_main(ModelAndView mnv, HttpSession session, SearchCriteria cri, Map<String, Object> dataMap) throws Exception{
		String url = "academic/staff/academicManagement";
		String url2 ="academic/staff/academicManagement"; 
				
		
		AccountVO account = (AccountVO) session.getAttribute("loginUser");
		StaffVO staff = staffService.getStaff(account.getId());
		String staff_no = account.getId();

		mnv.addObject("staff", staff);
		cri.setPerPageNum(5);
		
		if(account.getAuthority_cd().equals("ROLE_STAFF")) {
			dataMap = service.getDepStaffAcademicStateCriteria(account.getId(), cri);
			mnv.setViewName(url);
		}else if(account.getAuthority_cd().equals("ROLE_ACADEMIC")) {
			dataMap = service.getStaffAcademicStateCriteria(cri);
			mnv.setViewName(url2);
		}
		
		String dept_nm = service.getDeptStaffNmByStaff_no(staff_no);
		
		mnv.addObject("dept_nm", dept_nm);
		mnv.addObject("dataMap",dataMap);
		
		return mnv;
		
	}

	@RequestMapping("/academic/fluctuation_as/deatil")
	@ResponseBody 
	public ResponseEntity<AcademicStateStaffVO> getList(@RequestParam("student_no")String student_no, @RequestParam("register_date") String register_date) throws Exception{
		
		ResponseEntity<AcademicStateStaffVO> entity = null;
		
		try {
			AcademicStateStaffVO info = service.getDetail(student_no, register_date);
			
			entity = new ResponseEntity<AcademicStateStaffVO>(info, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<AcademicStateStaffVO>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping("/academic/fluctuation_as/changeStatus")
	@ResponseBody 
	public ResponseEntity<AcademicStateStaffVO> updateStatus(AcademicStateStaffCommand cmd) throws Exception{
		
		ResponseEntity<AcademicStateStaffVO> entity = null;
		
		AcademicStateStaffVO vo = cmd.toVO();
		System.out.println("getStudent_no : " + vo.getStudent_no());
		System.out.println("getRegister_date : " + vo.getRegister_date());
		System.out.println("getR_status_cd : " + vo.getR_status_cd());
		
		
		
		try {
			service.modifyStatus(vo);
			entity = new ResponseEntity<AcademicStateStaffVO>(vo, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<AcademicStateStaffVO>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
