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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/simpleAlert.css">

    <title>Resume Search</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images.jpg">
</head>

<body>

    <div class="modal fade" id="view-resume-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">View Resume</h5>
                    <button type="button" style="border: none;" class="modal2-cancel-button" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal2-body">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary modal2-cancel-button"
                        data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="left-sidebar.jsp" />

    <main class="main">
        <jsp:include page="header.jsp" />

        <div class="main-content">

            <!-- Error Alert -->
            <div class="validation-alert alert alert-danger alert-dismissible fade show d-none">
                <strong>Error!</strong>&nbsp Not Available
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
            <div class="no-data-alert alert alert-info alert-dismissible fade show d-none">
                <strong>Sorry!</strong>No Data Available
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>

            <h3 class="text-center">Search Visiting Faculty</h3>
            <div class="row px-lg-5 mx-lg-5">
                <div class="col-md-6">
                    <div class="input-group ">
                        <input type="search" class="form-control rounded" placeholder="Enter Pancard no."
                            aria-label="Search" id="search-by-id" aria-describedby="search-addon" />
                        <button type="button" class="btn btn-outline-primary faculty-search-button">search</button>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="input-group col-md-6">
                        <input type="search" id="search-by-name" class="form-control rounded" placeholder="Enter Name"
                            aria-label="Search" aria-describedby="search-addon" />
                        <button type="button" class="btn btn-outline-primary faculty-search-button">search</button>
                    </div>
                </div>
            </div>
            <hr>


            <div class="table-appending-div">

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

        <div class="modal fade" id="create-resume-modal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Create Resume</h5>
                        <button type="button" style="border: none;" class="modal-cancel-button" data-dismiss="modal"
                            aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="user-id">Pancard No.</label>
                            <input type="text" disabled id="user-id" class=" form-control">
                        </div>
                        <div class="form-group">
                            <label for="user-id">Enter Resume name</label>
                            <input minlength="3" type="text" id="resume-name" placeholder="Enter Resume Name"
                                class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="resume-description">Description</label>
                            <input type="text" id="resume-description" placeholder="Enter Description"
                                class="form-control">
                            <input type="hidden" id="user-lid" class="form-control">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary modal-cancel-button"
                            data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary modal-create-resume-button">Create Resume</button>
                    </div>
                </div>
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
        $(document).ready(function () {

            let timeout = null;

            function searchFunction(value) {
                
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/get-faculty-application',
                    data: {
                        user_id: value.toUpperCase()
                    },
                    success: function (response) {
                        let data = JSON.parse(response.value)
                        console.log("Available Resumes :",data)
                        document.querySelector('.validation-alert').classList.add('d-none')

                        if (data.resume_details != null) {


                            let tableToAppend = `
                            <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                       
                                <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Pan Card No</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>`
                            for (let obj of data.resume_details) {
                                console.log('length : '+obj.f_name);
                                if (obj.f_name == null) {
                                    tableToAppend += `
                                    <tr data-userlid = "\${obj.user_lid}">
                                        <td>----</td>
                                        <td class="user_id">\${obj.user_id}</td>
                                        <td>
                                            <a class="application-preview" style="border:none; outline:none" >
                                            <i class="fa-solid fa-eye view-resume-icon" data-toggle="tooltip" title="View Resume"></i></a>
                                            <a  class="" style="border:none; outline:none" >`
                        //Added to Hide Create Resume After Once Created 
                                        if(obj.f_name == null){
                        tableToAppend += ` <i style="color: green;" class="fa-solid fa-plus create-resume-button" data-toggle="tooltip" title="Create Resume"></i></a>`
                                        }
                        tableToAppend +=  `</td>
                                    </tr>`
                                } else {
                                    tableToAppend += `
                                    <tr data-userlid = "\${obj.user_lid}">
                                        <td>\${obj.f_name}</td>
                                        <td class="user_id">\${obj.user_id}</td>
                                        <td>
                                                <a class="application-preview" style="border:none; outline:none" >
                                                <i class="fa-solid fa-eye view-resume-icon" data-toggle="tooltip" title="View Resume"></i></a>
                                                <a  class="" style="border:none; outline:none" >`
                        //Added to Hide Create Resume After Once Created 
                                if(obj.f_name == null){
                                    tableToAppend +=`<i style="color: green;" class="fa-solid fa-plus create-resume-button" data-toggle="tooltip" title="Create Resume"></i></a>`
                                }      
                                    tableToAppend +=  `</td>
                                    </tr>`
                                }

                            }

                            tableToAppend += `  </tbody>
                                                     </table>
                                                           </div> `

                            $('.table-appending-div').html(tableToAppend)
                        } else {
                        document.querySelector('.no-data-alert').classList.remove('d-none')

                        }

                    },
                    error: function (error) {
                        document.querySelector('.validation-alert').classList.remove('d-none')

                    }
                })
                console.log(value);
            }

            function searchFunctionByName(value) {
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/get-faculty-by-name',
                    data: {
                        user_id: value
                    },
                    success: function (response) {
                        let data = JSON.parse(response.value)
                        console.log(data)

                        if (data.resume_details != null) {


                            let tableToAppend = `
                                <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

                                    <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Pan Card No</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>`
                            for (let obj of data.resume_details) {
                                tableToAppend +=
                                    ` <tr data-userlid = "\${obj.user_lid}">
                                            <td>\${obj.f_name}</td>
                                            <td class="user_id">\${obj.user_id}</td>
                                            <td>
                                                <a class="application-preview" style="border:none; outline:none" >
                                                <i class="fa-solid fa-eye view-resume-icon" data-toggle="tooltip" title="View Resume"></i></a>
                                                <a  class="" style="border:none; outline:none" >
                                            <i class="fa-solid fa-plus create-resume-button" data-toggle="tooltip" title="Create Resume"></i></a>
                                            
                                            </td>
                                        </tr>`
                            }

                            tableToAppend += `  </tbody>
                                    </table>


                                </div>
                                                        `

                            $('.table-appending-div').html(tableToAppend)
                        } else {
                            document.querySelector('.no-data-alert').classList.remove('d-none')
                            $('.table-appending-div').html("")
                        }


                    },
                    error: function (error) {
                        document.querySelector('.validation-alert').classList.remove('d-none')
                        console.log("Error");
                    }
                })
                console.log(value);
            }

            $('#search-by-id').on('keyup', function () {
                let searchByIdValue = document.getElementById('search-by-id').value

                    clearTimeout(timeout)
                    const value = this.value
                    timeout = setTimeout(() => searchFunction(value.toUpperCase()), 2000)

            })

            $('#search-by-name').on('keyup', function () {

                clearTimeout(timeout)
                const value = this.value.toUpperCase()
                timeout = setTimeout(() => searchFunctionByName(value), 2000)

            })

            $(document).on('click', '.create-resume-button', function () {

                let tr = $(this).closest('tr')
                $('#user-id').val(tr.find('.user_id').html())
                $('#user-lid').val(tr.data('userlid'))
                $("#create-resume-modal").modal("toggle");

            })

            $(document).on('click', '.modal-cancel-button', function () {
                $("#create-resume-modal").modal("toggle");
            })

            $(document).on('click', '.modal2-cancel-button', function () {
                $("#view-resume-modal").modal("toggle");
            })

            $('.modal-create-resume-button').on('click', function (e) {
                console.log("clicked create resume")
                e.preventDefault();
                let myForm = document.getElementById('create-resume-form');
                let formData = new FormData()

                formData.append("user_lid", document.getElementById('user-lid').value)
                formData.append("name", document.getElementById('resume-name').value)
                formData.append("description", document.getElementById('resume-description').value)

                $.ajax({
                    url: '${pageContext.request.contextPath}/create-resume',
                    type: 'POST',
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (response) {
                        location.href =
                            '${pageContext.request.contextPath}/resume?resume_lid=' +
                            response
                    },
                    error: function (error) {
                        console.log('error', error)
                    }
                })
            })

            $(document).on('click', '.view-resume-icon', function () {

                let tr = $(this).closest('tr')
                let id = tr.data('userlid')
                $.ajax({
                    url: '${pageContext.request.contextPath}/get-resume-by-user?user_id=' + id,
                    type: 'POST',
                    success: function (response) {
                        let data = JSON.parse(response.value)

                        console.log(data)

                        if (data.resume_details != null) {


                            let tableToAppend = `
                                <div class="tab-content" id="myTabContent">
                                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

                                    <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>Resume Name</th>
                                        <th>Resume Description</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>`
                            for (let obj of data.resume_details) {
                                console.log(obj.id)
                                tableToAppend += `
                                        <tr>
                                            <td>\${obj.name}</td>
                                            <td class="user_id">\${obj.description}</td>
                                            <td>
                                                <a href="${pageContext.request.contextPath}/view-resume?resume_lid=\${obj.id}" class="application-preview" style="border:none; outline:none" >
                                                <i class="fa-solid fa-eye get-resume-icon" data-toggle="tooltip" title="View Resume"></i></a>
                                                <a  class="" style="border:none; outline:none" >
                                                <a href="${pageContext.request.contextPath}/resume?resume_lid=\${obj.id}" class="application-preview" style="border:none; outline:none" >
                                                <i class="fa-solid fa-edit get-resume-icon" data-toggle="tooltip" title="View Resume"></i></a>
                                                <a  class="" style="border:none; outline:none" >
                                            </td>
                                        </tr>`
                            }

                            tableToAppend += `  </tbody>
                                    </table>
                                </div>
                                       `
                            $('tab-content').remove()
                            document.querySelector('.modal2-body').innerHTML = ""
                            $('.modal2-body').html(tableToAppend)
                            $("#view-resume-modal").modal("toggle");
                            
                        } else {
                            document.querySelector('.modal2-body').innerHTML = `<div class="tab-content container"><h5 class="text-center mt-3 mb-3" > -- No resume has been created -- </h5></div>`
                            $("#view-resume-modal").modal("toggle");

                        }
                    },
                    error: function (error) {

                        console.log("error", error)
                    }
                })

            })

            $(document).on('click', '.view-job-application', function () {

                $("#view-resume-modal").modal("toggle");
                let tr = $(this).closest('tr')
                let id = tr.data('userlid')
                $.ajax({
                   url : ''
                })
            })
        })
    </script>
</body>

</html>