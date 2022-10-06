<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/login.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/simpleAlert.css">

  <title>Resume</title>
  <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images.jpg">
</head>

<body>
  <!-- id(body) of this div is used to hide as well as unhide the resume -->
  <jsp:include page="left-sidebar.jsp" />
  <main class="main">
    <jsp:include page="header.jsp" />

    <div id="body" class="container">
    </div>

    <!-- ***************************************************Image modal Start************************************************ -->

    <div class="image-preview-modal d-none">
        <div id="bank-form-area">
          <div class="container">
            <div class="d-flex justify-content-center align-items-center my-4">
              <h2> Image Preview </h2>
            </div>
  
            <div class="row">
              <div class="col-md-12 col-sm-12 d-flex justify-content-center">
                <img src="" alt="image-uploaded" id="image-uploaded" class="image-uploaded"
                  style="width:450px;height:300px;">
              </div>
            </div>
  
            <div class="d-flex justify-content-center">
              <button id="image-preview-cancel-button" class="btn btn-danger m-4">Cancel</button>
            </div>
          </div>
        </div>
      </div>

    <!-- ***************************************************Job Application Start************************************************ -->


    <!-- ***************************************************Job Application End************************************************** -->

  <div class="modal-loader d-none" id="main-loader">
    <svg version="1.1" id="L5" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
      y="0px" viewBox="0 0 100 100" enable-background="new 0 0 0 0" xml:space="preserve">
      <circle fill="#FF4136" stroke="none" cx="6" cy="50" r="6">
        <animateTransform attributeName="transform" dur="1s" type="translate" values="0 15 ; 0 -15; 0 15"
          repeatCount="indefinite" begin="0.1" />
      </circle>
      <circle fill="#FF851B" stroke="none" cx="30" cy="50" r="6">
        <animateTransform attributeName="transform" dur="1s" type="translate" values="0 10 ; 0 -10; 0 10"
          repeatCount="indefinite" begin="0.2" />
      </circle>
      <circle fill="#FFDC00" stroke="none" cx="54" cy="50" r="6">
        <animateTransform attributeName="transform" dur="1s" type="translate" values="0 5 ; 0 -5; 0 5"
          repeatCount="indefinite" begin="0.3" />
      </circle>
    </svg>
  </div>



  <!-- INCLUDE JS -->
  <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/SimpleAlert.js"></script>
  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <script src="${pageContext.request.contextPath}/js/leftsidebartoggle.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.bootpag.min.js"></script>
  <script id="script-data"></script>
  <script>
    let resume_lid = '${resume_lid}';
    let resumeinfo;
    console.log(resume_lid)
    console.log(resumeinfo)
    $.ajax({
      url: '${pageContext.request.contextPath}/get-user-details?resume_lid=' + resume_lid,
      type: 'POST',
      success: function (response) {
        let data = JSON.parse(response.value)
        resumeinfo = data;
        let personal_details = data.personal_details;
        let bank_details = data.bank_details;
        let pancardNumber = personal_details ? personal_details[0].pancard_no : '';
        let discontinuedStatus = resumeinfo.discontinue_status
        console.log('Resume info :', resumeinfo);

        let resume = `
      <div class="d-flex justify-content-end">

        <i id="download-btn" class="h1 fa-solid fa-download"></i>
      </div>

      <div class="shadow-lg">

        <!--------------------------------------Personal Details Section ---------------------------------------->`

        if (personal_details != null) {
          let tempCont = " ";
          let tempAdd = "";
          let tempEmail = "";

          if ( (personal_details[0].temp_contact_number) == null) {
            console.log("LOOP-1")
            tempCont = "N.A"
          }
          if ((personal_details[0].address).length == 0) {
            console.log("LOOP-2")
            tempAdd = "N.A"
          }
          if ((personal_details[0].temp_email).length == 0) {
            console.log("LOOP-3")
            tempEmail = "N.A"
          }

          resume += `<div class="edit-personal-details">
          <div class="position-relative personal-information-div-wrapper d-flex" style="cursor: pointer;">
            <div class="container p-0">
              <div class="personal-information-div">
                <div class="cover-div p-3 px-sm-4 p-lg-4"> <div class="row">
                    <div class="col-md-4 col-sm-12 col-lg-3">
                      <div class="avatar bg-white shadow-sm p-1">
                        <img src="imagedata/\${personal_details[0].profile_url_path}" alt="Passport Size photo" id="profile-photo-value" width="200"
                          height="200" />
                      </div>
                    </div>
                <div id="right-cover" class="col-md-8 col-sm-12 col-lg-9 p-5">
                      <div class="d-flex" style="color: #740E00;">
                        <h3><b id="first-name-value">\${personal_details[0].f_name}</b></h3> &nbsp &nbsp
                        <h3><b id="last-name-value">\${personal_details[0].l_name}</b></h3>
                      </div>
                    </div>
                  </div>
                </div>

                <div id="personal-details-div" class="pt-lg-4 pt-md-5 px-3 px-sm-4 px-lg-4 mt-1">
                  <div class="row">
                    <div id="personaldetails-left-side"
                      class="col-12 col-md-6 col-lg-6 col-sm-12 ps-4 pt-lg-5 pt-md-2 text-center">
                      <div class="row py-1">
                        <div class="col-md-5 col-sm-3">
                          <h6>Gender :</h6>
                        </div>
                        <div class="col-md-7 col-sm-9">
                          <p id="gender-value">\${personal_details[0].name}</p> 
                        </div>
                      </div>
                      <div class="row py-1">
                        <div class="col-md-5 col-sm-3">
                          <h6>Date of birth </h6>
                        </div>
                        <div class="col-md-7 col-sm-9">
                          <p id="date-of-birth-value">\${changeDateFormat(personal_details[0].date_of_birth)}</p>
                        </div>
                      </div>
                      <div class="row py-1">
                        <div class="col-md-5 col-sm-3">
                          <h6>Pancard </h6>
                        </div>
                        <div class="col-md-7 col-sm-9">
                          <p id="pancard-value">\${personal_details[0].pancard_no}</p>
                        </div>
                      </div>
                      <div class="row py-1">
                        <div class="col-md-5 col-sm-3">
                          <h6>Pancard Photo</h6>
                        </div>
                        <div class="col-md-7 col-sm-9">
                          <p id="pancard-photo"><i id="pancard-photo-preview" data-image="imagedata/\${personal_details[0].pancard_url_path}" class="fa-solid fa-image text-success pancard-photo-preview"></i></p>
                          </p>
                        </div>
                      </div>
                      <div class="row py-1">
                        <div class="col-md-5 col-sm-3">
                          <h6>Aadhar card </h6>
                        </div>
                        <div class="col-md-7 col-sm-9">
                          <p id="aadhar-card-value">\${personal_details[0].aadhar_card_no}</p>
                        </div>
                      </div>
                      <div class="row py-1">
                        <div class="col-md-5 col-sm-3">
                          <h6>Aadhar card Photo</h6>
                        </div>
                        <div class="col-md-7 col-sm-9">
                          <p id="aadhar-card-photo"><i id="aadhar-photo-preview" data-image="imagedata/\${personal_details[0].aadhar_card_url_path}" class="fa-solid fa-image text-success aadhar-photo-preview"></i></p>
                        </div>
                      </div>
                      <div class="row py-1">
                        <div class="col-md-5 col-sm-3">
                          <h6>Contact No.</h6>
                        </div>
                        <div class="col-md-7 col-sm-9">
                          <p id="contact-number-value">\${personal_details[0].contact_number}</p>
                        </div>
                      </div>
                      <div class="row py-1">
                        <div class="col-md-5 col-sm-3">
                          <h6>Secondary Contact No.</h6>
                        </div>
                        <div class="col-md-7 col-sm-9">
                          <p id="temp-contact-value">\${personal_details[0].temp_contact_number}\${tempCont}</p>
                        </div>
                      </div>
                    </div>

                    <div id="personaldetails-right-side" class="col-12 col-md-6 col-lg-6 col-sm-12 pt-lg-5 text-center">
                    
                      <div class="row py-2">
                        <div class="col-md-5 col-sm-3">
                          <h6>Email </h6>
                        </div>
                        <div class="col-md-7 col-sm-9">
                          <p id="email-value">\${personal_details[0].email}</p>
                        </div>
                      </div>
                      <div class="row py-2">
                        <div class="col-md-5 col-sm-3">
                          <h6>Secondary Email </h6>
                        </div>
                        <div class="col-md-7 col-sm-9">
                          <p id="temp-email-value">\${personal_details[0].temp_email}\${tempEmail}</p>
                        </div>
                      </div>
                      <div class="row py-2">
                        <div class="col-md-5 col-sm-3">
                          <h6>Permanent Address </h6>
                        </div>
                        <div class="col-md-7 col-sm-9">
                          <p id="address-value">\${personal_details[0].address}</p>
                        </div>
                      </div>
                      <div class="row py-2">
                        <div class="col-md-5 col-sm-3">
                          <h6 class="temporary-address-heading">Temporary Address </h6>
                        </div>
                        <div class="col-md-7 col-sm-9">`
                      if(personal_details[1].address)
                          {
                         resume+= `<p id="temporary-address-value">\${personal_details[1].address}\${tempAdd}</p>`
                          }
                          else
                          {
                            resume+= `<p id="temporary-address-value">N.A</p>`
                          }
                        resume+=  `
                        </div>
                      </div>
                      <div class="row py-1">
                        <div class="col-md-5 col-sm-3">
                          <h6>City</h6>
                        </div>
                        <div class="col-md-7 col-sm-9">
                          <p id="city-value">\${personal_details[0].city}</p>
                        </div>
                      </div>
                      <div class="row py-1">
                        <div class="col-md-5 col-sm-3">
                          <h6>Pincode</h6>
                        </div>
                        <div class="col-md-7 col-sm-9">
                          <p id="pincode-value">\${personal_details[0].pin_code}</p>
                        </div>
                      </div>
                      <div class="row py-2">
                        <div class="col-md-5 col-sm-3">
                          <h6 class="country-heading">Country </h6>
                        </div>
                        <div class="col-md-7 col-sm-9">
                          <p id="country-value">\${personal_details[0].nationality}</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="d-none personal-details-edit-box d-flex justify-content-center align-items-center">
              <i class="fa-solid fa-pen fa-2x text-white "></i>
            </div>
        </div>
        <hr />`
        }else {
          resume += `
        <div class="edit-personal-details">
            <div class="container p-0">
              <div class="personal-information-div">
                <div class="cover-div p-3 px-sm-4 p-lg-4"> <div class="row">
                    <div class="col-md-4 col-sm-12 col-lg-3">
                      <div class="avatar bg-white shadow-sm p-1">
                        <img src="profile.jpg" alt="Passport Size photo" id="profile-photo-value" width="200"
                          height="200" />
                      </div>
                    </div>
                <div id="right-cover" class="col-md-8 col-sm-12 col-lg-9 p-5">
                      <div class="d-flex" style="color: #740E00;">
                        <h3><b id="first-name-value">Name</b></h3> &nbsp &nbsp
                      </div>
                    </div>
                  </div>
                </div>

                <div id="personal-details-div" class="pt-lg-4 pt-md-5 px-3 px-sm-4 px-lg-4 mt-1">
               
                </div>
              </div>
              <br>        
              <br>        
         
        <hr />
        `
        }
        
        if("${level}" > 0) {
                resume += `
                <!------------------------------------------------ Feedback Section ------------------------------------------------>
                
                  <div id="feedback-div">
                    <div class="d-flex justify-content-center align-items-center" style="color: #740E00;">
                      <h3><b><i class="fa-solid fa-clipboard"></i>Feedback</b></h3>
                    </div>
                      <div class="card">
                          <div id="feedback-list">
                                        <table class="table table-responsive">
                                            <thead>
                                                <th>School</th>
                                                <th>Institute</th>
                                                <th>Program Name</th>
                                                <th>Course Name</th>
                                                <th>Acad year</th>
                                                <th>Acad Session</th>
                                                <th>Average</th>
                                            </thead>
                                            <tbody id="feedback-table">
                                          
                                            </tbody>
                                      </table>
                              </div>
                          </div>
                        </div>
                      <hr />`
                        }

        resume += `
        <!------------------------------------------------ Qualification Section ------------------------------------------------>

        <div class="position-relative qualification-div-wrapper d-flex" style="cursor: pointer;">
          <div class="container">
            <div id="qualification-div">
              <div class="d-flex justify-content-center align-items-center" style="color: #740E00;">
                <h3><b> <i class="fa-solid fa-graduation-cap"></i>Qualification</b></h3>
              </div>

              <div id="qualification-list">`

        if (data.resume_qualification != null) {
          for (let qual of data.resume_qualification) {

            if (qual.qualification_type_lid === 1 || qual.qualification_type_lid === 2 || qual
              .qualification_type_lid === 3) {

              resume += `<div class="qualification-item d-flex position-relative"> 
          <div class="text-block right container" >
                  <div class="card-body preview-qualification-div">
                    <h2 id="year-of-passing">\${qual.year_of_passing}</h2>

                    <div id="qualification-display-div" class=" px-3 px-sm-4 px-lg-4 mt-1">
                      <div class="row">

                        <div class="col-12 col-md-6 col-lg-6 col-sm-12">
                          <div class="row pt-lg-3">
                            <div class="col-6  col-md-6 ps-md-0 ps-0 ps-sm-0 col-lg-6 col-sm-6">
                              <p class="h5 pb-1">Title </p>
                              <p class="h5 py-1">Major Subject </p>
                              <p class="h5 py-1">University </p>

                            </div>
                            <div class="col-6 col-md-6 col-lg-6 col-sm-6">
                              <p id="">\${qual.name}</p>
                              <p id="">\${qual.topic_of_study}</p>
                              <p id="">\${qual.university}</p>
                            </div>
                          </div>
                        </div>

                        <div class="col-12 col-md-6 col-lg-6 col-sm-12">
                          <div class="row pt-lg-3">
                            <div class="col-6 ps-lg-5 col-md-6 ps-md-0 ps-0 ps-sm-0 col-lg-6 col-sm-6">
                              <p class="h5 pb-1">College</p>
                              <p class="h5 py-1">percentage</p>`
              if (qual.abbr == 'phd') {
                resume += `<p class="h5 py-1">Status </p>`
              }
              resume += `<p class="h5 py-1">Certificate</p>
                            </div>
                            <div class="col-6 ps-md-0 ps-0 col-md-6 col-lg-6 col-sm-6">
                              <p class="" id="">\${qual.institute}</p>
                              <p id="" class="">\${qual.percentile}</p>`
              if (qual.abbr == 'phd') {
                if (qual.is_completed == true) {
                  resume += `<p id="" class="">Awarded</p>`
                } else {
                  resume += `<p id="" class="">Persuing</p>`
                }
              }
              resume += `<p id=""><i id="qualification-certificate-display" data-image="imagedata/\${qual.url_path}"
                                  class="fa-solid fa-image text-success qualification-certificate-display"></i></p>

                            </div>
                          </div>
                          
                          </div>
                          </div>
                         
                    </div>

                  </div>
                </div>
                  <div class="d-none qualification-edit-box d-flex justify-content-center align-items-center" data-qualificationid = "\${qual.resume_qualification_lid}">
                           <i class="fa-solid fa-pen fa-2x text-white "></i>
                          </div>
                        </div>
              `
            }

          }
        }


        resume += `
            </div>
                
          </div>
          </div>
        </div>
        <hr />


        <!------------------------------------------------ Work Experience Section ------------------------------------------------>
        <div class="position-relative workexperience-div-wrapper d-flex" style="cursor: pointer;">
          <div class="container">
            <div id="workexperience-div">
              <div class="d-flex justify-content-center align-items-center" style="color: #740E00;">
                <h3><b> <i class="fa-solid fa-graduation-cap"></i>Work Experience</b></h3>
              </div>
              <div id="workexperience-list">`


        if (data.resume_experience != null) {
          for (let exp of data.resume_experience) {
            let experiencetype = "";
            if (exp.experience_type_lid == 5) {
              experiencetype = "Teaching Experience"

              resume += ` <div class="text-block right workexperience-item">
                  <div class="card-body">
                    <h2>Teaching Experience</h2>
                    <div id="workexperience-display-div" class=" px-3 px-sm-4 px-lg-4 mt-1">
                      <div class="row">
                        <div class="col-12 col-md-6 col-lg-6 col-sm-12">
                          <div class="row pt-lg-3">
                            <div class="col-6  col-md-6 ps-md-0 ps-0 ps-sm-0 col-lg-6 col-sm-6">
                              <p class="h5 pb-1">University </p>
                              <p class="h5 py-1">Subject taught </p>
                              <p class="h5 py-1">Designation </p>
                              <p class="h5 py-1">Program </p>
                            </div>
                            <div class="col-6 col-md-6 col-lg-6 col-sm-6">
                              <p id="">\${exp.employer_name}</p>
                              <p id="">\${exp.responsibilities}</p>
                              <p class="" id="">\${exp.designation}</p>
                              <p class="" id="">\${exp.description}</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-12 col-md-6 col-lg-6 col-sm-12">
                          <div class="row pt-lg-3">
                            <div class="col-6 ps-lg-5 col-md-6 ps-md-0 ps-0 ps-sm-0 col-lg-6 col-sm-6">
                              <p class="h5 py-1">Start Date </p>
                              <p class="h5 py-1">End date</p>
                              <p class="h5 py-1">Duration in Year </p>
                              <p class="h5 py-1">Pedagogy </p>
                            </div>
                            <div class="col-6 ps-md-0 ps-0 col-md-6 col-lg-6 col-sm-6">
                              <p id="" class="">\${changeDateFormat(exp.start_date)}</p>
                              <p id="" class="">\${changeDateFormat(exp.end_date)}</p>
                              <p id="" class="">\${exp.duration}</p>
                              <p id="" class="">\${exp.padagogy == '' ? "N.A" : exp.padagogy} </p>
                              <!-- <p id=""><i class="fa-solid fa-ban text-danger"></i></p> -->
                            </div>
                          </div>
                          </div>
                          </div>
                          </div>
                          </div>
                          <div class="d-none workexperience-edit-box d-flex justify-content-center align-items-center" data-experienceid="\${exp.resume_experience_lid}">
                             <i class="fa-solid fa-pen fa-2x text-white "></i>
                          </div>
                </div>`
            } else {
              experiencetype = "Industrial Experience"

              resume += ` <div class="text-block right workexperience-item">
                  <div class="card-body">
                    <h2>Industrial Experience</h2>
                    <div id="workexperience-display-div" class=" px-3 px-sm-4 px-lg-4 mt-1">
                      <div class="row">
                        <div class="col-12 col-md-6 col-lg-6 col-sm-12">
                          <div class="row pt-lg-3">
                            <div class="col-6  col-md-6 ps-md-0 ps-0 ps-sm-0 col-lg-6 col-sm-6">
                              <p class="h5 pb-1">Organization </p>
                              <p class="h5 py-1">Resposibility </p>
                              <p class="h5 py-1">Designation </p>
                            </div>
                            <div class="col-6 col-md-6 col-lg-6 col-sm-6">
                              <p id="">\${exp.employer_name}</p>
                              <p id="">\${exp.responsibilities}</p>
                              <p class="" id="">\${exp.designation}</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-12 col-md-6 col-lg-6 col-sm-12">
                          <div class="row pt-lg-3">
                            <div class="col-6 ps-lg-5 col-md-6 ps-md-0 ps-0 ps-sm-0 col-lg-6 col-sm-6">
                              <p class="h5 py-1">Start Date </p>
                              <p class="h5 py-1">End date</p>
                              <p class="h5 py-1">Duration in Year</p>
                            </div>
                            <div class="col-6 ps-md-0 ps-0 col-md-6 col-lg-6 col-sm-6">
                              <p id="" class="">\${changeDateFormat(exp.start_date)}</p>
                              <p id="" class="">\${changeDateFormat(exp.end_date)}</p>
                              <p id="" class="">\${exp.duration}</p>
                              <!-- <p id=""><i class="fa-solid fa-ban text-danger"></i></p> -->
                            </div>
                          </div>
                          </div>
                          </div>
                          </div>
                          </div>
                          <div class="d-none workexperience-edit-box d-flex justify-content-center align-items-center" data-experienceid="\${exp.resume_experience_lid}">
                             <i class="fa-solid fa-pen fa-2x text-white "></i>
                          </div>
                </div>`

            }
          }
        }
        resume += `</div>
               
          </div>
          </div>
        </div>
        <hr />
        <!-------------------------------------------------- Skills Section----------------------------------------------->

        <div class="skills-div-wrapper position-relative d-flex" style="cursor: pointer;">
          <div class="container">
            <div id="skills-div" class="px-3 px-sm-4 px-lg-4">
              <div class="d-flex justify-content-center align-items-center">
                <h3 class="mb-4 h3" style="color: #740E00;">
                  <img src="icons/skills.png" alt="" height="40px"><b> Skills</b>
                </h3>
              </div>
              <div class="container bootstrap snippets bootdeys">
                <div class="row">

                  <div class="col-md-6 col-sm-12 content-card">
                    <div class="card card-just-text" data-background="color" data-color="grey" data-radius="none">
                      <h4 class="title">Hard Skills</h4>

                  <div id="hard-skill-appending-div1" class="d-flex w-100 flex-wrap">`
        if (data.resume_skill_selected != null) {
          for (hardskill of data.resume_skill_selected) {
            if (hardskill.skill_type_lid === 2)
              resume += ` <div data-id="\${hardskill.skill_lid}" data-skillid = \${hardskill.resume_skill_selected_lid} data-skilltype="\${hardskill.skill_type_lid}" class="skill-pill-div text-center">
                                    \${hardskill.skill_name}\
                                </div>`
          }

          resume += ` </div>
                    </div> <!-- end card -->
                  </div>

                  <div class="col-md-6 col-sm-12 content-card">
                    <div class="card card-just-text" data-background="color" data-color="green" data-radius="none">
                      <h4 class="title">Soft Skills</h4>
                      <div id="soft-skill-appending-div1" class="d-flex w-100 flex-wrap">`
          for (softskill of data.resume_skill_selected) {
            if (softskill.skill_type_lid === 1) {
              resume += `<div data-id="\${softskill.skill_lid}" data-skillid = \${softskill.resume_skill_selected_lid} data-skilltype="\${softskill.skill_type_lid}" class="skill-pill-div text-center">
                                    \${softskill.skill_name}\
                                </div>`
            }
          }
        } else {
          resume += `                      </div>
                    </div> <!-- end card -->
                  </div>

                  <div class="col-md-6 col-sm-12 content-card">
                    <div class="card card-just-text" data-background="color" data-color="green" data-radius="none">
                      <h4 class="title">Soft Skills</h4>

                      <div id="soft-skill-appending-div1" class="d-flex w-100 flex-wrap">`
        }

        resume += ` </div>
                    </div> <!-- end card -->
                  </div>`
        resume += ` </div>
              </div>
            </div>
          </div>
          <div class="d-none skills-edit-box d-flex justify-content-center align-items-center">
            <i class="fa-solid fa-pen fa-2x text-white "></i>
          </div>
        </div>
        <hr>

        <!-------------------------------------------------- Award Section----------------------------------------------->

        <div class="award-list d-flex position-relative" style="cursor: pointer;">
          <div class="container">
            <div id="award-div" class="px-3 px-sm-4 px-lg-4">
              <div class="d-flex justify-content-center align-items-center">
                <h3 style="color: #740E00;"><i class="fa-solid fa-award"></i><b> Awards </b></h3>
              </div>
              <div id="award-preview-div">`
        if (data.resume_achievement != null) {
          for (let award of data.resume_achievement) {
            resume += `  <div class="award-item d-flex position-relative">             
            <div id="Award-display-div" class="px-3 px-sm-4 px-lg-4 mt-1 container">
                  <div class="row">

                    <div class="col-12 col-md-6 col-lg-6 col-sm-12">
                      <div class="row pt-lg-3">
                        <div class="col-6  col-md-6 ps-md-0 ps-0 ps-sm-0 col-lg-6 col-sm-6">
                          <p class="h5 pb-1">Award Name </p>
                          <p class="h5 py-1">organization </p>
                          <p class="h5 py-1">Organization Type </p>

                        </div>
                        <div class="col-6 col-md-6 col-lg-6 col-sm-6">
                          <p id="">\${award.title}</p>
                          <p id="">\${award.organization_name} </p>
                          <p id="">\${award.name}</p>
                        </div>
                      </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-6 col-sm-12">
                      <div class="row pt-lg-3">
                        <div class="col-6 ps-lg-5 col-md-6 ps-md-0 ps-0 ps-sm-0 col-lg-6 col-sm-6">
                          <p class="h5 pb-1">Place </p>
                          <p class="h5 pb-1">Recieved date </p>
                          <p class="h5 py-1">Certificate </p>
                        </div>
                        <div class="col-6 ps-md-0 ps-0 col-md-6 col-lg-6 col-sm-6">
                          <p class="" id="">\${award.description}</p>
                          <p class="" id="">\${changeDateFormat(award.achievement_date)}</p>
                          <p ><i id="award-certificate-display" data-image="imagedata/\${award.url_path}" class="fa-solid fa-image text-success award-certificate-display"></i></p>
                        </div>
                      </div>
                    </div>

                  </div>
                  </div>
                  <div class="d-none award-edit-box d-flex justify-content-center align-items-center" data-awardid="\${award.resume_achievement_lid}">
                  <i class="fa-solid fa-pen fa-2x text-white "></i>
                    </div>
                    </div>
                <hr>
              `

          }
        }



        resume += `</div>
            
          </div>
          </div>
         
        </div>
        <hr />

        <!------------------------------------------- Publication Section  ----------------------------------------->

        <div class="publication-list d-flex position-relative" style="cursor: pointer;">
          <div class="container">
            <div id="publication-div" class="px-3 px-sm-4 px-lg-4">
              <div class="d-flex justify-content-center align-items-center">
                <h3 class="mb-4 h3" style="color: #740E00;"> <b> Publications </b></h3>
              </div>
              <div id="publication-appending-div" class="bg-white">`
        if (data.resume_publication != null) {
          for (let public of data.resume_publication) {
            resume += `<div class="publication-item d-flex position-relative"> 
           <div class=" px-3 px-sm-4 px-lg-4 mt-1 container">
                  <div class="row">

                    <div class="col-12 col-md-6 col-lg-6 col-sm-12">
                      <div class="row pt-lg-3">
                        <div class="col-6  col-md-6 ps-md-0 ps-0 ps-sm-0 col-lg-6 col-sm-6">
                          <p class="h5 pb-1">Role </p>
                          <p class="h5 py-1">No. of Authors </p>
                          <p class="h5 py-1">Book Title </p>

                        </div>
                        <div class="col-6 col-md-6 col-lg-6 col-sm-6">
                          <p id="">\${public.publication_role}</p>
                          <p id="">\${public.no_of_authors} </p>
                          <p id="">\${public.title}</p>
                        </div>
                      </div>
                    </div>

                    <div class="col-12 col-md-6 col-lg-6 col-sm-12">
                      <div class="row pt-lg-3">
                        <div class="col-6 ps-lg-5 col-md-6 ps-md-0 ps-0 ps-sm-0 col-lg-6 col-sm-6">
                          <p class="h5 pb-1">Publisher </p>
                          <p class="h5 pb-1">Publication Year</p>
                          <p class="h5 py-1">Certificate </p>
                        </div>
                        <div class="col-6 col-md-6 col-lg-6 col-sm-6">
                          <p class="" id="">\${public.publisher}</p>
                          <p class="" id="">\${public.year_of_publication}</p>
                          <p><i id="publication-certificate-display" data-image="imagedata/\${public.publication_url_path}" class="fa-solid fa-image text-success publication-certificate-display"></i></p>

                        </div>
                      </div>
                    </div>
                    
                  </div>
                
              </div>
              <div class="d-none publication-edit-box d-flex justify-content-center align-items-center" data-publicationid="\${public.resume_achievement_lid}">
            <i class="fa-solid fa-pen fa-2x text-white "></i>
          </div>
          </div>
          <hr>
              
              `

          }
        }


        resume += `</div>
              
            </div>
          </div>
         
        </div>

        <hr />


        <!------------------------------------------- Research Section  ----------------------------------------->


        <div class="research-list d-flex position-relative" style="cursor: pointer;">
          <div class="container">
            <div id="research-div" class="px-3 px-sm-4 px-lg-4">
              <div class="d-flex justify-content-center align-items-center">
                <h3 class="mb-4 pt-2 h3" style="color: #740E00;"><i class="fa-solid fa-telescope"></i><b> Research
                  </b></h3>
              </div>

              <div id="research-appending-div">`
        if (data.resume_research != null) {
          for (let research of data.resume_research) {
            resume += `<div class="research-item d-flex position-relative"> 
           <div class=" ps-3 ps-sm-4 ps-lg-4 mt-1 container">
                  <div class="row">

                    <div class="col-12 col-md-6 col-lg-6 col-sm-12">
                      <div class="row pt-lg-3">
                        <div class="col-6  col-md-6 ps-md-0 ps-0 ps-sm-0 col-lg-6 col-sm-6">
                          <p class="h5 py-1">Title </p>
                          <p class="h5 py-1">Volume year </p>

                        </div>
                        <div class="col-6 col-md-6 col-lg-6 col-sm-6">
                          <p id="">\${research.title}</p>
                          <p id="">\${research.volume_year}</p>
                        </div>
                      </div>
                    </div>


                    <div class="col-12 col-md-6 col-lg-6 col-sm-12">
                      <div class="row pt-lg-3">
                        <div class="col-6 ps-lg-5 col-md-6 ps-md-0 ps-0 ps-sm-0 col-lg-6 col-sm-6">
                          <p class="h5 pb-1">Description </p>
                          <p class="h5 pb-1">Category </p>
                          <p class="h5 py-1">Certificate </p>
                        </div>
                        <div class="col-6 ps-md-0 ps-0 col-md-6 col-lg-6 col-sm-6">
                          <p class="" id="">\${research.description}</p>
                          <p class="" id="">\${research.category}</p>
                          <p><i id="research-certificate-display" data-image="imagedata/\${research.research_url_path}" class="fa-solid fa-image text-success research-certificate-display" ></i></p>

                        </div>
                      </div>
                    </div>

                  </div>
                </div>
                <div class="d-none research-edit-box d-flex justify-content-center align-items-center" data-researchid="\${research.resume_achievement_lid}">
            <i class="fa-solid fa-pen fa-2x text-white "></i>
          </div>
          </div>
          <hr>

                `

          }
        }

        resume += `</div>  
                          

            </div>
          </div>
        
        </div>
        <hr />

        <!------------------------------------------------ Certification Section ------------------------------------------------>

        <div class="position-relative certification-list d-flex" style="cursor: pointer;">
          <div class="container">
            <div id="certification-div">
              <div class="d-flex justify-content-center align-items-center" style="color: #740E00;">
                <h3><i class="fa-solid fa-certificate"></i><b>Professional Membership Certificate</b></h3>
              </div>

              <div id="certification-appending-div">`
        if (data.resume_qualification != null) {
          for (let qual of data.resume_qualification) {
            if (qual.qualification_type_lid === 4) {

              resume += `<div class="professional-certificate-item d-flex position-relative" data-qualificationlid="\${qual.resume_qualification_lid}"> 
                <div class="text-block right container" id="preview-qualification-div">
                  <div class="card-body preview-certification-div">

                    <div class=" px-3 px-sm-4 px-lg-4 mt-1">
                      <div class="row">

                        <div class="col-12 col-md-6 col-lg-6 col-sm-12">
                          <div class="row pt-lg-3">
                            <div class="col-6  col-md-6 ps-md-0 ps-0 ps-sm-0 col-lg-6 col-sm-6">
                              <p class="h5 pb-1">Certification name</p>
                            </div>
                            <div class="col-6 col-md-6 col-lg-6 col-sm-6">
                              <p id="">\${qual.topic_of_study}</p>
                            </div>
                          </div>
                        </div>

                        <div class="col-12 col-md-6 col-lg-6 col-sm-12">
                          <div class="row pt-lg-3">
                            <div class="col-6 ps-lg-6 col-md-6 ps-md-0 ps-0 ps-sm-0 col-lg-6 col-sm-6">
                              <p class="h5 pb-1">Institution</p>
                            </div>
                            <div class="col-6 ps-md-0 ps-0 col-md-6 col-lg-6 col-sm-6">
                              <p class="" id="">\${qual.institute}</p>
                            </div>
                          </div>
                        </div>

                        <div class="col-12 col-md-6 col-lg-6 col-sm-12">
                          <div class="row pt-lg-3">
                            <div class="col-6  col-md-6 ps-md-0 ps-0 ps-sm-0 col-lg-6 col-sm-6">
                              <p class="h5 pb-1">Recieved Year</p>
                            </div>
                            <div class="col-6 col-md-6 col-lg-6 col-sm-6">
                              <p id="">\${qual.year_of_passing}</p>
                            </div>
                          </div>
                        </div>

                        <div class="col-12 col-md-6 col-lg-6 col-sm-12">
                          <div class="row pt-lg-3">
                            <div class="col-6  col-md-6 ps-md-0 ps-0 ps-sm-0 col-lg-6 col-sm-6">
                              <p class="h5 pb-1">Certificate</p>
                            </div>
                            <div class="col-6 col-md-6 col-lg-6 col-sm-6">
                              <p ><i id="professional-certificate-display" data-image="imagedata/\${qual.url_path}" class="fa-solid fa-image text-success professional-certificate-display"></i></p>
                            </div>
                          </div>
                        </div>

                      </div>
                    </div>

                  </div>
                </div>
                <div class="d-none certification-edit-box d-flex justify-content-center align-items-center" data-certificationid="\${qual.resume_qualification_lid}">
            <i class="fa-solid fa-pen fa-2x text-white "></i>
          </div>
          </div>
          <hr>

                `
            }

          }
        }
        resume += `
              </div>
                 
            </div>
          </div>
         
        </div>
        <hr />



        <!------------------------------------------- Bank Details Section  ----------------------------------------->`
        if (bank_details != null) {


          resume += `<div class="bank-details-div-wrapper d-flex position-relative" style="cursor: pointer;">
          <div id="bank-details-div">
            <div class="px-3 px-sm-4 ps-lg-5">
              <div class="d-flex justify-content-center align-items-center">
                <h3 class="p-md-3 pb-sm-3" style="color: #740E00;"><b><i class="fa-solid fa-building-columns"></i>
                    Bank Details </b></h3>
              </div>
              <div class="row">
                <div id="left-side" class="col-12 col-md-6 col-lg-6 col-sm-12">
                  <div class="row pt-lg-3">
                    <div class="col-6 col-md-6 col-lg-6 col-sm-6 ps-lg-4 ps-md-0 ps-0 ps-sm-0">
                      <h6 class="pb-4">Name of Bank</h6>
                      <h6 class="pb-4">Branch</h6>
                      <h6 class="pb-4">IFSC Code</h6>
                    </div>
                    <div class="col-6 ps-md-0 ps-0 col-md-6 col-lg-6 col-sm-6">
                      <p id="bank-name-value">\${bank_details.bank_name}</p>
                      <p id="branch-name-value" class="pt-2">\${bank_details.branch_name}</p>
                      <p id="ifsc-code-value" class="pt-2">\${bank_details.ifsc_code}</p>
                    </div>
                  </div>
                </div>

                <div id="right-side" class="col-12 col-md-6 col-lg-6 col-sm-12">
                  <div class="row pt-lg-3">
                    <div class="col-6 ps-lg-4 col-md-6 ps-md-0 ps-0 ps-sm-0 col-lg-6 col-sm-6">
                      <h6 class="pb-4">MICR Code</h6>
                      <h6 class="pb-4">Account Number</h6>
                      <h6 class="pb-4">Account Type</h6>
                      <h6 class="pb-4">Cancalled Cheque Photo</h6>
                    </div>
                    <div class="col-6 ps-md-0 ps-0 col-md-6 col-lg-6 col-sm-6">`
          if (bank_details.micr_code != null) {

            resume += ` <p id="micr-code-value">\${bank_details.micr_code}</p>`
          } else {
            resume += ` <p id="micr-code-value">N.A</p>`

          }
          resume += ` <p id="account-number-value" class="pt-2">\${bank_details.account_number}</p>
                      <p id="account-type-value" class="pt-2">\${bank_details.account_type}</p>
                      <p id="cancelled-check-photo" class="pt-3">
                        <i id="cancelled-cheque-photo-preview" data-image="imagedata/\${bank_details.url_path}" class="fa-solid fa-image text-success cancelled-cheque-photo-preview"></i>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="d-none bank-details-edit-box d-flex justify-content-center align-items-center">
            <i class="fa-solid fa-pen fa-2x text-white "></i>
          </div>
        </div>
      </div>`

      
        } else {
          resume += `
          <div id="bank-details-div">
              <div class="d-flex justify-content-center align-items-center">
                <h3 class="p-md-3 pb-sm-3" style="color: #740E00;"><b><i class="fa-solid fa-building-columns"></i>Bank Details </b></h3>
              </div> 
                  
        </div>`
        }
        document.querySelector('#body').insertAdjacentHTML('afterbegin', resume);
        feedBack(pancardNumber);

        if('${level} != 0') {

          if(discontinuedStatus != null) {
            if(discontinuedStatus[0].is_discontinued) {
              console.log(discontinuedStatus)
              divToAppend = ` <div class="text-danger" style="font-size:larger;">This Faculty is Discontinued in Program: \${discontinuedStatus[0].program_name} and Subject:
                \${discontinuedStatus[0].module}  </div>
                `
                $('#body').prepend(divToAppend)
              }
            }
        }
      },

      error: function (error) {
        console.log("error", error)
      }
    });

    function feedBack(pancardNumber){

      if("${level}" > 0) {

             $.ajax({
                        url: 'https://dev-portal.svkm.ac.in:8080/vfApi/getFeedback?panCardNo=' + pancardNumber,
                        type: 'GET',
                        success: function (response) {

                          console.log("Value of the feedback from ajax>>>>>>>>>>>>>>>>>>",response.value)

                          if(response != ''){

                            for(data of response){
                            let feedbackData = `<tr>
                                                      <td>\${data.school}</td>
                                                      <td>\${data.inst}</td>
                                                      <td>\${data.programName}</td>
                                                      <td>\${data.courseName}</td>
                                                      <td>\${data.acadYear}</td>
                                                      <td>\${data.acadSession}</td>
                                                      <td>\${data.avg}</td>
                                                  </tr>`
                                                     }
                         
                          document.querySelector("#feedback-table").innerHTML = feedbackData

                          } else {

                            console.log("else of ajax success function for feedback")
                            document.querySelector("#feedback-list").innerHTML = '<h4 align="center">--- No Feedback Available ---</h4>'

                          }
                         
                        },
                        error: function (error) {

                            console.log("ERROR")

                        }

                    })
             }
    }

    //----------------------------------function to display images---------------------------------------------------

    document.querySelector('#body').addEventListener('click', function (e) {
      console.log(e.target);

      if (e.target.classList.contains('qualification-certificate-display') || e.target.classList.contains(
          'award-certificate-display') || e.target.classList.contains('publication-certificate-display') || e.target
        .classList.contains('research-certificate-display') || e.target.classList.contains(
          'professional-certificate-display') || e.target.classList.contains('aadhar-photo-preview') || e.target
        .classList.contains('pancard-photo-preview') || e.target.classList.contains(
          'cancelled-cheque-photo-preview')) {

        document.getElementById('body').classList.add('d-none');
        document.querySelector('.image-preview-modal').classList.remove('d-none');
        if(e.target.dataset.image === 'imagedata/null'){
          document.querySelector(".image-uploaded").src = '${pageContext.request.contextPath}/image/image-not-found.png';
        } else {
          document.querySelector(".image-uploaded").src = e.target.dataset.image;
        }
        console.log(e.target.dataset.image)
      }
    })

    
    document.querySelector('#image-preview-cancel-button').addEventListener('click', function (e) {
      document.getElementById('body').classList.remove('d-none');
      document.querySelector('.image-preview-modal').classList.add('d-none');
      // document.getElementById("image-uploaded").src = " ";
    })

  </script>
</body>

</html>