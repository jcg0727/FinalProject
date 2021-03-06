package kr.ac.hs.dao.lecture;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.lecture.CurriculumCommand;
import kr.ac.hs.dto.lecture.CurriculumVO;
import kr.ac.hs.dto.lecture.LectureVO;

public interface CurriculumDAO {
   public List<CurriculumVO> selectCurriculumListByDeptCd(CurriculumCommand cmd) throws SQLException;
   
   public List<CurriculumVO> selectNotOpenCurriculumBySemester(CurriculumCommand cmd) throws SQLException;
   
   public List<CurriculumVO> selectLecture(CurriculumCommand cmd) throws SQLException;

   public void insertUnonpenedCurriculum(CurriculumCommand cmd) throws SQLException;

   public void deleteUnopenedCurriculum(CurriculumCommand cmd) throws SQLException;

   public void insertOpenedCurriculum(LectureVO lecture) throws SQLException;

   public List<LectureVO> selectRegisteCurriculumAcademic(CurriculumCommand cmd) throws SQLException;

   public LectureVO selectRegistCurriculumAcademicDetail(CurriculumCommand cmd) throws SQLException;
   
   public void updateOpenCurriculumByAcademic(CurriculumCommand cmd) throws SQLException;
   
   
   
   // 교직원 -----------------------------------------------------------------------------------
   CurriculumVO selectCurriculumDetail(String class_no) throws SQLException;
   
   String selectCreateClass_No() throws SQLException;
   
   List<CurriculumVO> selectCurriculumDeptStaff(Map<String, Object> dataMap) throws SQLException;
   int selectCurriculumDeptStaffCount(Map<String, Object> dataMap) throws SQLException;
   
   List<CurriculumVO> selectCurriculumStaff(Map<String, Object> dataMap) throws SQLException;
   int selectCurriculumStaffCount(Map<String, Object> dataMap) throws SQLException;
   
   void insertCurriculumStaff(CurriculumVO curriculumVO) throws SQLException;
   
   void deleteCurriculumWhether(String class_no) throws SQLException;
   
   
}