package kr.ac.hs.controller.academic;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.hs.command.academic.AcademicDropCommand;
import kr.ac.hs.dto.AcademicStateVO;
import kr.ac.hs.service.AcademicStateService;

@Controller
@RequestMapping("/academicState/drop")
public class AcademicDropController {
	@Autowired
	private AcademicStateService academicStateService;

	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, String>> registDrop(AcademicDropCommand dropCommand) throws Exception {
		ResponseEntity<Map<String, String>> entity = null;

		AcademicStateVO academicDropState = dropCommand.toVO();
		Map<String, String> resultMap = new HashMap<String, String>();

		try {
			String check = academicStateService.registAcademicDrop(academicDropState);
			String message = "";
			if (check.equals("OK")) {
				message = "신청 완료";
			} else {
				message = "이미 신청하신 내역이 존재합니다.\n 신청이 불가능합니다";
			}

			resultMap.put("message", message);

			entity = new ResponseEntity<Map<String, String>>(resultMap, HttpStatus.OK);

		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, String>>(HttpStatus.BAD_REQUEST);
		}
		return entity;

	}

	@RequestMapping("/list")
	@ResponseBody
	public ResponseEntity<List<AcademicStateVO>> getList(@RequestParam("id") String student_no) throws Exception {
		ResponseEntity<List<AcademicStateVO>> entity = null;

		try {
			List<AcademicStateVO> dropList = academicStateService.getListAcademicDropByStudentNO(student_no);
			entity = new ResponseEntity<List<AcademicStateVO>>(dropList, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<AcademicStateVO>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "remove", method = RequestMethod.POST)
	public ResponseEntity<List<AcademicStateVO>> remove(@RequestParam("id") String student_no, RedirectAttributes rttr) throws Exception {
		ResponseEntity<List<AcademicStateVO>> entity = null;

		try {
			academicStateService.removeAcademicDrop(student_no);
			List<AcademicStateVO> dropList = academicStateService.getListAcademicDropByStudentNO(student_no);
			entity = new ResponseEntity<List<AcademicStateVO>>(dropList, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<List<AcademicStateVO>>(HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

}
