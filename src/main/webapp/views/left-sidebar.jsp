<aside class="left-sidebar">

    <div class="left-sidebar-logo">
        <a href="${pageContext.request.contextPath}/dashboard"> <img
                src="${pageContext.request.contextPath}/image/logo-nmims.png" class="nmims-logo"> </a>
    </div>

    <ul class="offset-list offcanvas-body sidebar-body" id="left-sidebar-accordion">



    </ul>
</aside>

<script>
    let list = ``

    if ("${role}" == "ROLE_ADMIN") {
        list += `

        <a href="${pageContext.request.contextPath}/dashboard" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/speedometer.png" class="ps-3 pe-2"> Dashboard</li>
        </a>
        <a href="${pageContext.request.contextPath}/visiting-faculty-applications" id="resume-call" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/programs.png" class="ps-3 pe-2"> Resume</li>
        </a>
        <a href="${pageContext.request.contextPath}/view-applications" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/application.png" height="24" class="ps-3 pe-2"> Applications</li>
        </a>
        <a href="${pageContext.request.contextPath}/proforma" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/pending_report.png" height="24" class="ps-3 pe-2"> Proforma For Approval</li>
        </a>
        
        <a href="${pageContext.request.contextPath}/proforma-report" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/sidebar-icon.png" height="24" class="ps-3 pe-2"> Proforma Report</li>
        </a>
        <a href="${pageContext.request.contextPath}/faculty-reg" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/admin.png" class="ps-3 pe-2"> Add Faculty</li>
        </a>
        <a href="${pageContext.request.contextPath}/logout" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/logout.png" class="ps-3 pe-2"> Logout</li>
        </a>

`
    } else if ("${role}" == "User") {

        list += `
        
        <a href="${pageContext.request.contextPath}/dashboard" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/speedometer.png" class="ps-3 pe-2"> Dashboard</li>
        </a>
        <a id="resume-call" class="offset-list-item-link view-resume-icon" style="cursor: pointer;">
            <li><img src="${pageContext.request.contextPath}/icons/programs.png" class="ps-3 pe-2"> Resume</li>
        </a>
        <a href="${pageContext.request.contextPath}/faculty-application-view" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/report.png" height="24"  class="ps-3 pe-2"> Application</li>
        </a>
        <a href="${pageContext.request.contextPath}/offer-accept-reject" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/pending_report.png" height="24"  class="ps-3 pe-2"> Offer Letter</li>
        </a>
        <a href="${pageContext.request.contextPath}/logout" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/logout.png" class="ps-3 pe-2"> Logout</li>
        </a>
        
        `
    } else if('${role}' == 'ROLE_DEAN' || '${role}' == 'ROLE_DIRECTOR') {
        list += `
        <a href="${pageContext.request.contextPath}/dashboard" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/speedometer.png" class="ps-3 pe-2"> Dashboard</li>
        </a>
        <a href="${pageContext.request.contextPath}/proforma" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/pending_report.png" height="24" class="ps-3 pe-2"> Proforma For Approval</li>
        </a>
        
        <a href="${pageContext.request.contextPath}/proforma-report" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/sidebar-icon.png" height="24" class="ps-3 pe-2"> Proforma Report</li>
        </a>
        <a href="${pageContext.request.contextPath}/discotinue-faculty" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/report (2).png" height="24" class="ps-3 pe-2"> Discontinue</li>
        </a>
        <a href="${pageContext.request.contextPath}/logout" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/logout.png" class="ps-3 pe-2"> Logout</li>
        </a>
        `
    } else if('${role}' == 'ROLE_CENTRAL') {
        list += `
        <a href="${pageContext.request.contextPath}/dashboard" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/speedometer.png" class="ps-3 pe-2"> Dashboard</li>
        </a>
        <a href="${pageContext.request.contextPath}/proforma" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/pending_report.png" height="24" class="ps-3 pe-2"> Proforma For Approval</li>
        </a>
        
        <a href="${pageContext.request.contextPath}/proforma-report" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/sidebar-icon.png" height="24" class="ps-3 pe-2"> Proforma Report</li>
        </a>
        <a href="${pageContext.request.contextPath}/manual-approval-list" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/business-report.png" height="24" class="ps-3 pe-2"> Manual Approval List</li>
        </a>
        <a href="${pageContext.request.contextPath}/logout" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/logout.png" class="ps-3 pe-2"> Logout</li>
        </a>
        `
    } else {
        list += `
        <a href="${pageContext.request.contextPath}/dashboard" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/speedometer.png" class="ps-3 pe-2"> Dashboard</li>
        </a>
        <a href="${pageContext.request.contextPath}/proforma" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/pending_report.png" height="24" class="ps-3 pe-2"> Proforma For Approval</li>
        </a>
        
        <a href="${pageContext.request.contextPath}/proforma-report" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/sidebar-icon.png" height="24" class="ps-3 pe-2"> Proforma Report</li>
        </a>
        <a href="${pageContext.request.contextPath}/logout" class="offset-list-item-link">
            <li><img src="${pageContext.request.contextPath}/icons/logout.png" class="ps-3 pe-2"> Logout</li>
        </a>
        `
    }

    document.getElementById('left-sidebar-accordion').innerHTML = list;
</script>