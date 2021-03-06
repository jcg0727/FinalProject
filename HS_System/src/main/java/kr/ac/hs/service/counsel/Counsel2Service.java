package kr.ac.hs.service.counsel;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.command.SearchCriteria;
import kr.ac.hs.dto.common.Counsel2VO;

public interface Counsel2Service {

	Map<String, Object> selectAllByStudent_no(String student_no, SearchCriteria cri)throws SQLException;	
	public void insertCounsel(Counsel2VO counsel)throws SQLException;

	Map<String, Object> selectAllByPro_no(String pro_no, SearchCriteria cri)throws SQLException;
	
	public void updateAccept(String counsel_no)throws SQLException;
	public void updateDeny(String counsel_no)throws SQLException;
	public void updateRefuse_content(String refuse_content, String counsel_no)throws SQLException;
	
	public String selectAccount_noByStudent_no(String student_no)throws SQLException;
	
	public List<Counsel2VO> detailList(String counsel_no)throws SQLException;
	public void updateCounselContent(Counsel2VO counsel2)throws SQLException;
}
