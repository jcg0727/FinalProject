package kr.ac.hs.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dao.AcademicFreshmenDAO;
import kr.ac.hs.dao.StudentDAO;
import kr.ac.hs.dto.AcademicFreshmenVO;
import kr.ac.hs.dto.ProfessorVO;
import kr.ac.hs.dto.academic.StudentVO;
import kr.ac.hs.dto.common.AdvisorVO;

public class StudentServiceImpl implements StudentService {

	private StudentDAO studentDAO;
	private AcademicFreshmenDAO academicFreshmenDAO;

	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}

	public void setAcademicFreshmenDAO(AcademicFreshmenDAO academicFreshmenDAO) {
		this.academicFreshmenDAO = academicFreshmenDAO;
	}

	@Override
	public List<StudentVO> getStudentListByDeptNm(String dept_nm) throws SQLException {
		List<StudentVO> studentList = studentDAO.selectStudentByDeptName(dept_nm);
		return studentList;
	}

	@Override
	public Map<String, Object> getStudentList(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<StudentVO> studentList = studentDAO.selectStudentList(cri);

		int totalCnt = studentDAO.selectStudentListBySearchMenuCount(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCnt);

		dataMap.put("studentList", studentList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public List<AdvisorVO> getAdvisor(String student_no) throws SQLException {
		List<AdvisorVO> adviosrList = studentDAO.selectAdvisorByStudnetNo(student_no);

		return adviosrList;
	}

	@Override
	public StudentVO getStudent(String student_no) throws SQLException {
		StudentVO student = studentDAO.selectStudentByStudentNo(student_no);
		return student;
	}

	@Override
	public List<StudentVO> getStudentDetail(String student_no) throws SQLException {
		List<StudentVO> studentDetail = studentDAO.selectStudentDetail(student_no);
		return studentDetail;
	}

	@Override
	public List<ProfessorVO> getProfessorNm(String student_no) throws SQLException {
		List<ProfessorVO> proNm = studentDAO.selectProfessorNm(student_no);
		return proNm;
	}

	@Override
	public Map<String, Object> selectProfessorListByDept_nm(String dept_nm, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(academicFreshmenDAO.selectCountProfessorListByDept_nm(dept_nm, cri));

		List<AcademicFreshmenVO> proList = academicFreshmenDAO.SelectProfessorListByDept_nm(dept_nm, cri);

		dataMap.put("proList", proList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void updateAdvisor(String pro_no, String student_no) throws SQLException {
		academicFreshmenDAO.updateAdvisor(pro_no, student_no);
	}

}
