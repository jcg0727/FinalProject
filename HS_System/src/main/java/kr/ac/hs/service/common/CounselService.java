package kr.ac.hs.service.common;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.dto.common.CounselVO;
import kr.ac.hs.dto.counsel.CounselLectureVO;

public interface CounselService {
	public String regist(CounselVO counsel) throws SQLException;

	List<CounselVO> getCouselListByProfNo(String pro_no) throws SQLException;

	public List<CounselLectureVO> getLectureListProNo(CounselLectureVO counsel) throws SQLException;
}
