package com.visitingfaculty.validations;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.visitingfaculty.service.faculty_service.UserService;

@Component
public class jsoncheck {
    @Autowired
    validationsMethod checkVal;

    @Autowired
    UserService userService;

    // **************************************************************************************************---->For
    // Personal Details
    public String UserJsonCheck(String JsonString) {
        Boolean check = false;
        JSONObject jsonString = new JSONObject(JsonString);
        // for userinfo
        JSONObject insert_user_personal_details = jsonString.getJSONObject("insert_user_personal_details");
        JSONArray user_info = insert_user_personal_details.getJSONArray("user_info");
        JSONArray user_contact = insert_user_personal_details.getJSONArray("user_contact");
        for (int i = 0; i < user_info.length(); i++) {
            String f_name = user_info.getJSONObject(i).getString("f_name");
            String l_name = user_info.getJSONObject(i).getString("l_name");
            String email = user_info.getJSONObject(i).getString("email");
            String profilePhoto = user_info.getJSONObject(i).isNull("profile_url_path") ? "null"
                    : user_info.getJSONObject(i).getString("profile_url_path");
            String pancardPhoto = user_info.getJSONObject(i).isNull("pancard_url_path") ? "null"
                    : user_info.getJSONObject(i).getString("pancard_url_path");
            String aadharPhoto = user_info.getJSONObject(i).isNull("aadhar_card_url_path") ? "null"
                    : user_info.getJSONObject(i).getString("aadhar_card_url_path");

            if (!profilePhoto.equals("null")) {
                String replacedProfilePhoto = userService.uploadPhotos(profilePhoto);
                JsonString = JsonString.replace(profilePhoto, replacedProfilePhoto);

            }

            if (!pancardPhoto.equals("null")) {

                String replacedPancardPhoto = userService.uploadPhotos(pancardPhoto);
                JsonString = JsonString.replace(pancardPhoto, replacedPancardPhoto);

            } 

            if (!aadharPhoto.equals("null")) {

                String replacedAadharPhoto = userService.uploadPhotos(aadharPhoto);

                JsonString = JsonString.replace(aadharPhoto, replacedAadharPhoto);
            } 

            Boolean l_namecheck = checkVal.CheckWithNoSpectailChar(l_name);
            Boolean f_namecheck = checkVal.CheckWithNoSpectailChar(f_name);
            Boolean emailcheckvalue = checkVal.emailCheck(email);

            // for contact numbver
            String contact_number = user_contact.getJSONObject(i).getString("contact_number");
            Boolean contactcheck = checkVal.phoneNumberCheck(contact_number);

            if (l_namecheck == false || f_namecheck == false || emailcheckvalue == false || contactcheck == false) {
                check = false;
                break;
            } else {
                check = true;

            }
            System.out.println("Json In Validation : "+JsonString);
        }
        if (check == true) {
            System.out.println(JsonString);
            return JsonString;
        } else {
            return null;
        }

    }
    public String ConvertFileToBase64(String JsonString) {
        JSONObject jsonString = new JSONObject(JsonString);
        // for userinfo
        JSONArray proforma_status = jsonString.getJSONArray("insert_proforma_status");

            String file = proforma_status.getJSONObject(0).isNull("file_path") ? "null"
                    : proforma_status.getJSONObject(0).getString("file_path");

            if (!file.equals("null")) {

                String replacedAadharPhoto = userService.uploadPhotos(file);

                JsonString = JsonString.replace(file, replacedAadharPhoto);
            } 
       return JsonString;

    }

    // **************************************************************************************************---->For
    // Bank Details
    public String bankJsonCheck(String JsonString) {
        Boolean check = false;
        String replacedData = null;
        JSONObject jsonString = new JSONObject(JsonString);
        JSONArray jsonStringArray = jsonString.getJSONArray("insert_bank_data");

        System.out.println("JSON String Array for Bank : " + jsonStringArray);

        // Value From Key
        String account_number = jsonStringArray.getJSONObject(0).getString("account_number");
        String name = jsonStringArray.getJSONObject(0).getString("bank_name");
        String branch = jsonStringArray.getJSONObject(0).getString("branch_name");
        String ifsc_code = jsonStringArray.getJSONObject(0).getString("ifsc_code");
        String chequePhoto = jsonStringArray.getJSONObject(0).isNull("url_path") ? "null"
                : jsonStringArray.getJSONObject(0).getString("url_path");

        if (!chequePhoto.equals("null")) {

            String replacedchequePhoto = userService.uploadPhotos(chequePhoto);

            replacedData = JsonString.replace(chequePhoto, replacedchequePhoto);
        }

        Boolean account_numberCheck = checkVal.accountNumberCheck(account_number);
        Boolean nameCheck = checkVal.checkLengthThree(name);
        Boolean branchCheck = checkVal.checkLengthThree(branch);
        Boolean ifsc_codeCheck = checkVal.checkLengthThree(ifsc_code);

        if (account_numberCheck == true && nameCheck == true && branchCheck == true && ifsc_codeCheck == true) {
            check = true;
            if (!chequePhoto.equals("null")) {
                JsonString = replacedData;
            }
        }
        if (check == true) {
            return JsonString;
        } else {
            return null;
        }

    }

    // **************************************************************************************---->For
    // // Qualification Details
    public String qualificationCheck(String JsonString) {
        Boolean check = false;
        String replacedData = null;
        JSONObject jsonString = new JSONObject(JsonString);
        JSONArray qualification = jsonString.getJSONArray("qualificationDetails");
        for (int i = 0; i < qualification.length(); i++) {
            String topic_of_study = qualification.getJSONObject(i).getString("topic_of_study");
            String university = qualification.getJSONObject(i).getString("university");
            String institute = qualification.getJSONObject(i).getString("institute");
            String url_path = qualification.getJSONObject(i).isNull("url_path") ? "null"
                    : qualification.getJSONObject(i).getString("url_path");
            String year_of_passing = qualification.getJSONObject(i).getString("year_of_passing");

            System.err.println("urlPath" + url_path);
            if (!url_path.equals("null")) {

                String replacedPhoto = userService.uploadPhotos(url_path);

                replacedData = JsonString.replace(url_path, replacedPhoto);
            }

            Boolean topic_of_studyCheck = checkVal.checkLengthThree(topic_of_study);
            Boolean universityCheck = checkVal.checkLengthThree(university);
            Boolean instituteCheck = checkVal.checkLengthThree(institute);
            // Boolean url_pathCheck = checkVal.checkLengthThree(url_path);
            Boolean year_of_passingCheck = checkVal.yearCheck(year_of_passing);

            if (topic_of_studyCheck == true && universityCheck == true && instituteCheck == true
                    && year_of_passingCheck == true) {
                check = true;
                if (!url_path.equals("null")) {

                    JsonString = replacedData;
                }
                System.out.println("Changed String" + JsonString);
            }
        }
        if (check == true) {
            return JsonString;
        } else {
            return null;
        }

    }

    // **************************************************************************************************---->For
    // Award Section//

    public String JsonStringValues(String JsonString) {
        Boolean check = false;
        String replacedData = null;
        JSONObject jsonString = new JSONObject(JsonString);
        JSONArray award = jsonString.getJSONArray("insert_award");
        for (int i = 0; i < award.length(); i++) {
            String title = award.getJSONObject(i).getString("title");
            String organization_name = award.getJSONObject(i).getString("organization_name");
            String discription = award.getJSONObject(i).getString("description");
            String url_path = award.getJSONObject(i).isNull("url_path") ? "null"
                    : award.getJSONObject(i).getString("url_path");
            if (!url_path.equals("null")) {

                String replacedPhoto = userService.uploadPhotos(url_path);

                System.out.println("REplacedPhoto>>>>>>>> " + replacedPhoto);
                replacedData = JsonString.replace(url_path, replacedPhoto);
            }

            Boolean titlecheck = checkVal.checkLengthThree(title);
            Boolean organizationcheck = checkVal.checkLengthThree(organization_name);
            Boolean discriptioncheck = checkVal.checkLengthThree(discription);

            if (titlecheck == true && organizationcheck == true && discriptioncheck == true) {
                check = true;
                if (!url_path.equals("null")) {

                    JsonString = replacedData;
                }
            }
        }
        if (check == true) {
            System.out.println("JSON STring Converted" + JsonString);
            return JsonString;
        } else {
            return null;
        }
    }

    // *******************************************************************************---->For//
    // Research Details
    public String researchJsonCheck(String JsonString) {
        Boolean check = false;
        String replacedData = null;
        JSONObject jsonString = new JSONObject(JsonString);
        JSONArray research = jsonString.getJSONArray("insert_research");
        for (int i = 0; i < research.length(); i++) {
            String journal_name = research.getJSONObject(i).getString("title");
            String volume_year = research.getJSONObject(i).getString("volume_year");
            String number = research.getJSONObject(i).getString("description");
            String category = research.getJSONObject(i).getString("category");
            String url_path = research.getJSONObject(i).isNull("research_url_path") ? "null"
                    : research.getJSONObject(i).getString("research_url_path");

            if (!url_path.equals("null")) {

                String replacedPhoto = userService.uploadPhotos(url_path);

                replacedData = JsonString.replace(url_path, replacedPhoto);
            }

            Boolean journal_nameCheck = checkVal.checkLengthThree(journal_name);
            Boolean volume_yearCheck = checkVal.yearCheck(volume_year);
            Boolean numberCheck = checkVal.checkLengthThree(number);
            Boolean categoryCheck = checkVal.checkLengthThree(category);
            Boolean url_pathCheck = checkVal.checkLengthThree(url_path);

            System.out.println("journal_nameCheck : " + journal_nameCheck);
            System.out.println("volume_yearCheck : " + volume_yearCheck);
            System.out.println("numberCheck : " + numberCheck);
            System.out.println("categoryCheck : " + categoryCheck);
            System.out.println("url_pathCheck : " + url_pathCheck);

            if (journal_nameCheck == true && volume_yearCheck == true && numberCheck == true && categoryCheck == true
                    && url_pathCheck == true) {
                check = true;
                if (!url_path.equals("null")) {

                    JsonString = replacedData;
                }

            } else {
                check = false;
                break;
            }
        }
        if (check == true) {
            return JsonString;
        } else {
            return null;
        }

    }

    // **************************************************************************************************---->For
    // Publication Section
    public String publicationJsonCheck(String jsonString) {
        boolean check = false;
        String replacedData = null;
        JSONObject jsonstring = new JSONObject(jsonString);
        JSONArray publication = jsonstring.getJSONArray("insert_publication");
        for (int k = 0; k < publication.length(); k++) {
            String publicationrole = publication.getJSONObject(k).getString("publication_role");
            String title = publication.getJSONObject(k).getString("title");
            String publisher = publication.getJSONObject(k).getString("publisher");
            String publication_url_path = publication.getJSONObject(k).isNull("publication_url_path") ? "null"
                    : publication.getJSONObject(k).getString("publication_url_path");
            String year_of_publication = publication.getJSONObject(k).getString("year_of_publication");

            if (!publication_url_path.equals("null")) {

                String replacedPhoto = userService.uploadPhotos(publication_url_path);

                replacedData = jsonString.replace(publication_url_path, replacedPhoto);
            }

            Boolean publicationroleCheck = checkVal.checkLengthThree(publicationrole);
            Boolean titleCheck = checkVal.checkLengthThree(title);
            Boolean publisherCheck = checkVal.checkLengthThree(publisher);
            Boolean publication_url_pathCheck = checkVal.checkLengthThree(publication_url_path);
            Boolean year_of_publicationCheck = checkVal.yearCheck(year_of_publication);

            if (publicationroleCheck == true && titleCheck == true && publisherCheck == true
                    && publication_url_pathCheck == true
                    && year_of_publicationCheck == true) {
                check = true;
                if (!publication_url_path.equals("null")) {

                    jsonString = replacedData;
                }

            } else {
                check = false;
                break;
            }
        }
        if (check == true) {
            return jsonString;
        } else {
            return null;
        }

    }

    public String certificationJson(String JsonString) {
        Boolean check = false;
        String replacedData = null;
        JSONObject jsonstring = new JSONObject(JsonString);
        JSONArray certificate = jsonstring.getJSONArray("qualificationDetails");
        for (int i = 0; i < certificate.length(); i++) {
            String topic_of_study = certificate.getJSONObject(i).getString("topic_of_study");
            String institute = certificate.getJSONObject(i).getString("institute");
            String year_of_passing = certificate.getJSONObject(i).getString("year_of_passing");
            String url_path = certificate.getJSONObject(i).isNull("url_path") ? "null"
                    : certificate.getJSONObject(i).getString("url_path");
            if (!url_path.equals("null")) {

                String replacedPhoto = userService.uploadPhotos(url_path);

                replacedData = JsonString.replace(url_path, replacedPhoto);
            }
            Boolean topic_of_studyCheck = checkVal.checkLengthThree(topic_of_study);
            Boolean instituteCheck = checkVal.checkLengthThree(institute);
            Boolean year_of_passingCheck = checkVal.yearCheck(year_of_passing);

            if (topic_of_studyCheck == true && instituteCheck == true && year_of_passingCheck == true) {
                check = true;
                if (!url_path.equals("null")) {

                    JsonString = replacedData;
                }
            }

        }
        if (check == true) {
            return JsonString;
        } else {
            return null;
        }
    }
}