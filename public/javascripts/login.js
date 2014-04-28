$('body').on('submit', '#login-form', function(e) {
    var user;
    e.preventDefault();
    user = {
      email: $(this).find('#user_email').val(),
      password: $(this).find('#user_password').val()
    };

    $.ajax({
        url: '/login',
        type: 'POST',
        contentType: 'application/json',
        dataType: 'json',
        data: JSON.stringify({
          user: user
        }),
        success: (function(_this) {
          return function(data) {
            return window.router.navigate('event', {
              trigger: true
            });
          };
        })(this),
        error: (function(_this) {
          return function(x, y, z) {
            return console.log(x, y, z);
          };
        })(this)
      });
    });
  });
}).call(this);