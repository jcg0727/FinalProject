package kr.ac.hs.controller.academic;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.academic.DepartmentChangeCommand;
import kr.ac.hs.command.academic.DepartmentChangeStaffListCommand;
import kr.ac.hs.dto.academic.DepartmentChangeVO;
import kr.ac.hs.service.academic.DepartmentChangeService;

@Controller
@RequestMapping("/academic")
public class DepartmentTransferStaffController {

	@Autowired
	private DepartmentChangeService deptService;
	
	@RequestMapping(value="/transferIn/list", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> inList(@RequestBody DepartmentChangeStaffListCommand cmd) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String,Object> dataMap = new HashMap<String, Object>();
		
		cmd.setPerPageNum(6);
		
		dataMap.put("cri", cmd);
		dataMap.put("apply_dept_cd", cmd.getDept_cd());

		System.out.println(dataMap.get("cri"));
		
		try {
			Map<String, Object> resultMap = deptService.getTransferListByDeptNO(dataMap);

			entity = new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value ="/transferOut/list", method= RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> outList(@RequestBody DepartmentChangeStaffListCommand cmd) throws Exception {
		ResponseEntity<Map<String, Object>> entity = null;
		
		Map<String,Object> dataMap = new HashMap<String, Object>();
		cmd.setPerPageNum(6);

		dataMap.put("cri", cmd);
		dataMap.put("belong_dept_cd", cmd.getDept_cd());

		
		try {
			Map<String, Object> resultMap = deptService.getTransferListByDeptNO(dataMap);

			entity = new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
	
	@RequestMapping("/transfer/detail")
	public String getTransferDetail(String student_no, String register_date, Model model) throws Exception{
		String url = "academic/staff/departmentTransferDetail";
		if(register_date.length() != 16) {
			long parseLong = Long.parseLong(register_date);
			Calendar calendar = Calendar.getInstance();
			calendar.setTimeInMillis(parseLong);
			Date numDate = calendar.getTime();
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			register_date = format.format(numDate);
		}
		
		Map<String, Object> dataMap = deptService.getDetail(student_no, register_date);
		
		model.addAllAttributes(dataMap);
		model.addAttribute("student_no", student_no);
		model.addAttribute("register_date", register_date);
		
		return url;
	}
	
	@RequestMapping(value="/transfer/modify")
	@ResponseBody
	public ResponseEntity<String> modifyDeptTransferStatus(@RequestBody DepartmentChangeCommand cmd) throws Exception{
		ResponseEntity<String> entity = null;
		
		DepartmentChangeVO dept = cmd.toVO();
		
		deptService.modify(dept);
		
		
		return entity;
	}
}
