$(document).ready( function() {
  // logout button
  var log_user_out = function() {
    $.removeCookie('user_id');
    $.removeCookie('username');
  }

  $('#logout').on('click', function () {
    log_user_out();
  });
});

