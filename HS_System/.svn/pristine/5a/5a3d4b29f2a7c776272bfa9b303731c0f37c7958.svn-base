package kr.ac.hs.service.academic;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.dao.academic.StudentInformationDAO;
import kr.ac.hs.dto.StudentInformationVO;

public class StudentInformationServiceImpl implements StudentInformationService {
	private StudentInformationDAO studentInformationDAO;

	public void setStudentInformationDAO(StudentInformationDAO studentInformationDAO) {
		this.studentInformationDAO = studentInformationDAO;
	}

	@Override
	public Map<String, Object> getInfoByAccountNO(String account_no) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		String professor = studentInformationDAO.selectProfessorByStuInfo(account_no);
		int studentNumber = studentInformationDAO.selectStudent_noByStuInfo(account_no);
		String dept = studentInformationDAO.selectDept_nmByStuInfo(account_no);
		String dept2 = studentInformationDAO.selectDept_nm2ByStuInfo(account_no);
		String gender = studentInformationDAO.selectGenderByStuInfo(account_no);
		String faculty = studentInformationDAO.selectFaculty_nmByStuInfo(account_no);
		String status = studentInformationDAO.selectStatus_nmByStuInfo(account_no);
		List<StudentInformationVO> stuInfo = studentInformationDAO.selectPersonalInfoByStuInfo(account_no);
		List<StudentInformationVO> bankInfo = studentInformationDAO.selectBankInfoByStuInfo(account_no);
		

		dataMap.put("professor", professor);
		dataMap.put("studentNumber", studentNumber);
		dataMap.put("dept", dept);
		dataMap.put("dept2", dept2);
		dataMap.put("gender", gender);
		dataMap.put("faculty", faculty);
		dataMap.put("status", status);
		dataMap.put("stuInfo", stuInfo);
		dataMap.put("bankInfo", bankInfo);

		return dataMap;
	}

	@Override
	public StudentInformationVO getPictureByAccountNO(String account_no) throws SQLException {

		StudentInformationVO pic = studentInformationDAO.selectPictureByStuInfo(account_no);
		return pic;
	}

	@Override
	public void modify(StudentInformationVO stuInfo) throws SQLException {

		studentInformationDAO.updateBankInfo(stuInfo);
		studentInformationDAO.updateStuInfo(stuInfo);

	}

	// 학생계좌정보 조회
	@Override
	public List<StudentInformationVO> getStdAcunt(String account_no) throws SQLException {
		List<StudentInformationVO> acuntList = studentInformationDAO.selectStdAcunt(account_no);
		return acuntList;
	}

	@Override
	public int selectLectureSemester(String student_no) throws SQLException {
		int semester = studentInformationDAO.selectLectureSemester(student_no);
		return semester;
	}

}