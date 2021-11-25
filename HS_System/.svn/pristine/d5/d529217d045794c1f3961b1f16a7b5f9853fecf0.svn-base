package kr.ac.hs.service.grades;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.grades.GradesDissentVO;
import kr.ac.hs.dto.grades.GradesVO;

public interface GradesService {
	
	public List<GradesVO> getGradesByStudentNo(String student_no) throws SQLException;

	double getPreviousSemesterGradesByStudnetNo(String student_no) throws SQLException;
	
	public Map<String,Object> getThisSemesterGradesByStudentNo(GradesVO grades,SearchCriteria cri) throws SQLException;
	
	public Map<String,Object> getGradesBySemester(GradesVO grades,SearchCriteria cri) throws SQLException;

	public GradesVO getTotalGradesByStudentNo(String student_no) throws SQLException;

	public List<String> getSemesterListByStudentNo(String student_no) throws SQLException;

	public void registGradesDissent(GradesDissentVO dissent) throws SQLException;

	public GradesDissentVO getGradesDissent(GradesDissentVO dissent) throws SQLException;

	public Map<String,Object> getPdfGrades (String student_no) throws SQLException;

	public Map<String, Object> getDissentGradesListByProNo(Map<String, Object> paraMap) throws SQLException;

	public Map<String, Object> getStudentListByClassNo(Map<String, Object> paraMap) throws SQLException;

	public void registGrades(GradesVO grades) throws SQLException;

	public GradesVO getGradesByStudentNoAndClassNo(GradesVO grades) throws SQLException;

	public GradesDissentVO getDissentDetailFromProf(String dissentNo) throws SQLException;

	public void modifyDissentGradesFromProf(GradesDissentVO dissent) throws SQLException;

	void modifyTotalGrades(GradesVO grades) throws SQLException;
}
