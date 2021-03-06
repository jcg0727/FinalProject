package kr.ac.hs.service;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SmsServiceImpl implements SmsService{
	 
	@Override
	public void certifiedPhoneNumber(String phoneNumber, String cerNum) {
		String api_key = "NCSI2S3WUDOYORNN";
	    String api_secret = "FL3O4QN3K2X9BYZR5CSZXHH48LU21OAN";
	    Message coolsms = new Message(api_key, api_secret);
	    
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phoneNumber);	// 수신전화번호
	    params.put("from", "01099027725");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "인증번호는 [" + cerNum + "]"+ "입니다.");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	}

	@Override
	public void passSms(String phoneNumber, String name) {
		String api_key = "NCSI2S3WUDOYORNN";
	    String api_secret = "FL3O4QN3K2X9BYZR5CSZXHH48LU21OAN";
	    Message coolsms = new Message(api_key, api_secret);
	    System.out.println("22222222222222" + phoneNumber);
	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phoneNumber);	// 수신전화번호
	    params.put("from", "01099027725");	// 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", name + "님 HS대학교 합격을 진심으로 축하드립니다. 등록금 납부기간은 홈페이지에서 확인");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	}
}
