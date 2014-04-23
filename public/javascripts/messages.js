
$(function() {
  var faye = new Faye.Client('http://localhost:9292/faye');
  faye.subscribe('/events/1/messages', function (data) {
    alert(data);
  });
});