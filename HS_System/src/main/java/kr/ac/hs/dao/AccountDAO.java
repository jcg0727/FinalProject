package kr.ac.hs.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.javassist.bytecode.annotation.MemberValueVisitor;

import kr.ac.hs.dto.AccountVO;

public interface AccountDAO {

	//보안레벨 설정
	public void updateSecurityLevel(AccountVO account) throws SQLException;

	AccountVO selectSecurityLevel(AccountVO account) throws SQLException;

	// 아이디 찾기
	public AccountVO selectFindId(AccountVO account) throws SQLException;


	// 비밀번호 변경
	public void updatePw(AccountVO account) throws SQLException;
	
	// 비밀번호변경(이메일발송용)
	public int updatePw2(AccountVO account) throws SQLException;

	public int selectUser(AccountVO account);

}
