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
    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js" defer></script>


    <title>Manual Approval</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images.jpg">

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

        .comments {
            margin-top: 5%;
            margin-left: 20px;
        }

        .darker {
            border: 1px solid #ecb21f;
            float: right;
            border-radius: 5px;
            min-width: 80%;
            padding-left: 40px;
            padding-right: 30px;
            padding-top: 10px;
        }

        .comment {
            border: 1px solid rgba(16, 46, 46, 1);
            float: left;
            border-radius: 5px;
            padding-left: 40px;
            padding-right: 30px;
            padding-top: 10px;

        }

        .comment h6,
        .comment span,
        .darker h6,
        .darker span {
            display: inline;
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
                        <input type="file" id="approval-file" required accept=".doc,.docx,.pdf,image/*" class="form-control d-none">
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


        <div class="modal fade" id="comments-modal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Comments </h5>
                        <button type="button" style="border: none;" class="comments-cancel-button" data-dismiss="modal"
                            aria-label="Close">
                            <span class="comments-cancel-button" aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="comments-body container" style="width: auto;">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger comments-cancel-button"
                            data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>

        </div> -->



        <div class="main-content">

            <!-- <div class="col-md-9 text-center pt-4" id="select-div" style="margin: auto;">
                <h5 class="py-md-2 "> Select School</h5>
                <hr>
                <select class="form-select school-select form-select-lg mb-3">
                </select>
            </div> -->

            
            <div class="row d-none">
                <div class="col-md-4 text-center" id="select-div">
                    <h5 > Select School</h5>
                    <hr>
                    <select class="form-select school-select form-select-lg mb-3">
                    </select>
                </div>

                <div class="col-md-4 text-center filter" data-filter="1" id="">
                    <h5>Program</h5>
                    <hr>
                    <select class="form-select select-program form-select-lg mb-3 program-select">
                        
                    </select>
                </div>

                <div class="col-md-4 text-center filter" data-filter="2" id="">
                   <h5>Semester</h5>
                   <hr>
                   <select class="form-select select-semester form-select-lg mb-3">

                   </select>
               </div>

               <div class="col-md-4 text-center filter" data-filter="3" id="">
                <h5 >Date</h5>
                <hr>
                <input class="form-select-lg mb-3 select-date" type="date" style="width: 100%; border: none;"></input>
             </div>

               <!-- <div class="col-md-4 text-center filter " data-filter="5" id="">
                   <h5 >Subject</h5>
                   <hr>
                   <select class="form-select select-subject form-select-lg mb-3">

                   </select>
               </div> -->

               <div class="col-md-4 text-center filter d-none status-filter" data-filter="4" id="">
                   <h5 >Status</h5>
                   <hr>
                   <select class="form-select form-select-lg mb-3 select-status-option">
                        <option value="0" >--SELECT--</option>
                        <option value="1" >Accepted</option>
                        <option value="2" >Rejected</option>
                   </select>
               </div>
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


            <div class="table-responsive table-wrapper px-2 perfoma-table  pt-5">
                <table class='table table-display table-bordered proforma-table' id="proforma-table"
                    style="width: 3600px !important;">
                    <thead>
                        <tr>
                            <th rowspan="2">Date</th>
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
                            <th rowspan="2">Uploaded File</th>
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
                    <tbody class="proforma-view">

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
                                    data-dismiss="modal"><i class="fa close1 fa-times btn btn-danger"
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

        if('${level}' == 3)
        {
        document.querySelector('.status-filter').classList.remove('d-none')
        }
        
        $(document).ready(function () {

            let performerinfoobj;
            let schoolType = '<option value="0" class="school-option" selected>All Schools</option>';
            let schoolList = 1;
            let schoolArray = []

            function getAllProforma() {
                if (schoolList == 1) {
                    $.ajax({
                        url: '${pageContext.request.contextPath}/get-schools-list',
                        type: 'POST',
                        async: false,
                        contentType: false,
                        success: function (response) {

                            for (let desig of response) {
                                let schoolObject = {
                                    "organization_lid": desig.organization_id
                                };
                                console.log(desig.organization_id)
                                // schoolObject.organization_lid = desig.organization_id;
                                schoolArray.push(schoolObject);

                                schoolType +=
                                    `<option class="school-option" value="\${desig.organization_id}" data-name="\${desig.name}">\${desig.name}
                                 </option>`
                            }
                            document.querySelector('.school-select').insertAdjacentHTML('beforeend',
                                schoolType);
                        },
                        error: function (error) {
                            console.log("Error::::::::::::", error);
                        }
                    })
                    schoolList++

                }

                //   let proformaObject = {"get_all_proforma" : []}
                let objForProforma = {}
                objForProforma.level = Number.parseInt('${level}')
                objForProforma.organization_lid = schoolArray
                console.log("JSON>>>>>>>", JSON.stringify(objForProforma))
                $.ajax({
                    url: '${pageContext.request.contextPath}/get-all-rejected-proforma',
                    type: 'POST',
                    data: JSON.stringify(objForProforma),
                    async: false,
                    contentType: false,
                    success: function (response) {
                        performerinfoobj = JSON.parse(response.value)
                        console.log(performerinfoobj)
                        if (performerinfoobj.proforma_details != null) {
                            let view = ``
                            for (performerinfo of performerinfoobj.proforma_details) {
                  let maxpoints = JSON.parse(performerinfo.max_points_2)
                  console.log(maxpoints)
                                view += `
                <tr>
                    <td>\${performerinfo.created_date}</td>
                    <td>\${performerinfo.full_name}</td>
                    <td>\${performerinfo.pancard_no}</td>
                    <td><button data-qual="\${performerinfo.application_lid}" data-id = "1" data-toggle="modal" data-target=".bd-example-modal-lg" type="button" class="qual-btn btn btn-outline-primary text-dark">Graduate</button> </td>
                    <td><button data-qual="\${performerinfo.application_lid}" data-id = "2" data-toggle="modal" data-target=".bd-example-modal-lg" type="button" class="qual-btn btn btn-outline-primary text-dark">Masters</button></td>
                    <td><button data-qual="\${performerinfo.application_lid}" data-id = "3" data-toggle="modal" data-target=".bd-example-modal-lg" type="button" class="qual-btn btn btn-outline-primary text-dark">PHD</button></td>
                    <td><button data-exp="5" data-id = "\${performerinfo.application_lid}" data-toggle="modal" type="button" class="exp-btn btn btn-outline-primary text-dark">\${performerinfo.teaching_exp}</button></td>
                    <td><button data-exp="4" data-id = "\${performerinfo.application_lid}" data-toggle="modal" type="button" class="exp-btn btn btn-outline-primary text-dark">\${performerinfo.industrial_exp}</button></td>
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
                    <td><button data-skill="\${maxpoints.skill}" data-experience="\${maxpoints.experience}" data-achievement="\${maxpoints.achievement}" data-qualification="\${maxpoints.qualification}" data-totalP="\${maxpoints.total_points}" data-toggle="modal" type="button" class="point-distribution btn btn-outline-primary text-dark">\${maxpoints.total_points}</button></td>
                    <td><button data-id = "\${performerinfo.proforma_id}" data-toggle="modal" type="button" class="comments-btn btn btn-outline-primary text-dark">Comments</button></td>
                    <td data-id ="\${performerinfo.proforma_id}">\${performerinfo.status_lid == '4'?  '<a class="fa fa-solid fa-download text-dark fa-2x file-download-btn"></a>' : 'N.A'}</td>
                    <td>\${performerinfo.status} by \${performerinfo.modified_by}</td>`
                    if(performerinfo.status_lid != 4){
                    view += `
                    <td><i data-id="\${performerinfo.proforma_id}" class="fa-solid fa-fast-forward approval-btn" title="Send for Approval"></i></td>
                <tr>
                ` ;
                } else{
                    view += `
                    <td><i class="fa-solid text-success fa-check" title="Approved"></i></td>
                <tr>
                ` ;
                }
                            }
                            document.querySelector('.proforma-view').innerHTML = view;
                        }
                    },
                    error: function (error) {
                        console.log("error", error)
                    }
                });
            }
            getAllProforma();


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
                                <table class="table table-responsive ">
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
                                            <td>\${gd.year_of_passing}</td>
                                        </tr>`
                                }
                                qualdetails += `</tbody>
                                </table>
                            </div>   
                        </div>

                        `
                                $('.card').remove();
                                document.querySelector('.qualification-div')
                                    .insertAdjacentHTML(
                                        'afterend', qualdetails);
                            } else {
                                let qualdetails = `
                        <div class="card">
                        <h4 align="center">No Data Available</h4>
                        </div>
                        `
                                document.querySelector('.qualification-div')
                                    .insertAdjacentHTML(
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
                        url: 'https://dev-portal.svkm.ac.in:8080/vfApi/getFeedback?panCardNo=' +
                            e.target
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
                                document.querySelector('.qualification-div')
                                    .insertAdjacentHTML(
                                        'afterend', feedback);
                            } else {
                                let feedback = `
                        <div class="card">
                        <h4 align="center">No Feedback Available</h4>
                        </div>
                        `
                                $('.card').remove();
                                document.querySelector('.qualification-div')
                                    .insertAdjacentHTML(
                                        'afterend', feedback);
                            }
                        },
                        error: function (error) {
                            console.log("ERROR")
                        }

                    })

                }

                if (e.target.classList.contains('file-download-btn')) {
                    let proformaId = e.target.closest('td').dataset.id
                    $.ajax({
                        url: '${pageContext.request.contextPath}/download-file',
                        data: proformaId,
                        type: 'POST',
                        contentType: false,
                        success: function (response) {
                            e.preventDefault()
                            fetchFile("${pageContext.request.contextPath}/imagedata/" + response)
                        },
                        error: function (error) {
                            console.log(error)
                        }
                    })
                }

                function fetchFile(url) {
                    fetch(url).then(res => res.blob()).then(file => {
                        let tempUrl = URL.createObjectURL(file);
                        let aTag = document.createElement('a');
                        aTag.href = tempUrl;
                        aTag.download = "AcceptanceFile";
                        document.body.appendChild(aTag);
                        aTag.click();
                        aTag.remove();
                    })
                }
            })


            document.querySelector('.main').addEventListener('click', function (e) {


                
                if (e.target.classList.contains('approval-btn')) {
                    proformaid = e.target.dataset.id
                    console.log("LEVEL>>>>>>>>>>", '${level}')
                    let statusObject = {
                        "get_status_list": []
                    }
                    let object = {}
                    object.proforma_lid = proformaid;
                    object.level = '${level}';
                    statusObject.get_status_list.push(object)
                    console.log(JSON.stringify(statusObject))

                    $.ajax({
                        url: '${pageContext.request.contextPath}/get-status-list',
                        type: 'POST',
                        data: JSON.stringify(statusObject),
                        contentType: false,
                        success: function (response) {
                            if (response != null) {

                                let selectOptions = JSON.parse(response.value)
                                console.log(selectOptions)
                                let commentbox =
                                    `<textarea class="textarea proforma-comment container" data-id="\${proformaid}" cols="50" rows="5"></textarea>`;
                                let options =
                                    `<option value="0" selected>Select Status</option>`
                                if (selectOptions.status_list != null) {

                                    for (let option of selectOptions.status_list) {
                                        options +=
                                            `<option value="\${option.id}">\${option.name}</option>`
                                    }
                                    let card = document.querySelector(
                                            '.proforma-approval-body')
                                        .querySelector(
                                            'textarea')
                                    card == null ? '' : card.remove()
                                    document.querySelector('.proforma-approval-body')
                                        .insertAdjacentHTML(
                                            'afterbegin', commentbox)
                                    document.querySelector('.status-select').innerHTML =
                                        options
                                    $('#proforma-approval-modal').modal('toggle');
                                    if('${level}' == 1) {
                                        document.querySelector('.status-select').lastElementChild.remove()
                                    }
                                }

                            }
                        },
                        error: function (error) {
                            console.log(error);
                        }
                    })
                }

                if (e.target.classList.contains('close1')) {
                    document.querySelector('.card').remove()
                    $(".qualification-display").modal("toggle");
                }
                if (e.target.classList.contains('close2')) {
                    document.querySelector('.proforma-approval-body').firstElementChild.remove()
                    $("#proforma-approval-modal").modal("toggle");
                }
                if (e.target.classList.contains('proforma-approval-submit-btn')) {

                    document.querySelector('.proforma-comment').classList.remove('border-danger');
                    document.getElementById('main-loader').classList.remove('d-none')
                    document.getElementById("approval-file").classList.remove('border-danger')
                    document.querySelector('.status-select').classList.remove('border-danger');
                    const fileInput = document.getElementById("approval-file");
                    console.log("APPROVAL FILE" , fileInput.length);
                    let objectData = {}
                    objectData.proforma_lid = document.querySelector('.proforma-comment').dataset.id
                    objectData.level = '${level}'
                    objectData.comment = document.querySelector('.proforma-comment').value
                    objectData.status_lid = document.querySelector('.status-select').value
                    objectData.approved_by = '${user_id}'

                    if (objectData.status_lid < 1 || objectData.status_lid > 4 ) {
                        document.querySelector('.status-select').classList.add('border-danger');
                        document.getElementById('main-loader').classList.add('d-none')
                        return;
                    } 
                    if(objectData.status_lid == 2 && objectData.comment.length < 1) {
                        document.querySelector('.proforma-comment').classList.add('border-danger');
                        document.querySelector('.proforma-comment').outerHTML += "<p class='text-danger'style='width:auto'>Please Enter Reason</p>"
                        document.getElementById('main-loader').classList.add('d-none')
                        return;
                    }
                    if(objectData.status_lid == 4 && objectData.comment.length < 1 ) {
                        document.querySelector('.proforma-comment').classList.add('border-danger');
                        document.querySelector('.proforma-comment').outerHTML += "<p class='text-danger'style='width:auto'>Please Enter Reason</p>"
                        document.getElementById('main-loader').classList.add('d-none')
                        return;
                    }
                    if(objectData.status_lid == 4 && (fileInput.value.length < 1 || !fileInput)) {
                        fileInput.classList.add('border-danger');
                        fileInput.outerHTML += "<p class='text-danger'style='width:auto'>Please Upload File</p>"
                        document.getElementById('main-loader').classList.add('d-none')
                        return;
                    }

                    let fileArray = []

                    let approvalFile = document.getElementById("approval-file").files[0]
                    if (approvalFile) {
                    let filereader = new FileReader();
                    filereader.readAsDataURL(approvalFile);
                    filereader.onload =  function  (evt) {
                        let profilePhotoBase64 =  evt.target.result;
                        fileArray[0] = profilePhotoBase64
                        console.log(profilePhotoBase64)
                    }
                       
                    } else {
                        fileArray[0] = null;
                    }
                    let proformaArray = {
                        "insert_proforma_status": []
                    }

                    setTimeout(function() {

                    objectData.file_path = fileArray[0]
                    
                    proformaArray.insert_proforma_status.push(objectData);

                    $.ajax({
                        url: '${pageContext.request.contextPath}/proforma-approval',
                        type: 'POST',
                        data: JSON.stringify(proformaArray),
                        contentType: false,
                        success: function (response) {
                            document.getElementById('main-loader').classList.add('d-none')
                            location.reload()
                        },
                        error: function (err) {
                            document.getElementById('main-loader').classList.add('d-none')
                            console.log("Error");
                        }

                    })
                },1200)

                }

                if (e.target.classList.contains('school-select')) {
                    let objArray = {
                        "proforma_details": []
                    }
                    let organization_lid = e.target.value
                    if (organization_lid == 0) {
                        document.querySelector('.proforma-view').innerHTML = '';
                        getAllProforma();
                        return;
                    }
                    let obj = {
                        "level": '${level}',
                        "organization_lid": organization_lid
                    }
                    objArray.proforma_details.push(obj)

                    $.ajax({
                        url: '${pageContext.request.contextPath}/proforma-view',
                        type: 'POST',
                        data: JSON.stringify(objArray),
                        async: false,
                        contentType: false,
                        success: function (response) {
                            let data = JSON.parse(response.value)
                            performerinfoobj = data;

                            if (performerinfoobj != null) {
                                let view = ``
                                if(performerinfoobj.proforma_details != null) {

                                for (performerinfo of performerinfoobj.proforma_details) {
                                    let maxpoints = JSON.parse(performerinfo.max_points_2)
                                             console.log(maxpoints)
                                    view += `
                                    <tr>
                                        <td>\${performerinfo.created_date}</td>
                                        <td>\${performerinfo.full_name}</td>
                                        <td>\${performerinfo.pancard_no}</td>
                                        <td><button data-qual="\${performerinfo.application_lid}" data-id = "1" data-toggle="modal" data-target=".bd-example-modal-lg" type="button" class="qual-btn btn btn-outline-primary text-dark">Graduate</button> </td>
                                        <td><button data-qual="\${performerinfo.application_lid}" data-id = "2" data-toggle="modal" data-target=".bd-example-modal-lg" type="button" class="qual-btn btn btn-outline-primary text-dark">Masters</button></td>
                                        <td><button data-qual="\${performerinfo.application_lid}" data-id = "3" data-toggle="modal" data-target=".bd-example-modal-lg" type="button" class="qual-btn btn btn-outline-primary text-dark">PHD</button></td>
                                        <td><button data-exp="5" data-id = "\${performerinfo.application_lid}" data-toggle="modal" type="button" class="exp-btn btn btn-outline-primary text-dark">\${performerinfo.teaching_exp}</button></td>
                                        <td><button data-exp="4" data-id = "\${performerinfo.application_lid}" data-toggle="modal" type="button" class="exp-btn btn btn-outline-primary text-dark">\${performerinfo.industrial_exp}</button></td>
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
                                        <td><button data-skill="\${maxpoints.skill}" data-experience="\${maxpoints.experience}" data-achievement="\${maxpoints.achievement}" data-qualification="\${maxpoints.qualification}" data-totalP="\${maxpoints.total_points}" data-toggle="modal" type="button" class="point-distribution btn btn-outline-primary text-dark">\${maxpoints.total_points}</button></td>
                                        <td><button data-id = "\${performerinfo.proforma_id}" data-toggle="modal" type="button" class="comments-btn btn btn-outline-primary text-dark">Comments</button></td>
                                        <td data-id ="\${performerinfo.proforma_id}">\${performerinfo.status_lid == '4'?  '<a class="fa fa-solid fa-download text-dark fa-2x file-download-btn"></a>' : 'N.A'}</td>
                                        <td>\${performerinfo.status} by \${performerinfo.modified_by}</td>
                                        <td><i data-id="\${performerinfo.proforma_id}" class="fa-solid fa-fast-forward approval-btn" title="Send for Approval"></i></td>
                                    <tr>
                `
                                }
                                document.querySelector('.proforma-view').innerHTML = view;
                            } else {
                                document.querySelector('.proforma-view').innerHTML = ""
                            }

                            }


                        },
                        error: function (error) {
                            console.log("error", error)
                        }
                    });

                    
                }
                if (e.target.classList.contains('point-distribution')) {

                    let skillPoint = e.target.dataset.skill
                    let experiencePoint = e.target.dataset.experience
                    let achievementPoint = e.target.dataset.achievement
                    let qualificationPoint = e.target.dataset.qualification
                    let totalPoint = e.target.innerText

                    console.log(skillPoint)

                    if(skillPoint != null){

                        let pointDistribution = `<div class="card">
                                        <table>
                                            <thead>
                                                <th>Skill</th>
                                                <th>Experience</th>
                                                <th>Achievement</th>
                                                <th>Qualification</th>
                                                <th>Total Points</th>
                                            </thead>
                                            </hr>
                                            <tbody>`

                        pointDistribution +=  `<tr>
                                   <td>\${skillPoint}</td>
                                   <td>\${experiencePoint}</td>
                                   <td>\${achievementPoint}</td>
                                   <td>\${qualificationPoint}</td>
                                   <td>\${totalPoint}</td>
                                </tr> `

                        pointDistribution += `</tbody></table></div>`

                               $('.card').remove();
                                document.querySelector('.qualification-div').innerHTML = pointDistribution
                                $(".qualification-display").modal("toggle");
                            } else {

                                let noexp = `
                                <div class="card">
                                    <h4 align="center"> No Data Available </h4>
                                </div>
                                 `
                                $('.card').remove();
                                $(".qualification-display").modal("toggle");
                                document.querySelector('.qualification-div').insertAdjacentHTML('afterend', noexp);


                            }


                }

                //
                if (e.target.classList.contains('comments-btn')) {
                    let proforma_lid = e.target.dataset.id
                    $.ajax({
                        url: '${pageContext.request.contextPath}/get-comments',
                        type: 'POST',
                        data: JSON.stringify({
                            "proforma_lid": proforma_lid
                        }),
                        async: false,
                        contentType: 'application/json',
                        success: function (response) {
                            let divToAppend = ``
                            let commentData = JSON.parse(response.value);
                            if (commentData.comments != null) {
                                console.log(commentData)
                                for (let data of commentData.comments) {
                                    divToAppend += `
                                   <div class="card pb-4">
                                        <div class="text-justify darker mt-4 float-right">
                                            <h6>\${data.approved_by}</h6>
                                            <span>- \${data.created_date}</span>
                                            <br>
                                            <p>\${data.comment}</p>
                                        </div>
                                    </div>`
                                }

                            } else {
                                divToAppend += `
                                   <div class="pb-4">
                                        <div class="text-justify darker mt-4 float-right">
                                            <h4>No Comments Available</h4>
                                        </div>
                                    </div>`
                            }

                            $('.card').remove();
                            document.querySelector('.comments-body').innerHTML =
                                divToAppend;
                            $('#comments-modal').modal('toggle');
                        },
                        error: function (error) {}
                    })

                }
                if (e.target.classList.contains('comments-cancel-button')) {

                    $('#comments-modal').modal('toggle')

                }


                if (e.target.classList.contains('exp-btn')) {
                    let objArray = []
                    let obj = {
                        application_lid: e.target.dataset.id,
                        experience_type_lid: e.target.dataset.exp
                    }
                    objArray.push(obj)
                    let objJson = {
                        'get_application_experience': objArray
                    }
                    console.log(JSON.stringify(objJson));
                    $.ajax({
                        url: '${pageContext.request.contextPath}/get-experience',
                        type: 'POST',
                        data: JSON.stringify(objJson),
                        contentType: false,
                        success: function (response) {
                            let experienceType = 0;
                            let expdata = JSON.parse(response.value)
                                .application_resume_experience;
                            console.log(expdata)

                            if (expdata != null) {

                                let teachingExperience = `<div class="card">
                                        <table class="table table-display table-bordered">
                                            <thead>
                                                <th>University/Institute</th>
                                                <th>Program</th>
                                                <th>Subject Taught</th>
                                                <th>Pedagogy</th>
                                                <th>Designation</th>
                                                <th>Start Date</th>
                                                <th>End Date</th>
                                            </thead>
                                            </hr>
                                            <tbody>`

                                let industryTable = `<div class="card">
                                        <table class="table table-display table-bordered">
                                            <thead>
                                                <th>Organizatione</th>
                                                <th>Responsibility</th>
                                                <th>Designation</th>
                                                <th>Start Date</th>
                                                <th>End Date</th>
                                            </thead>
                                            </hr>
                                            <tbody>`
                                for (let exp of expdata) {
                                    if (exp.experience_type_lid === 5) {
                                        experienceType = 5;
                                        teachingExperience += `
                                <tr>
                                   <td>\${exp.employer_name}</td>
                                   <td>\${exp.description}</td>
                                   <td>\${exp.responsibilities}</td>
                                   <td>\${exp.padagogy == "" ? 'N.A' : exp.padagogy}</td>
                                   <td>\${exp.designation}</td>
                                   <td>\${exp.start_date}</td>
                                   <td>\${exp.end_date}</td>
                                </tr> `
                                    } else if (exp.experience_type_lid === 4) {
                                        experienceType = 4;
                                        industryTable += `
                                <tr>
                                   <td>\${exp.employer_name}</td>
                                   <td>\${exp.responsibilities}</td>
                                   <td>\${exp.designation}</td>
                                   <td>\${exp.start_date}</td>
                                   <td>\${exp.end_date}</td>
                                </tr> `
                                    }

                                }

                                teachingExperience += `</tbody></table></div>`;
                                industryTable += `</tbody></table></div>`;
                                $('.card').remove();
                                document.querySelector('.qualification-div').innerHTML =
                                    experienceType == 5 ? teachingExperience : industryTable
                                $(".qualification-display").modal("toggle");
                            } else {
                                let noexp = `
                                <div class="card">
                                    <h4 align="center"> No Data Available </h4>
                                </div>
                        `
                                $('.card').remove();
                                $(".qualification-display").modal("toggle");
                                document.querySelector('.qualification-div')
                                    .insertAdjacentHTML('afterend', noexp);


                            }

                        },
                        error: function (err) {
                            alert('Refresh the Page and Try Again!!')
                        }
                    })
                }
                if(e.target.classList.contains('status-select')) {
                    if(e.target.value == 4) {
                       document.getElementById('approval-file').classList.remove('d-none')
                    } else {
                       document.getElementById('approval-file').classList.add('d-none')
                    }
                }

            })

            // if (Number.parseInt("${level}") > 2) {
            //     document.getElementById('select-div').classList.add('d-none');

            // }

//----------------------------------------------------------------ON CHANGE FUNCTIONS--------------------------------------------------------

        document.querySelector('.main').addEventListener('change', function(e){


            if(e.target.classList.contains('school-select'))
            {
               let organization_lid = document.querySelector('.school-select').value;
               if(organization_lid != null)
               {
                 let selectProgramList = '<option value="0" data-value="0">--SELECT--</option>';
                 $.ajax({   
                         url: 'https://dev-portal.svkm.ac.in:8080/vfApi/getProgramName?characters=&programId=0&schoolObjId=' + organization_lid ,
                         type: 'GET',
                         async: false,
                         success: function (response) {
                             let resResult = JSON.parse(response);
                 
                             for (let desig of resResult) {
                                     selectProgramList +=
                                 `<option class="programoptions" data-programid = "\${desig.id}" value="\${desig.id}">     
                                     \${desig.programName}
                                 </option>`
                                 document.querySelector('.program-select').innerHTML = selectProgramList
                                 
                             }
                         },
                         error: function (error) {
                             return error;
                         }
               });
               }
            }

            if(e.target.classList.contains('select-program'))
            {
                let programId = document.querySelector('.select-program').value;
                let selectSessionList = '<option data-value="0">--SELECT--</option>' 
                if(programId != null)
                {
                $.ajax({
                        url: 'https://dev-portal.svkm.ac.in:8080/vfApi/getacadSession?programId=' + programId,
                        type: 'GET',
                        success: function (response) {
                            let resResult = JSON.parse(response).data;
                        
                            for (let session of resResult) {
                            
                                selectSessionList +=
                                    `<option data-semister="\${session.acadSession}">     
                                        \${session.acadSession}
                                    </option>`
                                document.querySelector('.select-semester').innerHTML = selectSessionList;
                            }                        
                        },
                        error: function (error) {
                            return error;
                        }
                })
                }
            }

            if(e.target.classList.contains('select-semester'))
            {
                let programId =  document.querySelector('.select-program').value;
                let sessionName =  document.querySelector('.select-semester').value;
                let selectSubjectList = '<option data-value="0">--SELECT--</option>';
                console.log('subject :', programId)
                console.log('sessionName :', sessionName)

                $.ajax({
                        url: 'https://dev-portal.svkm.ac.in:8080/vfApi/getSubjectName?programId=' + programId + '&semester=' + sessionName ,
                        type: 'GET',
                        success: function (response) {
                            console.log('response->',response)           
                            if(!response) {
                                response = '[]';
                            }
                            let resResult = JSON.parse(response);
                            for (let sub of resResult) {
                                if(sub.moduleName != null) {
                
                                    selectSubjectList +=
                                    `<option data-value="\${sub.moduleName}" data-id="\${sub.moduleId}">     
                                        \${sub.moduleName}
                                        </option>`
                                 document.querySelector('.select-subject').innerHTML = selectSubjectList;
                                 }
                            }
                        },
                        error: function (error) {
                            return error;
                        }
            })
            }

            if(e.target.classList.contains('filter') || findClosest(e.target,'filter'))
                {
                    let obj = {
                        filter_id: findClosest(e.target,'filter').dataset.filter,
                        level: '${level}',
                        status_lid: 1,
                        filter_date : document.querySelector('.select-date').value,
                        organization_lid: document.querySelector('.school-select ').value,
                        program_id: document.querySelector('.select-program').value == 0 ? null : document.querySelector('.select-program').value,
                        acad_session: document.querySelector('.select-semester').value == '' ? null : document.querySelector('.select-semester').value,
                        status_lid: document.querySelector('.select-status-option').value == 0 ? null : document.querySelector('.select-status-option').value,
                        module_id: null,

                    }
                    let filterObj = {"get_filter": []};
                    filterObj.get_filter.push(obj);
                    console.log('OBJ : ',JSON.stringify(filterObj))
                    $.ajax({
                        url: '${pageContext.request.contextPath}/get-proforma-filter',
                        type: 'POST',
                        data: JSON.stringify(filterObj),
                        contentType: false, 
                        success: function(response){
                            let data = JSON.parse(response.value)
                            performerinfoobj = data;

                            if (performerinfoobj != null) {
                                let view = ``
                                if(performerinfoobj.proforma_details != null) {

                                for (performerinfo of performerinfoobj.proforma_details) {
                                    let maxpoints = JSON.parse(performerinfo.max_points_2)
                                             console.log(maxpoints)
                                    view += `
                                    <tr>
                                        <td>\${performerinfo.created_date}</td>
                                        <td>\${performerinfo.full_name}</td>
                                        <td>\${performerinfo.pancard_no}</td>
                                        <td><button data-qual="\${performerinfo.application_lid}" data-id = "1" data-toggle="modal" data-target=".bd-example-modal-lg" type="button" class="qual-btn btn btn-outline-primary text-dark">Graduate</button> </td>
                                        <td><button data-qual="\${performerinfo.application_lid}" data-id = "2" data-toggle="modal" data-target=".bd-example-modal-lg" type="button" class="qual-btn btn btn-outline-primary text-dark">Masters</button></td>
                                        <td><button data-qual="\${performerinfo.application_lid}" data-id = "3" data-toggle="modal" data-target=".bd-example-modal-lg" type="button" class="qual-btn btn btn-outline-primary text-dark">PHD</button></td>
                                        <td><button data-exp="5" data-id = "\${performerinfo.application_lid}" data-toggle="modal" type="button" class="exp-btn btn btn-outline-primary text-dark">\${performerinfo.teaching_exp}</button></td>
                                        <td><button data-exp="4" data-id = "\${performerinfo.application_lid}" data-toggle="modal" type="button" class="exp-btn btn btn-outline-primary text-dark">\${performerinfo.industrial_exp}</button></td>
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
                                        <td><button data-skill="\${maxpoints.skill}" data-experience="\${maxpoints.experience}" data-achievement="\${maxpoints.achievement}" data-qualification="\${maxpoints.qualification}" data-totalP="\${maxpoints.total_points}" data-toggle="modal" type="button" class="point-distribution btn btn-outline-primary text-dark">\${maxpoints.total_points}</button></td>
                                        <td><button data-id = "\${performerinfo.proforma_id}" data-toggle="modal" type="button" class="comments-btn btn btn-outline-primary text-dark">Comments</button></td>
                                        <td data-id ="\${performerinfo.proforma_id}">\${performerinfo.status_lid == '4'?  '<a class="fa fa-solid fa-download text-dark fa-2x file-download-btn"></a>' : 'N.A'}</td> 
                                        <td>\${performerinfo.status} by \${performerinfo.modified_by}</td>
                                        <td><i data-id="\${performerinfo.proforma_id}" class="fa-solid fa-fast-forward approval-btn" title="Send for Approval"></i></td>
                                    <tr>
                `
                                }
                                document.querySelector('.proforma-view').innerHTML = ""
                                document.querySelector('.proforma-view').innerHTML = view;
                            } else {
                                document.querySelector('.proforma-view').innerHTML = ""
                            }

                            }
                        },  
                        error: function (error) {
                            console.log(error);
                        }
                    })
                }

        })



        });



    </script>
</body>

</html>