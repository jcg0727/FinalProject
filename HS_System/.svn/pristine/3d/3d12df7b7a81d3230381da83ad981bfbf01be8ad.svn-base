package kr.ac.hs.dao.academic;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.dto.StudentInformationVO;

public class StudentInformationDAOImpl implements StudentInformationDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public String selectProfessorByStuInfo(String account_no) throws SQLException {
		String stuInfo = session.selectOne("selectProfessorByStuInfo", account_no);
		return stuInfo;
	}

	@Override
	public int selectStudent_noByStuInfo(String account_no) throws SQLException {
		int stuInfo = session.selectOne("selectStudent_noByStuInfo", account_no);
		return stuInfo;
	}

	@Override
	public String selectStatus_nmByStuInfo(String account_no) throws SQLException {
		String stuInfo = session.selectOne("selectStatus_nmByStuInfo", account_no);
		return stuInfo;
	}

	@Override
	public String selectDept_nmByStuInfo(String account_no) throws SQLException {
		String stuInfo = session.selectOne("selectDept_nmByStuInfo", account_no);
		return stuInfo;
	}

	@Override
	public String selectGenderByStuInfo(String account_no) throws SQLException {
		String stuInfo = session.selectOne("selectDept_nm2ByStuInfo", account_no);
		return stuInfo;
	}

	@Override
	public String selectFaculty_nmByStuInfo(String account_no) throws SQLException {
		String stuInfo = session.selectOne("selectGenderByStuInfo", account_no);
		return stuInfo;
	}

	@Override
	public String selectDept_nm2ByStuInfo(String account_no) throws SQLException {
		String stuInfo = session.selectOne("selectFaculty_nmByStuInfo", account_no);
		return stuInfo;
	}

	@Override
	public List<StudentInformationVO> selectPersonalInfoByStuInfo(String account_no) throws SQLException {
		List<StudentInformationVO> stuInfoList = session.selectList("selectPersonalInfoByStuInfo", account_no);
		return stuInfoList;
	}

	@Override
	public List<StudentInformationVO> selectBankInfoByStuInfo(String account_no) throws SQLException {
		List<StudentInformationVO> stuInfoList = session.selectList("selectBankInfoByStuInfo", account_no);
		return stuInfoList;
	}

	@Override
	public StudentInformationVO selectPictureByStuInfo(String account_no) throws SQLException {
		StudentInformationVO picture = session.selectOne("selectPictureByStuInfo", account_no);
		return picture;
	}

	@Override
	public void updateStuInfo(StudentInformationVO stuInfo) throws SQLException {
		session.update("updateStuInfo", stuInfo);

	}

	@Override
	public void updateBankInfo(StudentInformationVO stuInfo) throws SQLException {
		session.update("updateBankInfo", stuInfo);
	}

	// 학생계좌조회 by jej
	@Override
	public List<StudentInformationVO> selectStdAcunt(String account_no) throws SQLException {
		List<StudentInformationVO> acuntList = session.selectList("StudentInformation-Mapper.selectStdBasicAcuntDeptInfor", account_no);
		return acuntList;
	}

	@Override
	public int selectLectureSemester(String student_no) throws SQLException {
		int semester = session.selectOne("selectLectureSemester", student_no);
		return semester;
	}
	
	

	

}