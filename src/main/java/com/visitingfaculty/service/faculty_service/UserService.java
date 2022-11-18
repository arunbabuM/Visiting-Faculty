package com.visitingfaculty.service.faculty_service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.visitingfaculty.service.PasswordService;

@Service
public class UserService {

    public static String uploadDirectory = "/data/tomcat/webapps/vf/imagedata";
    //System.getProperty("user.dir") + "/src/main/webapp/imagedata";  


    @Autowired
    PasswordService passwordService;

    public String uploadPhotos(String base64String) {

        String initialFilename = UUID.randomUUID().toString();
        String type = base64String.split(";")[0].split("/")[1];
        System.out.println(type);
        String filename = initialFilename + "." + type;
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
