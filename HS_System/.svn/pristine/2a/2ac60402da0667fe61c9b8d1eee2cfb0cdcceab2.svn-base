package kr.ac.hs.command.academic;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.hs.dto.StudentInformationVO;

public class AcademicInformationCommand {

   private String account_no;
   private String email;
   private int student_no;
   private int applicant_no;
   private String address;
   private String detail_add;
   private String phone;
   private String acunt_nn;
   private String acunt_bank;
   private String acunt_no;
   private MultipartFile picture; // 사진파일 
   private String oldPicture; // 이전 사진파일명
   private String uploadPicture; // 변경된 사진 파일명.
   
   public String getAccount_no() {
      return account_no;
   }
   public void setAccount_no(String account_no) {
      this.account_no = account_no;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public int getStudent_no() {
      return student_no;
   }
   public void setStudent_no(int student_no) {
      this.student_no = student_no;
   }
   public int getApplicant_no() {
      return applicant_no;
   }
   public void setApplicant_no(int applicant_no) {
      this.applicant_no = applicant_no;
   }
   public String getAddress() {
      return address;
   }
   public void setAddress(String address) {
      this.address = address;
   }
   public String getDetail_add() {
      return detail_add;
   }
   public void setDetail_add(String detail_add) {
      this.detail_add = detail_add;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   public String getAcunt_nn() {
      return acunt_nn;
   }
   public void setAcunt_nn(String acunt_nn) {
      this.acunt_nn = acunt_nn;
   }
   public String getAcunt_bank() {
      return acunt_bank;
   }
   public void setAcunt_bank(String acunt_bank) {
      this.acunt_bank = acunt_bank;
   }
   public String getAcunt_no() {
      return acunt_no;
   }
   public void setAcunt_no(String acunt_no) {
      this.acunt_no = acunt_no;
   }
   public MultipartFile getPicture() {
      return picture;
   }
   public void setPicture(MultipartFile picture) {
      this.picture = picture;
   }
   public String getOldPicture() {
      return oldPicture;
   }
   public void setOldPicture(String oldPicture) {
      this.oldPicture = oldPicture;
   }
   public String getUploadPicture() {
      return uploadPicture;
   }
   public void setUploadPicture(String uploadPicture) {
      this.uploadPicture = uploadPicture;
   }
   
   public StudentInformationVO toParseStuInfo() {
      StudentInformationVO stuInfo = new StudentInformationVO();
      stuInfo.setAccount_no(this.account_no);
      stuInfo.setEmail(this.email);
      stuInfo.setStudent_no(this.student_no);
      stuInfo.setApplicant_no(this.applicant_no);
      stuInfo.setAddress(this.address);
      stuInfo.setDetail_add(this.detail_add);
      stuInfo.setPhone(this.phone);
      stuInfo.setAcunt_no(this.acunt_no);
      stuInfo.setAcunt_nn(this.acunt_nn);
      stuInfo.setAcunt_bank(this.acunt_bank);
      
      return stuInfo;
      
   }
   
   
}