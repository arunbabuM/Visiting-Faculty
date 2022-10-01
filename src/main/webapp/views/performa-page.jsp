<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/login.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" />
    

    <title>Dashboard</title>
    <link rel="icon" type="image/x-icon" href="/images.jpg">

    <style>
        .deanObservationExpand {
            color: black;
            text-decoration: none;
        }



        .form-control {
            display: block;
            width: 100%;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            color: #212529;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid #ced4da;
            -webkit-appearance: none;
            -moz-appearance: none;
            appearance: none;
            border-radius: 0.25rem;
            transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
        }

        .select2-container--default .select2-selection--multiple {
            background-color: white;
            border: 1px solid #aaa;
            border-radius: 4px;
            cursor: text;
            padding-bottom: 5px;
            padding-right: 5px;
            position: relative;
        }
    </style>
</head>

<body>

    <jsp:include page="left-sidebar.jsp" />

    <main class="main">
        <jsp:include page="header.jsp" />


        <div class="modal fade" id="proforma-approval-modal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Comment for Proforma Approval</h5>
                        <button type="button" style="border: none;" class="close2 modal2-cancel-button"
                            data-dismiss="modal" aria-label="Close">
                            <span class="close2" aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="proforma-approval-body container" style="width: auto;">
                        <select class="form-select status-select form-select-lg mb-3">  
                          </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="close2 btn btn-secondary modal2-cancel-button"
                            data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-success proforma-approval-submit-btn"
                            data-dismiss="modal">Submit</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- <div class="modal fade" id="proforma-approval-modal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Comment for Proforma Approval</h5>
                        <button type="button" style="border: none;" class="close2 modal2-cancel-button"
                            data-dismiss="modal" aria-label="Close">
                            <span class="close2" aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="proforma-approval-body container" style="width: auto;">
                        <select class="form-select status-select form-select-lg mb-3">  
                          </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="close2 btn btn-secondary modal2-cancel-button"
                            data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-success proforma-approval-submit-btn"
                            data-dismiss="modal">Submit</button>
                    </div>
                </div>
            </div>
        </div> -->

   

        <div class="main-content">

            <div class="col-md-9 text-center pt-4" style="margin: auto;">
                <h5 class="py-md-2 "> Select School</h5>
                <hr>
                <select class="form-select school-select form-select-lg mb-3">  
                </select>
            </div>

            <!-- Error Alert -->
            <div class="validation-alert alert alert-danger alert-dismissible fade show d-none">
                <strong>Error!</strong>Enter Valid Information
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
            <div class="no-data-alert alert alert-info alert-dismissible fade show d-none">
                <strong>Error!</strong>No Data Available
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>


            <div class="main-box main-box-vf p-0 d-none">
                <div class="row my-3 px-5" style="padding-top: 10px">
                    <div class="col-lg-3 col-md-6 col-sm-12 px-2 pt-2 select2-wrapper">
                        <label for="school"> <small>Date: </small>
                        </label> <input type="date" class="form-control" name="createdDate" id="createdDate">
                    </div>


                    <div class="col-lg-3 col-md-6 col-sm-12 px-2 pt-2 select2-wrapper">
                        <label for="school"> <small>School: </small>
                        </label>
                        <input type="text" class="form-control" name="">
                    </div>

                    <!-- <div class="col-lg-3 col-md-6 col-sm-12 px-2 pt-2 select2-wrapper">
                        <label for="school"> <small>School: </small>
                        </label> <select id="selectSchool"
                            class="select-school select2-innerwrapper" name="school"
                            multiple="multiple">
                            
                                <option value="00004534">SAMSOE</option>
                            
                        </select>
                    </div> -->

                    <div class="col-lg-3 col-md-6 col-sm-12 px-2 pt-2 select2-wrapper">
                        <label for="program"> <small>Program: </small>
                        </label>
                        <input type="text" class="form-control" name="">
                    </div>

                    <!-- <div class="col-lg-3 col-md-6 col-sm-12 px-2 pt-2 select2-wrapper">
                        <label for="program"> <small>Program: </small>
                        </label> <select id="selectProgram"
                            class="select-program select2-innerwrapper" name="program"
                            multiple="multiple">
        
                        </select>
                    </div> -->


                    <div class="col-lg-3 col-md-6 col-sm-12 px-2 pt-2 select2-wrapper">
                        <label for="semester"> <small>Semester: </small>
                        </label>
                        <input type="text" class="form-control" name="">
                    </div>
                    <!-- <div class="col-lg-3 col-md-6 col-sm-12 px-2 pt-2 select2-wrapper">
                        <label for="semester"> <small>Semester: </small>
                        </label> <select id="selectSemester"
                            class="select-semester select2-innerwrapper" name="semester"
                            multiple="multiple">
        
                        </select>
                    </div> -->

                    <div class="col-lg-3 col-md-6 col-sm-12 px-2 pt-2 select2-wrapper">
                        <label for="subject"> <small>Subject: </small>
                        </label>
                        <input type="text" class="form-control" name="">
                    </div>
                    <!-- <div class="col-lg-3 col-md-6 col-sm-12 px-2 pt-2 select2-wrapper">
                        <label for="subject"> <small>Subject: </small>
                        </label> <select id="selectSubject"
                            class="select-subject select2-innerwrapper" name="subject"
                            multiple="multiple">
        
                        </select>
                    </div>  -->
                </div>
            </div>


            <div class="table-responsive table-wrapper px-2 perfoma-table mt-5 pt-5">
                <table class='table table-display table-bordered proforma-report-table' id="proforma-report-table"
                    style="width: 3600px !important;">
                    <thead>
                        <tr>
                            <th rowspan="2">Date</th>
                            <th rowspan="2">School Name</th>
                            <th rowspan="2">Name</th>
                            <th rowspan="2">PAN No</th>
                            <th style="min-width: 165px; text-align: center;" colspan="3">Qualification</th>
                            <th colspan="3" style="text-align: center;">Experience</th>
                            <th rowspan="2">Subject</th>
                            <th rowspan="2">Program</th>
                            <th rowspan="2">Acad Session</th>
                            <th data-bs-toggle="tooltip" title="As per OB approval" rowspan="2">Rate Per Hour</th>
                            <th rowspan="2">Total No. of Hours Alloted</th>
                            <th rowspan="2">No. of Division/Batches</th>
                            <th rowspan="2">Student Count</th>
                            <th rowspan="2">Total Amount Rs.</th>
                            <th rowspan="2">Faculty Feedback</th>
                            <th rowspan="2">Total Subjects alloted in a Term</th>
                            <th rowspan="2">Subject Under AOL/OBE</th>
                            <th rowspan="2">Total Points</th>
                            <th rowspan="2">Comments</th>
                            <th rowspan="2">Status</th>
                            <th rowspan="2">Action</th>
                        </tr>
                        <tr>
                            <th>Graduate</th>
                            <th>Masters</th>
                            <th>PHD</th>
                            <th>Total Teaching Experience</th>
                            <th>Total Industrial Experience</th>
                            <th>Total Experience</th>
                        </tr>
                    </thead>
                    <tbody class="performer-view">

                    </tbody>
                </table>
                <!--------------------------------------------------------------Modal for qualification-------------------------------------------------------->

                <!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Large modal</button> -->

                <div class="modal fade  bd-example-modal-lg qualification-display" data-keyboard="false"
                    data-backdrop="static" id="exampleModalCenter" tabindex="-1" role="dialog"
                    aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                    <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLongTitle">Details</h5>
                                <button type="button" class="btn btn-secondary btn btn-danger close1"
                                    data-dismiss="modal"><i class="fa fa-times btn btn-danger"
                                        aria-hidden="true"></i></button>
                            </div>
                            <div class="modal-body qualification-div">

                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary btn btn-danger close1"
                                    data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="modal-loader d-none" id="main-loader">
            <svg version="1.1" id="L5" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                x="0px" y="0px" viewBox="0 0 100 100" enable-background="new 0 0 0 0" xml:space="preserve">
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


    </main>

    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.dev.js"></script>
    <!-- <script src="/js/session-timeout.js"></script> -->
    <script src="${pageContext.request.contextPath}/js/SimpleAlert.js"></script>
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
    <script src="${pageContext.request.contextPath}/js/leftsidebartoggle.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js"
        integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.5/dist/umd/popper.min.js"
        integrity="sha384-Xe+8cL9oJa6tN/veChSP7q+mnSPaj5Bcu9mPX5F5xIGE0DVittaqT5lorf0EI7Vk" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.bootpag.min.js"></script>
    <script>
        let performerinfoobj;

        let schoolType = '<option value="0" class="school-option" selected>Select School</option>';
        let schoolList = 1;
        let schoolArray = []
        if (schoolList == 1) {
        $.ajax({
          url: '${pageContext.request.contextPath}/get-schools-list',
          type: 'POST',
          async : false,
          contentType : false,
          success: function (response) {
            console.log(response)
            console.log(response.value)
            for (let desig of response) {
                schoolArray.push(desig.organization_id)

                schoolType +=
                `<option class="school-option col-md-10 col-sm-10 col-12" value="\${desig.organization_id}" data-name="\${desig.name}"  >\${desig.name}</option>`
            }
            document.querySelector('.school-select').insertAdjacentHTML('beforeend', schoolType);
          },
          error: function (error) {
            console.log("Error::::::::::::", error);
          }
        })
        schoolList++
      }

        document.querySelector('.perfoma-table').addEventListener('click', function (e) {

            if (e.target.classList.contains('qual-btn')) {

                let obj = {
                    "get_application_qualification": []
                }
                let data = {}
                data.qualification_type_lid = e.target.dataset.id,
                    data.application_lid = e.target.dataset.qual
                obj.get_application_qualification.push(data);
                console.log("OBJECTTT", obj)

                $.ajax({
                    url: '${pageContext.request.contextPath}/get-qual',
                    type: 'POST',
                    data: JSON.stringify(obj),
                    contentType: false,
                    success: function (response) {
                        $(".qualification-display").modal("toggle", {
                            backdrop: "static ",
                            keyboard: false
                        });

                        let graduationdetails = JSON.parse(response.value)
                            .application_resume_qualification;
                        console.log(graduationdetails);
                        if (graduationdetails != null) {
                            let qualdetails = `
                        <div class="card">
                            <div class="card-body">
                                <table class="table table-responsive">
                                    <thead>
                                        <th>Institute</th>
                                        <th>Topic of study</th>
                                        <th>University</th>
                                        <th>Year of passing</th>
                                    </thead>
                                    <tbody>`
                            for (gd of graduationdetails) {
                                qualdetails += `<tr>
                                            <td>\${gd.institute}</td>
                                            <td>\${gd.topic_of_study}</td>
                                            <td>\${gd.university}</td>
                                            <td>\${gd.rev_timestamp.split('T')[0]}</td>
                                        </tr>`
                            }
                            qualdetails += `</tbody>
                                </table>
                            </div>   
                        </div>

                        `
                            $('.card').remove();
                            document.querySelector('.qualification-div').insertAdjacentHTML(
                                'afterend', qualdetails);
                        } else {
                            let qualdetails = `
                        <div class="card">
                        <h4 align="center">No Data Available</h4>
                        </div>
                        `
                            document.querySelector('.qualification-div').insertAdjacentHTML(
                                'afterend', qualdetails);
                        }
                    },
                    error: function (error) {
                        console.log("error", error)
                    }

                });

            }

            if (e.target.classList.contains('feedback-btn')) {

                $.ajax({
                    url: 'https://dev-portal.svkm.ac.in:8080/vfApi/getFeedback?panCardNo=' + e.target
                        .dataset.panNo,
                    type: 'GET',
                    success: function (response) {
                        $(".qualification-display").modal("toggle", {
                            backdrop: "static ",
                            keyboard: false
                        });

                        let feedbackdetails = response;
                        console.log(feedbackdetails);
                        if (feedbackdetails != '') {
                            let feedback = `
                        <div class="card">
                            <div class="card-body">
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
                                    <tbody>`
                            for (gd of feedbackdetails) {
                                feedback += `<tr>
                                            <td>\${gd.school}</td>
                                            <td>\${gd.inst}</td>
                                            <td>\${gd.programName}</td>
                                            <td>\${gd.courseName}</td>
                                            <td>\${gd.acadYear}</td>
                                            <td>\${gd.acadSession}</td>
                                            <td>\${gd.avg}</td>
                                        </tr>`
                            }
                            feedback += `</tbody>
                                </table>
                            </div>   
                        </div>
                        `
                            $('.card').remove();
                            document.querySelector('.qualification-div').insertAdjacentHTML('afterend', feedback);
                        } else {
                            let feedback = `
                        <div class="card">
                        <h4 align="center">No Feedback Available</h4>
                        </div>
                        `
                        $('.card').remove();
                            document.querySelector('.qualification-div').insertAdjacentHTML(
                                'afterend', feedback);
                        }
                    },
                    error: function (error) {
                        console.log("ERROR")
                    }

                })

            }
        })


        document.querySelector('.main').addEventListener('click', function (e) {

            if (e.target.classList.contains('approval-btn')) {
                 proformaid = e.target.dataset.id
                 console.log("LEVEL>>>>>>>>>>" , '${level}')
                 let statusObject = {"get_status_list" : []}
                 let object = {}
                 object.proforma_lid = proformaid;
                 object.level = '${level}';
                 statusObject.get_status_list.push(object)
                 console.log(JSON.stringify(statusObject))

                 $.ajax({
                    url : '${pageContext.request.contextPath}/get-status-list',
                    type : 'POST',
                    data : JSON.stringify(statusObject),
                    contentType : false,
                    success : function(response) {
                       let selectOptions = JSON.parse(response.value)
                       $('#proforma-approval-modal').modal('toggle');
                       let commentbox = `<textarea class="textarea proforma-comment container" data-id="\${proformaid}" cols="50" rows="5"></textarea>`;
                       let options = `<option value="0" selected>Select Status</option>`
                       for(let option of selectOptions.status_list) {
                        options += `<option value="\${option.id}">\${option.name}</option>`
                       }
                       let card = document.querySelector('.proforma-approval-body').querySelector('textarea')
                       card == null ? '' : card.remove()
                       document.querySelector('.proforma-approval-body').insertAdjacentHTML('afterbegin',commentbox)
                       document.querySelector('.status-select').innerHTML = options
                    },
                    error : function(error) {
                        console.log(error);
                    }
                 })
            }

            
            if (e.target.classList.contains('close1') || e.target.classList.contains('fa-times')) {
                document.querySelector('.card').remove()
                $(".qualification-display").modal("toggle");
            }
            if (e.target.classList.contains('close2')) {
                document.querySelector('.proforma-approval-body').firstElementChild.remove()
                $("#proforma-approval-modal").modal("toggle");
            }
            if(e.target.classList.contains('proforma-approval-submit-btn'))
            {

                document.querySelector('.status-select').classList.remove('border-danger');

                let proformaArray = {"insert_proforma_status" : []}

                let objectData = {}
                objectData.proforma_lid = document.querySelector('.proforma-comment').dataset.id
                objectData.level = '${level}'
                objectData.comment = document.querySelector('.proforma-comment').value
                objectData.status_lid = document.querySelector('.status-select').value
                if(objectData.status_lid < 1 || objectData.status_lid  > 4) {
                    document.querySelector('.status-select').classList.add('border-danger');
                    return;
                }
                proformaArray.insert_proforma_status.push(objectData);
                
               $.ajax({
                url : '${pageContext.request.contextPath}/proforma-approval',
                type : 'POST',
                data : JSON.stringify(proformaArray),
                contentType : false,
                success : function(response) {

                    console.log("Success");
                    location.reload()
                },
                error : function(err) {

                    console.log("Error");
                }

               })
            }

            if (e.target.classList.contains('school-select')) {
                let objArray = {"proforma_details" : []}
               let organization_lid = e.target.value
                 if(organization_lid == 0)  {
                    document.querySelector('.performer-view').innerHTML =  '';

                    return;
                 }  
                let obj = {"level" : '${level}',
                            "organization_lid" : organization_lid}  
                objArray.proforma_details.push(obj) 
                
             $.ajax({
                url: '${pageContext.request.contextPath}/performer-view',
                type: 'POST',
                data: JSON.stringify(objArray),
                async: false,
                contentType : false,
                success: function (response) {
                    let data = JSON.parse(response.value)
                    performerinfoobj = data;

                    if (performerinfoobj != null) {
                        let view = ``
            for (performerinfo of performerinfoobj.proforma_details) {
             view   += `
                <tr>
                    <td>\${performerinfo.created_date.split('T')[0]}</td>
                    <td>NMIMS</td>
                    <td>\${performerinfo.full_name}</td>
                    <td>\${performerinfo.pancard_no}</td>
                    <td><button data-qual="\${performerinfo.application_lid}" data-id = "1" data-toggle="modal" data-target=".bd-example-modal-lg" type="button" class="qual-btn btn btn-outline-primary text-dark">Graduate</button> </td>
                    <td><button data-qual="\${performerinfo.application_lid}" data-id = "2" data-toggle="modal" data-target=".bd-example-modal-lg" type="button" class="qual-btn btn btn-outline-primary text-dark">Masters</button></td>
                    <td><button data-qual="\${performerinfo.application_lid}" data-id = "3" data-toggle="modal" data-target=".bd-example-modal-lg" type="button" class="qual-btn btn btn-outline-primary text-dark">PHD</button></td>
                    <td><button data-qual="\${performerinfo.application_lid}" data-exp = "4" class="btn btn-outline-primary text-dark exp-btn"> \${performerinfo.teaching_exp}</button></td>
                    <td><button data-qual="\${performerinfo.application_lid}" data-exp = "5" class="btn btn-outline-primary text-dark exp-btn"> \${performerinfo.industrial_exp}</button></td>
                    <td>\${performerinfo.total_exp}</td>
                    <td>\${performerinfo.module}</td>
                    <td>\${performerinfo.program_name}</td>
                    <td>\${performerinfo.acad_session}</td>
                    <td>\${performerinfo.rate_per_hours}</td>
                    <td>\${performerinfo.total_no_of_hrs_alloted}</td>
                    <td>\${performerinfo.no_of_division}</td>
                    <td>\${performerinfo.student_count_per_division}</td>
                    <td>\${performerinfo.rate_per_hours * performerinfo.total_no_of_hrs_alloted}</td>
                    <td><button data-pan-no="\${performerinfo.pancard_no}" class="btn btn-outline-primary feedback-btn">Feedback</button></td>
                    <td>1</td>
                    <td>\${performerinfo.aol_obe}</td>
                    <td>\${performerinfo.max_points}</td>
                    <td>Comments</td>
                    <td>Pending</td>
                    <td><i data-id="\${performerinfo.proforma_id}" class="fa-solid fa-fast-forward approval-btn" title="Send for Approval"></i></td>
                <tr>
                `
            }
            document.querySelector('.performer-view').innerHTML =  view;
        }
                },
                error: function (error) {
                    console.log("error", error)
                }
            });
            }
        })
    </script>
</body>

</html>