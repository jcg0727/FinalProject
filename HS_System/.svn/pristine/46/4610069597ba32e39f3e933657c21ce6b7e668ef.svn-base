package kr.ac.hs.service;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.ac.hs.dto.AccountVO;

public interface AccountService {

	//보안레벨 수정
	void updateSecurityLevel(AccountVO account) throws SQLException;

	public AccountVO selectSecurityLevel(AccountVO account) throws SQLException;

	//이메일발송
	public void sendEmail(AccountVO account, String div) throws Exception;

	//비밀번호찾기
	public void findPw(HttpServletResponse response, AccountVO account) throws Exception;

	// 아이디 찾기
	public AccountVO getId(AccountVO account) throws SQLException;

	// 비번바꾸기
	public void updatePw(AccountVO account) throws SQLException;
}
