package kr.ac.hs.dao.sugang;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.sugang.ExSugangListVO;

public interface ExSugangListDAO {
	List<ExSugangListVO> SugangInfoBystudent_no(String student_no, String lecture_semester)throws SQLException;
	
	List<ExSugangListVO> SelectTookClassesByStudent_no(String student_no)throws SQLException;
	List<ExSugangListVO> SelectTookClassesByStudent_no(String student_no, Criteria cri)throws SQLException;
	List<ExSugangListVO> SelectTookClassesByStudent_no(String student_no, SearchCriteria cri)throws SQLException;
	
	List<ExSugangListVO> SelectClassesOpenThisSemester(String student_no, String lecture_semester)throws SQLException;
	
	List<ExSugangListVO> selectListYear(String student_no)throws SQLException;
	
	int selectCountTookClassesByStudent_no(String student_no, SearchCriteria cri)throws SQLException;
}
