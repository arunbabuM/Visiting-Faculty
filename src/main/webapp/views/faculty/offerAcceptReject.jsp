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

    <title>Dashboard</title>
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
    <jsp:include page="../left-sidebar.jsp" />

    <main class="main">
        <jsp:include page="../header.jsp" />

        <div class="main-content">

            <!-- Error Alert -->
            <div class="validation-alert alert alert-info alert-dismissible fade show d-none">
                <strong>Note!</strong>&nbsp No Offer Letter Available
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
            <div class="no-data-alert alert alert-info alert-dismissible fade show d-none">
                <strong>Error!</strong>No Data Available
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>

            <h3 class="text-center">Offer Letter</h3>
            <hr>


            <div class="table-appending-div">

            </div>

<!----------------------------------------------------------------------------------------------------------------------------- -->
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
            <textarea class="textarea offer-comment container" cols="50" rows="5"></textarea>
            <select class="form-select status-select form-select-lg mb-3">
                <option value= 0 selected disabled > Select Status </option>
                <option value = 1 > Accept </option>
                <option value = 2 > Reject </option>
            </select>
        </div>
        <div class="modal-footer">
            <button type="button" class="close2 btn btn-secondary modal2-cancel-button"
                data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-success offerSubmitBtn"
                data-dismiss="modal">Submit</button>
        </div>
    </div>
</div>
</div>

<!------------------------------------------------------------------------------------------------------------------------------------>







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

        console.log("${user_id}")
            $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/get_created_offer_letter',
                    data: {
                        user_id: "${user_id}"
                    },
                    success:function(response){
                        let data = JSON.parse(response.value)
                        console.log(data);

                    if (data.generated_offer_letter != null) {
                        let tableToAppend = `
                        <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

                            <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Program</th>
                                <th>School</th>
                                <th>Session</th>
                                <th>Offer Letter</th>
                                <th>Accept/Reject</th>
                            </tr>
                            </thead>
                            <tbody>`
                        for (let obj of data.generated_offer_letter) {
                                tableToAppend += `
                                <tr data-userlid = "\${obj.organization_lid}">
                                    <td>\${obj.program_name}</td>
                                    <td class="user_id">\${obj.school_name}</td>
                                    <td class="user_id">\${obj.acad_session}</td>
                                    <td><a class="text-success" href="${pageContext.request.contextPath}/offer-letter?prof_id=\${obj.proforma_id}" > Offer letter </a></td>`
                                    if(!obj.status){
                                        tableToAppend += `<td><i data-id = \${obj.proforma_id} class="fa-solid fa-forward text-primary acceptrejectbtn" data-toggle="tooltip" title=""></i></td>`
                                    } else if (obj.status == '1'){
                                        tableToAppend += `<td><i class="fa-solid fa-check text-success" title="Accepted"></i></td>`
                                    } else if (obj.status == '2'){
                                        tableToAppend += `<td><i class="fa-solid fa-xmark text-danger" title="Rejected"></i></td>`
                                    }
                                    
                        }
                        tableToAppend += `  </tbody>
                                                </table>
                                                    </div> `

                            $('.table-appending-div').html(tableToAppend)
                        }
                        else{
                            document.querySelector('.validation-alert').classList.remove('d-none');
                        }
                    },
                    error:function(err){
                        console.log('Error');
                    }
            });

            $(document).on('click','.acceptrejectbtn',function(){
                $('#proforma-approval-modal').modal('toggle');
                $('.offerSubmitBtn' ).attr( "data-id", $(this).attr('data-id'));
            })
            $(document).on('click','.close2',function(){
                $('#proforma-approval-modal').modal('toggle');
            })
            $(document).on('click','.offerSubmitBtn',function(){
                let prof_id = $(this).attr('data-id');
                let comment = $('.offer-comment').val();
                let status = $('.status-select').val()

                $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/update_offer_letter',
                    contentType: false,
                    data: JSON.stringify({
                        prof_id: prof_id,
                        comment: comment,
                        status: status
                    }),
                    success:function(response){
                        location.reload();
                    },
                    error:function(err){
                        document.querySelector('.no-data-alert').classList.remove('d-none');
                    }
            });
               
            })
                    
    </script>

</body>

</html>