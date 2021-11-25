package kr.ac.hs.command;

public class SearchCriteria extends Criteria{
	
	private String searchType="";
	private String searchType2="";
	private String searchType3="";
	private String keyword="";
	
	
	
	public String getSearchType3() {
		return searchType3;
	}
	public void setSearchType3(String searchType3) {
		this.searchType3 = searchType3;
	}
	public String getSearchType2() {
		return searchType2;
	}
	public void setSearchType2(String searchType2) {
		this.searchType2 = searchType2;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}
