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

    // click handler
    $('#post-button').on('click', function(e) {

      var renderMessage = function(message) {
        html = '<div class="message">' +
          '<div class="user">' + message.user_id + '</div>' +
          '<div class="content">' + message.content + '</div>' +
        '</div>';
        return html;
      }

      var appendMessage = function(html) {
        $('.messages').append(html);
      }

      var clearTextArea = function() {
        // $('#message').overlay([
          // {
            // match: /\B#([\w.])+/g,
            // css: {'background-color': '#fff'}
          // }]);
        $('#message').val('');
      }

      var getEventId = function() {
        var intRegex = /[0-9 -()+]+$/;
        return $(location).attr('hash').match(intRegex)[0];
      }

      var url = 'http://localhost:3000/api/events/' + getEventId() + '/messages';

      $.ajax({
        type: 'POST',
        url: url,
        dataType: 'json',
        data: $('form').serialize(),
        success: function(data) {
          messageView = renderMessage(data);
          appendMessage(messageView);
          scrollMessagesToBottom(true);
          clearTextArea();
        },
        error: function(x,y,z) {
          alert('Error posting message');
        }
      });

      e.preventDefault();
    });
  }
);