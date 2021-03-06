package kr.ac.hs.security;

import java.sql.SQLException;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;

import kr.ac.hs.dao.StaffDAO;
import kr.ac.hs.dao.StudentDAO;
import kr.ac.hs.dao.common.ProfessorDAO;
import kr.ac.hs.dto.AccountVO;

public class CustomAuthenticationProvider implements AuthenticationProvider{
	
	private StudentDAO studentDAO;
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}
	
	private ProfessorDAO professorDAO;
	public void setProfessorDAO(ProfessorDAO professorDAO) {
		this.professorDAO = professorDAO;
	}
	
	private StaffDAO staffDAO;
	public void setStaffDAO(StaffDAO staffDAO) {
		this.staffDAO = staffDAO;
	}
	
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		String login_id = (String) auth.getPrincipal();
		String login_pwd = (String) auth.getCredentials();
//		String gubun = login_id.substring(0,1);
//		login_id = login_id.substring(1);
		//StudentVO student = null;
		int length = (int)login_id.length();
		AccountVO account = null;
		
		try {
			//student = studentDAO.selectStudentByNo(login_id);
//			switch(gubun) {
			switch(length) {
			case (int) 10 : 
				account = studentDAO.selectStudentByStudentNo(login_id); 
				break;  // 학생 
			case (int)11 : 
				account = staffDAO.selectStaffbyStaffNo(login_id);
				break; // 교직원
			case (int)8 : 
				account = professorDAO.selectProfessorbyProNo(login_id); 
				break; // 교수
			}
								
		} catch (SQLException e) {
			e.printStackTrace();
			throw new AuthenticationServiceException("Internal servce error!");
		}
	
		if(account != null) {
			if(login_pwd.equals(account.getPwd())) {
				account.setLength(length);
				account.setId(login_id);
				UserDetails authUser = new User(account);
				boolean invalidCheck = authUser.isAccountNonExpired() && authUser.isAccountNonLocked() && authUser.isCredentialsNonExpired() && authUser.isEnabled();

				if(invalidCheck) {
						UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(authUser.getUsername(), authUser.getPassword(), authUser.getAuthorities());
						result.setDetails(authUser); 
						return result;								
				}else {
					throw new BadCredentialsException("로그인이 거부되었습니다.");
				}
			}else {
				throw new BadCredentialsException("패스워드가 일치하지 않습니다.");
			}
		}else {
			throw new BadCredentialsException("존재하지않는아이디입니다.");
		}

	}

	@Override
	public boolean supports(Class<?> auth) {
		return auth.equals(UsernamePasswordAuthenticationToken.class);
	}

}
