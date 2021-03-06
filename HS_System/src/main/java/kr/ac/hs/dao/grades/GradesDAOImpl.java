package kr.ac.hs.dao.grades;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.command.grades.DissenetRegistCommand;
import kr.ac.hs.command.grades.RegistGradesCommand;
import kr.ac.hs.dto.academic.StudentVO;
import kr.ac.hs.dto.grades.GradesDissentVO;
import kr.ac.hs.dto.grades.GradesVO;

public class GradesDAOImpl implements GradesDAO {

	private SqlSession session;
	private int offset;
	private int limit;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<GradesVO> selectGradesByStudentNo(String student_no) throws SQLException {
		List<GradesVO> gradesList = session.selectList("Grades-Mapper.selectGradesByStudentNo", student_no);
		return gradesList;
	}

	@Override
	public double selectPreviousSemesterGradesByStudnetNo(String student_no) throws SQLException {
		double score = session.selectOne("Grades-Mapper.selectPreviousSemesterGradesByStudnetNo", student_no);
		return score;
	}

	@Override
	public List<GradesVO> selectThisSemesterGradesByStudentNo(Map<String, Object> dataMap) throws SQLException {
		List<GradesVO> gradesList = null;

		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		offset = cri.getStartRowNum();
		limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		gradesList = session.selectList("Grades-Mapper.selectThisSemesterGradesByStudentNo", dataMap, rowBounds);

		return gradesList;

	}

	@Override
	public List<GradesVO> selectGradesBySemester(Map<String, Object> dataMap) throws SQLException {

		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");

		offset = cri.getStartRowNum();
		limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		List<GradesVO> gradesList = session.selectList("Grades-Mapper.selectGradesBySemester", dataMap, rowBounds);

		return gradesList;
	}

	@Override
	public GradesVO selectTotalGradesByStudentNo(String student_no) throws SQLException {
		GradesVO grades = session.selectOne("Grades-Mapper.selectTotalGradesByStudentNo", student_no);
		return grades;
	}

	@Override
	public List<String> selectSemesterListByStudentNo(String student_no) throws SQLException {
		List<String> semesterList = session.selectList("Grades-Mapper.selectSemesterListByStudentNo", student_no);
		return semesterList;
	}

	@Override
	public String selectDissentSeq() throws SQLException {
		String sequence = session.selectOne("Grades-Mapper.selectDissentSeq");
		return sequence;
	}

	@Override
	public void insertGradesDissent(GradesDissentVO dissent) throws SQLException {
		session.update("Grades-Mapper.insertGradesDissent", dissent);
	}

	@Override
	public GradesDissentVO selectDissentGrades(GradesDissentVO dissent) throws SQLException {
		GradesDissentVO dissentVO = session.selectOne("Grades-Mapper.selectDissentGrades", dissent);
		return dissentVO;
	}

	@Override
	public List<GradesVO> selectPdfGradesByStudentNo(String student_no) throws SQLException {
		List<GradesVO> gradesList = session.selectList("Grades-Mapper.selectPdfGradesByStudentNo", student_no);
		return gradesList;
	}

	@Override
	public GradesVO selectPdfTotalGrades(String student_no) throws SQLException {
		GradesVO totalGrades = session.selectOne("Grades-Mapper.selectPdfTotalGrades", student_no);
		return totalGrades;
	}

	@Override
	public List<GradesDissentVO> selectDissentGradesListByPronNo(Map<String, Object> paraMap) throws SQLException {
		DissenetRegistCommand cmd = (DissenetRegistCommand) paraMap.get("cmd");

		offset = cmd.getStartRowNum();
		limit = cmd.getPerPageNum();

		RowBounds rowBounds = new RowBounds(offset, limit);

		List<GradesDissentVO> dissentList = session.selectList("Grades-Mapper.selectDissentGradesListByPronNo", paraMap,
				rowBounds);
		return dissentList;
	}

	@Override
	public List<StudentVO> selectStduentListByClassNo(Map<String, Object> paraMap) throws SQLException {
		RegistGradesCommand cri = (RegistGradesCommand) paraMap.get("cri");

		offset = cri.getStartRowNum();
		limit = cri.getPerPageNum();

		RowBounds rowBounds = new RowBounds(offset, limit);

		List<StudentVO> studentList = session.selectList("Grades-Mapper.selectStduentListByClassNo", paraMap,
				rowBounds);

		return studentList;
	}

	@Override
	public void insertGrades(GradesVO grades) throws SQLException {
		session.update("Grades-Mapper.insertGrades", grades);
	}

	@Override
	public void updateGrades(GradesVO grades) throws SQLException {
		session.update("Grades-Mapper.updateGrades", grades);
	}

	@Override
	public void updateGradesForGradesCd(GradesVO grades) throws SQLException {
		session.update("Grades-Mapper.updateGradesForGradesCd", grades);

	}

	@Override
	public GradesVO selectGradesFromPorfByStudentNo(GradesVO grades) throws SQLException {
		GradesVO gradesVO = session.selectOne("Grades-Mapper.selectGradesFromPorfByStudentNo", grades);
		return gradesVO;
	}

	@Override
	public GradesDissentVO selectDissentGradesByDissentNo(String dissentNo) throws SQLException {
		GradesDissentVO dissent = session.selectOne("Grades-Mapper.selectDissentGradesByDissentNo", dissentNo);
		return dissent;
	}

	@Override
	public void updateDissentGradesFromProf(GradesDissentVO dissent) throws SQLException {
		session.update("Grades-Mapper.updateDissentGradesFromProf", dissent);
	}

}
