<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/login.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/simpleAlert.css">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/css/select2.min.css" rel="stylesheet" />

  <title>Login</title>
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


    img {
      width: 100%;
    }

    .login-wrapper {
      overflow: hidden;
      padding: 15px;
      position: fixed;
      width: 1200px;
      left: calc(50% - 600px);
      top: calc(50% - 280px);
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


    .login-btn {
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


    }
  </style>
</head>

<body>
  <canvas class="background"></canvas>

  <div class="login-success-alert alert alert-success alert-dismissible fade show d-flex justify-content-center align-items-center d-none">
    <strong>Success!</strong>&nbsp &nbsp You Can Now Login
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  </div>

  <div class="password-reset-alert alert alert-success alert-dismissible fade show d-flex justify-content-center align-items-center d-none">
    <strong>Password Reset Successfull!</strong>&nbsp &nbsp You Can Now Login
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  </div>

  <div class="login-error-alert alert alert-danger alert-dismissible fade show d-flex justify-content-center align-items-center d-none">
    <strong>Error!</strong>&nbsp &nbsp Invalid Credentials
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  </div>

  <div class="session-timeout-alert alert alert-warning alert-dismissible fade show d-flex justify-content-center align-items-center d-none">
    <strong>Oops!</strong>&nbsp &nbsp Your Session has expired, Kindly Login again
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  </div>

  <section class="login-wrapper">
    <div class="inner-login-wrapper">
      <div class="row">
        <div class="col-md-6" id="login-right">
          <div class="logo">
            <img src="${pageContext.request.contextPath}/image/logo-nmims.png" />
          </div>
          <object type="image/svg+xml" data="/image/login-animate-nmims.svg">
            <img src="${pageContext.request.contextPath}/image/login-animate-nmims.svg" />
          </object>
        </div>
        <div class="col-md-6" id="login-left">

          <form method="POST" class="text-center" id="login-form">
            <h3><span>Wel</span>come</h3>
            <span class="bottom-line mx-auto"></span>

            <div class="cust-btn-group mt-3 mb-3">
              <div class="cust-input-prepend">
                <i class="fa-solid fa-user"></i>
              </div>
              <input type="text" name="user_id" id="user_id" placeholder="Pan Card No./Username" required>
            </div>

            <div class="cust-btn-group mb-3">
              <div class="cust-input-prepend">
                <i class="fas fa-key"></i>
              </div>
              <input type="password" name="password" id="password" placeholder="Password" required>
              <input type="hidden" name="devicecheck" id="devicecheck">
            </div>

            <!-- <label>Is trusted device</label>
            <input type="checkbox" name="is_trusted" id="is_trusted"> -->
            <button class="btn btn-dark login-btn"><i class="fas fa-sign-in-alt"></i> Sign In</button>
            <!-- <div class="py-2">New User?<a style="text-decoration: none;" href="${pageContext.request.contextPath}/register"> Sign Up</a> </div> -->
            <div id="forgot-password" class=""><a class="text-danger" href="${pageContext.request.contextPath}/reset-password">Forgot your password?</a> </div>
            <!-- <button type="button" class="btn btn-dark test-btn"><i class="fas fa-sign-in-alt"></i> Test Btn</button> -->
          </form>

        </div>
      </div>
    </div>
  </section>



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


  <!-- Optional JavaScript -->
  <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
  <!-- <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.dev.js"></script>
  <script src="${pageContext.request.contextPath}/js/session-timeout.js"></script>
  <script src="${pageContext.request.contextPath}/js/SimpleAlert.js"></script>
  <script src="${pageContext.request.contextPath}/js/script.js"></script>
  <script src="${pageContext.request.contextPath}/js/leftsidebartoggle.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.bootpag.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/particlejs.min.js"></script>

  <!-- Page Level JavaScript Libaries End -->
  <script>

  //--------------------------------------------------------------------------------------------------------------------------------------

let publicKey = "${publicKey}";

let isEnc = false;


function getMessageEncoding(plainText) {
    let enc = new TextEncoder();
    return enc.encode(plainText);
}

async function encryptMessage(textToEncode, publicKey) {
    let encoded = getMessageEncoding(textToEncode);
    
    let key = await importRsaKey(publicKey);

    let ciphertext = await window.crypto.subtle.encrypt({
            name: "RSA-OAEP"
        },
        key,
        encoded
    ).catch(e => {
  alert("Something went wrong! If issue persist, please try using the latest updated Chrome browser.")
});

    let base64String = btoa(String.fromCharCode.apply(null, new Uint8Array(ciphertext)));
    
    return base64String;

}


async function importRsaKey(publicKey) {
    const binaryDerString = window.atob(publicKey);
    const binaryDer = str2ab(binaryDerString);

    return window.crypto.subtle.importKey(
        "spki",
        binaryDer, {
            name: "RSA-OAEP",
            hash: "SHA-256"
        },
        true,
        ["encrypt"]
    );
}

function _arrayBufferToBase64(buffer) {
    var binary = '';
    var bytes = new Uint8Array(buffer);
    var len = bytes.byteLength;
    for (var i = 0; i < len; i++) {
        binary += String.fromCharCode(bytes[i]);
    }
    return window.btoa(binary);
}

function str2ab(str) {
    const buf = new ArrayBuffer(str.length);
    const bufView = new Uint8Array(buf);
    for (let i = 0, strLen = str.length; i < strLen; i++) {
        bufView[i] = str.charCodeAt(i);
    }
    return buf;
}

  //-------------------------------------------------------------------------------------------------------------------------------------- 

    // window.onload = function () {
    //   console.log("Window on load")
    //   Particles.init({
    //     selector: '.background',
    //     connectParticles: true,
    //     color: '#ffffff'
    //   });
    // };
    if(window.location.hash == '#success') {
      document.querySelector('.login-success-alert').classList.remove('d-none')
    } else {
      document.querySelector('.login-success-alert').classList.add('d-none')

    }
    if(window.location.hash == '#password-reset-success') {
      document.querySelector('.password-reset-alert').classList.remove('d-none')
    } else {
      document.querySelector('.password-reset-alert').classList.add('d-none')

    }

    if(window.location.hash == '#session-timeout') {
      document.querySelector('.session-timeout-alert').classList.remove('d-none')
    } else {
      document.querySelector('.session-timeout-alert').classList.add('d-none')

    }
    
    if(window.location.hash == '#error') {
      document.querySelector('.login-error-alert').classList.remove('d-none')
      // document.querySelector('#forgot-password').classList.remove('d-none')
    } else {
      document.querySelector('.login-error-alert').classList.add('d-none')
      // document.querySelector('#forgot-password').classList.add('d-none')
    }

    //DYNAMIC CSS
    const cssRoot = document.querySelector(':root');

    let org = 'nmims'

    if (org !== 'nmims') {
      cssRoot.style.setProperty("--login-bg-color",
        'radial-gradient(circle, rgb(0 13 107) 0%, rgb(0 0 0) 100%)')

      cssRoot.style.setProperty("--welcome-color",
        'rgb(0 13 107)')
    }


    let loginButton = document.querySelector('.login-btn')
    let status = 400;

    loginButton.addEventListener('click',async function (e) {
      
      document.getElementById('main-loader').classList.remove('d-none')
      e.preventDefault();

      // let myForm = document.getElementById('login-form')
      // let formData = new FormData(myForm)

      // let result = {};
      // for (let entry of formData.entries()) {
      //   result[entry[0]] = entry[1];
      // }
      // console.log(JSON.stringify(result))

      let username = document.querySelector('#user_id').value;
      let password = document.querySelector('#password').value;
      encryptedUsername = await encryptMessage(username, publicKey);
			encryptedPass = await encryptMessage(password, publicKey);
      encryptresult = {
        user_id : encryptedUsername,
        password : encryptedPass,
        devicecheck : ''
      }

      fetch('${pageContext.request.contextPath}/verify-login', {
          method: "POST",
          body: JSON.stringify(encryptresult),
          headers: {

            "Content-Type": "application/json; charset=UTF-8",
          }
        })
        .then(response => status = response.status)
        .then(response => {
          if (status === 200) {
            document.getElementById('main-loader').classList.add('d-none')
            console.log("success")
            window.location.href = '${pageContext.request.contextPath}/dashboard';
          } else {
            document.getElementById('main-loader').classList.add('d-none')
            window.location.href = '${pageContext.request.contextPath}/login#error';
            window.location.reload()

          }
        })
        .catch(exception => console.log(exception));
    })

    let loginErrorMessage = ``;

    console.log('loginErrorMessage', loginErrorMessage)

    if (loginErrorMessage) {
      let simpleAlert = new SimpleAlert();


      simpleAlert.alert({
        title: "Login failed!",
        message: [{
          "": 'User name or Password Invalid'
        }],
        type: "alert-danger",
        buttons: {
          positive: {
            text: "Okay",
            action: function () {
              document.querySelector('.simple-alert').remove();
            }
          },
          negative: {
            text: "Cancel",
            action: function () {
              alert('Negative')
            }
          }
        }
      });
    }

    $("#devicecheck").val(localStorage.getItem('devicecheck'))
  </script>
</body>

</html>