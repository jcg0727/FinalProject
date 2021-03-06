package kr.ac.hs.controller.grades;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLDocument.HTMLReader.ParagraphAction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.mail.iap.Response;

import kr.ac.hs.command.common.professorListByDeptNameCommand;
import kr.ac.hs.command.grades.DissenetRegistCommand;
import kr.ac.hs.command.grades.RegistGradesCommand;
import kr.ac.hs.command.grades.scoreCommand;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.ProfessorVO;
import kr.ac.hs.dto.academic.StudentVO;
import kr.ac.hs.dto.grades.GradesDissentVO;
import kr.ac.hs.dto.grades.GradesVO;
import kr.ac.hs.dto.lecture.LectureManagemenProfVO;
import kr.ac.hs.service.grades.GradesService;
import kr.ac.hs.service.lecture.LectureManagementProfService;
import oracle.net.aso.d;

@Controller
@RequestMapping("/score")
public class GradesController {

	@Autowired
	private GradesService gradesService;

	@Autowired
	private LectureManagementProfService lectureService;

	@RequestMapping("/management_st")
	public String gradesMain(Model model, HttpSession session) throws Exception {
		String url = "grades/gradesStudent";

		AccountVO account = (AccountVO) session.getAttribute("loginUser");
		GradesVO totalGrades = gradesService.getTotalGradesByStudentNo(account.getStudent_no());
		List<String> semesterList = gradesService.getSemesterListByStudentNo(account.getStudent_no());

		model.addAttribute("totalGrades", totalGrades);
		model.addAttribute("semesterList", semesterList);
		return url;
	}

	@RequestMapping("/management_st/thisSemester")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getThisSemensterGrades(@RequestBody scoreCommand cmd,
			HttpSession session) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;

		GradesVO grades = cmd.convertGradesVO(session);
		cmd.setPerPageNum(5);
		try {
			Map<String, Object> dataMap = gradesService.getThisSemesterGradesByStudentNo(grades, cmd);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping("/management_st/eachSemester")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getEachSemensterGrades(@RequestBody scoreCommand cmd,
			HttpSession session) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;

		GradesVO grades = cmd.convertGradesVO(session);
		cmd.setPerPageNum(5);
		try {
			Map<String, Object> dataMpa = gradesService.getGradesBySemester(grades, cmd);
			entity = new ResponseEntity<Map<String, Object>>(dataMpa, HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/management_st/thisSemester/dissentRegist", method = RequestMethod.GET)
	public String registDissent(@ModelAttribute("cmd") DissenetRegistCommand cmd, Model model, String from,
			HttpSession session) throws Exception {
		String url = "grades/gradesStudentDissent";

		GradesDissentVO dissent = null;
		if (from != null) {
			dissent = cmd.convertGradesDissent(session);
		}
		GradesDissentVO dissentDetail = gradesService.getGradesDissent(dissent);
		model.addAttribute("detail", dissentDetail);
		return url;
	}

	@RequestMapping(value = "/management_st/thisSemester/dissentRegist", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<?> registDissentRegist(@RequestBody DissenetRegistCommand cmd, HttpSession session)
			throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;

		GradesDissentVO dissent = cmd.convertGradesDissent(session);
		try {
			gradesService.registGradesDissent(dissent);
			Map<String, Object> dataMap = new HashMap<>();
			dataMap.put("message", "ok");
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/management_st/thisSemester/dissentModify", method = RequestMethod.POST)
	public ModelAndView updateDissentGrades(@RequestBody DissenetRegistCommand cmd, ModelAndView mnv) throws Exception {
		GradesDissentVO dissent = cmd.convertGradesDissentFromProfByUpdate();

		gradesService.modifyDissentGradesFromProf(dissent);

		GradesDissentVO detail = gradesService.getDissentDetailFromProf(dissent.getDissent_grades_no());

		mnv.addObject("detail", detail);
		mnv.addObject("from", "modify");
		mnv.setViewName("grades/gradesDissentByProf");

		return mnv;
	}

	@RequestMapping("/management_st/gradesPdf")
	public String pdf(HttpSession session, Model model) throws Exception {
		String url = "grades/studentPdf";

		StudentVO student = (StudentVO) session.getAttribute("loginUser");

		Map<String, Object> dataMap = gradesService.getPdfGrades(student.getStudent_no());

		dataMap.put("student", student);
		model.addAllAttributes(dataMap);

		return url;
	}

	@RequestMapping("/management_prof")
	public String gradesMainProf(Model model, HttpSession session) throws Exception {
		String url = "grades/gradesProfessor";

		ProfessorVO professor = (ProfessorVO) session.getAttribute("loginUser");

		List<LectureManagemenProfVO> lectureList = lectureService.getLectureList_prof(professor.getPro_no());
		model.addAttribute("lectureList", lectureList);
		return url;
	}

	@RequestMapping("/management_prof/dissentList")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> getDissentList(@RequestBody DissenetRegistCommand cmd,
			HttpSession session) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;

		Map<String, Object> paraMap = new HashMap<>();

		ProfessorVO professor = (ProfessorVO) session.getAttribute("loginUser");

		paraMap.put("lecture_semester", cmd.getLecture_semester());
		paraMap.put("pro_no", professor.getPro_no());
		paraMap.put("cmd", cmd);

		try {
			Map<String, Object> dataMap = gradesService.getDissentGradesListByProNo(paraMap);
			entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			e.printStackTrace();
		}

		return entity;
	}

	@RequestMapping("/management_prof/dissentList/detail")
	public ModelAndView getDissentDetail(ModelAndView mnv, String dissentNo, HttpSession session) throws Exception {
		GradesDissentVO dissent = gradesService.getDissentDetailFromProf(dissentNo);

		ProfessorVO professor = (ProfessorVO) session.getAttribute("loginUser");

		dissent.setProName(professor.getName());
		mnv.addObject("detail", dissent);
		mnv.setViewName("grades/gradesDissentByProf");

		return mnv;
	}

	@RequestMapping("/management_prof/studentList")
	public ModelAndView getStudetnListByClassNo(ModelAndView mnv, @ModelAttribute RegistGradesCommand cmd,
			HttpSession session) throws Exception {

		ProfessorVO professor = (ProfessorVO) session.getAttribute("loginUser");

		Map<String, Object> paraMap = cmd.convertGradesVOWithCriteria(cmd);
		paraMap.put("pro_no", professor.getPro_no());

		Map<String, Object> dataMap = gradesService.getStudentListByClassNo(paraMap);

		dataMap.put("className", cmd.getClass_name());
		dataMap.put("classNo", cmd.getClass_no());
		dataMap.put("lectureSemester", cmd.getLecture_semester());

		mnv.addAllObjects(dataMap);
		mnv.setViewName("grades/registGrades");

		return mnv;
	}

	@RequestMapping("/management_prof/studentList/registGrades")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> registGrades(@RequestBody RegistGradesCommand cmd) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;

		GradesVO grades = cmd.convertGradesVO();
		try {
			gradesService.registGrades(grades);
			entity = new ResponseEntity<>(HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping("/management_prof/studentList/studentGrades")
	@ResponseBody
	public ResponseEntity<GradesVO> getStudentGrades(@RequestBody RegistGradesCommand cmd) throws Exception {
		ResponseEntity<GradesVO> entity = null;

		GradesVO grades = cmd.convertGradesVOForProf();

		try {
			GradesVO gradesVO = gradesService.getGradesByStudentNoAndClassNo(grades);

			entity = new ResponseEntity<GradesVO>(gradesVO, HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping("/management_prof/studentList/registTotal")
	@ResponseBody
	public ResponseEntity<HttpStatus> modifyTotalGrades(@RequestBody RegistGradesCommand cmd) throws Exception {
		ResponseEntity<HttpStatus> entity = null;

		GradesVO grades = new GradesVO();
		grades.setClass_no(cmd.getClass_no());
		grades.setLecture_semester(cmd.getLecture_semester());

		gradesService.modifyTotalGrades(grades);

		return entity;
	}
}