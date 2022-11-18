package com.visitingfaculty.controller;

import java.util.Map;
import javax.servlet.http.HttpSession;
import org.json.JSONObject;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.visitingfaculty.dao.UserDaoInterface;
import com.visitingfaculty.model.User;
import com.visitingfaculty.service.JavaCrypto;

@Controller
public class UserController {

    @Autowired
    UserDaoInterface userDaoInterface;

    @Autowired
    HttpSession httpSession;

    @Value("${publicKeyLocation}")
	private String publicKeyLocation;

    @GetMapping("/login")
    public String getLoginPage(Model m) {
        m.addAttribute("publicKey", JavaCrypto.getPublicKeyFromFile(publicKeyLocation));
        return "login";
    }

    @GetMapping("/register")
    public String getRegistrationPage() {
        return "register";
    }

    @GetMapping("/reset-password")
    public String getResetPasswordPage() {
        return "reset-password";
    }

    @GetMapping("/resume")
    public String getResume(@RequestParam(value = "resume_lid") int resume_lid, Model model) {

        String user_id = (String) httpSession.getAttribute("user_id");
        if (user_id != null) {
            User user = userDaoInterface.getUserByResume(resume_lid);

            model.addAttribute("resume_lid", resume_lid);
            model.addAttribute("level", httpSession.getAttribute("level"));
            model.addAttribute("user_lid", user.getId());
            model.addAttribute("user_id", user.getUser_id());
            return "resume";
        }
        return "redirect:/login";
    }

    @GetMapping("/dashboard")
    public String getDashboard(Model m) {
        String user_id = (String) httpSession.getAttribute("user_id");
        if (user_id != null) {
            String role = (String) httpSession.getAttribute("role");

            if (role.equals("ROLE_ADMIN")) {
                m.addAttribute("role" , role);
                return "dashboard";
            } else if (role.equals("User")) {
                int count = userDaoInterface.isResumeCreated(user_id);
                m.addAttribute("resumeCount", count);
                m.addAttribute("user_id", httpSession.getAttribute("user_id"));
                m.addAttribute("role" , role);
                return "faculty/dashboard";
            } else{
                m.addAttribute("role" , role);
                m.addAttribute("user_id", httpSession.getAttribute("user_id"));
                return "upperLevelDashboard";
            }
            // return "redirect:/login";
        }
        return "redirect:/login#session-timeout";
    }


    @GetMapping("/logout")
    public String logout() {

        httpSession.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/visiting-faculty-applications")
    public String getFacultyApplcation(Model m) {
        String user_id = (String) httpSession.getAttribute("user_id");
        if (user_id != null) {
            return "resume-search";
        }
        return "redirect:/login#session-timeout";
    }

    @GetMapping("/resume-dashboard")
    public String getResumeDashboard() {
        String user_id = (String) httpSession.getAttribute("user_id");
        if (user_id != null) {
            return "resume-dashboard";
        }
        return "redirect:/login#session-timeout";

    }

    @GetMapping("/create-new-resume")
    public String getNewResumePage(@RequestParam Map<String, String> urlObject, Model model) {

        String user_id = (String) httpSession.getAttribute("user_id");
        if (user_id != null) {

            model.addAttribute("user_lid", urlObject.get("user_lid"));
            model.addAttribute("resume_lid", urlObject.get("resume_lid"));
            return "new-resume";
        }
        return "redirect:/login#session-timeout";
    }

    @GetMapping("/proforma")
    public String getPerforma(Model m) {
        String user_id = (String) httpSession.getAttribute("user_id");
        if (user_id != null) {
            m.addAttribute("level", httpSession.getAttribute("level"));
            m.addAttribute("role", httpSession.getAttribute("role"));
            m.addAttribute("user_id", httpSession.getAttribute("user_id"));
            m.addAttribute("organization_lid", httpSession.getAttribute("organization_lid"));
            return "proforma-page";
        }
        return "redirect:/login#session-timeout";
    }

    @GetMapping("/proforma-report")
    public String viewPerforma(Model m) {
        String user_id = (String) httpSession.getAttribute("user_id");
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>entered inside view page");
        if (user_id != null) {
            m.addAttribute("level", httpSession.getAttribute("level"));
            m.addAttribute("organization_lid", httpSession.getAttribute("organization_lid"));
            m.addAttribute("role", httpSession.getAttribute("role"));
            return "proforma-report";
        }
        return "redirect:/login#session-timeout";
    }

    @GetMapping("/proforma-creation")
    public String getPerformaCreation(@RequestParam(value = "application_lid") int application_lid, Model m) {
        String user_id = (String) httpSession.getAttribute("user_id");
        if (user_id != null) {
            m.addAttribute("application_lid", application_lid);
            m.addAttribute("level", httpSession.getAttribute("level"));
            m.addAttribute("user_id", httpSession.getAttribute("user_id"));
            return "proforma-creation";
        }
        return "redirect:/login#session-timeout";
    }

    @GetMapping("/view-application")
    public String viewApplication(@RequestParam(value = "application_lid") int application_lid, Model m) {
        String user_id = (String) httpSession.getAttribute("user_id");
        if (user_id != null) {
            m.addAttribute("application_lid", application_lid);
            return "faculty/application";
        }
        return "redirect:/login#session-timeout";
    }

    @GetMapping("/faculty-reg")
    public String getNewFaculty() {

        String user_id = (String) httpSession.getAttribute("user_id");
        if (user_id != null) {

            return "faculty-reg";
        }
        return "redirect:/login#session-timeout";
    }
    
    @GetMapping("/faculty-application-view")
    public String viewFacultyApplicationList(Model model) {
        model.addAttribute("user_id", httpSession.getAttribute("user_id"));
        return "faculty/faculty-application-view";
    }

    @GetMapping("/view-resume")
    public String viewResume(@RequestParam(value = "resume_lid") int resume_lid, Model model) {
        String user_id = (String) httpSession.getAttribute("user_id");
        if (user_id != null) {
            User user = userDaoInterface.getUserByResume(resume_lid);
            model.addAttribute("resume_lid", resume_lid);
            model.addAttribute("user_lid", user.getId());
            model.addAttribute("level",  httpSession.getAttribute("level"));
            model.addAttribute("user_id", user.getUser_id());
            return "view-resume";
        }
        return "redirect:/login#session-timeout";
    }

    @GetMapping("/view-applications")
    public String getperformerpage() {
        String user_id = (String) httpSession.getAttribute("user_id");
        if (user_id != null) {
            return "job-proforma-page";
        }
        return "redirect:/login#session-timeout";
    }

    @GetMapping("/discotinue-faculty") 
    public String getDiscontinuePage(Model m) {
        String user_id = (String) httpSession.getAttribute("user_id");
        if (user_id != null) {
            m.addAttribute("role", httpSession.getAttribute("role"));
            return "discontinue";
        }
        return "redirect:/login#session-timeout";
    }

    @GetMapping("/manual-approval-list")
    public String manualApprovalList(Model m) {
        String user_id = (String) httpSession.getAttribute("user_id");
        if (user_id != null) {
            m.addAttribute("level", httpSession.getAttribute("level"));
            m.addAttribute("role", httpSession.getAttribute("role"));
            m.addAttribute("user_id", httpSession.getAttribute("user_id"));
            m.addAttribute("organization_lid", httpSession.getAttribute("organization_lid"));
            return "manual-approval-page";
        }
        return "redirect:/login#session-timeout";
    }

    @GetMapping("/offer-letter")
    public String generateOfferLetter(@RequestParam(value = "prof_id") String prof_id, Model model) {
        String user_id = (String) httpSession.getAttribute("user_id");
        if (user_id != null) {
            Object offerLetter = userDaoInterface.generateOfferLetter(prof_id);
            model.addAttribute("offerLetter", offerLetter);
            // JSONObject jsonObject =  new JSONObject(offerLetter);  
            // JSONArray resetData = jsonObject.getJSONArray("offer_letter_details");
            // String name = resetData.getJSONObject(0).getString("name");
            return "offer-letter";
        }
        return "redirect:/login#session-timeout";
       
    }
    @GetMapping("/offer-accept-reject")
    public String offerAcceptReject(Model m){
        String user_id = (String) httpSession.getAttribute("user_id");
        m.addAttribute("user_id", user_id);
        return "faculty/offerAcceptReject";
    }

    @GetMapping("/created-offer-letter-admin")
    public String createdOfferLetterAdmin(Model m){
        return "createdOfferLetterAdmin";
    }


}
