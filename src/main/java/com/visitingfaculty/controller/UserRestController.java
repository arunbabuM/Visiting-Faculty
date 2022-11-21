package com.visitingfaculty.controller;

import java.io.File;
import java.security.interfaces.RSAPrivateKey;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.visitingfaculty.dao.UserDaoInterface;
import com.visitingfaculty.dto.UserDto;
import com.visitingfaculty.model.ResetPassword;
import com.visitingfaculty.model.Resume;
import com.visitingfaculty.model.SchoolList;
import com.visitingfaculty.model.User;
import com.visitingfaculty.model.user_skills.UserSkillsFromDB;
import com.visitingfaculty.service.JavaCrypto;
import com.visitingfaculty.service.PasswordService;
import com.visitingfaculty.service.faculty_service.UserLoginService;
import com.visitingfaculty.service.faculty_service.UserService;
import com.visitingfaculty.validations.jsoncheck;

@RestController
public class UserRestController {

    @Value("${privateKeyLocation}")
    String privateKeyLocation;

    @Autowired
    UserService userService;

    @Autowired
    RestTemplate restTemplate;

    @Autowired
    jsoncheck jsonchk;

    @Autowired
    UserLoginService loginService;

    @Autowired
    PasswordService passwordService;

    @Autowired
    UserDaoInterface userDaoInterface;

    @Value("${notification.url}")
    String EmailUrl;

    String password;


    @PostMapping("/reset-password-pancard")
    public ResponseEntity<?>  verifyEmail(@RequestBody String data,ResetPassword rp){

     if(userDaoInterface.resetPassword(data)) {

        return ResponseEntity.status(HttpStatus.OK).build();
     }
     return ResponseEntity.status(HttpStatus.NOT_FOUND).build();

    }

    @PostMapping("/reset-success")
    public ResponseEntity<?>  resetpassword(@RequestBody String rp,HttpSession httpSession)
    {
        JSONObject jsonString = new JSONObject(rp);
        JSONArray resetData = jsonString.getJSONArray("object");
        String tokenJson = resetData.getJSONObject(0).getString("token");
        String passwordJson = resetData.getJSONObject(0).getString("password");
        int token = (int) httpSession.getAttribute("token");
        if(Integer.parseInt(tokenJson) == token)
        {
           userDaoInterface.resetPassword1(passwordJson);
           return ResponseEntity.status(HttpStatus.OK).build();
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();

    }

    @PostMapping(value = "/insert-personal-details")
    public ResponseEntity<?> insertPersonalDetails(@RequestBody String personalDetailsData) {

        String json = jsonchk.UserJsonCheck(personalDetailsData);
        System.out.println(json);
        if (json != null) {
            Object insertPersonalDetails = userDaoInterface.insertPersonalDetails(json);
            if (insertPersonalDetails == null) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
            }
            return ResponseEntity.ok("Inserted Successfully");
        }
        System.out.println("Error");
        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();

    }

    @PostMapping(value = "/update-personal-details")
    public ResponseEntity<?> updatePersonalDetails(@RequestBody String personalDetailsData) {
        System.out.println("Personal detail Update controller : "+personalDetailsData);

        String json = jsonchk.UserJsonCheck(personalDetailsData);
        if (json != null) {
            Object updatePersonalDetails = userDaoInterface.updatePersonalDetails(json);
            System.out.println("sdfvgws"+updatePersonalDetails);
            if (updatePersonalDetails == null) {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
            }
            return ResponseEntity.ok("Inserted Successfully");
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();

    }

    @PostMapping("/verify-registration")
    public ResponseEntity<?> verifyUserRegistration(@RequestBody UserDto userDto, HttpSession httpSession) {

        // if user not exist then we will generatae a random 6 digit token for
        // verification
        httpSession.setAttribute("user_id", userDto.getUser_id());
        password = userDto.getPassword();

        int tokenGenerated = (int) Math.floor(100000 + Math.random() * 900000);
        httpSession.setAttribute("tokenGenerated", tokenGenerated);

        String message = "Please Enter this code to verify your email: " + tokenGenerated;

        JSONObject json = new JSONObject();
        json.put("message", message);
        json.put("toEmail", userDto.getEmail());
        json.put("subject", "Verify Your Email Adddress");
        json.put("cc", "null");
        String newJsonString = json.toString();

        restTemplate.postForObject(EmailUrl, newJsonString, Boolean.class);

        return ResponseEntity.status(HttpStatus.OK).build();


    }

    @PostMapping("/verify-token")
    public ResponseEntity<?> verifyToken(@RequestBody String token, HttpSession httpSession, Model m) {

        int tokenToVerify = Integer.parseInt(token);
        int tokenGenerated = (int) httpSession.getAttribute("tokenGenerated");
        String user_id = (String) httpSession.getAttribute("user_id");
        String passwordToVerify = password;
        if (loginService.validateToken(tokenToVerify, tokenGenerated, user_id, passwordToVerify)) {

            return ResponseEntity.status(HttpStatus.OK).build();
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();

    }

    @PostMapping("/get-all-skill")
    public List<UserSkillsFromDB> getAllSkills() {

        List<UserSkillsFromDB> list = userDaoInterface.getAllSkills();
        return list;
    }

    @PostMapping("/insert-custom-skill")
    public UserSkillsFromDB insertCustomSkill(UserSkillsFromDB userSkillsFromDB) {

        int insertSkill = userDaoInterface.insertCustomSkill(userSkillsFromDB);
        if (insertSkill == 1) {

            UserSkillsFromDB userSkill = userDaoInterface.getUserSkill(userSkillsFromDB.getSkill_name());

            return userSkill;

        } else {

            return null;
        }

    }

    @PostMapping("/verify-login")
    public ResponseEntity<?> verifyUserLogin(@RequestBody UserDto userDto, HttpSession httpSession) {

        String decodedUsername = null;
        String decodedPassword = null;     
        File privateKeyFile = new File(privateKeyLocation);
        RSAPrivateKey privKey;
        try {
            privKey = JavaCrypto.readPrivateKey(privateKeyFile);
            decodedUsername = JavaCrypto.getDecipheredText(privKey,userDto.getUser_id());
            decodedPassword = JavaCrypto.getDecipheredText(privKey, userDto.getPassword());
            userDto.setUser_id(decodedUsername);
            userDto.setPassword(decodedPassword);
            
        } catch (Exception e) {
            System.out.println("Decoded Exception");
            System.out.println("Exception : "+ e);
        }


        if (loginService.verifyPassword(userDto)) {

            UserDto userDtos = userDaoInterface.getUserLid(userDto.getUser_id());
            System.out.println("USERDTO" + userDtos);
            httpSession.setAttribute("user_lid", userDtos.getId());
            httpSession.setAttribute("user_id", userDtos.getUser_id());
            httpSession.setAttribute("role", userDtos.getName());
            httpSession.setAttribute("level", userDtos.getLevel());
            return ResponseEntity.ok(userDtos.getUser_id());
        } else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }

    }

    @PostMapping("/get-user-details")
    public Object getUserResume(@RequestParam(value = "resume_lid") int resume_lid,Model model,HttpSession httpSession) {

        model.addAttribute("level",  httpSession.getAttribute("level"));
        Object resume = userDaoInterface.getUserResume(resume_lid);
        return resume;
    }

    @PostMapping("/get-faculty-application")
    public Object searchFacultyById(String user_id) {

        Object data = userDaoInterface.getFacultyApplication(user_id);

        return data;
    }

    @PostMapping("/get-faculty-applications")
    public Object getFacultyApplications(String user_id) {

        Object data = userDaoInterface.getFacultyApplications(user_id);

        return data;
    }

    @PostMapping("/get-faculty-application-status")
    public Object getFacultyApplicationStatus(String prof_id) {

        Object data = userDaoInterface.getFacultyApplicationStatus(prof_id);
        return data;
    }

    @PostMapping("/get-faculty-by-name")
    public Object searchFacultyByName(String user_id) {


        Object data = userDaoInterface.getFacultyResumeByName(user_id);

        System.out.println(data);

        return data;
    }

    @PostMapping("/get-admin-application-search")
    public Object adminApplicationSearch(@RequestBody String getApplicationJson) {
        Object data = userDaoInterface.getApplicationData(getApplicationJson);

        return data;
    }

    @PostMapping("/get-admin-application-search-name")
    public Object adminApplicationSearchName(@RequestBody String getApplicationJson) {
        Object data = userDaoInterface.getApplicationDataByName(getApplicationJson);

        return data;
    }

    @PostMapping("/create-resume")
    public int createResume(Resume resume) {

        int resume_lid = userDaoInterface.insertResume(resume);

        return resume_lid;
    }

    @PostMapping("/get-resume-by-user")
    public Object getResumeByUser(@RequestParam("user_id") int user_lid) {

        Object data = userDaoInterface.getResumeById(user_lid);

        return data;
    }
   
    @PostMapping("/create-job-application")
    public ResponseEntity<?> createJobApplication(@RequestBody String data ,HttpSession httpSession) {
        Object dataFromDb = null;
        System.out.println(data);
        String role = (String) httpSession.getAttribute("role");
        System.out.println(role);
        if(role.equals("User")){
            dataFromDb = userDaoInterface.updateApplication(data);
        } else { 
            // dataFromDb = userDaoInterface.createJobApplicationByAdmin(data);
            dataFromDb = userDaoInterface.createJobApplicationByAdmin(data);
        }
        if (dataFromDb == null) {

            return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).build();
        }
        return ResponseEntity.status(HttpStatus.OK).build();
    }

    @PostMapping("/update-job-application")
    public ResponseEntity<?> updateJobApplication(@RequestBody String data ,HttpSession httpSession) {

           Object dataFromDb = userDaoInterface.updateApplication(data);

        if (dataFromDb == null) {

            return ResponseEntity.status(HttpStatus.NOT_ACCEPTABLE).build();

        }
        return ResponseEntity.status(HttpStatus.OK).build();
    }
 
    @PostMapping("get-job-application")
    public ResponseEntity<?> getJobApplication(@RequestBody String data) {

        return ResponseEntity.status(HttpStatus.OK).build();
    }

    @PostMapping("registerationFaculty")
    public ResponseEntity<?> getRegisterationFactulty(@RequestBody UserDto data,User user) {
        if(data.getUser_id() != null) {

            String password_hash = passwordService.encodePassword(data.getPassword());
            user.setPassword_hash(password_hash);
            user.setUser_id(data.getUser_id());
            user.setEmail(data.getEmail());
            System.out.println(user.getPassword_hash());
            userDaoInterface.insertUser(user);
            return ResponseEntity.status(HttpStatus.OK).build();
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
    }

    
    @PostMapping("/create-proforma")
    public ResponseEntity<?> getPerforma(@RequestBody String data) {
        userDaoInterface.createProforma(data);
        return ResponseEntity.status(HttpStatus.OK).build();
    }
   
    @PostMapping("/delete-proforma-detail")
    public ResponseEntity<?> deletePerformaDetail(@RequestBody int performaId) {
        
        int dataFromDb = userDaoInterface.deleteProformaDetail(performaId);
        if(dataFromDb == 1) {

            return ResponseEntity.status(HttpStatus.OK).build();
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();

    }

    @PostMapping("/get-school-name")
    public Object getSchoolName(@RequestBody String organizationId) {
           
           return userDaoInterface.getSchoolName(organizationId);
    }

    @PostMapping("/get-schools-list")
    public List<SchoolList> getSchoolList(HttpSession httpSession) {

        int user_lid = (int) httpSession.getAttribute("user_lid");
        
        List<SchoolList> schoolLists = userDaoInterface.getAllSchools(user_lid);

        return schoolLists;
    }

    @PostMapping("/proforma-approval") 
    public ResponseEntity<?> updateProforma(@RequestBody String data) {
        System.out.println("DATA>>>>>>>>>" + data);
        String updatedData = jsonchk.ConvertFileToBase64(data);
        System.out.println("UPDATEDDATA>>>>>>>>>" + updatedData);
        Object dataFromDb = userDaoInterface.updateproforma(updatedData);
        if (dataFromDb != null) {
           return ResponseEntity.status(HttpStatus.OK).build();
        }

        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
    }

    @PostMapping("/get-status-list")
    public Object getStatusList(@RequestBody String data) {

        Object dataFromDb = userDaoInterface.getStatusList(data);
        if(dataFromDb != null) {
            return dataFromDb;
        }
        return null;
    }

    @PostMapping("/get-comments")
    public Object getComments(@RequestBody String data) {
        JSONObject obj = new JSONObject(data);
        int proforma_lid = Integer.parseInt(obj.getString("proforma_lid"));
        Object dataFromDb = userDaoInterface.getCommments(proforma_lid);
        if(dataFromDb != null) {
            return dataFromDb;
        }
        return null;
    }

    @PostMapping("/get_discontinue_comments")
    public Object getDeiscontinueCOmment(@RequestBody String comments) {
        System.out.println("Commetnts ID : "+comments);
        Object data = userDaoInterface.discontinueFacultyComment(comments);
        return data;
    }

    @PostMapping("/download-file")
    public String downloadFile(@RequestBody String proformaId) {
        System.out.println("Commetnts ID : "+proformaId);
        String data = userDaoInterface.getFileURL(Integer.parseInt(proformaId));
        return data;
    }

}
