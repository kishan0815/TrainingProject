package com.techaspect.service;

import java.io.IOException;
import java.util.Properties;

import java.io.InputStream;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;

import com.techaspect.dao.VendorDao;
import com.techaspect.entity.Customer;

public class EmailService {
	private static final Logger LOGGER = Logger.getLogger(VendorDao.class);
	private static Properties properties = new Properties();
	private static EmailService eService;
	
	private EmailService() {	
	}
	public static EmailService getInstance() {
		if(eService == null) {
			eService = new EmailService();
		}
		return eService;
	}
	
	static {
		InputStream inputStream = EmailService.class.getClassLoader().getResourceAsStream("email.properties");
		
		try {
			properties.load(inputStream);
		} catch (IOException ioe) {
			LOGGER.error("Exception Raised",ioe);
		}
	}
	
	public boolean sendWelcomeMailToCustomer(Customer customer) {
		boolean status = false;
		
		//CONNECTING TO MAIL SERVER
		Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator() {
																	protected PasswordAuthentication getPasswordAuthentication() {
																		return new PasswordAuthentication(properties.getProperty("mail.username"), properties.getProperty("mail.password"));
																	}
																});
		
		try {
			//COMPOSING EMAIL
			MimeMessage mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress("kishankumar564@gmail.com"));
			mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse(customer.getcustEmail()));
			mimeMessage.setSubject("Welcome to My ECommerce Website.");
			mimeMessage.setText("Dear " + customer.getcustFname() + ",\n\n Thank you for registering with us.");

			//SENDING EMAIL
			Transport.send(mimeMessage);
			
			status = true;
		} catch (AddressException ae) {
			LOGGER.error("Exception Raised",ae);
		} catch (MessagingException me) {
			LOGGER.error("Exception Raised",me);
		}
	
		return status;
	}
}
