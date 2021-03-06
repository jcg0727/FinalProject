package kr.ac.hs.service.graduation;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.Criteria;
import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.graduation.GraduationVO;

public interface GraduationService {
	//학생페이지
	public Map<String,Object> selectGraduationPointsbyStudent_no(String student_no)throws SQLException;
	
	public void insertGrad_thesis(String student_no, String attach_no)throws SQLException;
	
	public List<GraduationVO> selectFilenameStatusByStudent_no(String student_no)throws SQLException;
	
	public void removeFromGrad_thesis(String student_no)throws SQLException;
	public void removeFromGraduated(String student_no)throws SQLException;
	
	public void insertGraduated(String student_no)throws SQLException;
	
	//교수페이지
	
	public List<GraduationVO> selectThesisByPro_no(String pro_no)throws SQLException;
	public List<GraduationVO> selectThesisByPro_no(String pro_no, Criteria cri)throws SQLException;
	Map<String, Object> selectThesisByPro_no(String pro_no, SearchCriteria cri)throws SQLException;
	
	void updateWhenProfConfirm(String student_no)throws SQLException;
	
	void removeFromAttachment(String attach_no)throws SQLException;
	
	public String selectAccount_no(String student_no)throws SQLException;
	
	public GraduationVO selectGraduatedByStudent_no(String student_no)throws SQLException;
	
	void updatePostpone(String student_no, String graduate_date)throws SQLException;
	
}
