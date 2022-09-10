package com.visitingfaculty.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.visitingfaculty.dao.UserDaoInterface;
import com.visitingfaculty.model.user_workexperience_detail.UserWorkexperienceDesignation;
import com.visitingfaculty.model.user_workexperience_detail.UserWorkexperienceType;
import com.visitingfaculty.validations.jsoncheck;

@RestController
public class UserWorkexperienceController {

    @Autowired
    UserDaoInterface userDaoInterface;

    @Autowired
    jsoncheck jsoncheck;

    @GetMapping("/get-workexperience-type")
    public List<UserWorkexperienceType> getWorkexperienceTypeDB() {

        List<UserWorkexperienceType> list = userDaoInterface.getWorkexperienceType();
        return list;
    }

    @GetMapping("/get-workexperience-designation-type")
    public List<UserWorkexperienceDesignation> getWorkexperienceDesignationTypeDB() {

        List<UserWorkexperienceDesignation> list = userDaoInterface.getWorkexperienceDesignation();
        return list;
    }

    @PostMapping(value = "/insert-workexperience-details")
    public ResponseEntity<?> insertWorkExperienceDetails(@RequestBody String workexperienceTableData) {
        Object insertWorkExperiencedetails = userDaoInterface.insertWorkExperienceDetails(workexperienceTableData);
        System.out.println(insertWorkExperiencedetails);
        return ResponseEntity.ok("Inserted Successfully");
        // String newObject = jsoncheck.qualificationCheck(qualificationTableData);

        // if(newObject != null)
        // {

        // Object updateQualificationDetails =
        // userDaoInterface.updateQualificationDetails(newObject);
        // System.out.println(updateQualificationDetails);
        // if (updateQualificationDetails == null) {
        // return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        // }

        // }
        // else
        // {
        // System.out.println("Error");
        // return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        // }

    }
}