package kr.ac.hs.dao.graduation;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.graduation.GraduationVO;

public interface GraduationDAO {
	//학생 졸업페이지
	int selectJPbyStudent_no(String student_no)throws SQLException;
	int selectJSbyStudent_no(String student_no)throws SQLException;
	int selectGPbyStudent_no(String student_no)throws SQLException;
	int selectGSbyStudent_no(String student_no)throws SQLException;
	
	void insertGrad_thesis(String student_no, String attach_no)throws SQLException;
	
	List<GraduationVO> selectFilenameStatusByStudent_no(String student_no)throws SQLException;
	
	void removeFromGrad_thesis(String student_no)throws SQLException;
	void removeFromGraduated(String student_no)throws SQLException;
	void removeFromAttachment(String attach_no)throws SQLException;
	
	void insertGraduated(String student_no)throws SQLException;
	
	
	//지도교수 논문확인 페이지
	List<GraduationVO> selectThesisByPro_no(String pro_no)throws SQLException;
	List<GraduationVO> selectThesisByPro_no(String pro_no, Criteria cri)throws SQLException;
	List<GraduationVO> selectThesisByPro_no(String pro_no, SearchCriteria cri)throws SQLException;
	
	int selectThesisByPro_noSearchCount(String pro_no, SearchCriteria cri)throws SQLException;
	
	//지도교수 논문승인시
	void updateStatus_cdOnGrad_thesis(String student_no)throws SQLException;
	void updateStatus_cdOnGraduated(String student_no, String graduate_date)throws SQLException;
	
	String selectAccount_no(String student_no)throws SQLException;
	
	GraduationVO selectGraduatedByStudent_no(String student_no)throws SQLException;
	
	void updatePostpone(String graduate_date, String student_no)throws SQLException; 
}
