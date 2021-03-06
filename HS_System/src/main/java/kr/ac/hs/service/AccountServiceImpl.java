package kr.ac.hs.service;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;

import kr.ac.hs.dao.AccountDAO;
import kr.ac.hs.dto.AccountVO;

public class AccountServiceImpl implements AccountService {

	private AccountDAO accountDAO;

	public void setAccountDAO(AccountDAO accountDAO) {
		this.accountDAO = accountDAO;
	}

	@Override
	public void updateSecurityLevel(AccountVO account) throws SQLException {
		accountDAO.updateSecurityLevel(account);

	}

	@Override
	public AccountVO selectSecurityLevel(AccountVO account) throws SQLException {

		return accountDAO.selectSecurityLevel(account);
	}

	@Override
	public void sendEmail(AccountVO account, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "hsmaster700@gmail.com";
		String hostSMTPpwd = "gkrtkaktmxj!";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "hsmaster700@gmail.com";
		String fromName = "HSsystem";
		String subject = "";
		String msg = "";

		if (div.equals("findPw")) {
			subject = "H.S SYSTEM 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += "임시 비밀번호입니다</h3>";
			msg += "<p>임시 비밀번호가 발급되었습니다. </p>";
			msg += "<p>로그인 후 보안을 위해 수정하여 사용하세요 </p>";
			msg += "<p><strong>" + account.getPwd() + "</strong></p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = account.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	// 비번찾기
	@Override
	public void findPw(HttpServletResponse response, AccountVO account) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int rtnCnt = accountDAO.selectUser(account);
		// 아이디나 이메일이 일치하지 않는 경우
		if (rtnCnt <= 0) {
			out.print("아이디나 이메일이 올바르지 않습니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 10; i++) {
				pw += UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다.
				pw = pw.substring(0, 10); // uuid를 앞에서부터 10자리 잘라줌.
			}
			account.setPwd(pw);
			// 비밀번호 변경
			accountDAO.updatePw2(account);
			// 비밀번호 변경 메일 발송
			sendEmail(account, "findPw");
			out.print("메일로 임시 비밀번호를 발송하였습니다");
			out.close();
		}

	}

	// 아이디찾기
	@Override
	public AccountVO getId(AccountVO account) throws SQLException {
		return accountDAO.selectFindId(account);
	}

	@Override
	public void updatePw(AccountVO account) throws SQLException {
		accountDAO.updatePw(account);

	}

}
