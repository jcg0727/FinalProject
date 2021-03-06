package kr.ac.hs.controller.academic;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.maven.wagon.observers.Debug;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.academic.PluralMajorStaffCommand;
import kr.ac.hs.command.academic.PluralRegistCommand;
import kr.ac.hs.dto.academic.PluralMajorVO;
import kr.ac.hs.dto.common.CounselVO;
import kr.ac.hs.service.academic.PluralMajorService;
import kr.ac.hs.service.academic.StudentInformationService;
import kr.ac.hs.service.counsel.Counsel2Service;

@Controller
@RequestMapping("/academic/pluralMajor")
public class PluralMajorController {

	@Autowired
	private PluralMajorService pluralMajorService;
	
	@Autowired
	 private StudentInformationService stuService;
	
	@Autowired
	private Counsel2Service counselService;
	
	@RequestMapping(value="/regist", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, String>> regist(PluralRegistCommand pluralReq) throws Exception{
		ResponseEntity<Map<String, String>> entity = null;
		
		PluralMajorVO plural = pluralReq.toVO();
		//CounselVO counsel = new CounselVO();
		//counsel.setCounsel_date(pluralReq.formatDate());
		Map<String,String> resultMap = new HashMap<String,String>();
		try {
			//String check = pluralMajorService.regist(plural, counsel);
			String check = pluralMajorService.regist(plural);
			String message = "";
			if(check.equals("OK")) {
				message = "?????? ??????";
			}else {
				message = "?????? ???????????? ????????? ???????????????.\n????????? ??????????????????";
			}
			resultMap.put("message", message);
			entity = new ResponseEntity<Map<String, String>>(resultMap,HttpStatus.OK);
		}catch(SQLException e){
			entity = new ResponseEntity<Map<String, String>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public ResponseEntity<List<PluralMajorVO>> getList(@RequestParam("id") String student_no) throws Exception{
	ResponseEntity<List<PluralMajorVO>> entity = null;

		try {
			List<PluralMajorVO> pluralList = pluralMajorService.getListByStudentNO(student_no);
			entity = new ResponseEntity<List<PluralMajorVO>>(pluralList, HttpStatus.OK);
		}catch(SQLException e){
			entity = new ResponseEntity<List<PluralMajorVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.POST)
		public ResponseEntity<List<PluralMajorVO>> remove(@RequestParam("id") String student_no, RedirectAttributes rttr) throws Exception{
		ResponseEntity<List<PluralMajorVO>> entity = null;
		try {
			pluralMajorService.remove(student_no);
			List<PluralMajorVO> pluralList = pluralMajorService.getListByStudentNO(student_no);
			entity = new ResponseEntity<List<PluralMajorVO>>(pluralList, HttpStatus.OK);
		}catch(SQLException e){
			entity = new ResponseEntity<List<PluralMajorVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/pdf", method=RequestMethod.GET)
	public ModelAndView pdf(String id, ModelAndView mnv, String student_no) throws Exception{
		String url = "academic/student/pluralPdf";
		 Map<String, Object>dataMap = stuService.getInfoByAccountNO(id);
		 PluralMajorVO plural = pluralMajorService.selectStudentDetailByStudentNo(student_no);
		 mnv.addObject("dataMap", dataMap);
		 mnv.addObject("plural", plural);
		mnv.setViewName(url);
		return mnv;
	}


	//STAFF
	@RequestMapping(value = "/pluralMajorOut", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,Object>> pluralMajorOutList(@RequestBody PluralMajorStaffCommand cmd) throws Exception{
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		cmd.setPerPageNum(5);
		dataMap.put("cri", cmd);
		dataMap.put("dept_nm", cmd.getDept_nm());
		
		try {
			Map<String,Object> resultMap = pluralMajorService.selectPluralByStaffDeptnm(dataMap);
			entity = new ResponseEntity<Map<String,Object>>(resultMap, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity =  new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	@RequestMapping(value = "/pluralMajorIn", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String,Object>> pluralMajorInList(@RequestBody PluralMajorStaffCommand cmd) throws Exception{
		ResponseEntity<Map<String,Object>> entity = null;
		Map<String,Object> dataMap = new HashMap<String, Object>();
		cmd.setPerPageNum(5);
		dataMap.put("cri", cmd);
		dataMap.put("dept_nm", cmd.getDept_nm());
		try {
			Map<String,Object> resultMap = pluralMajorService.selectStudentByApplyStaffDeptnm(dataMap);
			entity = new ResponseEntity<Map<String,Object>>(resultMap, HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			entity =  new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
			
		}
		return entity;
	}
	
	@RequestMapping("detail")
	public ModelAndView detail(ModelAndView mnv, String student_no, @RequestParam("id") String account_no) throws Exception {
		String url = "academic/staff/pluralMajorDetail";
		PluralMajorVO plural = pluralMajorService.selectStudentDetailByStudentNo(student_no);
		
		Map<String, Object> dataMap = stuService.getInfoByAccountNO(account_no);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("plural", plural);
		mnv.setViewName(url);
		return mnv;
	}
}
