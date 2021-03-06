package kr.ac.hs.service.lecture;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.lecture.CurriculumCommand;
import kr.ac.hs.dao.DepartmentDAO;
import kr.ac.hs.dao.lecture.CurriculumDAO;
import kr.ac.hs.dto.DepartmentVO;
import kr.ac.hs.dto.common.StaffVO;
import kr.ac.hs.dto.lecture.CurriculumVO;
import kr.ac.hs.dto.lecture.LectureVO;

public class CurriculumServiceImpl implements CurriculumService {

   private CurriculumDAO curriculumDAO;

   private DepartmentDAO departmentDAO;

   public void setCurriculumDAO(CurriculumDAO curriculumDAO) {
      this.curriculumDAO = curriculumDAO;
   }

   public void setDepartmentDAO(DepartmentDAO departmentDAO) {
      this.departmentDAO = departmentDAO;
   }

   @Override
   public Map<String, Object> getCurriculumListByDeptCd(CurriculumCommand cmd) throws SQLException {
      Map<String, Object> dataMap = new HashMap<String, Object>();

      List<CurriculumVO> curriculumList = curriculumDAO.selectCurriculumListByDeptCd(cmd);
      if (curriculumList != null) {
         for (CurriculumVO curriculum : curriculumList) {
            DepartmentVO department = departmentDAO.selectDepartmentByDeptartmentCode(curriculum.getDept_cd());
            curriculum.setDept_nm(department.getDept_nm());
         }
      }

      PageMaker pageMaker = new PageMaker();

      pageMaker.setCri(cmd);
      if (curriculumList != null && curriculumList.size() > 0) {
         pageMaker.setTotalCount(curriculumList.get(0).getTotalcnt());
      }

      dataMap.put("pageMaker", pageMaker);
      dataMap.put("curriculumList", curriculumList);

      return dataMap;
   }

   @Override
   public Map<String, Object> getNotOpenCurriculum(CurriculumCommand cmd) throws SQLException {
      Map<String, Object> dataMap = new HashMap<String, Object>();

      List<CurriculumVO> curriculumList = curriculumDAO.selectNotOpenCurriculumBySemester(cmd);
      PageMaker pageMaker = new PageMaker();

      pageMaker.setCri(cmd);
      if (curriculumList != null && curriculumList.size() > 0) {
         pageMaker.setTotalCount(curriculumList.get(0).getTotalcnt());
      }

      dataMap.put("pageMaker", pageMaker);
      dataMap.put("unopenedList", curriculumList);

      return dataMap;
   }

   @Override
   public Map<String, Object> getLectrue(CurriculumCommand cmd) throws SQLException {
      Map<String, Object> dataMap = new HashMap<String, Object>();

      List<CurriculumVO> lectureList = curriculumDAO.selectLecture(cmd);
      PageMaker pageMaker = new PageMaker();

      pageMaker.setCri(cmd);
      if (lectureList != null && lectureList.size() > 0) {
         pageMaker.setTotalCount(lectureList.get(0).getTotalcnt());
      }

      dataMap.put("pageMaker", pageMaker);
      dataMap.put("lectureList", lectureList);

      return dataMap;
   }

   @Override
   public void registUnopendCurriculum(CurriculumCommand cmd) throws SQLException {
      curriculumDAO.insertUnonpenedCurriculum(cmd);
   }

   @Override
   public void removeUnopenedCurriculumRegist(CurriculumCommand cmd) throws SQLException {
      curriculumDAO.deleteUnopenedCurriculum(cmd);
   }

   @Override
   public void registOpenedCurriculum(CurriculumCommand cmd, StaffVO staff) throws SQLException {
      List<CurriculumVO> curriculumList = curriculumDAO.selectCurriculumListByDeptCd(cmd);
      List<CurriculumVO> unopenedList = curriculumDAO.selectNotOpenCurriculumBySemester(cmd);

      cmd.setPerPageNum(curriculumList.get(0).getTotalcnt());
      curriculumList = curriculumDAO.selectCurriculumListByDeptCd(cmd);

      cmd.setPerPageNum(unopenedList.get(0).getTotalcnt());
      unopenedList = curriculumDAO.selectNotOpenCurriculumBySemester(cmd);

      for (CurriculumVO curriculum : curriculumList) {
         boolean flag = true;
         for (CurriculumVO unopened : unopenedList) {
            if (curriculum.getClass_no().equals(unopened.getClass_no())) {
               flag = false;
            }
         }

         if (flag == true) {
            LectureVO lecture = new LectureVO();

            lecture.setLecture_semester(cmd.getLecture_semester());
            lecture.setClass_no(curriculum.getClass_no());
            lecture.setClass_name(curriculum.getClass_nm());
            lecture.setClass_grade(curriculum.getClass_score());
            lecture.setClass_year(curriculum.getGrade());
            lecture.setDept_name(staff.getDept_nm());
            lecture.setClass_type(curriculum.getStatus_nm());
            lecture.setDept_no(staff.getDept_cd());
            try {
               curriculumDAO.insertOpenedCurriculum(lecture);
            } catch (Exception e) {
               e.printStackTrace();
            }
         }

      }

   }

   @Override
   public Map<String, Object> getRegisteCurriculumAcademic(CurriculumCommand cmd) throws SQLException {
      List<LectureVO> lectureList= curriculumDAO.selectRegisteCurriculumAcademic(cmd);
      Map<String,Object> dataMap = new HashMap<String, Object>();
      
      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cmd);
      
      if(lectureList != null && lectureList.size() > 0) {
         pageMaker.setTotalCount(lectureList.get(0).getTotalcnt());
      }
      
      dataMap.put("pageMaker", pageMaker);
      dataMap.put("lectureList", lectureList);
      
      return dataMap;
   }

   @Override
   public LectureVO getRegisteCurriculumAcademicDetail(CurriculumCommand cmd) throws SQLException {
      LectureVO lecture = curriculumDAO.selectRegistCurriculumAcademicDetail(cmd);
      return lecture;
   }

   @Override
   public void modifyCurriculumStatusByAcademic(CurriculumCommand cmd) throws SQLException {
      curriculumDAO.updateOpenCurriculumByAcademic(cmd);
   }

   
   
   // ????????? -----------------------------------------------------------------------------------------
   
   @Override
   public CurriculumVO getDetail(String class_no) throws SQLException {
      CurriculumVO curriculumVO =  curriculumDAO.selectCurriculumDetail(class_no);
      return curriculumVO;
   }
   
   
   @Override
   public String getCreateClass_No() throws SQLException {
      String class_no = curriculumDAO.selectCreateClass_No();
      return class_no;
   }
   
   @Override
   public Map<String, Object> getCurriculumDeptStaff(Map<String, Object> dataMap) throws SQLException {
      List<CurriculumVO> curriculumDeptList = curriculumDAO.selectCurriculumDeptStaff(dataMap);
      int totalCount = curriculumDAO.selectCurriculumDeptStaffCount(dataMap);
      
      PageMaker pageMaker = new PageMaker();
      SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
      
      pageMaker.setCri(cri);
      pageMaker.setTotalCount(totalCount);
      
      dataMap.put("curriculumDeptList", curriculumDeptList);
      dataMap.put("pageMaker", pageMaker);
      
      return dataMap;
   }

   @Override
   public Map<String, Object> getCurriculumStaff(Map<String, Object> dataMap) throws SQLException {
      List<CurriculumVO> curriculumStaffList = curriculumDAO.selectCurriculumStaff(dataMap);
      int totalCount = curriculumDAO.selectCurriculumStaffCount(dataMap);
      
      PageMaker pageMaker = new PageMaker();
      SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
      
      pageMaker.setCri(cri);
      pageMaker.setTotalCount(totalCount);
      
      dataMap.put("curriculumStaffList", curriculumStaffList);
      dataMap.put("pageMaker", pageMaker);
      
      return dataMap;
   }

   @Override
   public void registCurriculumStaff(CurriculumVO curriculumVO) throws SQLException {
      curriculumDAO.insertCurriculumStaff(curriculumVO);
   }

   @Override
   public void modifyCurriculumWhether(String class_no) throws SQLException {
      curriculumDAO.deleteCurriculumWhether(class_no);
   }

}