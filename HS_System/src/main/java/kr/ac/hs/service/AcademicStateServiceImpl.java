package kr.ac.hs.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dao.AcademicStateDAO;
import kr.ac.hs.dto.AcademicAttachVO;
import kr.ac.hs.dto.AcademicStateVO;
import kr.ac.hs.dto.academic.AcademicStateStaffVO;

public class AcademicStateServiceImpl implements AcademicStateService {

	private AcademicStateDAO academicStateDAO;

	public void setAcademicStateDAO(AcademicStateDAO academicStateDAO) {
		this.academicStateDAO = academicStateDAO;
	}

	@Override
	public String registLeaveAcademicState(AcademicStateVO academicState, String[] files) throws SQLException {
		List<AcademicStateVO> academicList = academicStateDAO.selectLeaveAcademicStateByStudentNO(academicState.getStudent_no());

		for (AcademicStateVO academicVO : academicList) {
			String status = academicVO.getR_status_cd();
			if (status != null) {
				return "NO";
			}
		}

		academicStateDAO.insertLeaveAcademicState(academicState);

		for (String file : files) {
			AcademicAttachVO attach = new AcademicAttachVO();
			attach.setAttach_no(file);
			attach.setDelete_whether("N");
			attach.setRegister_date(academicState.getRegister_date());
			attach.setStudent_no(academicState.getStudent_no());

			academicStateDAO.insertAcademicAttach(attach);
		}

		return "OK";
	}

	@Override
	public List<AcademicStateVO> getListByStudentNO(String student_no) throws SQLException {
		List<AcademicStateVO> leaveList = academicStateDAO.selectLeaveAcademicStateByStudentNO(student_no);
		return leaveList;
	}

	@Override
	public void remove(AcademicStateVO academicState) throws SQLException {
		academicStateDAO.deleteLeaveAcademicState(academicState);
	}
	//----------------------------------------------------------------------------------------------------------------------

	@Override
	public void registReturnAcademicState(AcademicStateStaffVO academicState) throws SQLException {
		academicStateDAO.insertReturnAcademicState(academicState);
	}

	@Override
	public List<AcademicStateVO> getListReturnAcademicStateStudentNo(String student_no) throws SQLException {
		List<AcademicStateVO> acdmReList = academicStateDAO.selectReturnAcademicState(student_no);
		return acdmReList;
	}

	@Override
	public void removeReturnAcademicState(AcademicStateVO academicState) throws SQLException {
		academicStateDAO.deleteReturnAcademicState(academicState);
	}

	//----------------------------------------------------------------------------------------------------------------------
	//////// 자퇴 - made by jej ///////////////

	@Override
	public List<AcademicStateVO> getListAcademicDropByStudentNO(String student_no) throws SQLException {
		List<AcademicStateVO> dropList = academicStateDAO.selectAcademicDropByStudentNO(student_no);
		return dropList;
	}

	// 신청완료 상태가 1개 있으면 더이상 자퇴신청 안되게
	@Override
	public String registAcademicDrop(AcademicStateVO academicState) throws SQLException {

		List<AcademicStateVO> academicList = academicStateDAO.selectAcademicDropByStudentNO(academicState.getStudent_no());

		for (AcademicStateVO academicVO : academicList) {
			String status = academicVO.getR_status_cd();
			if (status.equals("CCDF001")) {
				return "NO";
			}
		}

		academicStateDAO.insertAcademicDrop(academicState);
		return "OK";

	}

	@Override
	public void removeAcademicDrop(String student_no) throws SQLException {
		academicStateDAO.deleteAcademicDrop(student_no);
	}
	

}
