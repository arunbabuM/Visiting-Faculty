package com.visitingfaculty.controller;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.visitingfaculty.dao.UserDaoInterface;
import com.visitingfaculty.dto.Designation;
import com.visitingfaculty.dto.WorkExperience;
import com.visitingfaculty.service.faculty_service.WorkExperienceService;
import com.visitingfaculty.validations.ValidationOfWorkExperienceJson;

@RestController
public class FacultyControllerForWorkExperience {

	@Autowired
	ValidationOfWorkExperienceJson validationOfJson;

	@Autowired
	WorkExperienceService workExperienceService;

	@Autowired
	UserDaoInterface userDaoInterface;
	

	@RequestMapping(value = "/fetchDesignationValue" ,method=RequestMethod.POST)
	public List<Designation> fetchDesignationValue() {
		List<Designation> designationValue;
		designationValue = workExperienceService.getAllDesignation();
		return designationValue;

	}

	@RequestMapping(value = "/fetchWorkExperienceValue" ,method=RequestMethod.POST)
	public List<WorkExperience> fetchWorkExperienceValue() {
		List<WorkExperience> designationValue;
		designationValue = workExperienceService.getWorkExperienceValue();
		return designationValue;

	}
	
	@PostMapping(value = "/insertWorkExperience")
	@ResponseBody
	public ResponseEntity<?> insertWorkExperience(@RequestBody String workExperienceData) throws ParseException {
		System.out.println(workExperienceData);
		/*
		 * for(int i=0;i<validationValue.size();i++)
		 * System.out.println(validationValue.get(i)); String errorKey[] =
		 * validationOfJson.isBooleanTrueOrFalse(validationValue);
		 * System.out.println("value is university is" + validationValue); for(int
		 * i=0;i<errorKey.length;i++)
		 * System.out.println("values of error key is"+errorKey[i]); return errorKey;
		 */

		System.out.println(workExperienceData);
		Object insertWorkExperience = userDaoInterface.insertWorkExperience(workExperienceData);
		System.out.println(insertWorkExperience);
		return ResponseEntity.status(HttpStatus.OK).build();
	}

}

