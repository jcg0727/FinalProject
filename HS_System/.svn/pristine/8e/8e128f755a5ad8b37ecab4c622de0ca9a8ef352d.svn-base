package kr.ac.hs.service;

import java.sql.SQLException;
import java.util.Map;

import kr.ac.hs.dao.StaffDAO;
import kr.ac.hs.dto.common.StaffVO;
import kr.ac.hs.service.common.StaffService;

public class StaffServiceImpl implements StaffService{
	
	private StaffDAO staffDAO;
	
	public void setStaffDAO(StaffDAO staffDAO) {
		this.staffDAO = staffDAO;
	}

	@Override
	public StaffVO getStaff(String staff_no) throws SQLException {
		StaffVO staff = staffDAO.selectStaffbyStaffNo(staff_no);
		return staff;
	}
	
}
