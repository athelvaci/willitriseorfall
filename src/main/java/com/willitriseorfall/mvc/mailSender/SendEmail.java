package com.willitriseorfall.mvc.mailSender;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	static Properties mailServerProperties;
	static Session getMailSession;
	static MimeMessage generateMailMessage;

	public void SendEmailToUser(String emailAddress, String emailSubject, String emailBody) {
		try {
			mailServerProperties = System.getProperties();
			mailServerProperties.put("mail.smtp.port", "587");
			mailServerProperties.put("mail.smtp.auth", "true");
			mailServerProperties.put("mail.smtp.starttls.enable", "true");

			getMailSession = Session.getDefaultInstance(mailServerProperties, null);
			generateMailMessage = new MimeMessage(getMailSession);
			generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(emailAddress));
			generateMailMessage.setSubject(emailSubject);
			generateMailMessage.setContent(emailBody, "text/html");

			Transport transport = getMailSession.getTransport("smtp");

			transport.connect("smtp.gmail.com", "willitriseorfall@gmail.com", "khasbitirme");
			transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
			transport.close();
		} catch (Exception e) {
			System.out.println("Email sending process encountered an error.");
			System.out.println(e.getMessage());
		}
	}
}
