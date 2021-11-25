package kr.ac.hs.controller.graduation;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.common.AnnounceVO;
import kr.ac.hs.dto.common.AttachVO;
import kr.ac.hs.dto.graduation.GraduationVO;
import kr.ac.hs.service.common.AnnounceService;
import kr.ac.hs.service.common.AttatchmentService;
import kr.ac.hs.service.graduation.GraduationService;
import kr.ac.hs.util.GetAttachesAsMultipartFiles;

@Controller
public class GraduationController {

	@Autowired
	private GraduationService service;
	
	@Autowired
	private AttatchmentService attachService;
	
	@Autowired
	private AnnounceService announceService;

	@Resource(name = "uploadFile")
	private String uploadPath;
	
	@RequestMapping("/graduation/management_st")
	public ModelAndView main(HttpSession session, ModelAndView mnv)throws SQLException {
		String url = "graduation/main";
		
		AccountVO account =  (AccountVO)session.getAttribute("loginUser");
		String student_no = account.getId();
		List<GraduationVO> list =  service.selectFilenameStatusByStudent_no(student_no);
		Map<String, Object> dataMap =  service.selectGraduationPointsbyStudent_no(student_no);
		GraduationVO graduated = service.selectGraduatedByStudent_no(student_no);
		for(GraduationVO d : list) {
			System.out.println(d.getStatus_nm());
			System.out.println(d.getOrginal_nm());
			System.out.println(d.getExtension());
		}
		mnv.addObject("graduated", graduated);
		mnv.addObject("student_no", student_no);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("list", list);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping(value = "/graduation/management_st/thesis", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<List<String>> fileUpload(MultipartFile[] uploadFile,HttpSession session) throws Exception {
		ResponseEntity<List<String>> entity = null;
		ArrayList<String> tempList = new ArrayList<>();

		AccountVO account = (AccountVO)session.getAttribute("loginUser");
		String student_no = account.getId();
		
		//graduated에 학번 insert
		service.insertGraduated(student_no);
		
		List<AttachVO> fileList = GetAttachesAsMultipartFiles.save(uploadFile, uploadPath);
		String attach_no=null;
		for (AttachVO attach : fileList) {
			String tempId = attachService.regist(attach);
			attach_no = attach.getAttach_no();
			tempList.add(tempId);
			
		}
		
		service.insertGrad_thesis(student_no, attach_no);
		
		entity = new ResponseEntity<List<String>>(tempList, HttpStatus.OK);
		return entity;
	}
	
	@RequestMapping("/graduation/management_st/remove")
	@ResponseBody
	public ResponseEntity<String> remove(String student_no)throws Exception{
		ResponseEntity<String> entity = null;
		try {
			service.removeFromGrad_thesis(student_no);
			service.removeFromGraduated(student_no);
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	
	//교수페이지
	@RequestMapping("/graduation/management_prof")
	public ModelAndView main(HttpSession session, ModelAndView mnv, SearchCriteria cri)throws SQLException{
		String url = "graduation/proMain";
		
		AccountVO account = (AccountVO)session.getAttribute("loginUser");
		String pro_no = account.getId();
		String pro_name = account.getName();
		
		Map<String, Object>dataMap = service.selectThesisByPro_no(pro_no,cri);
		mnv.addObject("dataMap", dataMap);
		mnv.addObject("pro_name", pro_name);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/graduation/management_prof/confirm")
	@ResponseBody
	public ResponseEntity<String> confirm(String student_no, HttpSession session)throws Exception{
		ResponseEntity<String> entity = null;
		
		try {
			service.updateWhenProfConfirm(student_no);
			
			String account_no = service.selectAccount_no(student_no);
			AnnounceVO vo = new AnnounceVO();
			
			vo.setAccount_no(account_no);
			vo.setAnno_check_cd("N");
			vo.setAnno_content("졸업대상자로 변경되었습니다.");
			vo.setMcode("M080100");
			announceService.regist(vo);
			
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping("/graduation/management_prof/cancel")
	@ResponseBody
	public ResponseEntity<String> cancel(String student_no, String attach_no)throws Exception{
		ResponseEntity<String> entity = null;
		try {
			service.removeFromGrad_thesis(student_no);
			service.removeFromGraduated(student_no);
			service.removeFromAttachment(attach_no);
			
			String account_no = service.selectAccount_no(student_no);
			AnnounceVO vo = new AnnounceVO();
			
			vo.setAccount_no(account_no);
			vo.setAnno_check_cd("N");
			vo.setAnno_content("졸업논문이 반려되었습니다.");
			vo.setMcode("M080100");
			announceService.regist(vo);
			
			entity = new ResponseEntity<String>(HttpStatus.OK);
		}catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
