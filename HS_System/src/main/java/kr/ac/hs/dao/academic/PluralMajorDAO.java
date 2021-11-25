package kr.ac.hs.dao.academic;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.academic.PluralMajorVO;

public interface PluralMajorDAO {
	
	public List<PluralMajorVO> selectPluralMajorByStudentNO(String student_no)throws SQLException;

	public void insertPluralMajor(PluralMajorVO pluralMajor) throws SQLException;

	int selectPluralSeqNext() throws SQLException;
	
	void deletePlural(String student_no) throws SQLException;
	
	List<PluralMajorVO> selectStudentInfoByPlural(String student_no) throws SQLException; 
	
	//staff의 학과를 기준으로 복수전공 지원 리스트
	List<PluralMajorVO> selectPluralByStaffDeptnm(Map<String, Object> dataMap) throws SQLException;

	//staff의 학과를 기준으로 복수전공 접수 리스트
	List<PluralMajorVO> selectStudentByApplyStaffDeptnm(Map<String, Object> dataMap) throws SQLException;

	int selectCountPluralMajor(Map<String, Object> dataMap) throws SQLException;

	public PluralMajorVO selectStudentDetailByStudentNo(String student_no) throws SQLException;
}

