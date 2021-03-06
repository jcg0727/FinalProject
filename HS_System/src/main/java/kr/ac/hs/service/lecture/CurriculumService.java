package kr.ac.hs.service.lecture;

import java.sql.SQLException;
import java.util.Map;

import kr.ac.hs.command.lecture.CurriculumCommand;
import kr.ac.hs.dto.common.StaffVO;
import kr.ac.hs.dto.lecture.CurriculumVO;
import kr.ac.hs.dto.lecture.LectureVO;

public interface CurriculumService {
   public Map<String, Object> getCurriculumListByDeptCd(CurriculumCommand cmd) throws SQLException;

   public Map<String, Object> getNotOpenCurriculum(CurriculumCommand cmd) throws SQLException;
   
   public Map<String, Object> getLectrue(CurriculumCommand cmd) throws SQLException;

   public void registUnopendCurriculum(CurriculumCommand cmd) throws SQLException;

   public void removeUnopenedCurriculumRegist(CurriculumCommand cmd) throws SQLException;

   public void registOpenedCurriculum(CurriculumCommand cmd, StaffVO staff) throws SQLException;

   public Map<String, Object> getRegisteCurriculumAcademic(CurriculumCommand cmd) throws SQLException;

   public LectureVO getRegisteCurriculumAcademicDetail(CurriculumCommand cmd) throws SQLException;
   
   public void modifyCurriculumStatusByAcademic(CurriculumCommand cmd) throws SQLException;
   
   
   // 교직원 -------------------------------------------------------------------------------------
   CurriculumVO getDetail(String class_no) throws SQLException;
   
   String getCreateClass_No() throws SQLException;
   
   Map<String, Object> getCurriculumDeptStaff(Map<String, Object>dataMap) throws SQLException;

   Map<String, Object> getCurriculumStaff(Map<String, Object>dataMap) throws SQLException;
   
   void registCurriculumStaff(CurriculumVO curriculumVO) throws SQLException;
   
   void modifyCurriculumWhether(String class_no) throws SQLException;
   
}