
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Offer Letter</title>
    <style>
        body {
    background: white; 
    font-size: 0.8rem !important;
    font-family: 'Times New Roman', Times, serifS;
  }
  *{
      box-sizing: border-box;
  }
  
  .page {
    background: white;
    display: block;
    margin: 0 auto;
    margin-bottom: 0.5cm;
    /* box-shadow: 0 0 0.5cm rgba(0,0,0,0.5); */
    }
  
 .page[size="A4"] {  
    width: 21cm;
    height: 29.7cm;
  } 
  .header-list{
      list-style: none;
  }
  .offer-logo{
      width: 150px;
      height: auto;
      border-right: 1px solid rgb(196, 195, 195);
      padding-right: 20px;
      position: relative;
      top: 17px;
      z-index: 100;
  }
 
 .footer__top small{
      font-size: 1rem !important;
  }
  .purple-line{
      border: 1px solid violet;
  }
    </style>
</head>

<body>
    <section class="page" size="A4" id="offer-letter">
        <nav>
            <ul class="d-flex justify-content-between header-list align-items-end mb-0">
                <li > <img src="${pageContext.request.contextPath}/image/logo-nmims.png" alt="" class="offer-logo" > </li>
                <li> <h3 class="mb-0">SVKM NMIMS (Deemed-to-be-University)</h3> </li>
            </ul>
            <hr class="purple-line mt-1">
        </nav>
        <br>
        <br>
        <br>
        <p class="mb-0">Date: <span id = "date"></span> </p> <br>
        <p class="mb-0"><b>Prof. </b> <span id = "address"></span> </p> 
        <p class="mb-0"> <span id = "city"></span> </p>
        <br>
        <p class="mb-0">Dear Prof <span id = "name"></span> ,</p>
        <br>
        <p class="mb-0">I am pleased to appoint you as a Visiting Faculty at <span id = "school"></span> for the subject "<span id = "module_description"></span>" of <span id = "acad_session"></span> of <span id = "program_name"></span> for the Academic Year  <span id = "acad_year"></span> You are 
        required to conduct Theory /Practical /Tutorial classes for the above subject as per syllabus /Teaching Scheme during the term mentioned in Academic Calendar.
        </p><br>
        <p>NMIMS is  committed to providing quality education to UG /PG students. For better accountability, a detailed course outline with a session plan will be collaboratively prepared by the course anchor and the faculty teaching the course in the other campuses. Please  contact Head of Department /Program Chair,
        for the schedule of classes.You need to rigorously adhere the final schedule given to you to avoid rescheduling / cancellation of classes. In case of your multifarious involvement to stick to the schedule, please contact us well in advance to make necessary alternate arrangements. You are requested to share course syllabus
        and teaching scheme along with component of Internal Continuous Evaluation and its schedule of conduct to the students before the beginning of classes.</p> 
        
        <p class="mb-0"> You will be paid an honorarium of Rs. <span id = "rate_per_hour"></span> per hour/session. Submission of marks at the end of the term to respective HOD/Program Chair should be done timely. NMIMS appreciates your engagement in below given parameters and Multi Campus Co-ordination  wherever applicable.</p> 
        <br>
        <ol type="a">
            <li>Use of pedagogy relevant to the course.</li>
            <li>Maintaining Uniformity in classroom teaching across campuses.</li>
            <li>Involvement in course outline preparation, question paper setting, evaluation and  assessment of answer sheets, including the re-examination work.</li>
            <li>To attend all the meetings of the course level Multi Campus Co-ordination committee to ensure parity in content, delivery and to maintain standard of evaluation across all campuses</li>
            <li>To participate in all the efforts of Assurance of Learning processes/ Outcome based Learnings like training, meetings etc.</li>
        </ol>
        <br>
        
            <p class="mb-0">Look forward to your valued support and co-operation. Request you to sign and return one copy of this letter as a token of acceptance.</p>
            <br>
            <p class="mb-0">With warm regards</p>
            <br>
            <br>
            <p class="mb-0"><strong>Dean /Director</strong></p>
            <p class="mb-0">Encl:</p>
            <ol type="1">
                <li>Subject Syllabus and Teaching Scheme</li>
                <li>Academic Calendar</li>
                <li>Program Time Table / Faculty Time Table</li>
            </ol>
            <br>
            <br>
            <footer class="d-flex justify-space-between">
                <div class="footer__left">
                    <small class="footer__top">SVKM'S</small>
                    <h3 class="mb-0"><u>Narsee Monjee Institute of Managment Studies</u></h3>
                    <p class="mb-0">Deemed to be UNIVERSITY</p>
                    <p class="mb-0 mt-1">Plot No. 2, Sector 33, Kharghar, Navi Mumbai - 410210, India</p>
                    <p class="mb-0">Tel: (91-22) 35476550</p>
                    <p class="mb-0">Email: enquiry@nmims.edu | Web: <strong> www.nmimsnavimumbai.org</strong></p>

                </div>
                <!-- <img src="" alt="" class="category-uni"> -->
            </footer>
    </section>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>
    let letter = JSON.parse('${offerLetter}');
    document.getElementById("date").innerHTML = letter.date
    document.getElementById("address").innerHTML = letter.address
    document.getElementById("city").innerHTML = letter.city
    document.getElementById("name").innerHTML = letter.faculty_name
    document.getElementById("school").innerHTML = letter.school
    document.getElementById("module_description").innerHTML = letter.module_description
    document.getElementById("acad_session").innerHTML = letter.acad_session
    document.getElementById("program_name").innerHTML = letter.program_name
    document.getElementById("acad_year").innerHTML = letter.acad_year
    document.getElementById("rate_per_hour").innerHTML = letter.rate_per_hour
</script>
</body>
</html>