package kr.ac.hs.service.common;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.dto.common.MenuVO;

public interface MenuService{
	List<MenuVO> getMainMenuList(String authority_cd)throws SQLException;
	
	List<MenuVO> getSubMenuList(String mCode, String authority_cd)throws SQLException;
	
	MenuVO getMenuByMcode(String mCode, String authority_cd)throws SQLException;
	
	MenuVO getMenuByMname(String mName)throws SQLException;

	
}
