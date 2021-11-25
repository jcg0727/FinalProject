package kr.ac.hs.dao.lecture;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.lecture.CurriculumCommand;
import kr.ac.hs.dto.lecture.CurriculumVO;
import kr.ac.hs.dto.lecture.LectureVO;

public class CurriculumDAOImpl implements CurriculumDAO {

   private SqlSession session;
   private String namespace = "StaffCurriculum-Mapper.";
         
   public void setSqlSession(SqlSession session) {
      this.session = session;
   }

   @Override
   public List<CurriculumVO> selectCurriculumListByDeptCd(CurriculumCommand cmd) throws SQLException {
      int limit = cmd.getPerPageNum();
      int offset = cmd.getStartRowNum();
      RowBounds rowBounds = new RowBounds(offset, limit);
      
      List<CurriculumVO> curriList = session.selectList("Curriculum-Mapper.selectCurriculumListByDeptCd", cmd, rowBounds);
      
      return curriList;
   }

   @Override
   public List<CurriculumVO> selectNotOpenCurriculumBySemester(CurriculumCommand cmd) throws SQLException {
      int offset = cmd.getStartRowNum();
      int limit = cmd.getPerPageNum();
      
      RowBounds rowBounds = new RowBounds(offset, limit);
      
      List<CurriculumVO> curriculumList = session.selectList("Curriculum-Mapper.selectNotOpenCurriculumBySemester", cmd, rowBounds);
      return curriculumList;
   }

   @Override
   public List<CurriculumVO> selectLecture(CurriculumCommand cmd) throws SQLException {
      int offset = cmd.getStartRowNum();
      int limit = cmd.getPerPageNum();
      
      RowBounds rowBounds = new RowBounds(offset, limit);
      
      List<CurriculumVO> curriculumList = session.selectList("Curriculum-Mapper.selectLecture", cmd , rowBounds);
      return curriculumList;
   }

   @Override
   public void insertUnonpenedCurriculum(CurriculumCommand cmd) throws SQLException {
      session.update("Curriculum-Mapper.insertUponpenedCurriculum", cmd);
   }

   @Override
   public void deleteUnopenedCurriculum(CurriculumCommand cmd) throws SQLException{
      session.update("Curriculum-Mapper.deleteUnopenedCurriculum", cmd);
   }

   @Override
   public void insertOpenedCurriculum(LectureVO lecture) throws SQLException {
      session.update("Curriculum-Mapper.insertOpenedCurriculum", lecture);
      
   }

   @Override
   public List<LectureVO> selectRegisteCurriculumAcademic(CurriculumCommand cmd) throws SQLException {
      int offset = cmd.getStartRowNum();
      int limit = cmd.getPerPageNum();
      
      RowBounds rowBounds = new RowBounds(offset, limit);
      
      List<LectureVO> selectList = session.selectList("Curriculum-Mapper.selectRegisteCurriculumAcademic",cmd, rowBounds);
      return selectList;
   }

   @Override
   public LectureVO selectRegistCurriculumAcademicDetail(CurriculumCommand cmd) throws SQLException {
      LectureVO lecture = session.selectOne("Curriculum-Mapper.selectRegistCurriculumAcademicDetail", cmd);
      return lecture;
   }

   @Override
   public void updateOpenCurriculumByAcademic(CurriculumCommand cmd) throws SQLException {
      session.update("Curriculum-Mapper.updateOpenCurriculumByAcademic", cmd);
      
   }

   
   // 교직원 -----------------------------------------------------------------------------------
   
   @Override
   public CurriculumVO selectCurriculumDetail(String class_no) throws SQLException {
      CurriculumVO curriculumVO = session.selectOne(namespace + "selectCurriculumDetail", class_no);
      return curriculumVO;
   }
   
   @Override
   public String selectCreateClass_No() throws SQLException {
      String class_no = session.selectOne(namespace + "selectCreateClass_No");
      return class_no;
   }
   
   @Override
   public List<CurriculumVO> selectCurriculumDeptStaff(Map<String, Object> dataMap) throws SQLException {
      SearchCriteria cri = (SearchCriteria)dataMap.get("cri");
      int offset = cri.getStartRowNum();
      int limit = cri.getPerPageNum();
      RowBounds rowBounds = new RowBounds(offset, limit);
      List<CurriculumVO> curriculumDeptList = session.selectList(namespace + "selectCurriculumDeptStaff", dataMap, rowBounds);
      return curriculumDeptList;
   }

   @Override
   public int selectCurriculumDeptStaffCount(Map<String, Object> dataMap) throws SQLException {
      int count = session.selectOne(namespace + "selectCurriculumDeptStaffCount", dataMap);
      return count;
   }

   @Override
   public List<CurriculumVO> selectCurriculumStaff(Map<String, Object> dataMap) throws SQLException {
      SearchCriteria cri = (SearchCriteria)dataMap.get("cri");
      
      int offset = cri.getStartRowNum();
      int limit = cri.getPerPageNum();
      
      RowBounds rowBounds = new RowBounds(offset, limit);
      List<CurriculumVO> curriculumStaffList = session.selectList(namespace + "selectCurriculumStaff", dataMap, rowBounds);
      
      return curriculumStaffList;
   }

   @Override
   public int selectCurriculumStaffCount(Map<String, Object> dataMap) throws SQLException {
	   int count = session.selectOne(namespace + "selectCurriculumStaffCount", dataMap);
	   return count;
   }


   @Override
   public void insertCurriculumStaff(CurriculumVO curriculumVO) throws SQLException {
      session.update(namespace + "insertCurriculumStaff", curriculumVO);
      
   }

   @Override
   public void deleteCurriculumWhether(String class_no) throws SQLException {
      session.update(namespace + "deleteCurriculumWhether",class_no);
      
   }



}