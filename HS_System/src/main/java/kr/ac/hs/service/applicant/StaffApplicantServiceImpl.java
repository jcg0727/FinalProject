package kr.ac.hs.service.applicant;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.PageMaker;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dao.applicant.StaffApplicantDAO;
import kr.ac.hs.dto.applicant.StaffApplicantVO;

public class StaffApplicantServiceImpl implements StaffApplicantService {
	
	private StaffApplicantDAO staffApplicantDAO;
	

	public StaffApplicantDAO getStaffApplicantDAO() {
		return staffApplicantDAO;
	}

	public void setStaffApplicantDAO(StaffApplicantDAO staffApplicantDAO) {
		this.staffApplicantDAO = staffApplicantDAO;
	}

	@Override
	public Map<String, Object> getApplicantDeptStaff(Map<String, Object> dataMap) throws SQLException {
		
		List<StaffApplicantVO> applicantDeptList = staffApplicantDAO.selectApplicantDeptStaff(dataMap);
		int totalCount = staffApplicantDAO.selectApplicantDeptListCount(dataMap);
		
		PageMaker pageMaker = new PageMaker();
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("applicantDeptList", applicantDeptList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getListSelectApplicant(Map<String, Object> dataMap) throws SQLException {
		
		List<StaffApplicantVO> applicantList = staffApplicantDAO.selectApplicant(dataMap);
		int totalCount = staffApplicantDAO.selectApplicantListCount(dataMap);
		
		PageMaker pageMaker = new PageMaker();
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		dataMap.put("applicantList", applicantList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public StaffApplicantVO getDetail(String applicant_no) throws SQLException {
		
		StaffApplicantVO applicantVO = staffApplicantDAO.selectApplicantDetail(applicant_no);
		
		return applicantVO;
	}

	@Override
	public void modifyApplicantPassOrFail(StaffApplicantVO staffApplicantVO) throws SQLException {
		staffApplicantDAO.updatetApplicantPassOrFail(staffApplicantVO);
	}
	
	@Override
	public void modifyApplicantPassDelete(String applicant_no) throws SQLException {
		staffApplicantDAO.updateApplicantPassDelete(applicant_no);
		
	}

/*	@Override
	public String getAccountNo_SEQ(String account_no) throws SQLException {
		return null;
	}

	@Override
	public void registApplicantToAccount(StaffApplicantVO staffApplicantVO) throws SQLException {
	}
*/

	@Override
	public void registApplicantToStudent(String applicant_no) throws SQLException {
		//staffApplicantDAO.selectAccountNo_SEQ();
		try {
			staffApplicantDAO.insertApplicantToAccount(applicant_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			
			staffApplicantDAO.insertApplicantToStudent(applicant_no);
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}


}
