package member.mail;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	private String email;
	private String code;
	private String id;
	private String buyerId;	
	private String adoptId;
	private String name;
	private String bank;
	private String registration;
	private String buyerEmail;	
	private String adoptEmail;
	
	
	
	
	public String getBuyerEmail() {
		return buyerEmail;
	}



	public void setBuyerEmail(String buyerEmail) {
		this.buyerEmail = buyerEmail;
	}



	public String getAdoptEmail() {
		return adoptEmail;
	}



	public void setAdoptEmail(String adoptEmail) {
		this.adoptEmail = adoptEmail;
	}



	public String getBuyerId() {
		return buyerId;
	}



	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}



	public String getAdoptId() {
		return adoptId;
	}



	public void setAdoptId(String adoptId) {
		this.adoptId = adoptId;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getBank() {
		return bank;
	}



	public void setBank(String bank) {
		this.bank = bank;
	}



	public String getRegistration() {
		return registration;
	}



	public void setRegistration(String registration) {
		this.registration = registration;
	}



	public SendMail() {
	}	
	
	
	
	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getCode() {
		return code;
	}



	public void setCode(String code) {
		this.code = code;
	}


	//회원가입확인 이메일 전송
	public void sendmail(String email, String code) {		
		
		  String server = "smtp.gmail.com";
		  String sendID = "jpsystem2020@gmail.com";
		  String sendPW = "jpproject";
		  String sendMailAddr = "jpsystem2020@gmail.com";
		  int smtpPort=465;
		  
		  String recEmailAddr= email;
		  String sub = "Safety Pet 회원가입 인증메일입니다.";
		  String cont = code+"를 입력해주세요";
		  
		  Properties props = System.getProperties();
		  
		  props.put("mail.smtp.host", server);
		  props.put("mail.smtp.port", smtpPort);
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.ssl.enable", "true");
		  props.put("mail.smtp.ssl.trust", server);
		  
		  Session session = Session.getDefaultInstance(props, new Authenticator(){
		   protected PasswordAuthentication getPasswordAuthentication(){
		    return new PasswordAuthentication(sendID, sendPW);
		   }
		  });
		  
		  session.setDebug(true);
		  
		  Message mimeMessage = new MimeMessage(session);
		  try {
		   mimeMessage.setFrom(new InternetAddress( sendMailAddr ));
		   mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recEmailAddr));
		   mimeMessage.setSubject(sub);
		   mimeMessage.setText(cont);
		   Transport.send(mimeMessage);
		  } catch (AddressException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  } catch (MessagingException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  }
		  
		 }
	//아이디 찾기 이메일
	public void sendmailFindId(String email, String id) {		
		
		  String server = "smtp.gmail.com";
		  String sendID = "jpsystem2020@gmail.com";
		  String sendPW = "jpproject";
		  String sendMailAddr = "jpsystem2020@gmail.com";
		  int smtpPort=465;
		  
		  String recEmailAddr= email;
		  String sub = "Safety Pet 아이디 찾기 메일입니다.";
		  String cont = "회원님의 아이디는 "+id+"입니다.";
		  
		  Properties props = System.getProperties();
		  
		  props.put("mail.smtp.host", server);
		  props.put("mail.smtp.port", smtpPort);
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.ssl.enable", "true");
		  props.put("mail.smtp.ssl.trust", server);
		  
		  Session session = Session.getDefaultInstance(props, new Authenticator(){
		   protected PasswordAuthentication getPasswordAuthentication(){
		    return new PasswordAuthentication(sendID, sendPW);
		   }
		  });
		  
		  session.setDebug(true);
		  
		  Message mimeMessage = new MimeMessage(session);
		  try {
		   mimeMessage.setFrom(new InternetAddress( sendMailAddr ));
		   mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recEmailAddr));
		   mimeMessage.setSubject(sub);
		   mimeMessage.setText(cont);
		   Transport.send(mimeMessage);
		  } catch (AddressException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  } catch (MessagingException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  }
		  
		 }
	//임시비밀번호 전송
	public void temporaryPassword(String email, String id, String code) {		
		
		  String server = "smtp.gmail.com";
		  String sendID = "jpsystem2020@gmail.com";
		  String sendPW = "jpproject";
		  String sendMailAddr = "jpsystem2020@gmail.com";
		  int smtpPort=465;
		  
		  String recEmailAddr= email;
		  String sub = "Safety Pet 회원님의 임시비밀번호입니다.";
		  String cont = id+"회원님 임시비밀번호로 로그인을 하신후 비밀번호를 변경해 주시길 바랍니다. 회원님의 임시비밀번호는 "+ code+"입니다.";
		  
		  Properties props = System.getProperties();
		  
		  props.put("mail.smtp.host", server);
		  props.put("mail.smtp.port", smtpPort);
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.ssl.enable", "true");
		  props.put("mail.smtp.ssl.trust", server);
		  
		  Session session = Session.getDefaultInstance(props, new Authenticator(){
		   protected PasswordAuthentication getPasswordAuthentication(){
		    return new PasswordAuthentication(sendID, sendPW);
		   }
		  });
		  
		  session.setDebug(true);
		  
		  Message mimeMessage = new MimeMessage(session);
		  try {
		   mimeMessage.setFrom(new InternetAddress( sendMailAddr ));
		   mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recEmailAddr));
		   mimeMessage.setSubject(sub);
		   mimeMessage.setText(cont);
		   Transport.send(mimeMessage);
		  } catch (AddressException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  } catch (MessagingException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  }
		  
		 }
	//입양자에게 분양회원 정보 전송
	public void adoptConfirm(String buyerId, String adoptId, String name, String buyerEmail, String adoptEmail, String bank, String registration) {		
		
		  String server = "smtp.gmail.com";
		  String sendID = "jpsystem2020@gmail.com";
		  String sendPW = "jpproject";
		  String sendMailAddr = "jpsystem2020@gmail.com";
		  int smtpPort=465;
		  
		  String recEmailAddr= adoptEmail;
		  String sub = "Safety Pet "+ adoptId + "회원님 입양을 하신것을 축하드립니다.";		  		
		  String cont = adoptId +"회원님  \n"
		  		+ "분양회원님의 정보를 알려드립니다. 좋은 결과가 있으시길 바랍니다.\n"
		  		+ "아이디 : "+buyerId+"\n"
		  		+ "이름 : "+name+"\n"
		  		+ "이메일 : "+buyerEmail+"\n"
		  		+ "계좌번호 : " + bank+"\n"
		  		+ "동물등록번호 " + registration+"입니다.";
		  Properties props = System.getProperties();
		  
		  props.put("mail.smtp.host", server);
		  props.put("mail.smtp.port", smtpPort);
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.ssl.enable", "true");
		  props.put("mail.smtp.ssl.trust", server);
		  
		  Session session = Session.getDefaultInstance(props, new Authenticator(){
		   protected PasswordAuthentication getPasswordAuthentication(){
		    return new PasswordAuthentication(sendID, sendPW);
		   }
		  });
		  
		  session.setDebug(true);
		  
		  Message mimeMessage = new MimeMessage(session);
		  try {
		   mimeMessage.setFrom(new InternetAddress( sendMailAddr ));
		   mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recEmailAddr));
		   mimeMessage.setSubject(sub);
		   mimeMessage.setText(cont);
		   Transport.send(mimeMessage);
		  } catch (AddressException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  } catch (MessagingException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  }
		  
		 }
	//분양자에게 입양회원 정보 전송
	public void buyerConfirm( String buyerId, String adoptId, String name, String buyerEmail, String adoptEmail) {		
		
		  String server = "smtp.gmail.com";
		  String sendID = "jpsystem2020@gmail.com";
		  String sendPW = "jpproject";
		  String sendMailAddr = "jpsystem2020@gmail.com";
		  int smtpPort=465;
		  
		  String recEmailAddr= buyerEmail;
		  String sub = "Safety Pet "+buyerId+ "회원님 분양을 하신것을 축하드립니다.";
		  String cont = buyerId +"회원님  \n"
			  		+ "선택하신 입양회원님의 정보를 알려드립니다. 좋은 결과가 있으시길 바랍니다.\n"
			  		+ "아이디 : "+adoptId+"\n"
			  		+ "이름 : "+name+"\n"
			  		+ "이메일 : "+adoptEmail+"입니다.";
		  
		  Properties props = System.getProperties();
		  
		  props.put("mail.smtp.host", server);
		  props.put("mail.smtp.port", smtpPort);
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.ssl.enable", "true");
		  props.put("mail.smtp.ssl.trust", server);
		  
		  Session session = Session.getDefaultInstance(props, new Authenticator(){
		   protected PasswordAuthentication getPasswordAuthentication(){
		    return new PasswordAuthentication(sendID, sendPW);
		   }
		  });
		  
		  session.setDebug(true);
		  
		  Message mimeMessage = new MimeMessage(session);
		  try {
		   mimeMessage.setFrom(new InternetAddress( sendMailAddr ));
		   mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recEmailAddr));
		   mimeMessage.setSubject(sub);
		   mimeMessage.setText(cont);
		   Transport.send(mimeMessage);
		  } catch (AddressException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  } catch (MessagingException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  }
		  
		 }
	public void personReport( String email, String id) {		
		
		  String server = "smtp.gmail.com";
		  String sendID = "jpsystem2020@gmail.com";
		  String sendPW = "jpproject";
		  String sendMailAddr = "jpsystem2020@gmail.com";
		  int smtpPort=465;
		  
		  String recEmailAddr= email;
		  String sub = "Safety Pet "+id+ "회원님 부적절한 사이트 이용으로 인해 신고처리를 하였습니다.";
		  String cont = id +"회원님 부적절한 사이트 이용으로 인해 신고처리를 하였습니다. ";	 		
		  
		  Properties props = System.getProperties();
		  
		  props.put("mail.smtp.host", server);
		  props.put("mail.smtp.port", smtpPort);
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.ssl.enable", "true");
		  props.put("mail.smtp.ssl.trust", server);
		  
		  Session session = Session.getDefaultInstance(props, new Authenticator(){
		   protected PasswordAuthentication getPasswordAuthentication(){
		    return new PasswordAuthentication(sendID, sendPW);
		   }
		  });
		  
		  session.setDebug(true);
		  
		  Message mimeMessage = new MimeMessage(session);
		  try {
		   mimeMessage.setFrom(new InternetAddress( sendMailAddr ));
		   mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recEmailAddr));
		   mimeMessage.setSubject(sub);
		   mimeMessage.setText(cont);
		   Transport.send(mimeMessage);
		  } catch (AddressException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  } catch (MessagingException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  }
		  
		 }
	
	public void personWhoReport( String email, String id) {		
		
		  String server = "smtp.gmail.com";
		  String sendID = "jpsystem2020@gmail.com";
		  String sendPW = "jpproject";
		  String sendMailAddr = "jpsystem2020@gmail.com";
		  int smtpPort=465;
		  
		  String recEmailAddr= email;
		  String sub = "Safety Pet "+id+ "회원님 신고처리를 알려드립니다.";
		  String cont = id +"회원님이 신고하신 내용을 처리하였습니다.";			  		
		  
		  Properties props = System.getProperties();
		  
		  props.put("mail.smtp.host", server);
		  props.put("mail.smtp.port", smtpPort);
		  props.put("mail.smtp.auth", "true");
		  props.put("mail.smtp.ssl.enable", "true");
		  props.put("mail.smtp.ssl.trust", server);
		  
		  Session session = Session.getDefaultInstance(props, new Authenticator(){
		   protected PasswordAuthentication getPasswordAuthentication(){
		    return new PasswordAuthentication(sendID, sendPW);
		   }
		  });
		  
		  session.setDebug(true);
		  
		  Message mimeMessage = new MimeMessage(session);
		  try {
		   mimeMessage.setFrom(new InternetAddress( sendMailAddr ));
		   mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recEmailAddr));
		   mimeMessage.setSubject(sub);
		   mimeMessage.setText(cont);
		   Transport.send(mimeMessage);
		  } catch (AddressException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  } catch (MessagingException e) {
		   // TODO Auto-generated catch block
		   e.printStackTrace();
		  }
		  
		 }
}
