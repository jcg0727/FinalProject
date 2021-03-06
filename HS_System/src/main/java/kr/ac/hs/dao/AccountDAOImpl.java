package kr.ac.hs.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.dto.AccountVO;

public class AccountDAOImpl implements AccountDAO {

	private SqlSession session;

	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public void updateSecurityLevel(AccountVO account) throws SQLException {
		session.update("Account-Mapper.updateSecurityLevel", account);

	}

	@Override
	public AccountVO selectSecurityLevel(AccountVO account) throws SQLException {

		return session.selectOne("Account-Mapper.selectSecurityLevel", account);
	}

	// 비밀번호변경
	@Override
	public void updatePw(AccountVO account) throws SQLException {
		session.update("Account-Mapper.updatePw", account);
	}

	// 아이디찾기 - 학생/교직원/교수별
	@Override
	public AccountVO selectFindId(AccountVO account) throws SQLException {
		return session.selectOne("Account-Mapper.selectId", account);
	}

	// 비밀번호변경(메일발송용)
	@Override
	public int updatePw2(AccountVO account) throws SQLException {
		return session.update("Account-Mapper.updatePw2", account);
	}

	@Override
	public int selectUser(AccountVO account) {
		return session.selectOne("Account-Mapper.selectUserCnt", account);
	}

}
