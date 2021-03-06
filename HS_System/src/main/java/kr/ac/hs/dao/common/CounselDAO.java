package kr.ac.hs.dao.common;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.dto.common.CounselSelectVO;
import kr.ac.hs.dto.common.CounselVO;
import kr.ac.hs.dto.counsel.CounselLectureVO;

public interface CounselDAO {
	public void insertCounsel(CounselVO counsel) throws SQLException;
	
	public String selectCounselSequence() throws SQLException;

	public CounselSelectVO selectCounselByCounselNo(String counsel_no);
	
	public List<CounselVO> selectCounselListByProfessorNo(String pro_no) throws SQLException;

	void deleteCounselByCounselNo(String counsel_no) throws SQLException;

	public List<CounselLectureVO> selectLectureListProNo(CounselLectureVO counsel) throws SQLException;
}
