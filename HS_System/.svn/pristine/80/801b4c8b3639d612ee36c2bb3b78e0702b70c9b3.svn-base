package kr.ac.hs.dao.academic;

import java.sql.SQLException;
import java.util.List;

import kr.ac.hs.dto.StudentInformationVO;

public interface StudentInformationDAO {
   String selectProfessorByStuInfo(String account_no) throws SQLException;
   
   int selectStudent_noByStuInfo(String account_no) throws SQLException;
   
   String selectStatus_nmByStuInfo(String account_no) throws SQLException;

   String selectDept_nmByStuInfo(String account_no) throws SQLException;
   
   String selectDept_nm2ByStuInfo(String account_no) throws SQLException;
   
   List<StudentInformationVO> selectPersonalInfoByStuInfo(String account_no) throws SQLException;
   
   String selectGenderByStuInfo(String account_no) throws SQLException;
   
   List<StudentInformationVO> selectBankInfoByStuInfo(String account_no) throws SQLException;
   
   String selectFaculty_nmByStuInfo(String account_no) throws SQLException;
   
   StudentInformationVO selectPictureByStuInfo(String account_no)throws SQLException;
   
   // 수정
   public void updateStuInfo(StudentInformationVO stuInfo)throws SQLException;
   
   public void updateBankInfo(StudentInformationVO stuInfo)throws SQLException;
   
   // 학생계좌정보 조회
   public List<StudentInformationVO> selectStdAcunt(String account_no) throws SQLException;
   
   int selectLectureSemester(String student_no) throws SQLException;
   
   
}