$(function () {

  $('body').on('submit', '#registration-form', function(e) {

    e.preventDefault();
    var user = {
      username: $(this).find('#username').val(),
      email: $(this).find('#email').val(),
      password: $(this).find('#password').val(),
      password_confirmation: $(this).find('#password_confirmation').val()
    };

    // console.log(user);

    $.ajax({
        url: '/registration',
        type: 'POST',
        contentType: 'application/json',
        dataType: 'json',
        data: JSON.stringify({
          user: user
        }),
        success: function(data) {
          console.log("good");
          window.router.navigate('event', {
              trigger: true
            });
        },
        error: function(data) {
          console.log("something went wrong");
        }
    });


  }); //end of body click

}); //end of js

