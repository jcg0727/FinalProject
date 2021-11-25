package kr.ac.hs.dao;

import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;

import kr.ac.hs.dto.common.StaffVO;

public class StaffDAOImpl implements StaffDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session){
		this.session=session;
	}
	@Override
	public StaffVO selectStaffbyStaffNo(String staff_no) throws SQLException {
		StaffVO staff = session.selectOne("Staff-Mapper.selectStaffbyStaffNo",staff_no);
		return staff;
	}

}
