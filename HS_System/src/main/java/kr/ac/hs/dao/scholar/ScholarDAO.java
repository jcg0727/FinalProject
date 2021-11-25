package kr.ac.hs.dao.scholar;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.scholar.ScholarStaffVO;
import kr.ac.hs.dto.scholar.ScholarVO;


public interface ScholarDAO {
		
		String selectDeptNmDeptStaff(String staff_no) throws SQLException;
		
		List<ScholarVO> selectStudentDeptStaffScoreList(Map<String, Object> dataMap) throws SQLException;
		
		void insertDeptStaffScholar(String student_no) throws SQLException;
		
		void deleteDeptStaffScholarStu(ScholarStaffVO scholarVO) throws SQLException;
		
		
		List<ScholarVO> selectStudentScholarRecommend (Map<String, Object> dataMap) throws SQLException; 
		
		void updateScholarStaffStu(ScholarStaffVO scholarVO) throws SQLException;
		
		void updateScholarStaffTutionAmount(ScholarStaffVO scholarVO) throws SQLException;
		
		void DeleteScholarStaffStu(ScholarStaffVO scholarVO) throws SQLException;
		
		public List<ScholarVO> selectScholar(SearchCriteria cri, String student_no) throws SQLException;
	

		
}