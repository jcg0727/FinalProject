package kr.ac.hs.service.scholar;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.scholar.ScholarStaffVO;
import kr.ac.hs.dto.scholar.ScholarVO;

public interface ScholarService {

	String getDeptNmDeptStaff(String staff_no) throws SQLException;

	Map<String, Object> getStudentDeptStaffScoreList(Map<String, Object> dataMap) throws SQLException;

	void registDeptStaffScholar(String student_no) throws SQLException;

	void removeDeptStaffScholarStu(ScholarStaffVO scholarStaffVO) throws SQLException;

	Map<String, Object> getStudentScholarRecommend(Map<String, Object> dataMap) throws SQLException;

	void modifyScholarStaffStu(ScholarStaffVO scholarStaffVO) throws SQLException;

	void removeScholarStaffStu(ScholarStaffVO scholarStaffVO) throws SQLException;

	public Map<String, Object> selectScholar(SearchCriteria cri, String student_no) throws SQLException;

}
