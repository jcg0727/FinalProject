package kr.ac.hs.controller.common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hs.command.common.CounselRegistCommand;
import kr.ac.hs.command.common.RegistCounselCommand;
import kr.ac.hs.command.common.professorListByDeptNameCommand;
import kr.ac.hs.dto.ProfessorVO;
import kr.ac.hs.dto.academic.DepartmentChangeVO;
import kr.ac.hs.dto.common.CounselVO;
import kr.ac.hs.dto.counsel.CounselLectureVO;
import kr.ac.hs.dto.lecture.LectureManagemenProfVO;
import kr.ac.hs.service.AcademicFreshmenService;
import kr.ac.hs.service.academic.DepartmentChangeService;
import kr.ac.hs.service.common.CounselService;
import kr.ac.hs.service.common.ProfessorService;
import kr.ac.hs.service.lecture.LectureManagementProfService;

@Controller
@RequestMapping("/counsel")
public class CounselController {

	@Autowired
	private CounselService counselService;

	@Autowired
	private ProfessorService professorService;

	@Autowired
	private AcademicFreshmenService freshService;

	@Autowired
	private DepartmentChangeService deptService;

	
	@RequestMapping("/assignment")
	public String getCounselAssignment(RegistCounselCommand cmd, Model model) throws Exception {
		String url = "counsel/notAdvisorcounselRegist";

		cmd.setPerPageNum(7);
		Map<String, Object> dataMap = freshService.selectProfessorListByDept_nm(cmd.getDept_nm(), cmd);

		model.addAllAttributes(dataMap);
		model.addAttribute("cmd", cmd);

		if (cmd.getProNo() != null) {
			List<CounselVO> counselList = counselService.getCouselListByProfNo(cmd.getProNo());

			ProfessorVO professor = professorService.getProfessor(cmd.getProNo());
			
			CounselLectureVO vo = cmd.convertoCounselLectureVO();
			List<CounselLectureVO> lectureList = counselService.getLectureListProNo(vo);

			model.addAttribute("lectureList", lectureList);
			model.addAttribute("counselList", counselList);
			model.addAttribute("professor", professor);
		}

		return url;
	}

	@RequestMapping(value = "/regist", method = RequestMethod.GET)
	public String getCounselListByProfessorNo(CounselLectureVO counsel, Model model) throws Exception {
		String url = "counsel/counselRegist";

		
		List<CounselVO> counselList = counselService.getCouselListByProfNo(counsel.getProNo());

		ProfessorVO professor = professorService.getProfessor(counsel.getProNo());
		
		List<CounselLectureVO> lectureList = counselService.getLectureListProNo(counsel);
		
		model.addAttribute("counselList", counselList);
		model.addAttribute("professor", professor);
		model.addAttribute("lectureList", lectureList);
		
		
		return url;
	}

	@RequestMapping(value = "/registCounsel", method = RequestMethod.POST)
	@ResponseBody
	public HttpStatus registCounsel(@RequestBody CounselRegistCommand cmd) throws Exception {
		HttpStatus status = null;
		try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			DepartmentChangeVO dept = new DepartmentChangeVO();
			CounselVO counsel = cmd.toVo();
			String register_date = "";
			
			counsel.setConsl_categ_cd("CCDI002");
			counsel.setConsl_categ_nm("전과상담");
			counsel.setRegister_content("전입을 위한 상담입니다");

			
			String counsel_no = counselService.regist(counsel);
			
			dept.setStudent_no(cmd.getStudent_no());
			
			register_date = cmd.getRegister_date().replace("-", "/");
			
			dept.setRegister_date(format.parse(register_date));
			dept.setCounsel_no(counsel_no);
			dept.setCounsel_status_nm("대기");

			deptService.modifyCounselByDeptChangeSetCounsel(dept);
			status = HttpStatus.OK;
		} catch (Exception e) {
			status = HttpStatus.BAD_REQUEST;
			e.printStackTrace();
		}

		return status;
	}

}
