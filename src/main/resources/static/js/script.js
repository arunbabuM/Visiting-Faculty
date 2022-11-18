// $(document).ready(function () {
// SIDE-BAR OPENING EVENT
// const mobileHamburger = document.querySelector('.hamburger-smalldevices');
// const leftBar = document.querySelector('.left-sidebar');

$('.hamburger-smalldevices').on('click', function () {
  $('.left-sidebar').toggleClass('left-sidebar-open')
})
// mobileHamburger.addEventListener('click', () => {
//     leftBar.classList.toggle('left-sidebar-open');
// })
// })



function delay(callback, ms) {
  var timer = 0;
  return function () {
    var context = this;
    var args = arguments;
    clearTimeout(timer);
    timer = setTimeout(function () {
      callback.apply(context, args);
    }, ms || 0);
  };
}

// TOGGLE FULL-SCREEN

function toggle_full_screen() {
  if ((document.fullScreenElement && document.fullScreenElement !== null) || (!document.mozFullScreen && !document.webkitIsFullScreen)) {
    if (document.documentElement.requestFullScreen) {
      document.documentElement.requestFullScreen();
    } else if (document.documentElement.mozRequestFullScreen) {
      /* Firefox */
      document.documentElement.mozRequestFullScreen();
    } else if (document.documentElement.webkitRequestFullScreen) {
      /* Chrome, Safari & Opera */
      document.documentElement.webkitRequestFullScreen(Element.ALLOW_KEYBOARD_INPUT);
    } else if (document.msRequestFullscreen) {
      /* IE/Edge */
      document.documentElement.msRequestFullscreen();
    }
  } else {
    if (document.cancelFullScreen) {
      document.cancelFullScreen();
    } else if (document.mozCancelFullScreen) {
      /* Firefox */
      document.mozCancelFullScreen();
    } else if (document.webkitCancelFullScreen) {
      /* Chrome, Safari and Opera */
      document.webkitCancelFullScreen();
    } else if (document.msExitFullscreen) {
      /* IE/Edge */
      document.msExitFullscreen();
    }
  }
}


//left bar accordion expander



function changeDateFormat(date) {
  let dateArr = date.split('-');
  return `${dateArr[2]}/${dateArr[1]}/${dateArr[0]}`;
}

function dateFormatCalculation(date) {
  let dateArr = date.split('-');
  return `${dateArr[1]}/${dateArr[2]}/${dateArr[0]}`;
}

function findClosest(elem, className) {
  let closestParent = elem.parentElement;
  while (closestParent && !closestParent.classList.contains(className)) {
    closestParent = closestParent.parentElement
  }
  return closestParent;
}




// --------------------------methods to use for Front-End Validations through Java-Script------------------------------------


function isCharNumber(res) {
  for (let i = 0; i < checkLength(res); i++) {
    var c = res.charCodeAt(i);

    if (!(c > 47 && c < 58)) {
      return false;
    }
  }
  return true;
}

function isCharAlphabet(res) {
  for (let i = 0; i < checkLength(res); i++) {
    var c = res.charCodeAt(i);

    if (
      !(c > 47 && c < 58) &&
      !(c > 64 && c < 91) &&
      !(c > 96 && c < 123) &&
      c != 32
    ) {
      return false;
    }
  }
  return true;
}

function isSpecialChar(char) {
  return (
    (char >= 65 && char < 91) ||
    (char >= 97 && char < 123) ||
    (char >= "0" && char <= "9")
  );
}

function checkLength(value) {
  return value.length;
}

function clearError() {
  errors = document.getElementsByClassName("error");
  for (const item of errors) {
    item.innerHTML = "";
  }
}

let condition;

// function personalDetailFirstNameValidation(res) {
//   if (checkLength(res) > 2) {
//     if (isCharAlphabet(res)) {
//       condition = true;
//     } else {
//       document.getElementById("first-name-message").innerHTML = "Only Alphabets are allowed";
//       condition = false;
//     }
//   } else {
//     document.getElementById("first-name-message").innerHTML = "Invalid length";
//     condition = false;
//   }
//   return condition;
// }

// function personalDetailLastNameValidation(res) {
//   if (checkLength(res) > 2) {
//     if (isCharAlphabet(res)) {
//       condition = true;
//     } else {
//       document.getElementById("last-name-message").innerHTML = "Only Alphabets are allowed";
//       condition = false;
//     }
//   } else {
//     document.getElementById("last-name-message").innerHTML = "Invalid length";
//     condition = false;
//   }
//   return condition;
// }

function personalDetailDateOfBirthValidation(res) {
  var dob = res;
  var year = Number(dob.substr(0, 4));
  var today = new Date();
  var age = today.getFullYear() - year;
  if (res.length == 10) {
    if (age > 18) {
      condition = true;
    } else {
      document.getElementById("date-of-birth-message").innerHTML = "Your age should be above 18 years";
      condition = false;
    }

  } else {
    document.getElementById("date-of-birth-message").innerHTML = "Invalid length";
    condition = false;
  }
  return condition;
}

function personalDetailProfilePhotoValidation(res) {
  var fuData = document.getElementById('photo');
  if (res.length > 0) {
    var Extension = res.substring(res.lastIndexOf('.') + 1).toLowerCase();
    if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
      if (fuData.files && fuData.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#photo').attr('src', e.target.result);
          document.getElementById("profile-photo-value").src = e.target.result
          condition = true;
        }
        reader.readAsDataURL(fuData.files[0]);
      }
    } else {
      document.getElementById("photo-message").innerHTML = "File type should be of PNG, JPG and JPEG";
    }
  } else {
    document.getElementById("photo-message").innerHTML = "Profile photo is Mandatory";
    condition = false;
  }
  return condition;
}


function personalDetailGenderValidation(gender) {
  if (gender == 1 || gender == 2 || gender == 3) {
    condition = true;
  } else {
    document.getElementById("gender-message").innerHTML = "Mandatory";
    condition = false;
  }
  return condition;
}

// function personalDetailContactNumberValidation(res) {
//   if (res.length != 10) {
//     document.getElementById('contact-number-message').innerHTML = "Invalid length";
//     condition = false;
//   } else {
//     if (isNaN(res)) {
//       document.getElementById('contact-number-message').innerHTML = "Characters Not Allowed";
//       condition = false;
//     } else {
//       if ((res.charAt(0) != 9) && (res.charAt(0) != 8) && (res.charAt(0) != 7) && (res.charAt(0) != 6)) {
//         document.getElementById('contact-number-message').innerHTML = "Invalid phone number";
//         condition = false;
//       } else {
//         condition = true;
//       }
//     }
//   }
//   return condition;
// }

// function personalDetailEmailValidation(res) {
//   var atposition = res.indexOf('@');
//   var dotposition = res.lastIndexOf('.');
//   if (atposition < 1 || (res.length - 2) == dotposition) {
//     (document).getElementById('email-message').innerHTML = "Invalid email address";
//     condition = false;
//   } else if (atposition < dotposition) {
//     condition = true;
//   } else {
//     (document).getElementById('email-message').innerHTML = "Invalid email address";
//     condition = false;
//   }
//   return condition;
// }

function emailValidation(res) {
  var atposition = res.indexOf('@');
  var dotposition = res.lastIndexOf('.');
  if (atposition < 1 || (res.length - 2) == dotposition) {
    condition = false;
  } else if (atposition < dotposition) {
    condition = true;
  } else {
    condition = false;
  }
  return condition;
}

function personalDetailPancardValidation(res) {

  if (res.length != 10) {
    document.getElementById('pan-number-message').innerHTML = "Invalid length of Pancard Number";
    condition = false;
  } else {
    let firstfive = res.substring(0, 5);
    let nextfour = res.substring(5, 9);
    for (let i = 0; i < firstfive.length; i++) {
      if (firstfive[i] >= 'A' && firstfive[i] <= 'Z') {
        for (let k = 0; k < nextfour.length; k++) {
          if (nextfour[k] >= '0' && nextfour[k] <= '9') {
            if (res[9] >= 'A' && res[9] <= 'Z') {
              condition = true;
            } else {
              document.getElementById('pan-number-message').innerHTML = "Invalid Last Digit";
              condition = false;
            }
          } else {
            document.getElementById('pan-number-message').innerHTML = "Error Inbetween Numbers";
            condition = false;
            break;
          }
        }
      } else {
        document.getElementById('pan-number-message').innerHTML = "Error Inbetween First Five Characters";
        condition = false;
        break;
      }
    }
  }
  return condition;
}

function pancardValidation(res) {
  if (res.length != 10) {
    condition = false;
  } else {
    let firstfive = res.substring(0, 5);
    let nextfour = res.substring(5, 9);
    for (let i = 0; i < firstfive.length; i++) {
      if (firstfive[i] >= 'A' && firstfive[i] <= 'Z') {
        for (let k = 0; k < nextfour.length; k++) {
          if (nextfour[k] >= '0' && nextfour[k] <= '9') {
            if (res[9] >= 'A' && res[9] <= 'Z') {
              condition = true;
            } else {
              condition = false;
            }
          } else {
            condition = false;
            break;
          }
        }
      } else {
        condition = false;
        break;
      }
    }
  }
  return condition;
}

function personalDetailPancardPhotoValidation(res) {
  var fuData = document.getElementById('pan-photo');
  if (res.length > 0) {
    var Extension = res.substring(res.lastIndexOf('.') + 1).toLowerCase();
    if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
      if (fuData.files && fuData.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#pan-photo').attr('src', e.target.result);
          document.getElementById("Pancard-photo-uploaded").src = e.target.result
          condition = true;
        }
        reader.readAsDataURL(fuData.files[0]);
      }
    } else {
      document.getElementById("pan-photo-message").innerHTML = "File type should be of PNG, JPG and JPEG";
    }
  } else {
    document.getElementById("pan-photo-message").innerHTML = "Pancard photo is Mandatory";
    condition = false;
  }
  return condition;
}

// function personalDetailAadharValidation(res) {
//   if (res.length>0){
//   if (res.length != 12) {
//     document.getElementById('aadhar-number-message').innerHTML = "Invalid Adhar Number";
//     condition = false;
//   } else {
//     for (let i = 0; i < res.length; i++) {
//       if (res[i] < '0' || res[i] > '9') {
//         condition = false;
//         document.getElementById('aadhar-number-message').innerHTML = "Special Character not allowed";
//         break;
//       } else {
//         condition = true;
//       }
//     }
//   }
//   condition = false;
// }
//   return condition;
// }

function personalDetailAadharValidation(res) {
  let condition = true;
  if (res.length>0){
  if (res.length == 12) 
  {    
    condition = true;
  }
  else
  {
    document.getElementById('aadhar-number-message').innerHTML = "Invalid Adhar Number";
    condition = false;
  } 
}
  return condition;
}

function personalDetailAadharPhotoValidation(res) {
  var fuData = document.getElementById('aadhar-photo');
  if (res.length > 0) {
    var Extension = res.substring(res.lastIndexOf('.') + 1).toLowerCase();
    if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
      if (fuData.files && fuData.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#aadhar-photo').attr('src', e.target.result);
          condition = true;
        }
        reader.readAsDataURL(fuData.files[0]);
      }
    } else {
      document.getElementById("aadhar-photo-message").innerHTML = "File type should be of PNG, JPG and JPEG";
    }
  } else {
    document.getElementById("aadhar-photo-message").innerHTML = "Aadhar photo is Mandatory";
    condition = false;
  }
  return condition;
}


// function personalDetailAddressValidation(res) {
//   if (checkLength(res) > 5) {
//     condition = true;
//   } else {
//     document.getElementById("address-message").innerHTML = "Invalid length";
//     condition = false;
//   }
//   return condition;
// }

// function personalDetailCityValidation(res) {
//   if (checkLength(res) > 3) {
//     if (!isCharNumber(res)) {
//       condition = true;
//     } else {
//       document.getElementById("city-message").innerHTML = "Only characters are allowed";
//       condition = false;
//     }
//   } else {
//     document.getElementById("city-message").innerHTML = "Invalid length";
//     condition = false;
//   }
//   return condition;
// }

function personalDetailPincodeValidation(res) {
  if (checkLength(res) > 3) {
    if (isCharNumber(res)) {
      if(res.startsWith(1))
      {
      condition = true;
      } else {
        condition = false;
      }
    } else {
      document.getElementById("pincode-message").innerHTML = "Only Numbers are allowed";
      condition = false;
    }
  } else {
    document.getElementById("pincode-message").innerHTML = "Invalid length";
    condition = false;
  }
  return condition;
}

function personalDetailTemporaryContactValidation(res) {
  if (res.length < 1) {
    condition = true;
  } else {
    if (res.length != 10) {
      document.getElementById('temporary-contact-number-message').innerHTML = "Invalid length";
      condition = false;
    } else {
      if (isNaN(res)) {
        document.getElementById('temporary-contact-number-message').innerHTML = "Characters Not Allowed";
        condition = false;
      } else {
        if ((res.charAt(0) != 9) && (res.charAt(0) != 8) && (res.charAt(0) != 7) && (res.charAt(0) != 6)) {
          document.getElementById('temporary-contact-number-message').innerHTML = "Invalid phone number";
          condition = false;
        } else {
          condition = true;
        }
      }
    }
  }
  return condition;
}

function personalDetailCountryValidation(res) {
  if (checkLength(res) > 2) {
    condition = true;
  } else {
    document.getElementById("country-message").innerHTML = "Invalid length";
    condition = false;
  }
  return condition;
}

function qualificationDetailYearOfPassingValidation(res) {
  if (checkLength(res) == 4) {
    if (isCharNumber(res)) {
      condition = true;
    } else {
      condition = false;
    }
  } else {
    condition = false;
  }
  return condition;
}

function qualificationDetailPercentageValidation(res) {
  if (res.length > 0) {
    let value = parseFloat(res)
    console.log(value)
    if (isNaN(value) || value < 0 || value > 100) {
      return condtion = false;
    } else {
      condition = true;
    }
  } else {
    condition = false;
  }
  return condition;
}

function qualificationDetailCertificateValidation(res) {
  var fuData = document.querySelector('.qualification-certificate');
  console.log(fuData.value)
  if (res.length > 0) {
    var Extension = res.substring(res.lastIndexOf('.') + 1).toLowerCase();
    if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
      if (fuData.files && fuData.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('.qualification-certificate').attr('src', e.target.result);
          // let qualificationPhoto = document.querySelector('.qualification-certificate').src
          // document.querySelector(".qualification-photo-uploaded").src = qualificationPhoto
          // console.log(document.querySelector(".qualification-photo-uploaded").src)
          condition = true;
        }
        reader.readAsDataURL(fuData.files[0]);
      }
    } else {
      document.getElementById("cancelled_cheque_Photo-message").innerHTML =
        "File type should be of PNG, JPG and JPEG";
    }
  } else {
    document.getElementById("cancelled_cheque_Photo-message").innerHTML = "Cancelled Cheque photo is Mandatory";
    condition = false;
  }
  return condition;
}

// function bankDetailBankNameValidation(res) {
//   if (checkLength(res) > 3) {
//     condition = true;
//   } else {
//     document.getElementById("bank-name-message").innerHTML = "Invalid length";
//     condition = false;
//   }
//   return condition;
// }

// function bankDetailBankBranchValidation(res) {
//   if (checkLength(res) > 3) {
//     condition = true;
//   } else {
//     document.getElementById("bank-branch-message").innerHTML = "Invalid length";
//     condition = false;
//   }
//   return condition;
// }


// function bankDetailIfscCodeValidation(res) {
//   if (res.length != 11) {
//     condition = false;
//     document.getElementById('bank-ifsc-code-message').innerHTML = "Invalid length";
//   } else {
//     let firstfour = res.substring(0, 4);
//     let lastseven = res.substring(4, 11);
//     for (let i = 0; i < firstfour.length; i++) {
//       if (firstfour[i] < 'A' || firstfour[i] > 'Z') {
//         condition = false;
//         document.getElementById('bank-ifsc-code-message').innerHTML = "Invalid ifsc character";
//         break;
//       } else {
//         for (let j = 0; j < lastseven.length; j++) {
//           if (lastseven[j] >= '0' && lastseven[j] <= '9') {
//             condition = true;
//           } else {
//             console.log('in loop' + lastseven[j]);
//             condition = false;
//             document.getElementById('bank-ifsc-code-message').innerHTML = "Invalid last seven number";
//             break;
//           }
//         }

//       }
//     }
//   }
//   return condition;
// }

// function bankDetailMicrCodeValidation(res) {
//   if (res.length < 3) {
//     document.getElementById('bank-micr-code-message').innerHTML = "Invalid length";
//     condition = false;
//   } else {
//     if (isNaN(res)) {
//       document.getElementById('bank-micr-code-message').innerHTML = "Character not allowed";
//       condition = false;
//     } else {
//       condition = true;
//     }
//   }
//   return condition;
// }

// function bankDetailAccountNumberValidation(res) {
//   if ((checkLength(res) <= 10) || (checkLength(res) > 16)) {
//     document.getElementById('bank-account-number-message').innerHTML = "Invalid length"
//     condition = false;
//   } else {
//     if (isNaN(res)) {
//       document.getElementById('bank-account-number-message').innerHTML = "Charaters not allowed";
//       condition = false;
//     } else {
//       condition = true;
//     }
//   }
//   return condition;
// }




function bankDetailCancelledChequeValidation(res) {
  var fuData = document.getElementById("cancelled_cheque_Photo");
  if (res.length > 0) {
    var Extension = res.substring(res.lastIndexOf('.') + 1).toLowerCase();
    if (Extension == "png" || Extension == "jpeg" || Extension == "jpg") {
      if (fuData.files && fuData.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#cancelled_cheque_Photo').attr('src', e.target.result);
          document.getElementById("cancelled-cheque-photo-uploaded").src = e.target.result
          condition = true;
        }
        reader.readAsDataURL(fuData.files[0]);
      }
    } else {
      document.getElementById("cancelled_cheque_Photo-message").innerHTML =
        "File type should be of PNG, JPG and JPEG";
    }
  } else {
    document.getElementById("cancelled_cheque_Photo-message").innerHTML = "Cancelled Cheque photo is Mandatory";
    condition = false;
  }
  return condition;
}

// ******************************************Validation Functions Start****************************************************


function namecheck(value) {
  let check = false;
  if (value.length > 1) {
    for (let i = 0; i < value.length; i++) {
      if (value[i] >= '!' && value[i] <= '@') {
        check = false;
        break;
      } else {
        check = true;
      }
    }
  } else {
    check = false;
  }
  return check;
}

function yearcheck(value) {
  let checkit = false;
  if (value.length == 4) {
    if (!isNaN(value)) {
      checkit = true;
    }
  } else {
    checkit = false;
  }
  return checkit;
}

// ******************************************Validation Functions End***************************************************

function tempemailvalidation(value) {
  let checkit = false;
  if (value.length > 0) {
    var atposition = value.indexOf('@');
    var dotposition = value.lastIndexOf('.');
    if (atposition < 1 || (value.length - 2) == dotposition) {
      document.querySelector('#temp-email-message').innerHTML = "Invalid";
      checkit = false;
    } else if (atposition < dotposition) {
      checkit = true;
    } else {
      document.querySelector('#temp-email-message').innerHTML = "Invalid";
      checkit = false;
    }
  } else {
    checkit = true;
  }
  return checkit;
}


// ******************************************Validation Functions Start****************************************************
function tabledatacheck(value) {
  let checkit = false;
  if (value.length > 0) {
    checkit = true;
  } else {
    checkit = false;
  }
  return checkit;
}

function checknotnull(value) {
  let checkit = false;
  if (value > 0) {
    checkit = true;
  } else {
    checkit = false;
  }
  return checkit;
}

function namecheck(value) {
  let check = false;
  if (value.length > 1) {
    for (let i = 0; i < value.length; i++) {
      if (value[i] >= '!' && value[i] <= '@') {
        check = false;
        break;
      } else {
        check = true;
      }
    }
  } else {
    check = false;
  }
  return check;
}

function checkdate(value) {
  let checkit = false;
  if (value.length == 10) {
    checkit = true;
  } else {
    checkit = false;
  }
  return checkit;
}

// ******************************************Validation Functions End***************************************************



function personalDetails() {

  document.querySelector('.personal-information-div-wrapper').addEventListener('mouseover', function () {

    for (let box of document.querySelector('#body').querySelectorAll('.edit-show')) {
      box.classList.add('d-none');
      box.classList.remove('edit-show');
    }

    document.querySelector('.personal-details-edit-box').classList.remove('d-none');
    document.querySelector('.personal-details-edit-box').classList.add('edit-show');
  });



  document.querySelector('#pancard-photo-preview').addEventListener('click', function (e) {
    document.getElementById('body').classList.add('d-none');
    document.querySelector('.pancard-photo-modal').classList.remove('d-none');
  })

  document.querySelector('#pancard-photo-cancel-button').addEventListener('click', function (e) {
    document.getElementById('body').classList.remove('d-none');
    document.querySelector('.pancard-photo-modal').classList.add('d-none');
  })

  document.querySelector('#aadhar-photo-preview').addEventListener('click', function (e) {
    document.getElementById('body').classList.add('d-none');
    document.querySelector('.aadhar-photo-modal').classList.remove('d-none');
  })

  document.querySelector('#aadhar-photo-cancel-button').addEventListener('click', function (e) {
    document.getElementById('body').classList.remove('d-none');
    document.querySelector('.aadhar-photo-modal').classList.add('d-none');
  })



  //************************************Personal Details Section Start***************************************************************

  //Personal details Edit Btn
  document.querySelector('.personal-details-edit-box').addEventListener('click', function () {

    let editPersonalDetailsForm = new FormData()

    editPersonalDetailsForm.append('editDateOfBirth', document.getElementById('date-of-birth-value')
      .innerText)
    editPersonalDetailsForm.append('editFirstName', document.getElementById('first-name-value')
      .innerText)
    editPersonalDetailsForm.append('editLastName', document.getElementById('last-name-value')
      .innerText)
    editPersonalDetailsForm.append('editPancardNumber', document.getElementById('pancard-value')
      .innerText)
    editPersonalDetailsForm.append('editAadharCardNumber', document.getElementById(
        'aadhar-card-value')
      .innerText)
    editPersonalDetailsForm.append('editContactNumber', document.getElementById(
        'contact-number-value')
      .innerText)
    editPersonalDetailsForm.append('editEmail', document.getElementById('email-value').innerText)
    editPersonalDetailsForm.append('editAddress', document.getElementById('address-value').innerText)
    editPersonalDetailsForm.append('editTemporaryAddress', document.getElementById(
      'temporary-address-value').innerText)
    editPersonalDetailsForm.append('editCity', document.getElementById('city-value').innerText)
    editPersonalDetailsForm.append('editPincode', document.getElementById('pincode-value').innerText)
    editPersonalDetailsForm.append('editCountry', document.getElementById('country-value').innerText)
    editPersonalDetailsForm.append('editGender', document.getElementById('gender-value').innerText)

    document.getElementById('first-name').value = editPersonalDetailsForm.get('editFirstName')
    document.getElementById('last-name').value = editPersonalDetailsForm.get('editLastName')
    document.getElementById('date-of-birth').value = editPersonalDetailsForm.get('editDateOfBirth')
    document.getElementById('pan-number').value = editPersonalDetailsForm.get('editPancardNumber')
    document.getElementById('aadhar-number').value = editPersonalDetailsForm.get(
      'editAadharCardNumber')
    document.getElementById('contact-number').value = editPersonalDetailsForm.get('editContactNumber')
    document.getElementById('email').value = editPersonalDetailsForm.get('editEmail')
    document.getElementById('address').value = editPersonalDetailsForm.get('editAddress')
    document.getElementById('city').value = editPersonalDetailsForm.get('editCity')
    document.getElementById('pincode').value = editPersonalDetailsForm.get('editPincode')
    document.getElementById('temporary-address').value = editPersonalDetailsForm.get(
      'editTemporaryAddress')
    document.getElementById('country').value = editPersonalDetailsForm.get('editCountry')

    document.getElementById('body').classList.add('d-none');
    document.querySelector('.personal-details-modal').classList.remove('d-none');

  });

}

function checkboxfunction(checkbox, input) {
  $("." + checkbox).on("click", function () {
    if ($(this).is(":checked")) {
      document.querySelector('.' + input).classList.remove('d-none');
    } else {
      document.querySelector('.' + input).classList.add('d-none');
    }
  });
}

//*****************************************************Dynamic Validation's**************************************************************** 

function dynamiCheckSpecialChar(value, message) {
  document.getElementById(message).innerHTML = '';
  let check = false;
  if (value.length > 1) {
    for (let i = 0; i < value.length; i++) {
      if (value[i] >= '!' && value[i] <= '@') {
        document.getElementById(message).innerHTML = 'Not Allowed';
        check = false;
        break;
      } else {
        check = true;
      }
    }
  } else {
    document.getElementById(message).innerHTML = 'Provide Input';
    check = false;
  }
  return check;
}

function dynamicLengthCheck(value, message) {
  document.getElementById(message).innerHTML = '';
  let check = false;
  if (value.length > 2) {
    check = true;
  } else {
    document.getElementById(message).innerHTML = 'Invalid';
    check = false;
  }
  return check;
}

function dynamicEmailCheck(value, message) {
  document.getElementById(message).innerHTML = '';
  let condition = false;
  let atposition = value.indexOf('@');
  let dotposition = value.lastIndexOf('.');
  if (atposition < 1 || (value.length - 2) == dotposition) {
    document.getElementById(message).innerHTML = 'Invalid';
    condition = false;
  } else if (atposition < dotposition) {
    condition = true;
  } else {
    document.getElementById(message).innerHTML = 'Invalid';
    condition = false;
  }
  return condition;
}

function dynamicContactCheck(value, message) {
  document.getElementById(message).innerHTML = '';
  let condition = false;
  if (value.length != 10) {
    document.getElementById(message).innerHTML = 'Invalid';
    condition = false;
  } else {
    if (isNaN(value)) {
      document.getElementById(message).innerHTML = 'Invalid';
      condition = false;
    } else {
      if ((value.charAt(0) != 9) && (value.charAt(0) != 8) && (value.charAt(0) != 7) && (value.charAt(0) != 6)) {
        document.getElementById(message).innerHTML = 'Invalid';
        condition = false;
      } else {
        condition = true;
      }
    }
  }
  return condition;
}

function dynamicAdharNumberCheck(value, message) {
  document.getElementById(message).innerHTML = '';
  let condition = false;
  if (value.length>0)
  {
  if (value.length != 12) {
    document.getElementById(message).innerHTML = 'Invalid';
    condition = false;
  } else {
    for (let i = 0; i < value.length; i++) {
      if (value[i] < '0' || value[i] > '9') {
        document.getElementById(message).innerHTML = 'Invalid';
        condition = false;
        break;
      } else {
        condition = true;
      }
    }
  }
  condition = false;
}
  return condition;
}

function dynamicIFSCCheck(value, message) {
  document.getElementById(message).innerHTML = '';
  let condition = false;
  if (value.length != 11) {
    condition = false;
    document.getElementById(message).innerHTML = 'Invalid';
  } else {
    let firstfour = value.substring(0, 4);
    let lastseven = value.substring(4, 11);
    for (let i = 0; i < firstfour.length; i++) {
      if (firstfour[i] < 'A' || firstfour[i] > 'Z') {
        document.getElementById(message).innerHTML = 'Invalid';
        condition = false;
        break;
      } else {
        for (let j = 0; j < lastseven.length; j++) {
          if (lastseven[j] >= '0' && lastseven[j] <= '9') {
            condition = true;
          } else {
            document.getElementById(message).innerHTML = 'Invalid';
            condition = false;
            break;
          }
        }
      }
    }
  }
  return condition;
}

function dynamicBankAcountNumber(value, message) {
  document.getElementById(message).innerHTML = '';
  if ((value.length <= 10) || value.length > 16) {
    document.getElementById(message).innerHTML = 'Invalid';
    condition = false;
  } else {
    if (isNaN(value)) {
      document.getElementById(message).innerHTML = 'Invalid';
      condition = false;
    } else {
      condition = true;
    }
  }
  return condition;
}

function dynamicPinNumber(value, message) {
  document.getElementById(message).innerHTML = '';
  check = false;
  if (value.length == 6) {
    if (isNaN(value)) {
      check = false;
      document.getElementById(message).innerHTML = 'Invalid';
    } else {
      check = true;
    }
  } else {
    check = false;
    document.getElementById(message).innerHTML = 'Invalid';
  }
  return check;
}

function dynamicTempContactNumber(value, message) {
  document.getElementById(message).innerHTML = '';
  let condition = false;
  if (value.length < 1) {
    condition = true;
  } else {
    if (value.length != 10) {
      condition = false;
      document.getElementById(message).innerHTML = 'Invalid';
    } else {
      if (isNaN(value)) {
        condition = false;
      } else {
        if ((value.charAt(0) != 9) && (value.charAt(0) != 8) && (value.charAt(0) != 7) && (value.charAt(0) != 6)) {
          condition = false;
          document.getElementById(message).innerHTML = 'Invalid';
        } else {
          condition = true;
        }
      }
    }
  }
  return condition;
}

function dynamicTempEmail(value, message) {
  document.getElementById(message).innerHTML = '';
  let checkit = false;
  if (value.length > 0) {
    var atposition = value.indexOf('@');
    var dotposition = value.lastIndexOf('.');
    if (atposition < 1 || (value.length - 2) == dotposition) {
      document.getElementById(message).innerHTML = 'Invalid';
      checkit = false;
    } else if (atposition < dotposition) {
      checkit = true;
    } else {
      document.getElementById(message).innerHTML = 'Invalid';
      checkit = false;
    }
  } else {
    checkit = true;
  }
  return checkit;
}

function dynamicPin(res, message) {
  document.getElementById(message).innerHTML = "";
  if (checkLength(res) > 3) {
    if (isCharNumber(res)) {
      if(res.charAt(0) != '0')
      {
      condition = true;
      } else {
        document.getElementById(message).innerHTML = "Invalid";
        condition = false;
      }
    } else {
      document.getElementById(message).innerHTML = "Only Numbers are allowed";
      condition = false;
    }
  } else {
    document.getElementById(message).innerHTML = "Invalid length";
    condition = false;
  }
  return condition;
}



function RegistrationPanValidation(res) {

  if (res.length != 10) {
    document.querySelector('.pancard-error-message').classList.remove('d-none')
    condition = false;
  } else {
    let firstfive = res.substring(0, 5);
    let nextfour = res.substring(5, 9);
    for (let i = 0; i < firstfive.length; i++) {
      if (firstfive[i] >= 'A' && firstfive[i] <= 'Z') {
        for (let k = 0; k < nextfour.length; k++) {
          if (nextfour[k] >= '0' && nextfour[k] <= '9') {
            if (res[9] >= 'A' && res[9] <= 'Z') {
              return true;
            } else {
              document.querySelector('.pancard-error-message').classList.remove('d-none')
              return false;
            }
          } else {
            document.querySelector('.pancard-error-message').classList.remove('d-none')
            return false;
          }
        }
      } else {
        document.querySelector('.pancard-error-message').classList.remove('d-none')
        return false
      }
    }
  }
  return false;
}

function RegistrationEmailValidation(res) {
  var atposition = res.indexOf('@');
  var dotposition = res.lastIndexOf('.');

  if (atposition < 1 || (res.length - 2) == dotposition) {
    document.querySelector('.email-error-message').classList.remove('d-none')
    return false;
  } else if (atposition < dotposition) {
    return true;
  } else {
    document.querySelector('.email-error-message').classList.remove('d-none')
    return false;
  }
}

function RegistrationPasswordValidation(res,className) {
  if (checkLength(res) > 3) {
   return true;
  } else {
    document.querySelector('.'+className).classList.remove('d-none')
    return false;
  }
}

function ClearRegistrationError() {
  document.querySelector('.pancard-error-message').classList.add('d-none')
  document.querySelector('.email-error-message').classList.add('d-none')
  document.querySelector('.password-error-message').classList.add('d-none')
  document.querySelector('.password-2-error-message').classList.add('d-none')

}

function dynamiVariableName(value, message) {
  document.getElementById(message).innerHTML = '';
  let check = false;
  if (value.length > 1) {
    for (let i = 0; i < value.length; i++) {
      value = value.replaceAll('(','');
      value = value.replaceAll(')','');
      value = value.replaceAll('-','');
      if ((value[i] >= '!' && value[i] <= '/') || (value[i] >= ':' && value[i] <= '@')) {
        document.getElementById(message).innerHTML = "Only '( ) -' are Allowed";
        check = false;
        break;
      } else {
        check = true;
      }
    }
  } else {
    document.getElementById(message).innerHTML = 'Provide Input';
    check = false;
  }
  return check;
}

function variableName(value){
  let check = false;
  if (value.length > 1) {
    for (let i = 0; i < value.length; i++) {
      value = value.replaceAll('(','');
      value = value.replaceAll(')','');
      value = value.replaceAll('-','');
      if ((value[i] >= '!' && value[i] <= '/') || (value[i] >= ':' && value[i] <= '@')) {
        check = false;
        break;
      } else {
        check = true;
      }
    }
  } else {
    check = false;
  }
  return check;
}