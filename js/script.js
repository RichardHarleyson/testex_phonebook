//   DOCUMENT ON LOAD

// activate tab on page load
const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
if(urlParams.has('error')) document.getElementById('loginTabBtn').click();
else document.getElementById("publicTabBtn").click();

// FUNCTIONS

// Tabs logic
function openTab(evt, block) {
    // Declare all variables
    var i, tabcontent, tablinks;
  
    // Get all elements with class="tabcontent" and hide them
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
    }
  
    // Get all elements with class="tablinks" and remove the class "active"
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
  
    // Show the current tab, and add an "active" class to the button that opened the tab
    document.getElementById(block).style.display = "block";
    evt.currentTarget.className += " active";

    event.preventDefault();
    var divToAppendTo = document.getElementById(block);

    $.ajax({
      url: block,
      type: 'GET',
      success: function(blockCode){
        $(divToAppendTo).empty();
        $(divToAppendTo).html(blockCode);
        // divToAppendTo.innerHTML = blockCode;
      }
    })

  }

// Adding phone block
function addPhoneBlock(){
  event.preventDefault();
  $('#userPhoneList').append('<div class="personal-phone-block"><input type="checkbox" name="phone"><label for="phone">Public field</label><br><input type="tel" data-pid="" class="personal-tab-input" name="phone"></div>');
  return 0;
}

// Adding email block
function addEmailBlock(){
  event.preventDefault();
  $('#userEmailList').append('<div class="personal-email-block"><input type="checkbox" name="email"><label for="email">Public field</label><br><input type="email" data-eid="" class="personal-tab-input" name="email"></div>');
  return 0;
}

function sendUserInfoAjax(objToSend){
  var userInfo = JSON.stringify(objToSend);
  $.ajax({
    url: $('#saveUserInfoForm').attr('action'),
    type: $('#saveUserInfoForm').attr('method'),
    data: {userInfo: userInfo},
    success: function(res){
      console.log(res);
      $('#saveUserInfoBtn').css('background-color', 'green');
      setTimeout(function(){
        $('#saveUserInfoBtn').css('background-color', '#ff7400');
      }, 2000);
    }
  })
}

function openAccordion(elem, blockId){
  event.preventDefault();
  blockId.classList.toggle('hide');
  blockId.classList.toggle('show');
  if(elem.innerHTML === 'View details'){
    elem.innerHTML = 'Hide details';
  }else{
    elem.innerHTML = 'View details';
  }
}

// EVENTS HANDLERS

// Saving user data from personal info tab
$(document).on('submit', '#saveUserInfoForm', function(){
  event.preventDefault();
  $('#saveUserInfoBtn').attr('disabled', true);

  // Collecting basic user info (fname, addr etc)
  var objToSend = {};
  objToSend['uid'] = $('#saveUserInfoForm').data('uid');
  // objToSend['public'] = $('#publicUser').is(':checked');
  objToSend['public'] = document.getElementById('publicUser').checked ? 1 : 0;

  var baseInfo = document.getElementById('baseInfoCol').querySelectorAll("input, select");
  for(let i=0; i<baseInfo.length; i++){
    var elem = baseInfo[i];
    if(!elem.name) continue;
    objToSend[elem.name] = elem.value;
  }

// Collecting user phones
  var phonesObj = {};
  var phones = document.getElementsByClassName('personal-phone-block');
  for(let i=0; i<phones.length; i++){
    let innerObj = {};
    let phone = phones[i].querySelector('input[type="tel"]').value;
    if(!phone) continue;
    let checkboxState = phones[i].querySelector('input[type="checkbox"]').checked ? 1 : 0;
    let phoneId = phones[i].querySelector('input[type="tel"]').getAttribute('data-pid');
    innerObj['phone'] = phone;
    innerObj['public'] = checkboxState;
    innerObj['pid'] = phoneId;
    phonesObj[i] = innerObj;
  }
  objToSend['phones'] = phonesObj;

// Collecting user emails
  var emailsObj = {};
  var emails = document.getElementsByClassName('personal-email-block');
  for(let i=0; i<emails.length; i++){
    let innerObj = {};
    let email = emails[i].querySelector('input[type="email"]').value;
    if(!email) continue;
    let checkboxState = emails[i].querySelector('input[type="checkbox"]').checked ? 1 : 0;
    let emailId = emails[i].querySelector('input[type="email"]').getAttribute('data-eid');
    innerObj['email'] = email;
    innerObj['public'] = checkboxState;
    innerObj['eid'] = emailId;
    emailsObj[i] = innerObj;
  }
  objToSend['emails'] = emailsObj;

  sendUserInfoAjax(objToSend);
  $('#saveUserInfoBtn').attr('disabled', false);
  return 0;
})
