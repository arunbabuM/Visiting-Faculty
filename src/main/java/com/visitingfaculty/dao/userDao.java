package com.visitingfaculty.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.visitingfaculty.dto.UserDto;
import com.visitingfaculty.model.Resume;
import com.visitingfaculty.model.SchoolList;
import com.visitingfaculty.model.User;
import com.visitingfaculty.model.user_bank_details.UserBankAccountType;
import com.visitingfaculty.model.user_qualification.UserQualificationType;
import com.visitingfaculty.model.user_skills.UserSkillsFromDB;
import com.visitingfaculty.model.user_workexperience_detail.UserWorkexperienceDesignation;
import com.visitingfaculty.model.user_workexperience_detail.UserWorkexperienceType;
import com.visitingfaculty.service.PasswordService;
import com.visitingfaculty.service.faculty_service.UserService;

@Repository
public class userDao implements UserDaoInterface {

    @Autowired
    HttpSession httpSession;

    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    PasswordService passwordService;

    @Autowired
    UserService userService;

    @Override
    public boolean resetPassword(String emailValue) {
     String sql="select id from public.user where email = ?";
     int id = 0;
     try{
        id = (int)jdbcTemplate.queryForObject(sql,Integer.class,emailValue);
     } catch(Exception e) {
       return false;
     }
     if(id != 0) {
        int tokenGenerated = (int) Math.floor(100000 + Math.random() * 900000);
        httpSession.setAttribute("token", tokenGenerated);
        httpSession.setAttribute("email", emailValue);
        userService.sendEmail("Please Enter This Token to Reset Password : " + tokenGenerated , emailValue, 3);
        return true;
     }
     return false;
    
    }

    public int resetPassword1(String password)
    {
        String SQL = "update public.user set password_hash = ? where email = ?";
        String email = (String) httpSession.getAttribute("email");
        String encodedPassword = passwordService.encodePassword(password);
        return jdbcTemplate.update(SQL,encodedPassword ,email);
    }


    @Override
    public Object insertPersonalDetails(String personalDetailsData) {

        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("insert_user_details");

        return jdbcCall.executeFunction(Object.class, personalDetailsData);
    }

    @Override
    public List<UserSkillsFromDB> getAllSkills() {

        String sql = "select * from skill";

        return jdbcTemplate.query(sql, (rs, rownum) -> {
            return new UserSkillsFromDB(rs.getInt("id"), rs.getInt("skill_type_lid"), rs.getString("skill_name"));
        });
    }

    @Override
    public int insertCustomSkill(UserSkillsFromDB userSkillsFromDB) {

        String sql = "insert into skill(skill_type_lid,skill_name) values(?,?)";
        return jdbcTemplate.update(sql, userSkillsFromDB.getSkill_type_lid(), userSkillsFromDB.getSkill_name());
    }

    @Override
    public UserSkillsFromDB getUserSkill(String skill_name) {

        String sql = "select * from skill where skill_name = ?";

        return jdbcTemplate.queryForObject(sql, (rs, rownum) -> {
            return new UserSkillsFromDB(rs.getInt("id"), rs.getInt("skill_type_lid"), rs.getString("skill_name"));
        }, skill_name);
    }

    @Override
    public Object insertQualificationDetails(String qualificationTableData) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("insert_qualification_details");

        return jdbcCall.executeFunction(Object.class, qualificationTableData);
    }

    @Override
    public Object updateQualificationDetails(String qualificationTableData) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("update_qualification_details");

        return jdbcCall.executeFunction(Object.class, qualificationTableData);
    }

    @Override
    public Object insertAllSkills(String skills) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("insert_skill_details");

        return jdbcCall.executeFunction(Object.class, skills);
    }

    @Override
    public Object updateAllSkills(String skills) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("update_skill_details");

        return jdbcCall.executeFunction(Object.class, skills);
    }

    @Override
    public Object insertAwardData(String data) {

        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("insert_achievement");

        return jdbcCall.executeFunction(Object.class, data);
    }

    @Override
    public Object insertBankDetails(String bankDetailsData) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("insert_bank_details");

        return jdbcCall.executeFunction(Object.class, bankDetailsData);
    }

    @Override
    public Object updateBankDetails(String bankDetailsData) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("update_bank_details");

        return jdbcCall.executeFunction(Object.class, bankDetailsData);
    }

    @Override

    public List<UserQualificationType> getQualificationType() {
        String sql = "select id, name, abbr from qualification_type where id < 4";
        return jdbcTemplate.query(sql, (rs, rownum) -> {
            return new UserQualificationType(rs.getInt("id"), rs.getString("name"), rs.getString("abbr"));
        });
    }

    @Override
    public List<UserWorkexperienceType> getWorkexperienceType() {
        String sql = "select * from experience_type where parent_lid=2 and active= 'true'";
        return jdbcTemplate.query(sql, (rs, rownum) -> {
            return new UserWorkexperienceType(rs.getInt("id"), rs.getString("name"), rs.getString("abbr"));
        });
    }

    @Override
    public List<UserWorkexperienceDesignation> getWorkexperienceDesignation() {
        String sql = "select id, name from designation";
        return jdbcTemplate.query(sql, (rs, rownum) -> {
            return new UserWorkexperienceDesignation(rs.getInt("id"), rs.getString("name"));
        });
    }

    @Override
    public List<UserBankAccountType> getBankAccountType() {
        String sql = "select * from bank_account_type";
        return jdbcTemplate.query(sql, (rs, rownum) -> {
            return new UserBankAccountType(rs.getInt("id"), rs.getString("account_type"));
        });
    }

    public Object updatePersonalDetails(String personalDetailsData) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("update_user_details");

        return jdbcCall.executeFunction(Object.class, personalDetailsData);

    }

    @Override
    public Object insertPublications(String data) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("insert_publication");

        return jdbcCall.executeFunction(Object.class, data);
    }

    @Override
    public Object insertResearch(String data) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("insert_research");

        return jdbcCall.executeFunction(Object.class, data);
    }

    @Override
    public Object updateAward(String data) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("update_achievement");

        return jdbcCall.executeFunction(Object.class, data);
    }

    @Override
    public Object updatePublications(String data) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("update_publication");

        return jdbcCall.executeFunction(Object.class, data);
    }

    @Override
    public Object updateResearch(String data) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("update_research");

        return jdbcCall.executeFunction(Object.class, data);
    }

    @Override
    @Transactional
    public int insertUser(User user) {

        String sql = "insert into public.user( user_id , password_hash , email) values( ? , ? , ? )";
        String sql2 = "insert into user_role( user_lid , role_lid) values( ? , ? )";

        KeyHolder holder = new GeneratedKeyHolder();
        jdbcTemplate.update(new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
                PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                ps.setString(1, user.getUser_id());
                ps.setString(2, user.getPassword_hash());
                ps.setString(3, user.getEmail());
                return ps;
            }
        }, holder);

        Map<String, Object> id = holder.getKeys();
        int userId = (int) id.get("id");
        System.out.println("id>>>>" + userId);
        if (userId != 0) {

            return jdbcTemplate.update(sql2, userId, 2);

        }
        return 0;
    }

    @Override
    public String getPasswordById(String user_id) {

        String sql = "Select Password_hash from public.user where user_id = ?";
        String Password = (String) jdbcTemplate.queryForObject(sql, String.class, user_id);
        return Password;
    }

    @Override
    public UserDto getUserLid(String user_id) {
        String sql = "Select lev.level,u.id,u.user_id,r.name,u.organization_lid from public.user u INNER JOIN user_role ur ON u.id=ur.user_lid INNER JOIN role r ON r.id = ur.role_lid INNER JOIN level lev ON lev.role_lid = r.id AND u.user_id = ?";
        // Integer Password = jdbcTemplate.queryForObject(sql, Integer.class, user_id);
        UserDto userDto = jdbcTemplate.queryForObject(sql, (rs, rownum) -> {
            return new UserDto(rs.getInt("level"),rs.getInt("id"), rs.getString("user_id"), rs.getString("name"),
             rs.getString("organization_lid"));
        }, user_id);
        return userDto;
    }

    @Override
    public Object getUserResume(int resume_lid) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("get_user_resume_details");

        return jdbcCall.executeFunction(Object.class, resume_lid);
    }

    @Override
    public Object getFacultyApplication(String user_id) {

        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("faculty_resume_search");

        return jdbcCall.executeFunction(Object.class, user_id);
    }

    @Override
    public Object getFacultyApplications(String user_id) {

        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("get_faculty_applications");

        return jdbcCall.executeFunction(Object.class, user_id);
    }

    @Override
    public Object getFacultyResumeByName(String user_id) {

        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("faculty_search_by_name");

        return jdbcCall.executeFunction(Object.class, user_id);
    }

    @Override
    public int insertResume(Resume resume) {

        String sql = "insert into resume(user_lid,name,description) values(?,?,?)";
        KeyHolder holder = new GeneratedKeyHolder();
        jdbcTemplate.update(new PreparedStatementCreator() {
            @Override
            public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
                PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                ps.setInt(1, resume.getUser_lid());
                ps.setString(2, resume.getName());
                ps.setString(3, resume.getDescription());
                return ps;
            }
        }, holder);

        Map<String, Object> id = holder.getKeys();
        int newResumeid = (int) id.get("id");
        return newResumeid;
    }

    @Override
    public Object getResumeById(int user_lid) {

        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("resume_search");

        return jdbcCall.executeFunction(Object.class, user_lid);
    }

    @Override
    public User getUserByResume(int id) {

        String sql = "SELECT u.id,u.email,u.user_id,u.password_hash FROM PUBLIC.user u INNER JOIN resume r ON r.user_lid = u.id WHERE r.id=?";
        User user = jdbcTemplate.queryForObject(sql, (rs, rownum) -> {
            return new User(rs.getInt("id"), rs.getString("user_id"), rs.getString("password_hash"),rs.getString("email"));
        }, id);
        return user;
    }

    @Override
    public Object insertWorkExperienceDetails(String workexperienceTableData) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("insert_work_experience");

        return jdbcCall.executeFunction(Object.class, workexperienceTableData);
    }

    @Override
    public Object updateWorkExperienceDetails(String workexperienceTableData) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("update_work_experience");

        return jdbcCall.executeFunction(Object.class, workexperienceTableData);
    }

    @Override
    public int deleteQualification(int id) {
        String sql = "DELETE FROM resume_qualification WHERE resume_qualification_lid = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override
    public int deleteaward(int id) {
        String sql = "DELETE FROM resume_achievement WHERE resume_achievement_lid = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override
    public int deletepublication(int id) {
        String sql = "DELETE FROM resume_publication WHERE resume_achievement_lid = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override
    public int deleteresearch(int id) {
        String sql = "DELETE FROM resume_research WHERE resume_achievement_lid = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override
    public int deleteCertificate(int id) {
        String sql = "DELETE FROM resume_qualification WHERE resume_qualification_lid = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override
    public Object createJobApplication(String object) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("create_application");

        return jdbcCall.executeFunction(Object.class, object);
    }

    @Override
    public int deleteExperience(int id) {
        String sql = "DELETE FROM resume_experience WHERE resume_experience_lid = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override
    public int deleteSoftSkills(int id) {
        String sql = "DELETE FROM resume_skill_selected WHERE resume_skill_selected_lid = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override
    public Object createProforma(String data) {

        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("upsert_proforma_details");

        return jdbcCall.executeFunction(Object.class, data);
    }

    @Override
    public Object getApplicationData(String getApplicationJson) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("admin_application_search");

        return jdbcCall.executeFunction(Object.class, getApplicationJson);
    }

    @Override
    public Object getJobResume(int resume_lid) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("get_appln_details");

        return jdbcCall.executeFunction(Object.class, resume_lid);
    }

    @Override
    public Object getJobView(String data) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("get_proforma_details");

        return jdbcCall.executeFunction(Object.class, data);
    }

    @Override
    public Object getQualPerformer(String data) {
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("get_application_resume_qualification");

        return jdbcCall.executeFunction(Object.class, data);
    }

    @Override
    public boolean createJobApplicationByAdmin(String object) {

        String sql = "INSERT INTO user_application ( resume_lid, organization_lid,active ) VALUES ( ?, ?,?)";
        JSONObject jsonString = new JSONObject(object);
        JSONArray array = jsonString.getJSONArray("create_job_application");
        int resume_lid = array.getJSONObject(0).getInt("resume_lid");
        int organization_lid = array.getJSONObject(0).getInt("organization_lid");
        int rows = jdbcTemplate.update(sql, resume_lid, organization_lid, false);

        if (rows ==  1) {
            String sql2 = "	SELECT ui.email FROM user_application ua INNER JOIN user_info ui ON ua.resume_lid = ui.resume_lid AND ua.resume_lid = ?  LIMIT 1";
            String email = jdbcTemplate.queryForObject(sql2, String.class, resume_lid);
            System.out.println(email);
            String message = "Please confirm the application created by Admin through your pancard ";
            boolean bool = userService.sendEmail(message, email, 2);
            return bool;
        }
        return false;

    }

    @Override
    public Object updateApplication(String user_id) {

        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("update_application");

        return jdbcCall.executeFunction(Object.class, user_id);
    }

    @Override
    public Object insertApplication(String user_id) {

        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("insert_application");

        return jdbcCall.executeFunction(Object.class, user_id);
    }

    @Override
    public List<SchoolList> getAllSchools(int user_lid) {
     
        
        String sql = "SELECT o.organization_id,o.name FROM public.user pu INNER JOIN admin_organization ao ON pu.id = ao.user_lid INNER JOIN organization o ON o.organization_id = ao.organization_lid WHERE ao.user_lid = ?";

        List<SchoolList>  schoolsList = jdbcTemplate.query(sql,(rs,rownum) -> {
            return new SchoolList(rs.getString("organization_id"),rs.getString("name"));
        },user_lid);

        return schoolsList;
    }

    @Override
    public int deleteProformaDetail(int id) {
        String sql = "Update proforma_details set active = false where proforma_id = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override
    public Object updateproforma(String data) {
       
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("update_proforma_status");

        return jdbcCall.executeFunction(Object.class, data);
    }

    @Override
    public Object getStatusList(String data) {
       
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("get_status_list");

        return jdbcCall.executeFunction(Object.class, data);
    }

    @Override
    public Object getAllProforma(String data) {
       
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("get_all_proforma");

        return jdbcCall.executeFunction(Object.class, data);
    }

    @Override
    public int getSchoolName(int id) {
        String sql = "SELECT name FROM organization where organization_id = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override

    public Object getExpperfoma(String data) {
       
        SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("get_application_resume_experience");

        return jdbcCall.executeFunction(Object.class, data);

    public Object getCommments(int id) {
         SimpleJdbcCall jdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withFunctionName("get_comments");

        return jdbcCall.executeFunction(Object.class, id);

    }

}
