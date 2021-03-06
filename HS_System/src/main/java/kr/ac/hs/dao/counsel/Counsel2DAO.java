package kr.ac.hs.dao.counsel;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.common.Counsel2VO;

public interface Counsel2DAO {

	List<Counsel2VO> selectAllByStudent_no(String student_no, SearchCriteria cri)throws SQLException;
	int selectAllByStudent_noCount(String student_no, SearchCriteria cri)throws SQLException;
	
	String selectCounsel_no()throws SQLException;
	void insertCounsel(Counsel2VO counsel)throws SQLException;
	
	List<Counsel2VO> selectAllByPro_no(String pro_no, SearchCriteria cri)throws SQLException;
	int selectAllByPro_noCount(String pro_no, SearchCriteria cri)throws SQLException;
	
	void updateAccept(String counsel_no)throws SQLException;
	void updateDeny(String counsel_no)throws SQLException;
	void updateRefuse_content(String refuse_content, String counsel_no)throws SQLException;
	
	String selectAccount_noByStudent_no(String student_no)throws SQLException;
	
	List<Counsel2VO> selectDetailByCounsel_no(String counsel_no)throws SQLException;
	
	void updateCounselContent(Counsel2VO counsel2) throws SQLException;
}
