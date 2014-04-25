$(document).ready(

  function() {

    var scrollMessagesToBottom = function(animated) {
      var height = $('.messages')[0].scrollHeight;
      if(animated) {
        $('.messages').animate({scrollTop: height}, 900);
      } else {
        $('.messages').scrollTop(height);
      }
    }

    scrollMessagesToBottom();

    var getEventId = function() {
      var intRegex = /[0-9 -()+]+$/;
      return $(location).attr('hash').match(intRegex)[0];
    }

    var renderMessage = function(message) {
      html = '<div class="message">' +
        '<div class="user">' + message.user_id + '</div>' +
        '<div class="content">' + message.content + '</div>' +
      '</div>';
      return html;
    }

    var appendMessage = function(html) { $('.messages').append(html); }

    var clearTextArea = function() { $('#message').val(''); }

    // Faye subscription
    var channel = '/events/' + getEventId() + '/messages';
    var faye = new Faye.Client('http://localhost:9292/faye');

    faye.subscribe(channel, function (data) {
      messageView = renderMessage(data);
      appendMessage(messageView);
      scrollMessagesToBottom(true);
    })

    // click handler
    $('#post-button').on('click', function(e) {

      var url = 'http://localhost:3000/api/events/' + getEventId() + '/messages';

      $.ajax({
        type: 'POST',
        url: url,
        dataType: 'json',
        data: $('form').serialize(),
        success: function(data) {
          clearTextArea();
          faye.publish(channel, data);
        },
        error: function(x,y,z) {
          alert('Error posting message');
        }
      });

      e.preventDefault();
    });
  }
);