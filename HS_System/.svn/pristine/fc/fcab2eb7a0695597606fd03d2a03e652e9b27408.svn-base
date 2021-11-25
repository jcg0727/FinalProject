package kr.ac.hs.service.common;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.ac.hs.dao.common.MenuDAO;
import kr.ac.hs.dto.common.MenuVO;

public class MenuServiceImpl implements MenuService{
	
	private MenuDAO menuDAO;
	
	public void setMenuDAO(MenuDAO menuDAO) {
		this.menuDAO = menuDAO;
	}

	@Override
	public List<MenuVO> getMainMenuList(String authority_cd) throws SQLException {
		List<MenuVO> menuList = menuDAO.selectMainMenu(authority_cd);
		return menuList;
	}

	@Override
	public List<MenuVO> getSubMenuList(String mCode, String authority_cd) throws SQLException {
		MenuVO menu = new MenuVO();
		menu.setUpcode(mCode);
		menu.setAuthority_cd(authority_cd);
		List<MenuVO> subMenuList = menuDAO.selectSubMenu(menu);
		return subMenuList;
	}

	@Override
	public MenuVO getMenuByMcode(String mCode, String authority_cd) throws SQLException {
		Map<String,String> dataMap = new HashMap<String, String>();
		dataMap.put("mcode", mCode);
		dataMap.put("authority_cd", authority_cd);
		MenuVO menu = menuDAO.selectMenuByMcode(dataMap);
		return menu;
	}

	@Override
	public MenuVO getMenuByMname(String mName) throws SQLException {
		MenuVO menu = menuDAO.selectMenuByMname(mName);
		return menu;
	}

}
