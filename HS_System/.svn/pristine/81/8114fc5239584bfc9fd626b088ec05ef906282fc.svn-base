 package kr.ac.hs.controller.academic;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.ac.hs.command.academic.AcademicInformationCommand;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.StudentInformationVO;
import kr.ac.hs.service.academic.StudentInformationService;
import kr.ac.hs.util.MakeFileName;

@Controller
public class AcademicInformation {
   
   @Autowired
   private StudentInformationService service;
   
   @RequestMapping("/style/compo")
   public String components() {
      String url = "common/components";
      return url;
   }

   @RequestMapping("/academic/management_st")
   public ModelAndView stuInfo(HttpSession session, ModelAndView mnv) throws SQLException {
      String url = "academic/academicInformation";

      AccountVO account = (AccountVO) session.getAttribute("loginUser");
      String account_no = account.getAccount_no();
      String student_no = account.getId();
      
      int semester = service.selectLectureSemester(student_no);
      int grade = 0;
      switch(semester) {
      	case 0: case 1 :
      		grade = 1;
			break;
		case 2: case 3 :
			grade = 2;
			break;
		case 4: case 5:
			grade = 3;
			break;
		case 6: case 7: case 8: case 9: case 10:
			grade = 4;
			break;
      }
      
      Map<String, Object> dataMap = service.getInfoByAccountNO(account_no);
      
      mnv.addObject("dataMap", dataMap);
      mnv.addObject("account_no",account_no);
      mnv.addObject("semester", semester);
      mnv.addObject("grade", grade);
      mnv.setViewName(url);
      return mnv;
   }
   
	@Resource(name = "picturePath")
	private String picturePath;
	
	@RequestMapping(value = "/picture", method = RequestMethod.POST, produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<String> picture(@RequestParam("pictureFile") MultipartFile multi, String oldPicture)
			throws Exception {
		ResponseEntity<String> entity = null;

		String result = "";
		HttpStatus status = null;

		/* 파일저장확인 */
		if ((result = savePicture(oldPicture, multi)) == null) {
			result = "업로드 실패했습니다.!";
			status = HttpStatus.BAD_REQUEST;
		} else {
			status = HttpStatus.OK;

		}

		entity = new ResponseEntity<String>(result, status);

		return entity;
	}
	
	
	
	private String savePicture(String oldPicture, MultipartFile multi) throws Exception {
		String fileName = null;

		/* 파일유무확인 */
		if (!(multi == null || multi.isEmpty() || multi.getSize() > 1024 * 1024 * 5)) {

			/* 파일저장폴더설정 */
			String uploadPath = picturePath;
			fileName = MakeFileName.toUUIDFileName(multi.getOriginalFilename(), "$$");
			File storeFile = new File(uploadPath, fileName);

			storeFile.mkdirs();

			// local HDD 에 저장.
			multi.transferTo(storeFile);

			if (oldPicture != null && !oldPicture.isEmpty()) {
				File oldFile = new File(uploadPath, oldPicture);
				if (oldFile.exists()) {
					oldFile.delete();
				}
			}
		}
		return fileName;
	}
	
   
	@RequestMapping(value = "/academic/management_st/getPicture", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public ResponseEntity<byte[]> getPicture(String picture) throws Exception {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		String imgPath = this.picturePath;
		try {

			in = new FileInputStream(new File(imgPath, picture));

			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), 
					HttpStatus.CREATED);
		} catch (IOException e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.INTERNAL_SERVER_ERROR);
		} finally {
			in.close();
		}
		return entity;
	}
   
   @RequestMapping(value="/getPictureById/{id}",method=RequestMethod.GET, produces = "text/plain;charset=utf-8")
   @ResponseBody
   public ResponseEntity<byte[]> getPictureById(@PathVariable("id") String id)throws Exception{
	   
	   String picture = service.getPictureByAccountNO(id).getPicture();
	   
	   return getPicture(picture);
	   
   }
   
   @RequestMapping(value = "/academic/modifyForm", method = RequestMethod.GET)
   public String ModifyForm(String id, Model model)throws SQLException{
	   
	   String url = "academic/stuInfoModify";
	   
	   Map<String, Object> dataMap = service.getInfoByAccountNO(id);
	   model.addAttribute("dataMap", dataMap);
	   
	   return url;
   }
   
   @RequestMapping(value="/academic/modify", method=RequestMethod.POST)
   public String modify(AcademicInformationCommand modifyReq, HttpSession session, Model model)throws Exception{
	   
	   String url="/academic/stuInfoModify";
	   StudentInformationVO stuInfo = modifyReq.toParseStuInfo();
	   	   
	   String fileName = savePicture(modifyReq.getOldPicture(), modifyReq.getPicture());
	   stuInfo.setPicture(fileName);

	   if(modifyReq.getPicture().isEmpty()) {
		   stuInfo.setPicture(modifyReq.getOldPicture());
	   }
       AccountVO account = (AccountVO) session.getAttribute("loginUser");
       String account_no = account.getAccount_no();
       
	   stuInfo.setAccount_no(account_no);

	   service.modify(stuInfo);
	   
	   
	   if(account_no != null) {
		   session.setAttribute("account_no", account_no);
	   }
	   
	   model.addAttribute("account_no", account_no);
	   model.addAttribute("from", "modify");
	   Map<String, Object> dataMap = service.getInfoByAccountNO(account_no);	

	   model.addAttribute("dataMap", dataMap);
	   return url;
	   	  
   }
   
   @RequestMapping(value="/academic/print", method=RequestMethod.GET)
   public String printForm(String id,String grade, Model model)throws SQLException{
	   String url="academic/statusPrint";
	   Map<String, Object>dataMap = service.getInfoByAccountNO(id);
	   model.addAttribute("dataMap", dataMap);
	   model.addAttribute("grade", grade);
	   return url;
   }
   
	@RequestMapping(value = "/academic/gradute", method = RequestMethod.GET)
	public String printGraduteForm(String id, Model model) throws SQLException {
		String url = "academic/gradutePrint";
		Map<String, Object> dataMap = service.getInfoByAccountNO(id);
		model.addAttribute("dataMap", dataMap);
		return url;
	}
}