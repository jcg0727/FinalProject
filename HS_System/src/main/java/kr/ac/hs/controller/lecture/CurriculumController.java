package kr.ac.hs.controller.lecture;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.lecture.CurriculumCommand;
import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.applicant.StaffApplicantVO;
import kr.ac.hs.dto.common.StaffVO;
import kr.ac.hs.dto.lecture.CurriculumVO;
import kr.ac.hs.dto.lecture.LectureVO;
import kr.ac.hs.service.DepartmentService;
import kr.ac.hs.service.common.StaffService;
import kr.ac.hs.service.lecture.CurriculumService;
import oracle.net.aso.e;

@Controller
public class CurriculumController {

   @Autowired
   private CurriculumService curriculumService;

   @Autowired
   private StaffService staffService;

   @RequestMapping("/lecture/openLecture")
   public String mainOpenLecture(HttpSession session, Model model) throws Exception {
      String url = "lecture/staff/curriculumOpen";

      AccountVO account = (AccountVO) session.getAttribute("loginUser");

      StaffVO staff = staffService.getStaff(account.getStaff_no());

      model.addAttribute("staff", staff);
      return url;
   }

   @RequestMapping("/curriculum/list")
   @ResponseBody
   public ResponseEntity<Map<String, Object>> getCurriculumList(@RequestBody CurriculumCommand cmd) throws Exception {
      ResponseEntity<Map<String, Object>> entity = null;
      try {
         Map<String, Object> dataMap = curriculumService.getCurriculumListByDeptCd(cmd);

         entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
      } catch (SQLException e) {
         e.printStackTrace();
         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
      }

      return entity;
   }

   @RequestMapping("/curriculum/unopenedCurriculum/list")
   @ResponseBody
   public ResponseEntity<Map<String, Object>> getUnopenedCurriculum(@RequestBody CurriculumCommand cmd)
         throws Exception {
      ResponseEntity<Map<String, Object>> entity = null;

      try {
         cmd.setPerPageNum(5);
         Map<String, Object> dataMap = curriculumService.getNotOpenCurriculum(cmd);

         entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
      } catch (SQLException e) {
         e.printStackTrace();
         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
      }

      return entity;
   }

   @RequestMapping("/curriculum/registeCurriculum/list")
   @ResponseBody
   public ResponseEntity<Map<String, Object>> getOpenRegistCurriculumList(@RequestBody CurriculumCommand cmd)
         throws Exception {
      ResponseEntity<Map<String, Object>> entity = null;

      try {
         cmd.setPerPageNum(5);
         Map<String, Object> dataMap = curriculumService.getLectrue(cmd);

         entity = new ResponseEntity<Map<String, Object>>(dataMap, HttpStatus.OK);
      } catch (SQLException e) {
         e.printStackTrace();
         entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
      }

      return entity;
   }

   @RequestMapping("/curriculum/notOpenCurriculum/regist")
   @ResponseBody
   public ResponseEntity<Map<String, Object>> registUnopenedCurriculum(@RequestBody CurriculumCommand cmd) throws Exception {
      ResponseEntity<Map<String, Object>> entity = null;
      Map<String,Object> dataMap = new HashMap<String, Object>();
      
      try {
         curriculumService.registUnopendCurriculum(cmd);
         entity = new ResponseEntity<>(HttpStatus.OK);
      } catch (SQLIntegrityConstraintViolationException e) {
         dataMap.put("message", "overlap");
         entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
      } catch (SQLException e) {
         entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
      }

      return entity;
   }
   
   @RequestMapping("/curriculum/notOpenCurriculum/remove")
   @ResponseBody
   public ResponseEntity<Map<String,Object>> removeUnopenedCurriculum(@RequestBody CurriculumCommand cmd) throws Exception{
      ResponseEntity<Map<String, Object>> entity = null;
      
      try {
         curriculumService.removeUnopenedCurriculumRegist(cmd);
         entity = new ResponseEntity<Map<String,Object>>(HttpStatus.OK);
      }catch (SQLException e) {
         entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
      }
      
      return entity;
   }
   
   @RequestMapping("/curriculum/registeCurriculum/regist")
   @ResponseBody
   public ResponseEntity<Map<String, Object>> registOpenedCurriculum(@RequestBody CurriculumCommand cmd, HttpSession session) throws Exception{
      ResponseEntity<Map<String, Object>> entity = null;
      
      AccountVO account = (AccountVO) session.getAttribute("loginUser");
      StaffVO staff = staffService.getStaff(account.getStaff_no());
      try {
         curriculumService.registOpenedCurriculum(cmd, staff);
         entity = new ResponseEntity<>(HttpStatus.OK);
      }catch (SQLException e) {
         e.printStackTrace();
         entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
      }
      
      return entity;
   }
   
   @RequestMapping("/curriculum/registeCurriculumAcademic/list")
   @ResponseBody
   public ResponseEntity<Map<String,Object>> getRegisteCurriculumAcademic(@RequestBody CurriculumCommand cmd) throws Exception{
      ResponseEntity<Map<String,Object>> entity = null;
      try {
         Map<String,Object> dataMap = curriculumService.getRegisteCurriculumAcademic(cmd);
         entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
      }catch (SQLException e) {
         entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
      }
      
      return entity;
   }
   
   @RequestMapping("/curriculum/registeCurriculumAcademic/detail")
   @ResponseBody
   public ResponseEntity<LectureVO> getRegisteCurriculumAcademicDetail(@RequestBody CurriculumCommand cmd)throws Exception{
      ResponseEntity<LectureVO> entity = null;
      try {
         LectureVO lecture = curriculumService.getRegisteCurriculumAcademicDetail(cmd);
         entity = new ResponseEntity<LectureVO>(lecture, HttpStatus.OK);
      }catch (SQLException e) {
         entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
      }
      
      return entity;
   }
   
   @RequestMapping("/curriculum/registeCurriculumAcademic/modify")
   @ResponseBody
   public ResponseEntity<Map<String, Object>> modifyCurriculuStatus(@RequestBody CurriculumCommand cmd) throws Exception {
      ResponseEntity<Map<String, Object>> entity = null;
      Map<String,Object> dataMap = new HashMap<String, Object>();
      try {
         curriculumService.modifyCurriculumStatusByAcademic(cmd);
         dataMap.put("message", "OK");
         entity = new ResponseEntity<Map<String,Object>>(dataMap, HttpStatus.OK);
      }catch (SQLException e) {
         entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
      }
      
      
      return entity;
   }
   
   
   
   // ?????????---------------------------------------------------------------------------------------------------------------
   @RequestMapping("/curriculum/management")
   public ModelAndView curriculumMain(SearchCriteria cri, ModelAndView mnv, HttpSession session, Map<String, Object> dataMap) throws SQLException{
      String url = "curriculum/staff/curriculumManagement";
      String url2 = "curriculum/staff/curriculumdDeptManagement";
      
      String class_no = curriculumService.getCreateClass_No();
      
      AccountVO loginUser = (AccountVO)session.getAttribute("loginUser");
      
      //cri.setPerPageNum(5);
      
      dataMap.put("cri", cri);
      dataMap.put("staff_no", loginUser.getId());
      
      
      
      if(loginUser.getAuthority_cd().equals("ROLE_ACADEMIC")) {
         dataMap =  curriculumService.getCurriculumStaff(dataMap);
         mnv.setViewName(url);
      }else if(loginUser.getAuthority_cd().equals("ROLE_STAFF")) {
         dataMap =  curriculumService.getCurriculumDeptStaff(dataMap);
         mnv.setViewName(url2);
      }
      
      mnv.addObject("class_no", class_no);
      mnv.addObject("dataMap", dataMap);
      
      return mnv;
   }
   
   @RequestMapping(value="/curriculum/management/detail")
   @ResponseBody
   public ResponseEntity<CurriculumVO> detail(@RequestParam("class_no") String class_no) throws Exception{
      ResponseEntity<CurriculumVO> entity = null;
      
      try {
         CurriculumVO curriculumVO = curriculumService.getDetail(class_no);
         entity = new ResponseEntity<CurriculumVO>(curriculumVO, HttpStatus.OK);
      }catch (Exception e){
         entity = new ResponseEntity<CurriculumVO>(HttpStatus.BAD_REQUEST);
      }
      return entity;
   
   }
   
   @RequestMapping(value="/curriculum/management/regist" , method=RequestMethod.POST)
   @ResponseBody
   public ResponseEntity<CurriculumVO> regist(@RequestBody CurriculumCommand cmd) throws Exception{
      
      ResponseEntity<CurriculumVO> entity = null;
      
      CurriculumVO curriculumVO = cmd.toVO();
/*      System.out.println(curriculumVO.getClass_no());
      System.out.println(curriculumVO.getDept_nm());
      System.out.println(curriculumVO.getClass_nm());
      System.out.println(curriculumVO.getClass_score());
      System.out.println(curriculumVO.getCurri_content());
      System.out.println(curriculumVO.getGrade());
      System.out.println(curriculumVO.getClass_type_cd());*/
      
      try {
         curriculumService.registCurriculumStaff(curriculumVO);
         entity = new ResponseEntity<CurriculumVO>(curriculumVO, HttpStatus.OK);
      }catch(Exception e) {
         entity = new ResponseEntity<CurriculumVO>(HttpStatus.BAD_REQUEST);
      }
      return entity;
   }
   
   @RequestMapping(value="/curriculum/management/modify")
   @ResponseBody
   public ResponseEntity<String> modify(String class_no) throws Exception{
      
      ResponseEntity<String> entity = null;
      try {
         curriculumService.modifyCurriculumWhether(class_no);
         entity = new ResponseEntity<String>(HttpStatus.OK);
      }catch (Exception e) {
         entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
      }
      return entity;
   }
   
   @RequestMapping(value="/curriculum/management/remove")
   @ResponseBody
   public ResponseEntity<String> delete(String class_no) throws Exception{
      ResponseEntity<String> entity = null;

      
      try {
         curriculumService.modifyCurriculumWhether(class_no);
         entity = new ResponseEntity<String>(class_no, HttpStatus.OK);
      }catch (Exception e) {
         entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
      }
      return entity;
   }
   
}
