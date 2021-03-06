package kr.ac.hs.security;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import kr.ac.hs.dto.AccountVO;

public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	private String savePath="c:\\log";
	private String saveFileName = "login_user_log.csv";
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}
	
	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {
		
		User user = (User) authentication.getDetails();
		AccountVO loginUser = user.getAccountVO();
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", loginUser);
		// 세션 카운트다운 구현으로 인한 security 상의 타임아웃 해제
		// session.setMaxInactiveInterval(30*60); 
		
		//log 작성
		loginUserlogFile(loginUser, request);
		
		super.onAuthenticationSuccess(request, response, authentication);
	}
	
	
	
	private void loginUserlogFile(AccountVO loginUser, HttpServletRequest request) throws IOException{

		//로그인 정보를 스트링으로 저장.
		String tag = "[login;user]";
		String log = tag + loginUser.getId() + loginUser.getAccount_no();
	
		
		//로그 파일 생성
		File file = new File(savePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		String logFilePath = savePath + File.separator+saveFileName;
		
		BufferedWriter out = new BufferedWriter(new FileWriter(logFilePath, true));
		
		//로그를 기록
		try {
			out.write(log);
			out.newLine();		
		} finally {
			if(out!=null)out.close();
		}
	}
}
