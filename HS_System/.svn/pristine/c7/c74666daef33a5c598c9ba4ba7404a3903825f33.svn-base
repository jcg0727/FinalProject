
package kr.ac.hs.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.ProfessorVO;
import kr.ac.hs.dto.academic.StudentVO;
import kr.ac.hs.dto.common.AdvisorVO;

public class StudentDAOImpl implements StudentDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public StudentVO selectStudentByStudentNo(String student_no) throws SQLException {
		StudentVO student = session.selectOne("Student-Mapper.selectStudentbyStudentNo", student_no);
		return student;
	}

	@Override
	public List<AdvisorVO> selectAdvisorByStudnetNo(String student_no) throws SQLException {
		List<AdvisorVO> advisor = session.selectList("Student-Mapper.selectAdvisorByStudnetNo", student_no);
		return advisor;
	}

	@Override
	public List<StudentVO> selectStudentByDeptName(String dept_nm) throws SQLException {
		List<StudentVO> studentList = session.selectList("Student-Mapper.selectStudentByDeptName", dept_nm);
		return studentList;
	}

	// 학생목록(검색포함)
	@Override
	public List<StudentVO> selectStudentList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);

		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("cri", cri);

		List<StudentVO> studentList = session.selectList("Student-Mapper.selectStudentListBySearchMenu", cri, rowBounds);
		return studentList;
	}

	@Override
	public List<StudentVO> selectStudentDetail(String student_no) throws SQLException {

		List<StudentVO> studentDetail = session.selectList("Student-Mapper.selectStudentDetail", student_no);
		return studentDetail;
	}

	@Override
	public List<ProfessorVO> selectProfessorNm(String student_no) throws SQLException {
		List<ProfessorVO> proNm = session.selectList("Professor-Mapper.selectProfessorNm", student_no);
		return proNm;
	}

	// 리스트 검색결과 전체행count
	@Override
	public int selectStudentListBySearchMenuCount(SearchCriteria cri) throws SQLException {
		int cnt = session.selectOne("Student-Mapper.selectStudentListBySearchMenuCount", cri);
		return cnt;
	}



}
