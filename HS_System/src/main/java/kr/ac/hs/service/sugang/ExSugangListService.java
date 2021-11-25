package kr.ac.hs.service.sugang;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.sugang.ExSugangListVO;

public interface ExSugangListService {

	public List<ExSugangListVO> sugangInfoBystudent_no(String student_no, String lecture_semester)throws SQLException;
	
	public List<ExSugangListVO> selectTookClassesByStudent_no(String student_no)throws SQLException;
	public List<ExSugangListVO> selectTookClassesByStudent_no(String student_no, Criteria cri)throws SQLException;
	Map<String, Object> selectTookClassesByStudent_no(String student_no, SearchCriteria cri)throws SQLException;
	
	
	public List<ExSugangListVO> selectClassesOpenThisSemester(String student_no, String lecture_semester)throws SQLException;
}
