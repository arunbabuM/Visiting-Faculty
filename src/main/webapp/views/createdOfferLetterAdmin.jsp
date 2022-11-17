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

    <title>Offer Letter</title>
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images.jpg">
</head>

<body>
    <jsp:include page="./left-sidebar.jsp" />
    <main class="main">
        <jsp:include page="./header.jsp" />
        <h3 class="text-center" style="margin-top: 12vh;">Offer Letter Details</h3>
        <hr>
        <div class="table-appending-div"></div>

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
                    $.ajax({
                    type: 'POST',
                    url: '${pageContext.request.contextPath}/get-created-offer-letter-admin-side',
                    data: {
                        user_id: "${user_id}"
                    },
                    success:function(response){
                        let data = JSON.parse(response.value)
                        console.log(data);

                    if (data.offer_letter_details_admin != null) {
                        let tableToAppend = `
                        <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">

                            <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>Program</th>
                                <th>School</th>
                                <th>Session</th>
                                <th>Approved By</th>
                                <th>Offer Letter</th>
                                <th>Accept/Reject</th>
                            </tr>
                            </thead>
                            <tbody>`
                        for (let obj of data.offer_letter_details_admin) {
                                tableToAppend += `
                                <tr data-userlid = "\${obj.organization_lid}">
                                    <td>\${obj.program_name}</td>
                                    <td>\${obj.school_name}</td>
                                    <td>\${obj.acad_session}</td>
                                    <td>\${obj.approved_by}</td>
                                    <td><a class="text-success" href="${pageContext.request.contextPath}/offer-letter?prof_id=\${obj.proforma_id}" > Offer letter </a></td>`
                                    if(!obj.status){
                                        tableToAppend += `<td>Pending</td>`
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
    </script>

</body>

</html>