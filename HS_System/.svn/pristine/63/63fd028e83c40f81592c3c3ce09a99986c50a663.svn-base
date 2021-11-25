package kr.ac.hs.service.common;

import java.sql.SQLException;

import kr.ac.hs.dao.common.ProfessorDAO;
import kr.ac.hs.dto.ProfessorVO;

public class ProfessorServiceImpl implements ProfessorService {

	private ProfessorDAO professorDAO;

	public void setProfessorDAO(ProfessorDAO professorDAO) {
		this.professorDAO = professorDAO;
	}

	@Override
	public ProfessorVO getProfessor(String pro_no) throws SQLException {
		ProfessorVO professor = professorDAO.selectProfessorbyProNo(pro_no);
		return professor;
	}

}
