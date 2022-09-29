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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css">
  
    <title>Create Performa</title>
    <link rel="icon" type="image/x-icon" href="images.jpg">

    <style>
        .select2-selection {
            width: 300px;
        }
    </style>
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

        <div class="card-body porforma-table table-responsive">
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
                        <td>
                            <div class="custom-select-div">
                                <input class="form-control job-program cust-input"  data-id="" data-name="" type="text">
                                <ul class="form-control d-none job-program-list custom-select-div-ul"></ul>
                            </div>
                        </td>
                        <td>
                            <div class="custom-select-div">
                                <input class="form-control job-session cust-input" data-name="" type="text"> 
                                <ul class="form-control d-none job-session-list custom-select-div-ul"></ul>
                            </div>
                        </td>
                        <td>
                            <div class="custom-select-div">
                                <input class="form-control job-subject cust-input" data-id="" data-name="" type="text"> 
                                <ul class="form-control d-none job-subject-list custom-select-div-ul"></ul>
                            </div>
                        </td>
                        <td><input class="form-control job-date" type="date"> </td>
                        <td><input class="form-control job-hours" type="number"> </td>
                        <td><input class="form-control job-rate" type="number"> </td>
                        <td><input class="form-control job-total-hours" type="number"> </td>
                        <td><input class="form-control job-division" type="number"> </td>
                        <td><input class="form-control job-count" type="number"> </td>
                        <td><select class="form-control job-process">
                                <option value="0">-Select-</option>
                                <option value="AOL">AOL</option>
                                <option value="OBE">OBE</option>
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
          <div class="col-md-12 col-sm-12 d-flex justify-content-center" style="max-height: 50vh;">
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

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/SimpleAlert.js"></script>
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
    <script src="${pageContext.request.contextPath}/js/leftsidebartoggle.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.bootpag.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <script id="script-data"></script>

    <script>

// ------------------------function fro search which will be used for all 3 dropdowns-----------

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


let apiTimeout = null;


function searchProgramApi(query, targetProgramSearch) {

    let jobPorformaProgramUl = findClosest(targetProgramSearch, 'job-tr').querySelector(".job-program-list");
    let selectProgramList = '';
    let organization_lid = resumeinfo.organization_id[0].organization_lid
    

    $.ajax({
        
        url: 'https://dev-portal.svkm.ac.in:8080/vfApi/getProgramName?characters=' + query  + '&programId=0&schoolObjId=' + organization_lid ,
        type: 'GET',
        success: function (response) {
            console.log("organization_id>>>>>>>>>>" , organization_lid)
            console.log("response>>> ", response)
            let resResult = JSON.parse(response).results;

            for (let desig of resResult) {
                    selectProgramList +=
                `<li class="cust-single single-program job-program-item" data-value="\${desig.programName}" data-id="\${desig.id}">     
                    \${desig.programName}
                </li>`
            }

            jobPorformaProgramUl.innerHTML = selectProgramList;

            jobPorformaProgramUl.classList.remove("d-none");


        },
        error: function (error) {
            return error;
        }
    })
    
}


function searchSessionApi(targetSessionList,programId) {

    let selectSessionList = '';

    targetSessionList.innerHTML = "";
    /* targetSessionList.closest('div').firstElementChild.value = "" */

    $.ajax({
        url: 'https://dev-portal.svkm.ac.in:8080/vfApi/getacadSession?programId=' + programId,
        type: 'GET',
        success: function (response) {
            console.log("response>>> ", response)
            let resResult = JSON.parse(response).data;

            for (let session of resResult) {

                selectSessionList +=
                    `<li class="cust-single single-session job-session-item" data-value="\${session.acadSession}">     
                        \${session.acadSession}
                    </li>`
            }

            targetSessionList.innerHTML = selectSessionList;
            targetSessionList.classList.remove("d-none");

        },
        error: function (error) {
            return error;
        }
    })

}


function searchSubjectApi(targetSubjectList,programId,sessionName) {

    let selectSubjectList = '';

    targetSubjectList.innerHTML = "";
    /* targetSubjectList.closest('div').firstElementChild.value = ""; */

    $.ajax({
        url: 'https://dev-portal.svkm.ac.in:8080/vfApi/getSubjectName?programId=' + programId + '&semester=' + sessionName ,
        type: 'GET',
        success: function (response) {
            console.log("response>>> ", response)

            if(!response) {
                response = '[]';
            }

            let resResult = JSON.parse(response);


            for (let sub of resResult) {
                if(sub.moduleName != null) {

                    selectSubjectList +=
                    `<li class="cust-single single-subject job-subject-item" data-value="\${sub.moduleName}" data-id="\${sub.moduleId}">     
                        \${sub.moduleName}
                        </li>`
                 }
            }

            targetSubjectList.innerHTML = selectSubjectList;
            targetSubjectList.classList.remove("d-none");


        },
        error: function (error) {
            return error;
        }
    })

}

document.addEventListener('click', function(e) {

    document.querySelectorAll(`.custom-select-div-ul`).forEach(function(item){
        item.classList.add('d-none');
    })

    let custTarget = findClosest(e.target, 'custom-select-div');

    if(e.target.classList.contains('cust-input')) {
        custTarget.querySelector('.custom-select-div-ul').classList.remove('d-none');
    }


    if(custTarget && e.target.classList.contains('cust-single')) { 
        let targetInput = custTarget.querySelector("input");
        targetInput.value = e.target.getAttribute('data-value');

        custTarget.querySelectorAll(`li[selected=true]`).forEach(function(item){
            item.setAttribute('selected', 'false');
        })

        e.target.setAttribute('selected', 'true');
        custTarget.querySelector('.custom-select-div-ul').classList.add('d-none');
    }

})



    document.querySelector('#performa-creation-div').addEventListener('keyup', function(e) {
        let jobPorformaProgramUl = findClosest(e.target, 'job-tr').querySelector(".job-program-list")
        let jobPorformaSessionUl = findClosest(e.target, 'job-tr').querySelector(".job-session-list")
        let jobPorformaSubjectUl = findClosest(e.target, 'job-tr').querySelector(".job-subject-list")

        if(e.target.classList.contains('job-program')) {

            let selectedLi = jobPorformaProgramUl.querySelector(`li[selected=true]`);

            if(selectedLi) {
                selectedLi.setAttribute('selected', false);
            }

            clearTimeout(apiTimeout)
            const value = e.target.value
            apiTimeout = setTimeout(() => searchProgramApi(value, e.target), 2000)
        }

        if(e.target.classList.contains('job-session')) {

            let selectedLi = jobPorformaSessionUl.querySelector(`li[selected=true]`);

            if(selectedLi) {
                selectedLi.setAttribute('selected', false);
            }
        }
     
        if(e.target.classList.contains('job-subject')) {

            let selectedLi = jobPorformaSubjectUl.querySelector(`li[selected=true]`);

            if(selectedLi) {
                selectedLi.setAttribute('selected', false);
            }

        }
                
        // if(e.target.classList.contains('job-subject')) { 
        //     // Declare variables
        //     var input, filter, ul, li, a, i, txtValue;
        //     // Input for the variables declared
        //     input = findClosest(e.target, 'job-tr').querySelector('.job-subject');
        //     filter = input.value.toUpperCase();
        //     ul = findClosest(e.target, 'job-tr').querySelector(".job-subject-list");
        //     li = ul.getElementsByTagName('li');
        //     // Loop through all list items, and hide those who don't match the search query
        //     for (i = 0; i < li.length; i++) {
        //       a = li[i].getElementsByTagName("a")[0];
        //       txtValue = a.textContent || a.innerText;
        //       if (txtValue.toUpperCase().indexOf(filter) > -1) {
        //         li[i].style.display = "";
        //       } else {
        //         li[i].style.display = "none";
        //       }
        //     }
        // }

    })

  

    document.querySelector('#performa-creation-div').addEventListener('click', function(e) {


        if(e.target.classList.contains('single-program')) {

            let thisTr = findClosest(e.target, 'job-tr');

            thisTr.querySelector(".job-session").value = "";
            thisTr.querySelector(".job-subject").value = "";

            let trSession = thisTr.querySelector(".job-session-list");
            let programId = e.target.dataset.id;

            searchSessionApi(trSession, programId);
        }


        if(e.target.classList.contains('single-session')) {
            let thisTr = findClosest(e.target, 'job-tr');
            let trSubject = thisTr.querySelector(".job-subject-list");
            let acadSessionName =   e.target.dataset.value;
            let acadSessionId = e.target.dataset.id;
            let programId;
            let programLi = thisTr.querySelector(`.job-program-list li[selected=true]`)
            if(programLi) {
               programId =  programLi.dataset.id
            }

            thisTr.querySelector(".job-subject").value = "";
            
    
            searchSubjectApi(trSubject, programId, acadSessionName);
        }

    })
        


      document.querySelector('#image-preview-cancel-button').addEventListener('click', function (e) {
      document.getElementById('performa-creation-div').classList.remove('d-none');
      document.querySelector('.image-preview-modal').classList.add('d-none');
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



    //Job Application Table Add Button
    document.querySelector('.add-btn').addEventListener('click',function(){     
  
        let row = `                
        <tr class='job-tr'>
                        <td>
                            <div class="custom-select-div">
                                <input class="form-control job-program"  data-id="" data-name="" type="text">
                                <ul class="form-control d-none job-program-list custom-select-div-ul"></ul>
                            </div>
                        </td>
                        <td>
                            <div class="custom-select-div">
                                <input class="form-control job-session" data-name="" type="text"> 
                                <ul class="form-control d-none job-session-list custom-select-div-ul"></ul>
                            </div>
                        </td>
                        <td>
                            <div class="custom-select-div">
                                <input class="form-control job-subject" data-id="" data-name="" type="text"> 
                                <ul class="form-control d-none job-subject-list custom-select-div-ul"></ul>
                            </div>
                        </td>
                        <td><input class="form-control job-date" type="date"> </td>
                        <td><input class="form-control job-hours" type="number"> </td>
                        <td><input class="form-control job-rate" type="number"> </td>
                        <td><input class="form-control job-total-hours" type="number"> </td>
                        <td><input class="form-control job-division" type="number"> </td>
                        <td><input class="form-control job-count" type="number"> </td>
                        <td><select class="form-control job-process">
                                <option value="0">-Select-</option>
                                <option value="AOL">AOL</option>
                                <option value="OBE">OBE</option>
                            </select> 
                        </td>
                        <td><i class="fa-solid text-danger fa-trash delete-row"></i></td>
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
        location.href = '${pageContext.request.contextPath}/job-proforma-page';
        }
    })

    document.querySelector('#job-application-submit-btn').addEventListener('click',function(){
     
        document.getElementById('main-loader').classList.remove('d-none');

        let jobArrar = {"insert_proforma" : []};
        let jobApllicationData = document.querySelectorAll('.job-tr');
        let subjectName = '';
        let subjectId = '';
        
        for(let i = 0; i < jobApllicationData.length; i++)
        {
            
            jobApllicationData[i].querySelector('.job-program').classList.remove('input-border');
            jobApllicationData[i].querySelector('.job-session').classList.remove('input-border');
            jobApllicationData[i].querySelector('.job-subject').classList.remove('input-border');
            jobApllicationData[i].querySelector('.job-date').classList.remove('input-border');
            jobApllicationData[i].querySelector('.job-hours').classList.remove('input-border');
            jobApllicationData[i].querySelector('.job-total-hours').classList.remove('input-border');
            jobApllicationData[i].querySelector('.job-division').classList.remove('input-border');
            jobApllicationData[i].querySelector('.job-count').classList.remove('input-border');
            jobApllicationData[i].querySelector('.job-rate').classList.remove('input-border');

            let selectedProgramLi = jobApllicationData[i].querySelector(`.job-program-list li[selected=true]`);
            let selectedSessionLi = jobApllicationData[i].querySelector(`.job-session-list li[selected=true]`);
            let selectedModuleLi = jobApllicationData[i].querySelector(`.job-subject-list li[selected=true]`);
            let proformaId = jobApllicationData[i].dataset.id
            let programInput = selectedProgramLi ? selectedProgramLi.dataset.id : '';
            let programName = selectedProgramLi ? selectedProgramLi.dataset.value : '';
            // let sessionId = selectedSessionLi ? selectedSessionLi.dataset.id : '';
            let sessionName = selectedSessionLi ? selectedSessionLi.dataset.value : '';
            let moduleId = selectedModuleLi ? selectedModuleLi.dataset.id : '';
            let moduleName = selectedModuleLi ? selectedModuleLi.dataset.value : jobApllicationData[i].querySelector('.job-subject').value;
            let session = jobApllicationData[i].querySelector('.job-session').value;
            let date = jobApllicationData[i].querySelector('.job-date').value;
            let hours = jobApllicationData[i].querySelector('.job-hours').value;
            let rate = jobApllicationData[i].querySelector('.job-rate').value;
            let totalhours = jobApllicationData[i].querySelector('.job-total-hours').value;
            let division = jobApllicationData[i].querySelector('.job-division').value;
            let count = jobApllicationData[i].querySelector('.job-count').value;
            let process = jobApllicationData[i].querySelector('.job-process').value;

            let checkProgramInput = tabledatacheck(programInput);
            let checkSession = tabledatacheck(sessionName);
            let checkDate = tabledatacheck(date);
            let checkHours = tabledatacheck(hours);
            let checkRate = tabledatacheck(rate);
            let checkTotalHours = tabledatacheck(totalhours);
            let checkDivision = tabledatacheck(division);
            let checkCount = tabledatacheck(count);
            let checkProcess = tabledatacheck(process);
            let checkSubject = tabledatacheck(moduleName);

            if (checkProgramInput == false) {
                jobApllicationData[i].querySelector('.job-program').classList.add('input-border');;
                document.getElementById('main-loader').classList.add('d-none');
                return;

            } else if(checkSession == false) {

                jobApllicationData[i].querySelector('.job-session').classList.add('input-border');;
                document.getElementById('main-loader').classList.add('d-none');
                 return;

            }
                else if(checkDate == false) {

                jobApllicationData[i].querySelector('.job-date').classList.add('input-border');;
                document.getElementById('main-loader').classList.add('d-none');
                  return;

            }
                else if(checkHours == false) {

                jobApllicationData[i].querySelector('.job-hours').classList.add('input-border');;
                document.getElementById('main-loader').classList.add('d-none');
                   return;

            
            } else if(checkRate == false) {

                jobApllicationData[i].querySelector('.job-rate').classList.add('input-border');;
                document.getElementById('main-loader').classList.add('d-none');
                  return;

            
            } else if(checkTotalHours == false) {

                jobApllicationData[i].querySelector('.job-total-hours').classList.add('input-border');;
                document.getElementById('main-loader').classList.add('d-none');
                  return;

            
            } else if(checkDivision == false) {

                jobApllicationData[i].querySelector('.job-division').classList.add('input-border');;
                document.getElementById('main-loader').classList.add('d-none');
                 return;
            
            } else if(checkCount == false) {

                jobApllicationData[i].querySelector('.job-count').classList.add('input-border');;
                document.getElementById('main-loader').classList.add('d-none');
                  return;

            
            } else if(checkProcess == false) {

                jobApllicationData[i].querySelector('.job-process').classList.add('input-border');;
                document.getElementById('main-loader').classList.add('d-none');
                  return;

            } else if(checkSubject == false) {

                jobApllicationData[i].querySelector('.job-subject').classList.add('input-border');;
                document.getElementById('main-loader').classList.add('d-none');
                return;

            }
            
            obj = {
                application_lid:'${application_lid}',  
                proforma_id : proformaId ,
                module_id:  moduleId, 
                module_name: moduleName,
                vf_module_id: '',     
                teaching_hours:hours,
                program_name: programName,
                program_id: programInput,
                acad_session: sessionName,
                commencement_date_of_program:date,
                rate_per_hours:rate,
                total_no_of_hrs_alloted:totalhours,
                no_of_division:division,
                student_count_per_division:count,
                aol_obe:process,
                level : '${level}',
                status_lid : 1,
                username : '${user_id}'

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
                document.getElementById('main-loader').classList.add('d-none');
            } else {
              alert('Check Details Input');
              document.getElementById('main-loader').classList.add('d-none');
            }
          })
        }
        postdata();
    });
     
//------------------------------------------------------Appending Tables-------------------------------------------------------------


        console.log('Outside Ajax : ',resumeinfo)
    let proformaData = ``
    if( resumeinfo.proforma_details != null){

    for(let proforma of resumeinfo.proforma_details) {


        proformaData += `<tr class='job-tr' data-id ="\${proforma.proforma_id}">
                            <td>
                                <div class="custom-select-div">
                                    <input class="form-control job-program cust-input" value = "\${proforma.program_name == null ? '' : proforma.program_name}"  data-id="\${proforma.program_id}" data-name="" type="text">
                                    <ul class="form-control d-none job-program-list custom-select-div-ul">
                                        <li class="cust-single single-program job-program-item" data-value="\${proforma.program_name}" data-id="\${proforma.program_id}" selected="true">     
                                            \${proforma.program_name}
                                        </li>
                                    </ul>
                                </div>
                            </td>
                            <td>
                                <div class="custom-select-div">
                                    <input class="form-control job-session cust-input" data-name=""  value = "\${proforma.acad_session}" type="text"> 
                                    <ul class="form-control d-none job-session-list custom-select-div-ul">
                                        <li class="cust-single single-session job-session-item" data-value="\${proforma.acad_session}" selected="true"> 
                                            \${proforma.acad_session}
                                        </li>
                                    </ul>
                                </div>
                            </td>
                            <td>
                                <div class="custom-select-div">
                                    <input class="form-control job-subject cust-input" data-id="" value = "\${proforma.module}"  type="text"> 
                                    <ul class="form-control d-none job-subject-list custom-select-div-ul">
                                        <li class="cust-single single-subject job-subject-item" data-id="\${proforma.vf_module_id != null ? proforma.vf_module_id : proforma.module_id}"  data-value="\${proforma.module}" selected="true"> 
                                            \${proforma.module}
                                        </li>
                                    </ul>
                                </div>
                            </td>
                            <td><input class="form-control job-date" type="date" value = "\${proforma.commencement_date_of_program}"> </td>
                            <td><input class="form-control job-hours" type="number" value = "\${proforma.teaching_hours}"> </td>
                            <td><input class="form-control job-rate" type="number" value = "\${proforma.rate_per_hours}"> </td>
                            <td><input class="form-control job-total-hours" type="number" value = "\${proforma.total_no_of_hrs_alloted}"> </td>
                            <td><input class="form-control job-division" type="number" value = "\${proforma.no_of_division}"> </td>
                            <td><input class="form-control job-count" type="number" value = "\${proforma.student_count_per_division}" > </td>
                            <td><select class="form-control job-process"  >
                                    <option value="0" >-Select-</option>
                                    <option value="AOL" \${proforma.aol_obe  == "AOL" ? selected="selected" : null }>AOL</option>
                                    <option value="OBE" \${proforma.aol_obe  == "OBE" ? selected="selected" : null }>OBE</option>
                                </select> 
                            </td>
                        </tr>`
                        document.querySelector('.job-application-body').innerHTML =  proformaData;
        }
    }



let resumetable =`
<div class="card">
    <h2 align="center">\${resumeinfo.personal_details[0].f_name} \${resumeinfo.personal_details[0].l_name}</h2>
</div>
    <!-------------------------------------------------------Qualification Table----------------------------------------------------->
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



// function initSelect2LazyLoad(cssSelector) {
//     console.log('Lazy Load:::::::::::>>')
//     $(cssSelector).select2({
//         ajax: {
//             url: "http://localhost:8084/getProgramName",
//             dataType: 'json',
//             delay: 1000,
//             data: function (params) {
//                 return {
//                     programId: 0,
//                     schoolObjId: '00004537',
//                     characters: params.term, // search term
//                     page: params.page
//                 };
//             },
//             processResults: function (data, params) {
                

//                 console.log("data>>> ", data);

//                 params.page = params.page || 1;

//                 return {
//                     results: data.results,
//                     pagination: {
//                         more: (params.page * 1) < data.results[0].totalCount
//                     }
//                 };
//             },
//             cache: true
//         },
//         placeholder: 'Search for a repository',
//         minimumInputLength: 1,
//         templateResult: formatResult,
//         templateSelection: formatSelection
//     });
// }

// initSelect2LazyLoad('.job-program');


// function formatResult(data) {
//     return data.programName;
// };

// function formatSelection(data) {
//     return data.programName;
// };


// function formatRepo(repo) {
//     if (repo.loading) {
//         return repo.text;
//     }

//     var $container = $(
//         "<div class='select2-result-repository clearfix'>" +
//         "<div class='select2-result-repository__avatar'><img src='" + repo.owner.avatar_url + "' /></div>" +
//         "<div class='select2-result-repository__meta'>" +
//         "<div class='select2-result-repository__title'></div>" +
//         "<div class='select2-result-repository__description'></div>" +
//         "<div class='select2-result-repository__statistics'>" +
//         "<div class='select2-result-repository__forks'><i class='fa fa-flash'></i> </div>" +
//         "<div class='select2-result-repository__stargazers'><i class='fa fa-star'></i> </div>" +
//         "<div class='select2-result-repository__watchers'><i class='fa fa-eye'></i> </div>" +
//         "</div>" +
//         "</div>" +
//         "</div>"
//     );

//     $container.find(".select2-result-repository__title").text(repo.full_name);
//     $container.find(".select2-result-repository__description").text(repo.description);
//     $container.find(".select2-result-repository__forks").append(repo.forks_count + " Forks");
//     $container.find(".select2-result-repository__stargazers").append(repo.stargazers_count + " Stars");
//     $container.find(".select2-result-repository__watchers").append(repo.watchers_count + " Watchers");

//     return $container;
// }

// function formatRepoSelection(repo) {
//     return repo.full_name || repo.text;
// }


</script>

</body>
</html>