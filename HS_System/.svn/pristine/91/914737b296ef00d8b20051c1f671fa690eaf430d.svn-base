package kr.ac.hs.service.academic;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.ac.hs.dto.StudentInformationVO;

public interface StudentInformationService {

   public Map<String, Object> getInfoByAccountNO(String account_no) throws SQLException;
   
   public StudentInformationVO getPictureByAccountNO(String account_no) throws SQLException;
   
   void modify(StudentInformationVO stuInfo) throws SQLException;
   
   public List<StudentInformationVO> getStdAcunt(String account_no) throws SQLException;
   
   public int selectLectureSemester(String student_no)throws SQLException;
   
   
   

}