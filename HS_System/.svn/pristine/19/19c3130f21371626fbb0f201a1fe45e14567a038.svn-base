package kr.ac.hs.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.AcademicAttachVO;
import kr.ac.hs.dto.AcademicStateVO;
import kr.ac.hs.dto.academic.AcademicStateStaffVO;

public class AcademicStateDAOImpl implements AcademicStateDAO {

	private SqlSession session;
	private String namespace = "AcademicState-Mapper.";

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void insertAcademicAttach(AcademicAttachVO attach) throws SQLException {
		session.update("AcademicState-Mapper.insertAcademicAttach", attach);

	}

	@Override
	public void insertLeaveAcademicState(AcademicStateVO academicState) throws SQLException {
		session.update("AcademicState-Mapper.insertLeaveAcademicState", academicState);
	}

	@Override
	public List<AcademicStateVO> selectLeaveAcademicStateByStudentNO(String student_no) throws SQLException {
		List<AcademicStateVO> leaveList = session.selectList("AcademicState-Mapper.selectLeaveAcademicStateByStudentNO", student_no);
		return leaveList;
	}

	@Override
	public void deleteLeaveAcademicState(AcademicStateVO academicState) throws SQLException {
		session.update("AcademicState-Mapper.deleteLeaveAcademicState", academicState);
	}

	//-----------------------------------------------------------------------------------------------------------------

	@Override
	public void insertReturnAcademicState(AcademicStateStaffVO academicState) throws SQLException {
		session.update(namespace + "insertReturnAcademicState", academicState);
	}

	@Override
	public List<AcademicStateVO> selectReturnAcademicState(String student_no) throws SQLException {
		List<AcademicStateVO> acdmReList = session.selectList(namespace + "selectReturnAcademicState", student_no);
		return acdmReList;
	}

	@Override
	public void deleteReturnAcademicState(AcademicStateVO academicState) throws SQLException {
		session.update(namespace + "deleteReturnAcademicState", academicState);
	}

	//-----------------------------------------------------------------------------------------------------------------
	////////////// 자퇴 /////////////////////
	@Override
	public List<AcademicStateVO> selectAcademicDropByStudentNO(String student_no) throws SQLException {
		List<AcademicStateVO> dropList = session.selectList(namespace + "selectAcademicDropByStudentNO", student_no);
		return dropList;
	}

	//자퇴신청
	@Override
	public void insertAcademicDrop(AcademicStateVO academicState) throws SQLException {
		session.update(namespace + "insertAcademicDrop", academicState);
	}

	// 자퇴신청 취소
	@Override
	public void deleteAcademicDrop(String student_no) throws SQLException {
		session.update(namespace + "deleteAcademicDrop", student_no);
	}
	
}

	