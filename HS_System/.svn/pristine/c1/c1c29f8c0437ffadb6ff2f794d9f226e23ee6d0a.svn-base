package kr.ac.hs.dao.common;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.dto.ProfessorVO;

public class ProfessorDAOImpl implements ProfessorDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session){
		this.session=session;
	}
	
	@Override
	public ProfessorVO selectProfessorbyProNo(String pro_no) throws SQLException {
		ProfessorVO professor = session.selectOne("Professor-Mapper.selectProfessorbyProNo", pro_no);
		return professor;
	}

	@Override
	public List<ProfessorVO> selectProfessor() throws SQLException {
		List<ProfessorVO> proList = session.selectList("Professor-Mapper.selectProfessor");
		return proList;
	}

}
