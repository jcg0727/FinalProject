package kr.ac.hs.service;

public interface SmsService {

	   //문자 발송
	   void certifiedPhoneNumber(String phoneNumber, String cerNum);
	   
	   //합격자 문자 발송
	   void passSms(String phoneNumber, String name);
}
