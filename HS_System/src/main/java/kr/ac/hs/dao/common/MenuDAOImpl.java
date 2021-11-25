package kr.ac.hs.dao.common;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.dto.AccountVO;
import kr.ac.hs.dto.common.MenuVO;

public class MenuDAOImpl implements MenuDAO{
	private SqlSession session;
	private String namespace="Menu-Mapper.";
			
	
	public void setSqlSession(SqlSession sqlSession) {
		this.session = sqlSession;
	}

	@Override
	public List<MenuVO> selectMainMenu(String authority) throws SQLException {
		List<MenuVO> menuList = session.selectList(namespace+"selectMainMenu", authority);
		return menuList;
	}

	@Override
	public List<MenuVO> selectSubMenu(MenuVO menu) throws SQLException {
		List<MenuVO> menuList = session.selectList(namespace+"selectSubMenu", menu);
		return menuList;
	}

	@Override
	public MenuVO selectMenuByMcode(Map<String, String> dataMap) throws SQLException {
		MenuVO menu = session.selectOne(namespace+"selectMenuByMcode", dataMap);
		return menu;
	}

	@Override
	public MenuVO selectMenuByMname(String mName) throws SQLException {
		MenuVO menu = session.selectOne(namespace+"selectMenuByMname", mName);
		return menu;
	}

}
