<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/style.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/login.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/simpleAlert.css">
  
    <title>Create Performa</title>
    <link rel="icon" type="image/x-icon" href="images.jpg">
</head>
<body>

    <jsp:include page="left-sidebar.jsp" />
  <main class="main">
    <jsp:include page="header.jsp" />

   <div id="performa-creation-div">


<!----------------------------------------------------------Performer Table---------------------------------------------------------->
    <div class="card card-table faculty-table-body ">
        <div
            class="card-header table-card-header  text-uppercase d-flex align-items-center justify-content-between">
            <div class="">
                <h5>Please Fill in Details to Allot Subjects - Proforma</h5>
            </div>
            <div>
                <button class="btn add-btn ms-auto" type="button"
                    id="add-moreAllottedSubjects"><i class="fas fa-plus"></i></button>
            </div>
        </div>
      
        <div class="card-body table-responsive">
            <table class="table jobfacultytable" id="">
                <thead>
                    <th>Program&nbsp;<span class="text-danger fs-5">*</span></th>
                    <th>Acad Session&nbsp;<span class="text-danger fs-5">*</span></th>
                    <!-- <th>New Subject-?&nbsp;<span class="text-danger fs-5">*</span></th> -->
                    <th>Subject&nbsp;<span class="text-danger fs-5">*</span></th>
                    <th>Date Of Commencement Of Program&nbsp;<span class="text-danger fs-5">*</span></th>
                    <th>Subject Teaching Hours&nbsp;<span class="text-danger fs-5">*</span></th>
                    <th>Rate Per Hour&nbsp;<span class="text-danger fs-5">*</span></th>
                    <th>Total No. of Hours Allotted&nbsp;<span class="text-danger fs-5">*</span></th>
                    <th>No. of Division&nbsp;<span class="text-danger fs-5">*</span></th>
                    <th>Student Count Per Division&nbsp;<span class="text-danger fs-5">*</span></th>                 
                    <th>Subject under AOL / OBE Process&nbsp;<span class="text-danger fs-5">*</span></th>                
                    <th>Action</th>               
                </thead>
    
                <tbody class="job-application-body">
                    <tr class='job-tr'>
                        <td class="custom-select-div"><input class="form-control job-program" type="text">
                            <ul class="form-control d-none" id="job-program-list">

                            </ul>
                        </td>
                        <td class="custom-select-div" ><input class="form-control job-session" type="text"> 
                            <ul class="form-control d-none" id="job-session-list">
                                
                            </ul>
                        </td>
                        <!-- <td><input class="form-control" type="text"> </td> -->
                        <td class="custom-select-div" ><input class="form-control job-subject" type="text"> 
                            <ul class="form-control d-none" id="job-subject-list">
                              
                            </ul>
                        </td>
                        <td><input class="form-control job-date" type="date"> </td>
                        <td><input class="form-control job-hours" type="text"> </td>
                        <td><input class="form-control job-rate" type="text"> </td>
                        <td><input class="form-control job-total-hours" type="text"> </td>
                        <td><input class="form-control job-division" type="text"> </td>
                        <td><input class="form-control job-count" type="text"> </td>
                        <td><select class="form-control job-process">
                                <option value="0">-Select-</option>
                                <option value="AOL">AOL</option>
                                <option value="OBL">OBE</option>
                            </select> 
                        </td>
                    </tr>
                </tbody>  
                      
                             
            </table>
               <div class="d-flex justify-content-center">
                   <button id="job-application-cancel-btn" class="btn btn-danger m-4">Cancel</button>
                   <button id="job-application-submit-btn" class="btn btn-success m-4">Submit</button>
               </div>
        </div>
    </div>   
</div> 
  

  <div class="image-preview-modal d-none" style="height: calc(100vh - 100px); margin-top: 100px;">
    <div id="bank-form-area">
      <div class="container">
        <div class="d-flex justify-content-center align-items-center my-4">
          <h2> Image Preview </h2>
        </div>

        <div class="row">
          <div class="col-md-12 col-sm-12 d-flex justify-content-center">
            <img src="" alt="image-uploaded" id="image-uploaded" class="image-uploaded"
              style="width:100%;">
          </div>
        </div>

        <div class="d-flex justify-content-center">
          <button id="image-preview-cancel-button" class="btn btn-danger m-4">Cancel</button>
        </div>
      </div>
    </div>
  </div>
</main>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/SimpleAlert.js"></script>
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
    <script src="${pageContext.request.contextPath}/js/leftsidebartoggle.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.bootpag.min.js"></script>
    <script id="script-data"></script>

    <script>

    //    $.ajax({
    //         url: 'https://dev-portal.svkm.ac.in:8080/vfApi/getSchoolsList',
    //         type: 'get',
    //         success: function (response) {
    //           let selectList = ''
    //             for (let desig of response) {
    //             selectList +=
    //               `<li>     
    //                   <div class="job-program-item col-md-10 col-sm-10 col-12" data-name="\${desig.collegeName}" data-id="\${desig.schoolObjId}" >\${desig.collegeName}</div>
    //               </li>`
    //           }
    //           document.querySelector("#job-program-list").insertAdjacentHTML("beforeend",selectList)
    //         },
    //         error: function (error) {
    //           console.log("Error::::::::::::", error);
    //         }
    //       })
    //       $.ajax({
    //         url: 'https://dev-portal.svkm.ac.in:8080/vfApi/getSchoolsList',
    //         type: 'get',
    //         success: function (response) {
    //             let selectList = ''
    //           for (let desig of response) {
    //             selectList +=
    //               `<li>     
    //                   <div class="job-session-item col-md-10 col-sm-10 col-12" data-name="\${desig.collegeName}" data-id="\${desig.schoolObjId}" >\${desig.collegeName}</div>
    //               </li>`
    //           }
    //           document.querySelector("#job-session-list").insertAdjacentHTML("beforeend",selectList)
    //         },
    //         error: function (error) {
    //           console.log("Error::::::::::::", error);
    //         }
    //       })
    //       $.ajax({
    //         url: 'https://dev-portal.svkm.ac.in:8080/vfApi/getSchoolsList',
    //         type: 'get',
    //         success: function (response) {
    //             let selectList = ''
    //           for (let desig of response) {
    //             selectList +=
    //               `<li>     
    //                   <div class="job-subject-item col-md-10 col-sm-10 col-12" data-name="\${desig.collegeName}" data-id="\${desig.schoolObjId}" >\${desig.collegeName}</div>
    //               </li>`
    //           }
    //           document.querySelector("#job-subject-list").insertAdjacentHTML("beforeend",selectList)
    //         },
    //         error: function (error) {
    //           console.log("Error::::::::::::", error);
    //         }
    //       })

    //       document.querySelector('#performa-creation-div').addEventListener('click', function (e) {

    //       if (e.target.classList.contains("job-program")) {
    //         document.getElementById('job-program-list').classList.remove("d-none");
    //       } else {
    //         document.getElementById('job-program-list').classList.add("d-none");
    //       }
          
    //       if (e.target.classList.contains("job-program-item") || findClosest(e.target,'job-program-item')) {
    //         console.log('target', e.target)
    //         let id = e.target.classList.contains("job-program-item") ? e.target.dataset.id : e.target.parentElement.dataset.id;
    //         let name = e.target.classList.contains("job-program-item") ? e.target.dataset.name : e.target.parentElement.dataset.name
    //         document.querySelector('.job-program').value = name;
    //         document.querySelector('.job-program').dataset.id = id;
    //         document.querySelector('.job-program').dataset.name = name;
    //         console.log('value', name + id);
    //         document.getElementById('job-program-list').classList.add("d-none");
    //       }

    //       if (e.target.classList.contains("job-session")) {
    //         document.getElementById('job-session-list').classList.remove("d-none");
    //       } else {
    //         document.getElementById('job-session-list').classList.add("d-none");
    //       }
          
    //       if (e.target.classList.contains("job-session-item") || findClosest(e.target,'job-session-item')) {
    //         console.log('target', e.target)
    //         let id = e.target.classList.contains("job-session-item") ? e.target.dataset.id : e.target.parentElement.dataset.id;
    //         let name = e.target.classList.contains("job-session-item") ? e.target.dataset.name : e.target.parentElement.dataset.name
    //         document.querySelector('.job-session').value = name;
    //         document.querySelector('.job-session').dataset.id = id;
    //         document.querySelector('.job-session').dataset.name = name;
    //         console.log('value', name + id);
    //         document.getElementById('job-session-list').classList.add("d-none");
    //       }

    //       if (e.target.classList.contains("job-subject")) {
    //         document.getElementById('job-subject-list').classList.remove("d-none");
    //       } else {
    //         document.getElementById('job-subject-list').classList.add("d-none");
    //       }
          
    //       if (e.target.classList.contains("job-subject-item") || findClosest(e.target,'job-subject-item')) {
    //         console.log('target', e.target)
    //         let id = e.target.classList.contains("job-subject-item") ? e.target.dataset.id : e.target.parentElement.dataset.id;
    //         let name = e.target.classList.contains("job-subject-item") ? e.target.dataset.name : e.target.parentElement.dataset.name
    //         document.querySelector('.job-subject').value = name;
    //         document.querySelector('.job-subject').dataset.id = id;
    //         document.querySelector('.job-subject').dataset.name = name;
    //         console.log('value', name + id);
    //         document.getElementById('job-subject-list').classList.add("d-none");
    //       }
    //       })

      document.querySelector('#image-preview-cancel-button').addEventListener('click', function (e) {
      document.getElementById('performa-creation-div').classList.remove('d-none');
      document.querySelector('.image-preview-modal').classList.add('d-none');
    //   document.getElementById("image-uploaded").src = " ";
      });

    document.querySelector('#performa-creation-div').addEventListener('click', function (e) {

      if (e.target.classList.contains('qualification-certificate-display') || e.target.classList.contains(
          'award-certificate-display') || e.target.classList.contains('publication-certificate-display') || e.target
        .classList.contains('research-certificate-display') || e.target.classList.contains(
          'professional-certificate-display') || e.target.classList.contains('aadhar-photo-preview') || e.target
        .classList.contains('pancard-photo-preview') || e.target.classList.contains(
          'cancelled-cheque-photo-preview')) {
        document.getElementById('performa-creation-div').classList.add('d-none');
        document.querySelector('.image-preview-modal').classList.remove('d-none');
        if(e.target.dataset.image === 'imagedata/null'){
          document.querySelector(".image-uploaded").src = '${pageContext.request.contextPath}/image/image-not-found.png';
        } else {
          document.querySelector(".image-uploaded").src = e.target.dataset.image;
        }
      }
    })


    //************************************Function's for Job Application Table***************************************************

    //Job Application Table Add Button
    document.querySelector('.add-btn').addEventListener('click',function(){        
        let row = `                
                <tr class='job-tr'>
                    <td><input class="form-control job-program" type="text"> </td>
                    <td><input class="form-control job-session" type="text"> </td>
                    <!-- <td><input class="form-control" type="text"> </td> -->
                    <td><input class="form-control job-subject" type="text"> </td>
                    <td><input class="form-control job-date" type="date"> </td>
                    <td><input class="form-control job-hours" type="text"> </td>
                    <td><input class="form-control job-rate" type="text"> </td>
                    <td><input class="form-control job-total-hours" type="text"> </td>
                    <td><input class="form-control job-division" type="text"> </td>
                    <td><input class="form-control job-count" type="text"> </td>
                    <td><select class="form-control job-process">
                            <option value="0">-Select-</option>
                            <option value="AOL">AOL</option>
                            <option value="OBL">OBE</option>
                        </select> 
                    </td>
                    <td><i class="fa-trash fa-solid text-danger delete-row"></td>
                </tr>`

        document.querySelector('.job-application-body').insertAdjacentHTML('beforeend',row);
    });

    //Job Application remove Row Button
    document.querySelector('.faculty-table-body').addEventListener('click',function(e){
       if(e.target.classList.contains('delete-row'))
       {
           e.target.parentElement.parentElement.remove();
       }

    });

    //Job Application Cancel Button
    document.querySelector('#job-application-cancel-btn').addEventListener('click',function(){
        let confurm = confirm('Do you really want to cancel');
        if(confurm)
        {
        location.href = '${pageContext.request.contextPath}/job-performer-page';
        }
    })

    document.querySelector('#job-application-submit-btn').addEventListener('click',function(){
     
     let jobArrar = {"insert_proforma" : []};
     let jobApllicationData = document.querySelectorAll('.job-tr');
     for(let i=0 ; i<jobApllicationData.length;i++)
     {
    
        let proforma_id = jobApllicationData[i].dataset.proforma
      let program = jobApllicationData[i].querySelector('.job-program').value;
      let session = jobApllicationData[i].querySelector('.job-session').value;
      let subject = jobApllicationData[i].querySelector('.job-subject').value;
      let date = jobApllicationData[i].querySelector('.job-date').value;
      let hours = jobApllicationData[i].querySelector('.job-hours').value;
      let rate = jobApllicationData[i].querySelector('.job-rate').value;
      let totalhours = jobApllicationData[i].querySelector('.job-total-hours').value;
      let division = jobApllicationData[i].querySelector('.job-division').value;
      let count = jobApllicationData[i].querySelector('.job-count').value;
      let process = jobApllicationData[i].querySelector('.job-process').value;
      
      obj = {
        application_lid:'${application_lid}',
        proforma_id : proforma_id,    
        module:subject,        
        teaching_hours:hours,
        program_id: "1111",
        acad_session:session,
        commencement_date_of_program:date,
        rate_per_hours:rate,
        total_no_of_hrs_alloted:totalhours,
        no_of_division:division,
        student_count_per_division:count,
        aol_obe:process,
        level : 1,
        status_lid : 1,


      }
      jobArrar.insert_proforma.push(obj);
     }
     console.log("Array : ",JSON.stringify(jobArrar));

     
     //fetch api
     function postdata() {
          url = "${pageContext.request.contextPath}/create-proforma";
          params = {
            method: 'post',
            headers: {
              'content-Type': 'application/json'
            },
            body: JSON.stringify(jobArrar),
          }
          fetch(url, params).then((data) => {
            if (data.status == 200) {
                console.log(data);
                location.href = '${pageContext.request.contextPath}/performa'
            } else {
              alert('Check Details Input');
            }
          })
        }
        postdata();
    });
     
//------------------------------------------------------Appending Tables-------------------------------------------------------------

    let resumeinfo;
    $.ajax({
      url: '${pageContext.request.contextPath}/performer-resume?application_lid=${application_lid}',
      type: 'POST',
      async : false,
      success: function (response) {
        let data = JSON.parse(response.value)
        resumeinfo = data;
      },
      error: function (error) {
        console.log("error", error)
      }
    });
    console.log('Outside Ajax : ',resumeinfo)
let proformaTable = ``
if(resumeinfo.proforma_details != null) {
let data = resumeinfo.proforma_details

    for(let i = 0 ; i< data.length ; i++) {
        
        proformaTable += `
        <tr class='job-tr' data-proforma = \${data[i].proforma_id}>
                        <td class="custom-select-div"><input class="form-control job-program" value = "\${data[i].program_id}" type="text">
                            <ul class="form-control d-none" id="job-program-list">
                            </ul>
                        </td>
                        <td class="custom-select-div" ><input class="form-control job-session" value="\${data[i].acad_session}" type="text"> 
                            <ul class="form-control d-none" id="job-session-list">
                                
                            </ul>
                        </td>
                        <!-- <td><input class="form-control" type="text"> </td> -->
                        <td class="custom-select-div" ><input class="form-control job-subject" value="\${data[i].module}" type="text"> 
                            <ul class="form-control d-none" id="job-subject-list">
                              
                            </ul>
                        </td>
                        <td><input class="form-control job-date" type="date" value="\${data[i].commencement_date_of_program}"> </td>
                        <td><input class="form-control job-hours" type="text" value="\${data[i].teaching_hours}"> </td>
                        <td><input class="form-control job-rate" type="text" value="\${data[i].rate_per_hours}"> </td>
                        <td><input class="form-control job-total-hours" type="text" value="\${data[i].total_no_of_hrs_alloted}"> </td>
                        <td><input class="form-control job-division" type="text" value="\${data[i].no_of_division}"> </td>
                        <td><input class="form-control job-count" type="text" value="\${data[i].student_count_per_division}"> </td>
                        <td><select class="form-control job-process">
                                <option value="0">-Select-</option>
                                <option value="AOL">AOL</option>
                                <option value="OBL">OBE</option>
                            </select> 
                        </td>
                    </tr>`
                                let element = document.querySelector('.job-application-body')
                                element.innerHTML = proformaTable

                                element.querySelector('.job-process').value = data[i].aol_obe

            
    }
}

let resumetable =``
if(resumeinfo.personal_details != null)
{
resumetable+=`<div class="card">
    <h2 align="center">\${resumeinfo.personal_details[0].f_name} \${resumeinfo.personal_details[0].l_name}</h2>
</div>`
}
resumetable+=  `<!-------------------------------------------------------Qualification Table----------------------------------------------------->
    <div class="card card-table">
        <div
            class="card-header table-card-header text-uppercase d-flex align-items-center justify-content-between">
            <div>
                <h5><i class="fa-solid fa-graduation-cap"></i> Academic Qualification</h5>
            </div>
        </div>
        <div class="card-body table-responsive">
            <table class="table">
                <thead>
                    <th>Title</th>
                    <th>Major Subject</th>                    
                    <th>University</th>                    
                    <th>College</th>
                    <th>percentage</th>
                    <th>Certificate</th>
                 </thead>
                <tbody> `
                    if (resumeinfo.resume_qualification != null)
                    {
                        for (let qual of resumeinfo.resume_qualification)
                        {
                            if (qual.qualification_type_lid === 1 || qual.qualification_type_lid === 2 || qual.qualification_type_lid === 3)
                            {
                                resumetable+=`<tr>
                                               <td>\${qual.name}</td>
                                               <td>\${qual.topic_of_study}</td>
                                               <td>\${qual.university}</td>
                                               <td>\${qual.institute}</td>
                                               <td>\${qual.percentile}</td>
                                               <td><p id=""><i id="qualification-certificate-display" data-image="imagedata/\${qual.url_path}"class="fa-solid fa-image text-success qualification-certificate-display"></i></p></td>
                                              </tr> 
                                              `
                            }
                        }
                    }                  
 resumetable+= `</tbody>
            </table>
        </div>
    </div>
<!----------------------------------------------------------Work Experience---------------------------------------------------------->

<div class="card card-table">
    <div
        class="card-header table-card-header text-uppercase d-flex align-items-center justify-content-between">
        <div>
            <h5><i class="fa-solid fa-cog"> </i> Work Experinece</h5>
        </div>
    </div>
    <div class="card-body table-responsive">
        <table class="table">
            <thead>
                <th>Experince Type</th>
                <th>Key role</th>                    
                <th>Designation</th>                    
                <th>Start Date</th>
                <th>End date</th>
                <th>Duration</th>
             </thead>
            <tbody>` 
                if (resumeinfo.resume_experience != null)
                {
                    for (let exp of resumeinfo.resume_experience)
                    {
                        let experiencetype = "";
                        if (exp.experience_type_lid == 5) {
                          experiencetype = "Teaching Experience"
                        } else {
                          experiencetype = "Industrial Experience"
                        }

                        resumetable+=                            
                            `<tr>
                                <td>\${experiencetype}</td>
                                <td>\${exp.responsibilities}</td>
                                <td>\${exp.designation}</td>
                                <td>\${exp.start_date}</td>
                                <td>\${exp.end_date}</td>
                                <td>\${exp.duration}</td>
                             </tr>`
                    }
                }                   
        
resumetable+= `</tbody>
        </table>
    </div>
</div>
<!----------------------------------------------------------Award Table-------------------------------------------------------------->

<div class="card card-table">
    <div
        class="card-header table-card-header text-uppercase d-flex align-items-center justify-content-between">
        <div>
            <h5><i class="fa-solid fa-award"></i> Awards</h5>
        </div>
    </div>
    <div class="card-body table-responsive">
        <table class="table">
            <thead>
                <th>Award Name</th>
                <th>Organization</th>                    
                <th>Organization Type</th>                    
                <th>Place</th>
                <th>Recieved date</th>
                <th>Certificate</th>
             </thead>
            <tbody>`
                if (resumeinfo.resume_achievement != null)
                {
                    for (let award of resumeinfo.resume_achievement)
                    {
                        resumetable+= `
                            <tr>
                                <td>\${award.title}</td>
                                <td>\${award.organization_name}</td>
                                <td>\${award.name}</td>
                                <td>\${award.description}</td>
                                <td>\${award.achievement_date}</td>
                                <td><p ><i id="award-certificate-display" data-image="imagedata/\${award.url_path}" class="fa-solid fa-image text-success award-certificate-display"></i></p></td>
                            </tr>` 
                    }
                }                    
                                  
resumetable+=`</tbody>
        </table>
    </div>
</div>

<!---------------------------------------------------------Publication Table-------------------------------------------------------->

<div class="card card-table">
    <div
        class="card-header table-card-header text-uppercase d-flex align-items-center justify-content-between">
        <div>
            <h5><i class="fa-solid fa-clipboard"></i> Publication</h5>
        </div>
    </div>
    <div class="card-body table-responsive">
        <table class="table">
            <thead>
                <th>Role</th>
                <th>No. of Authors</th>                    
                <th>Book Title</th>                    
                <th>Publisher</th>
                <th>Publication Year</th>
                <th>Certificate</th>
             </thead>
            <tbody>`    
                if (resumeinfo.resume_publication != null)
                {
                    for (let public of resumeinfo.resume_publication)
                    {
                        resumetable+= `
                            <tr>
                                <td>\${public.publication_role}</td>
                                <td>\${public.no_of_authors}</td>
                                <td>\${public.title}</td>
                                <td>\${public.publisher}</td>
                                <td>\${public.year_of_publication}</td>
                                <td> <p><i id="publication-certificate-display" data-image="imagedata/\${public.publication_url_path}" class="fa-solid fa-image text-success publication-certificate-display"></i></p></td>
                            </tr>`
                    }
                }                
          
resumetable+= `</tbody>
        </table>
    </div>
</div>

<!----------------------------------------------------------Research Table---------------------------------------------------------->

<div class="card card-table">
    <div
        class="card-header table-card-header text-uppercase d-flex align-items-center justify-content-between">
        <div>
            <h5><i class="fa-solid fa-pie-chart"></i> Research</h5>
        </div>
    </div>
    <div class="card-body table-responsive">
        <table class="table">
            <thead>
                <th>Title</th>
                <th>Volume year</th>                    
                <th>Description</th>                    
                <th>Category</th>
                <th>Certificate</th>
             </thead>
            <tbody>` 
                if (resumeinfo.resume_research != null)
                {
                    for (let research of resumeinfo.resume_research)
                    {
                        resumetable+=`
                            <tr>
                                <td>\${research.title}</td>
                                <td>\${research.volume_year}</td>
                                <td>\${research.description}</td>
                                <td>\${research.category}</td>
                                <td>  <p><i id="research-certificate-display" data-image="imagedata/\${research.research_url_path}" class="fa-solid fa-image text-success research-certificate-display" ></i></p></td>
                            </tr>` 
                    }
                }                   
       
resumetable+= `</tbody>
        </table>
    </div>
</div>

<!-----------------------------------------------------Profectional Certification---------------------------------------------------->

<div class="card card-table">
    <div
        class="card-header table-card-header text-uppercase d-flex align-items-center justify-content-between">
        <div>
            <h5><i class="fa-solid fa-certificate"></i> Profectional Certification</h5>
        </div>
    </div>
    <div class="card-body table-responsive">
        <table class="table">
            <thead>
                <th>Certification Name</th>
                <th>Recieved Year</th>                    
                <th>Institution</th>                    
                <th>Certificate</th>
             </thead>
            <tbody>`
                if (resumeinfo.resume_qualification != null)
                {
                    for (let qual of resumeinfo.resume_qualification)
                    {
                        if (qual.qualification_type_lid === 4)
                        {
                            resumetable+=`
                            <tr>
                                <td>\${qual.topic_of_study}</td>
                                <td>\${qual.institute}</td>
                                <td>\${qual.year_of_passing}</td>
                                <td><p ><i id="professional-certificate-display" data-image="imagedata/\${qual.url_path}" class="fa-solid fa-image text-success professional-certificate-display"></i></p></td>
                            </tr>`  
                        }
                    }
                }                    
      
resumetable+= `</tbody>
        </table>
    </div>
</div>
    ` 
document.querySelector('#performa-creation-div').insertAdjacentHTML('afterbegin', resumetable);

</script>

</body>
</html>