package kr.ac.hs.dao.common;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.dto.common.CounselSelectVO;
import kr.ac.hs.dto.common.CounselVO;
import kr.ac.hs.dto.counsel.CounselLectureVO;

public class CounselDAOImpl implements CounselDAO{

	private SqlSession session;
	private String namespace = "Counsel-Mapper.";
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.session = sqlSession;
	}

	@Override
	public void insertCounsel(CounselVO counsel) throws SQLException {
		session.update(namespace+"insertCounsel", counsel);
	}

	@Override
	public String selectCounselSequence() throws SQLException {
		String seq = session.selectOne(namespace+"selectCounselSequence");
		return seq;
	}

	@Override
	public CounselSelectVO selectCounselByCounselNo(String counsel_no) {
		CounselSelectVO cousel = session.selectOne(namespace+"selectCounselByCounselNo", counsel_no);
		return cousel;
	}

	@Override
	public List<CounselVO> selectCounselListByProfessorNo(String pro_no) throws SQLException {
		List<CounselVO> list = session.selectList(namespace+"selectCounselListByProffesorNo", pro_no);
		return list;
	}
	
	@Override
	public void deleteCounselByCounselNo(String counsel_no) throws SQLException	{
		session.update(namespace+"deleteCounselByCounselNo", counsel_no);
	}

	@Override
	public List<CounselLectureVO> selectLectureListProNo(CounselLectureVO counsel) throws SQLException {
		List<CounselLectureVO> lectureList = session.selectList(namespace+"selectProfessorClassTimeTable", counsel);
		return lectureList;
	}
}
