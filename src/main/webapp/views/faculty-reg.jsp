<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Faculty Registeration</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/simpleAlert.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/login.css">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" />

  <title>Register</title>
  <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images.jpg">

  <style>
    :root {
      --login-bg-color: radial-gradient(circle, rgb(143 0 0) 0%, rgb(0 0 0) 100%);
      --welcome-color: #740e00;
      --bottom-line-color: #ff1f00;
    }



    .background {
      background: var(--login-bg-color);
      position: fixed;
      display: block;
      top: 0;
      left: 0;
      z-index: -1;
      height: 100vh;
      width: 100%;
    }


    /* Custom CSS */
    .cust-btn-group {
      display: flex;
      align-items: center;
      padding: 7px 15px;
      background: #fff;
      border: 1px solid #c2c2c2;
      border-radius: 25px;
      font-size: 18px;
    }

    .cust-input-prepend {
      margin-right: 10px;
      width: 20px;
    }

    .cust-btn-group input {
      border: none;
      width: 100%;
    }

    .cust-btn-group input:focus {
      outline: none;
    }

    .bottom-line {
      width: 100px;
      position: relative;
      height: 1px;
      margin-bottom: 25px;
      background: var(--bottom-line-color);
      display: block;
    }

    .bottom-line::after {
      content: '';
      width: 100%;
      height: 2px;
      position: absolute;
      top: 2px;
      left: 0;
      background: #6b6d6d;
    }


    /* // Custom CSS */


    .img {
      width: 100%;
    }

    .login-wrapper {
      overflow: hidden;
      padding: 15px;
      position: fixed;
      width: 1200px;
      left: calc(50% - 600px);
      top: calc(50% - 340px);
      box-shadow: 0px 0px 8px 1px;
      background: rgb(255 255 255 / 80%);
      border-radius: 30px;
    }

    section.login-wrapper::before {
      content: "";
      position: absolute;
      left: 0;
      bottom: 0;
      z-index: -1;
      width: 50%;
      height: 100%;
      background: rgb(255 255 255 / 80%);
    }

    .inner-login-wrapper {
      height: 100%;
      width: 100%;
    }

    .logo img {
      width: 170px;
    }

    #login-left {
      padding: 150px 100px;
    }

    #login-left .cust-btn-group i {
      color: #757575;
    }

    #login-left h3 span {
      color: var(--welcome-color);
    }


    .register-btn {
      display: block;
      margin: auto;
      background: #000;
      padding: 7px 50px;
      border-radius: 25px;
    }

    .verify-button {
      display: block;
      margin: auto;
      background: #000;
      padding: 7px 50px;
      border-radius: 25px;
    }

    @media (max-width: 1200px) {
      .login-wrapper {
        width: 950px;
        top: calc(50% - 268px);
        left: calc(50% - 475px);
      }

      #login-left {
        padding: 133px 50px;
      }
    }

    @media (max-width: 1023px) {
      .login-wrapper {
        width: 700px;
        top: calc(50% - 230px);
        left: calc(50% - 350px);
      }

      #login-left {
        padding: 49px 15px;
      }
    }

    @media (max-width: 767px) {
      .login-wrapper {
        position: relative;
        width: 100%;
        min-height: 100vh;
        border-radius: 0;
        left: 0;
        top: 0;
      }

      .inner-login-wrapper {
        height: 100%;
        width: 100%;
      }

      .error {
        color: red !important;
      }

    }
  </style>
</head>

<body>

  <jsp:include page="left-sidebar.jsp" />


  <main class="main">
    <jsp:include page="header.jsp" />

    <section class="container" style="margin-top: 180px; border: 1px solid black; padding: 20px; border-radius: 20px;">
      <div class="inner-login-wrapper">
        <div class="row">
          <div class="col-md-6" id="login-right">
            <div class="logo">
              <img class="img" src="${pageContext.request.contextPath}/image/logo-nmims.png" />
            </div>
            <object type="image/svg+xml" data="/image/login-animate-nmims.svg">
              <img class="img" src="${pageContext.request.contextPath}/image/login-animate-nmims.svg" />
            </object>
          </div>
          <div class="col-md-6" id="login-left">
            <form method="POST" class="text-center" id="login-form">
              <h3><span>Fac</span>ulty<span> Regis</span>teration</h3>
              <span class="bottom-line mx-auto pancard-message" style="width: 60%;"></span>
              <div class="mt-3 mb-3 removing-input">
                <small class="pancard-error-message d-none text-danger">Enter Valid Pancard No.</small>
                <div class="cust-btn-group">
                  <div class="cust-input-prepend">
                    <i class="fa-solid fa-user"></i>
                  </div>
                  <input type="text" id="pannumber" name="user_id" placeholder="Pan Card No." required>
                </div>
              </div>
              <div class="mt-3 mb-3 removing-input">
                <small class="email-error-message text-danger d-none">Enter Valid Email</small>
                <div class="cust-btn-group">
                  <div class="cust-input-prepend">
                    <i class="fas fa-envelope"></i>
                  </div>
                  <input type="text" id="email" name="email" placeholder="Email id" required>
                </div>
              </div>

              <div class="mb-3 removing-input d-none">
                <small class="password-error-message text-danger d-none">Enter Valid Password</small>
                <div class="cust-btn-group">
                  <div class="cust-input-prepend">
                    <i class="fas fa-key"></i>
                  </div>
                  <input type="password" id="password" name="password" placeholder="Password" value="pass@123">
                  <input type="hidden" name="devicecheck" id="devicecheck">
                </div>
              </div>
              <button class="btn btn-dark register-btn pb-2"><i class="fas fa-sign-in-alt"></i>Register</button>
            </form>
          </div>
        </div>
      </div>
    </section>

  </main>
  <div class="modal-loader d-none" id="main-loader">
    <svg version="1.1" id="L5" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px"
      y="0px" viewBox="0 0 100 100" enable-background="new 0 0 0 0" xml:space="preserve">
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

  <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.dev.js"></script>
  <!-- <script src="/js/session-timeout.js"></script> -->
  <script src="${pageContext.request.contextPath}/js/SimpleAlert.js"></script>
  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <script src="${pageContext.request.contextPath}/js/leftsidebartoggle.js"></script>
  <script src="${pageContext.request.contextPath}/js/ajaxApi.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.bootpag.min.js"></script>

  <script>
    document.querySelector('.register-btn').addEventListener('click', function (e) {
      e.preventDefault();

      document.querySelector('.pancard-error-message').classList.add('d-none')
      document.querySelector('.email-error-message').classList.add('d-none')
      document.querySelector('.password-error-message').classList.add('d-none')
      let mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

      let panCard = document.querySelector('#pannumber').value;
      let email = document.querySelector('#email').value;
      let password = document.querySelector('#password').value;

      let panValidation = RegistrationPanValidation(panCard)
      let isEmailValid = email.match(mailformat);
      let passwordvalidation = RegistrationPasswordValidation(password, "password-error-message")

      if (!panValidation || !passwordvalidation) {
        return;
      }
      if(!isEmailValid) {

        document.querySelector('.email-error-message').classList.remove('d-none')
        return;
      }
      let regObj = {
        user_id: panCard,
        email : email,
        password: password
      }
      let options = {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json;charset=utf-8'
        },
        body: JSON.stringify(regObj)
      }
      let fetchRes = fetch("${pageContext.request.contextPath}/registerationFaculty", options);
      fetchRes.then(success => {
        if (success.status == 200) {
          location.href = '${pageContext.request.contextPath}/dashboard'
        } else {
          alert('Please Enter Different Pancard No./Email');
        }
      })

    })
  </script>


</body>

</html>