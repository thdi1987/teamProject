package member.mail;

import java.io.File;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailServiceImpl implements MailService{
	
	private JavaMailSender javaMailSender;

	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
	
	public boolean send(String subject, String text, String to, String filePath) {
		
		MimeMessage message = javaMailSender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			helper.setSubject(subject);
			helper.setText(text, true);
			helper.setTo(to);
			
			if(filePath != null) {
				File file = new File(filePath);
				if(file.exists()) {
					helper.addAttachment(file.getName(), new File(filePath));
				}
			}
			System.out.println(helper.getMimeMessage().toString());
			javaMailSender.send(helper.getMimeMessage());
			return true;
			
		}catch(MessagingException e) {
			e.printStackTrace();
		}
		return false;
	}
}
