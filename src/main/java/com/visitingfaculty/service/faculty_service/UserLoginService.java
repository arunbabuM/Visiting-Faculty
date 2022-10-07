package com.visitingfaculty.service.faculty_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.visitingfaculty.dao.UserDaoInterface;
import com.visitingfaculty.model.User;
import com.visitingfaculty.dto.UserDto;
import com.visitingfaculty.service.PasswordService;

@Service
public class UserLoginService {
    
    @Autowired
    UserDaoInterface userDaoInterface;

    @Autowired
    PasswordService passwordService;


    @Autowired
    UserDaoInterface daoInterface;
    // @Autowired
    // PasswordService passwordService;

    public boolean verifyPassword(UserDto userDto) {

        String passwordFromDB = userDaoInterface.getPasswordById(userDto.getUser_id());

        if (passwordService.verifyPassword(passwordFromDB, userDto.getPassword())) {
            return true;
        } else {
            return false;
        }
    }

    public boolean validateToken(int tokenToVerify, int tokenGenerated, String user_id, String password) {

        if (tokenGenerated != tokenToVerify) {

            return false;
        }
        String password_hash = passwordService.encodePassword(password);
        User user = new User();
        user.setPassword_hash(password_hash);
        user.setUser_id(user_id);
        daoInterface.insertUser(user);
        return true;
    }
}
