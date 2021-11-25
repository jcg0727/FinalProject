package kr.ac.hs.dao.academic;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.academic.DepartmentChangeVO;
import kr.ac.hs.dto.academic.DepartmentchangeAttachVO;
import kr.ac.hs.dto.common.CounselVO;

public interface DepartmentChageDAO {
	public void insertDepartmentChange(DepartmentChangeVO dept) throws SQLException;
	
	//학번 기준 리스트 검색
	public List<DepartmentChangeVO> selectDepartmentChangeByStundentNO(String student_no) throws SQLException;
	
	//소속학과 기준 검색
	public List<DepartmentChangeVO> selectDepartmentChangeByBelongDepartmentNO(Map<String, Object> dataMap) throws SQLException;
	
	//지원학과 기준 검색
	public List<DepartmentChangeVO> selectDepartmentChangeByApplyDepartmentNO(Map<String, Object>dataMap) throws SQLException;
	
	public void updateDpartmentChange(DepartmentChangeVO dept) throws SQLException;

	public void deleteDepartmentChange(DepartmentChangeVO dept) throws SQLException;

	public void insertDepartmentChangeAttach(DepartmentchangeAttachVO attach) throws SQLException;

	int selectCountDepartmentChange(Map<String,Object> dataMap) throws SQLException;

	public DepartmentChangeVO seletDetailByStudentNoAndRgisterDate(Map<String, Object>dataMap);

	public void updateDpartmentChangeByStaffForTransfer(DepartmentChangeVO dept);
}