package kr.ac.hs.command.academic;

import kr.ac.hs.command.SearchCriteria;

public class DepartmentChangeStaffListCommand extends SearchCriteria{
	private String dept_cd;
	
	public String getDept_cd() {
		return dept_cd;
	}
	public void setDept_cd(String dept_cd) {
		this.dept_cd = dept_cd;
	}
}
