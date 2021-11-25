package kr.ac.hs.dao.common;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.common.MenuVO;

public interface MenuDAO {

	public List<MenuVO> selectMainMenu(String authority) throws SQLException;

	public List<MenuVO> selectSubMenu(MenuVO menu) throws SQLException;

	public MenuVO selectMenuByMcode(Map<String, String> dataMap) throws SQLException;

	public MenuVO selectMenuByMname(String mName) throws SQLException;
}
