package kr.ac.hs.service.academic;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.academic.PluralMajorVO;
import kr.ac.hs.dto.common.CounselVO;

public interface PluralMajorService {
	//public String regist(PluralMajorVO pluralMajor, CounselVO counsel) throws SQLException;
	public String regist(PluralMajorVO pluralMajor) throws SQLException;
	
	public List<PluralMajorVO> getListByStudentNO(String student_no) throws SQLException;

	void remove(String student_no) throws SQLException;
	
	public List<PluralMajorVO> selectStudentInfoByPlural(String student_no) throws SQLException;
	
	public Map<String, Object> selectTotal(String student_no) throws SQLException;

	Map<String,Object> selectPluralByStaffDeptnm(Map<String,Object> dataMap) throws SQLException;
	
	Map<String,Object> selectStudentByApplyStaffDeptnm(Map<String,Object> dataMap) throws SQLException;
	
	public PluralMajorVO selectStudentDetailByStudentNo(String student_no) throws SQLException;
}
