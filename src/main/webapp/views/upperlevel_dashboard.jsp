<div class="row" id="upperlevel-dashboard">
  
    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 p-4">
        <a href="${pageContext.request.contextPath}/proforma"
        class="card_school_vf text-center d-flex flex-column justify-content-center align-items-center ">
        <img src="${pageContext.request.contextPath}/icons/pending_report.png" alt="">Proforma For
        Approval</a>
    </div>
    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 p-4 ">
        <a href="${pageContext.request.contextPath}/proforma-report"
            class="card_school_vf text-center d-flex flex-column justify-content-center align-items-center ">
            <img src="${pageContext.request.contextPath}/icons/report.png" alt="">PROFORMA REPORT</a>
    </div>
</div>
<script>
    if('${role}' == 'ROLE_DEAN' || '${role}' == 'ROLE_DIRECTOR') {
        document.getElementById('upperlevel-dashboard'). innerHTML +=
        `    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 p-4 ">
        <a href="${pageContext.request.contextPath}/discotinue-faculty"
            class="card_school_vf text-center d-flex flex-column justify-content-center align-items-center ">
            <img src="${pageContext.request.contextPath}/icons/report (2).png" height="80px" alt="">DISCONTINUE</a>
        </div>`
    }
</script>