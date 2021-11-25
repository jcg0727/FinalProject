package kr.ac.hs.dao.grades;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.academic.StudentVO;
import kr.ac.hs.dto.grades.GradesDissentVO;
import kr.ac.hs.dto.grades.GradesVO;

public interface GradesDAO {
	public List<GradesVO> selectGradesByStudentNo(String student_no) throws SQLException;

	double selectPreviousSemesterGradesByStudnetNo(String student_no) throws SQLException;

	public List<GradesVO> selectThisSemesterGradesByStudentNo(Map<String,Object> dataMap) throws SQLException;
	
	public List<GradesVO> selectGradesBySemester(Map<String,Object> dataMap) throws SQLException;

	public GradesVO selectTotalGradesByStudentNo(String student_no) throws SQLException;

	public List<String> selectSemesterListByStudentNo(String student_no) throws SQLException;

	public String selectDissentSeq() throws SQLException;

	public void insertGradesDissent(GradesDissentVO dissent) throws SQLException;

	public GradesDissentVO selectDissentGrades(GradesDissentVO dissent) throws SQLException;
	
	public List<GradesVO> selectPdfGradesByStudentNo(String student_no) throws SQLException;

	public GradesVO selectPdfTotalGrades(String student_no) throws SQLException;

	public List<GradesDissentVO> selectDissentGradesListByPronNo(Map<String, Object> paraMap) throws SQLException;

	public List<StudentVO> selectStduentListByClassNo(Map<String, Object> paraMap) throws SQLException;

	public void insertGrades(GradesVO grades) throws SQLException;

	public void updateGrades(GradesVO grades) throws SQLException;

	public void updateGradesForGradesCd(GradesVO grades) throws SQLException;

	public GradesVO selectGradesFromPorfByStudentNo(GradesVO grades) throws SQLException;

	public GradesDissentVO selectDissentGradesByDissentNo(String dissentNo) throws SQLException;

	public void updateDissentGradesFromProf(GradesDissentVO dissent) throws SQLException;
	
}
