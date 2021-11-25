package kr.ac.hs.dao.common;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.dto.ProfessorVO;

public interface ProfessorDAO {
	ProfessorVO selectProfessorbyProNo(String pro_no) throws SQLException;
	
	List<ProfessorVO> selectProfessor() throws SQLException;
}
