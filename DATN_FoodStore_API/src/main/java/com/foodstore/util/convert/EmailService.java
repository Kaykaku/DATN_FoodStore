package com.foodstore.util.convert;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

    @Autowired
    public JavaMailSender emailSender;

    public void send(String content,String subject,String email) throws MessagingException{

    	MimeMessage message = emailSender.createMimeMessage();

        boolean multipart = true;
        
        MimeMessageHelper helper = new MimeMessageHelper(message, multipart, "utf-8");
        
        String htmlMsg = content;
        
        message.setContent(htmlMsg, "text/html");
        
        helper.setTo(email);
        
        helper.setSubject(subject);
        
    
        this.emailSender.send(message);

    }

}