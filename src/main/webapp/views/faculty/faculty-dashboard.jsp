<div class="row">
  
    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 p-4">
        <a 
            class="card_school_vf text-center view-resume-icon  d-flex flex-column justify-content-center align-items-center">
            <img src="${pageContext.request.contextPath}/icons/application.png" alt="">
            <p>Resume</p>
        </a>
    </div>
    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 p-4">
        <a href="${pageContext.request.contextPath}/faculty-application-view" class="card_school_vf text-center create-application-button d-flex flex-column justify-content-center align-items-center ">
            <img src="${pageContext.request.contextPath}/icons/report.png" alt="">Application</a>
    </div>
    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 p-4">
        <a href="${pageContext.request.contextPath}/offer-accept-reject" class="card_school_vf text-center show-offer-letter d-flex flex-column justify-content-center align-items-center ">
            <img src="${pageContext.request.contextPath}/icons/offerLetter.png" height="55" alt="">Offer Letter</a>
    </div>
    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12 p-4 createResumediv">
        <!-- <a
            class="card_school_vf text-center create-resume-button d-flex flex-column justify-content-center align-items-center ">
            <img src="${pageContext.request.contextPath}/icons/application.png" alt="">Create Resume
        </a> -->
    </div>
</div>

<script>
        console.log('${resumeCount}');
        console.log('${resumeCount}'=='0');
        if('${resumeCount}'=='0'){
            let createResumediv = `
            <a
            class="card_school_vf text-center create-resume-button d-flex flex-column justify-content-center align-items-center ">
            <img src="${pageContext.request.contextPath}/icons/application.png" alt="">Create Resume
            </a>`
            document.querySelector('.createResumediv').innerHTML = createResumediv;
        }
</script>