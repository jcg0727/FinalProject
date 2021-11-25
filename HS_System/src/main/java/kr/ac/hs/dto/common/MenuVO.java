package kr.ac.hs.dto.common;

import java.util.List;

public class MenuVO {

	private String mcode;
	private String mname; 
	private String upcode; 
	private String micon; 
	private String url; 
	private String mlevel;
	private String authority_cd;
	private List<MenuVO> subMenuList;
	
	public String getAuthority_cd() {
		return authority_cd;
	}
	public void setAuthority_cd(String authority_cd) {
		this.authority_cd = authority_cd;
	}
	public String getMcode() {
		return mcode;
	}
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getUpcode() {
		return upcode;
	}
	public void setUpcode(String upcode) {
		this.upcode = upcode;
	}
	public String getMicon() {
		return micon;
	}
	public void setMicon(String micon) {
		this.micon = micon;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public List<MenuVO> getSubMenuList() {
		return subMenuList;
	}
	public void setSubMenuList(List<MenuVO> subMenuList) {
		this.subMenuList = subMenuList;
	}
	public String getMlevel() {
		return mlevel;
	}
	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}
	
	
	

}
