package kr.ac.hs.service.common;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.dao.common.CounselDAO;
import kr.ac.hs.dto.common.CounselVO;
import kr.ac.hs.dto.counsel.CounselLectureVO;

public class CounselServiceImpl implements CounselService{
	
	private CounselDAO dao;
	
	public void setCounselDAO(CounselDAO counselDAO) {
		this.dao = counselDAO;
	}

	@Override
	public String regist(CounselVO counsel) throws SQLException {
		String seq = dao.selectCounselSequence();
		counsel.setCounsel_no(seq);
		dao.insertCounsel(counsel);
	
		return seq;
	}

	@Override
	public List<CounselVO> getCouselListByProfNo(String pro_no) throws SQLException{
		
		List<CounselVO> couselLisst = dao.selectCounselListByProfessorNo(pro_no);
		return couselLisst;
	}

	@Override
	public List<CounselLectureVO> getLectureListProNo(CounselLectureVO counsel) throws SQLException {
		List<CounselLectureVO> lectureList = dao.selectLectureListProNo(counsel);
		return lectureList;
	}
	
}
