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


    <title>Discontinue Page</title>
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


        <div class="modal fade" id="discontinue-modal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Comment for Discontinue</h5>
                        <button type="button" style="border: none;" class="close2 modal2-cancel-button"
                            data-dismiss="modal" aria-label="Close">
                            <span class="close2" aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="discontinue-body container" style="width: auto;">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="close2 btn btn-secondary modal2-cancel-button"
                            data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-success discontinue-submit-btn">Submit</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="comments-modal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Comments</h5>
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

        </div>



        <div class="main-content">
            <h3 class="text-center">--DISCONTINUE--FACULTY--</h3>
            <div class="col-md-9 text-center pt-4 d-none" id="select-div" style="margin: auto;">
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


            <div class="table-responsive table-wrapper px-2 perfoma-table  pt-5">
                <table class='table table-display table-bordered proforma-report-table' id="proforma-report-table">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>PAN No</th>
                            <th>Subject</th>
                            <th>Program</th>
                            <th>Acad Session</th>
                            <th>Action</th>
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
                                    `<option class="school-option col-md-10 col-sm-10 col-12" value="\${desig.organization_id}" data-name="\${desig.name}">\${desig.name}
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

                $.ajax({
                    url: '${pageContext.request.contextPath}/get-all-approved-proforma',
                    type: 'POST',
                    data: JSON.stringify('1'),
                    async: false,
                    contentType: false,
                    success: function (response) {
                        performerinfoobj = JSON.parse(response.value)
                        console.log(performerinfoobj)
                        if (performerinfoobj.proforma_details != null) {
                            let view = ``
                            for (performerinfo of performerinfoobj.proforma_details) {
                                let maxpoints = JSON.parse(performerinfo.max_points_2)
                                view += `
                                <tr class="proforma-tr" >
                                    <td>\${performerinfo.full_name}</td>
                                    <td>\${performerinfo.pancard_no}</td>
                                    <td>\${performerinfo.module}</td>
                                    <td>\${performerinfo.program_name}</td>
                                    <td>\${performerinfo.acad_session}</td>
                                    <td><button data-organization-id="\${performerinfo.organization_lid}" data-id="\${performerinfo.proforma_id}" class="discontinue-btn btn btn-outline-danger text-dark"><i class="fa fa-solid fa-ban "></i> DISCONTINUE</button></td>
                                <tr>
                                `
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

            let graduation = 1;
            let masters = 1;
            let phd = 1;

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
                                            <td>\${gd.rev_timestamp}</td>
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
            })


            document.querySelector('.main').addEventListener('click', function (e) {

                if (e.target.classList.contains('close1')) {
                    document.querySelector('.card').remove()
                    $(".qualification-display").modal("toggle");
                }
                if (e.target.classList.contains('close2')) {
                    document.querySelector('.discontinue-body').firstElementChild.remove()
                    $("#discontinue-modal").modal("toggle");
                }
                //

                if (e.target.classList.contains('discontinue-btn')) {
                    let proformaId = e.target.dataset.id
                    let organizationid = e.target.dataset.organizationId
                    $(".discontinue-body").html(
                        `<textarea class="textarea proforma-comment container" data-organization-id="\${organizationid}" data-id="\${proformaId}" cols="50" rows="5"></textarea>`
                        )
                    $('#discontinue-modal').modal('toggle')

                }
                if (e.target.classList.contains('discontinue-submit-btn')) {
                    console.log("clickedd")
                    let commentBox = document.querySelector('.proforma-comment')

                    document.getElementById('main-loader').classList.remove('d-none')
                    commentBox.classList.remove('border-danger')

                    let commentValue = commentBox.value;
                    let jsonArray = {
                        "insert_discontinue": []
                    }
                    let objToPush = {}
                    objToPush.proforma_lid = commentBox.dataset.id;
                    objToPush.comment = commentValue;
                    objToPush.created_by = '${user_id}';
                    objToPush.organization_lid = commentBox.dataset.organizationId;
                    jsonArray.insert_discontinue.push(objToPush)
                    if (commentValue.length < 1) {
                        commentBox.classList.add('border-danger');
                        commentBox.outerHTML +=
                            `<p class="text-center text-danger" > Please Enter Comment</p>`;
                        document.getElementById('main-loader').classList.add('d-none');
                        return;
                    }

                    console.log(JSON.stringify(jsonArray))
                    $.ajax({
                        url: '${pageContext.request.contextPath}/discontinue-faculty',
                        type: 'POST',
                        data: JSON.stringify(jsonArray),
                        contentType: false,
                        success: function (response) {

                            document.getElementById('main-loader').classList.add('d-none');

                        },
                        error: function (error) {
                            document.getElementById('main-loader').classList.add('d-none');
                            console.log(error)
                        }
                    })
                }

            })

            if (Number.parseInt("${level}") > 2) {
                document.getElementById('select-div').classList.add('d-none');

            }

        });
    </script>
</body>

</html>