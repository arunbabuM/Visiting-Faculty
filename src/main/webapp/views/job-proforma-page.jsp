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

    <title>View Applications</title>
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
            <div class="validation-alert alert alert-danger alert-dismissible fade in show d-none">
                <strong>Error!</strong>&nbsp Not Available
                <button type="button" class="btn-close validation-close-btn"></button>
            </div>
            <div class="no-data-alert alert alert-info alert-dismissible fade in show d-none">
                <strong>SORRY!</strong>  No Data Available
                <button type="button" class="btn-close data-alert-close"></button>
            </div>


            <div class="row px-lg-5 mx-lg-5 container">
                <div class="col-md-12">
                    <h3 class="text-center">Search Applications</h3>
                    <div class="input-group w-50 pt-3" style="margin: auto;">
                        <input type="search" class="form-control rounded" placeholder="Enter Pancard no."
                            aria-label="Search" id="search-by-id" aria-describedby="search-addon" />
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.dev.js"></script>
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
            $('.data-alert-close').on('click',function() {
                document.querySelector('.no-data-alert').classList.add('d-none')
            })
            $('.validation-close-btn').on('click',function() {
                document.querySelector('.validation-alert').classList.add('d-none')
            })
            let timeout = null;

            function searchFunction(value) {
                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/get-admin-application-search',
                    data: JSON.stringify(value),
                    processData: false,
                    contentType: "application/json; charset=UTF-8",
                    success: function (response) {
                        let data = JSON.parse(response.value)
                        console.log(data)
                        document.querySelector('.validation-alert').classList.add('d-none')
                         console.log("entered inside loop of ajax succsss")
                              console.log(response.value)
                        if (data.application_details != null) {


                            let tableToAppend = `
                            <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                       
                                <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Pan Card No</th>
                                    <th>Resume Name</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>`
                            for (let obj of data.application_details) {
                                
                                    tableToAppend += `
                                    <tr data-userlid = "\${obj.user_lid}">
                                        <td>\${obj.full_name}</td>
                                        <td class="user_id">\${obj.user_id}</td>
                                        <td >\${obj.resume_name}</td>
                                        <td>
                                                <a class="application-preview" href="${pageContext.request.contextPath}/proforma-creation?application_lid=\${obj.appln_id}" style="border:none; outline:none" >
                                                <i class="fa-solid fa-eye view-resume-icon" data-toggle="tooltip" title="View"></i></a>
                                                
                                            </td>
                                    </tr>` 

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
                        console.log("entered inside loop of ajax")
                    }
                })
                console.log(JSON.stringify(value));
            }

            document.querySelector('.faculty-search-button').addEventListener('click', function () {
                let searchByIdValue = document.querySelector("#search-by-id").value

                let objectArray = []
                let object = {
                    'organization_lid': "${organization_lid}",
                    'input_text': searchByIdValue.toUpperCase()
                };
                objectArray.push(object)
                
                let getApplicationJson = {
                    "get_application": objectArray
                };
               searchFunction(getApplicationJson)

               console.log(getApplicationJson)
            })

        })
    </script>
</body>

</html>