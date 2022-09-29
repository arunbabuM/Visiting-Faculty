package com.visitingfaculty.service.faculty_service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import com.visitingfaculty.service.PasswordService;

@Service
public class UserService {

    public static String uploadDirectory = "/data/tomcat/webapps/vf/imagedata"; //System.getProperty("user.dir") + "/src/main/webapp/imagedata";
    //"/data/tomcat/webapps/vf/imagedata";

    @Autowired
    private JavaMailSender javaMailSender;

    @Autowired
    PasswordService passwordService;

    @Value("${spring.mail.username}")
    private String fromEmail;

    public boolean sendEmail(String message, String toEmail, int subjectType) {

        String subject = "Verify Your Email Adddress";
        String subject2 = "Application Creation Confirmation";
        String subject3 = "OTP to Reset Password";
        try {

            SimpleMailMessage simpleMailMessage = new SimpleMailMessage();

            simpleMailMessage.setTo(toEmail);
            simpleMailMessage.setFrom(fromEmail);
            if (subjectType == 1) {
            simpleMailMessage.setSubject(subject);
                
            } else if(subjectType == 2){
            simpleMailMessage.setSubject(subject2);
                
            } else {
            simpleMailMessage.setSubject(subject3);

            }
            simpleMailMessage.setText(message);

            javaMailSender.send(simpleMailMessage);
            return true;

        } catch (Exception e) {
            return false;
        }
    }

    public String uploadPhotos(String base64String) {

        String filename = UUID.randomUUID().toString() + ".jpg";

        String base64Image = base64String.split(",")[1];
        byte[] imageBytes = javax.xml.bind.DatatypeConverter.parseBase64Binary(base64Image);

        Path destinationFile = Paths.get(uploadDirectory, filename);

        try {
            Files.write(destinationFile, imageBytes);
            return filename;
        } catch (IOException e) {

            e.printStackTrace();
            return null;

        }
    }


}
