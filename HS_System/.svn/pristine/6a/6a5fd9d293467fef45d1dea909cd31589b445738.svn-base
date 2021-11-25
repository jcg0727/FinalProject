package kr.ac.hs.service.academic;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.academic.DepartmentChangeVO;
import kr.ac.hs.dto.common.CounselVO;

public interface DepartmentChangeService {
	public String regist(DepartmentChangeVO dept, CounselVO counsel, String[] files) throws SQLException;
	
//	public List<DepartmentChangeVO> getListByStudentNO(String student_no, SearchCriteria cri) throws SQLException;
	
	public List<DepartmentChangeVO> getListByStudentNO(String student_no) throws SQLException;

	public Map<String, Object> getTransferListByDeptNO(Map<String,Object>dataMap) throws SQLException;
	
	public void modify(DepartmentChangeVO dept) throws SQLException;

	public void remove(DepartmentChangeVO dept) throws SQLException;

	public Map<String, Object> getDetail(String student_no, String register_date) throws SQLException;

	public void modifyCounselByDeptChangeSetCounsel(DepartmentChangeVO dept);

}
