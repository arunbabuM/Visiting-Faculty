package com.visitingfaculty.dao;

import java.util.List;

import org.springframework.stereotype.Service;

import com.visitingfaculty.dto.UserDto;
import com.visitingfaculty.model.Resume;
import com.visitingfaculty.model.SchoolList;
import com.visitingfaculty.model.User;
import com.visitingfaculty.model.user_bank_details.UserBankAccountType;
import com.visitingfaculty.model.user_qualification.UserQualificationType;
import com.visitingfaculty.model.user_skills.UserSkillsFromDB;
import com.visitingfaculty.model.user_workexperience_detail.UserWorkexperienceDesignation;
import com.visitingfaculty.model.user_workexperience_detail.UserWorkexperienceType;

@Service
public interface UserDaoInterface {

    boolean resetPassword(String emailValue);

    int resetPassword1(String email);

    Object insertPersonalDetails(String personalDetailsData);

    Object updatePersonalDetails(String personalDetailsData);

    Object insertQualificationDetails(String qualificationTableData);

    Object updateQualificationDetails(String qualificationTableData);

    List<UserQualificationType> getQualificationType();

    List<UserWorkexperienceType> getWorkexperienceType();

    List<UserWorkexperienceDesignation> getWorkexperienceDesignation();

    Object insertWorkExperienceDetails(String workexperienceTableData);

    Object updateWorkExperienceDetails(String workexperienceTableData);

    List<UserSkillsFromDB> getAllSkills();

    int insertCustomSkill(UserSkillsFromDB userSkillsFromDB);

    UserSkillsFromDB getUserSkill(String skill_name);

    Object insertAllSkills(String skills);

    Object updateAllSkills(String skills);

    Object insertAwardData(String data);

    Object insertPublications(String data);

    Object insertResearch(String data);

    Object updateAward(String data);

    Object updatePublications(String data);

    Object updateResearch(String data);

    List<UserBankAccountType> getBankAccountType();

    Object insertBankDetails(String bankDetailsData);

    Object updateBankDetails(String bankDetailsData);

    int insertUser(User user);

    String getPasswordById(String user_id);

    UserDto getUserLid(String user_id);

    Object getUserResume(int resume_lid);

    Object getFacultyApplication(String user_id);

    Object getFacultyApplications(String user_id);

    Object getFacultyResumeByName(String user_id);

    int insertResume(Resume resume);

    Object getResumeById(int user_lid);

    User getUserByResume(int id);

    Object getApplicationData(String getApplicationJson);

    int deleteQualification(int id);

    int deleteaward(int id);

    int deletepublication(int id);

    int deleteresearch(int id);

    int deleteCertificate(int id);

    int deleteExperience (int id);

    int deleteSoftSkills(int id);
    
    int deleteProformaDetail(int id);
   
    String getSchoolName(String id);

    Object createJobApplication(String object);
    
    boolean createJobApplicationByAdmin(String object);

    Object createProforma(String data);

    Object getJobResume(int resume_lid);

    Object getJobView(String schoolid);

    Object getQualPerformer(String data);

    Object updateApplication(String data);

    Object insertApplication(String data);
    
    Object updateproforma(String data);

    Object getAllProforma(String data);
    
    Object getAllProformaReport(String data);

    Object getStatusList(String data);

    Object getCommments(int proforma_lid);

    List<SchoolList> getAllSchools(int user_lid);

    Object getExpperfoma(String data);
   
    Object getProformaReport(String data);

    Object getProformaFilter(String data);
   
    Object getReport(String data);

}
