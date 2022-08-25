
import consumer from "./consumer"

$(document).ready(function () {
  $('[data-channel-subscribe="room"]').each(function (index, element) {
    var $element = $(element),
      room_id = $element.data('room-id')
    var messageTemplate = $('[data-role="message-template"]');

    $element.animate({ scrollTop: $element.prop("scrollHeight") }, 1000)

    consumer.subscriptions.create({ channel: "RoomChannel", room: room_id }, {

      connected() {
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        var content = messageTemplate.children().clone(true, true);
        content.find('[data-role="user-avatar"]').attr('src', data.user_avatar_url);
        content.find('[data-role="user-name"]').text(data.user_name);
        content.find('[data-role="message-text"]').text(data.message);
        content.find('[data-role="message-date"]').text(data.updated_at);
        $element.append(content);
        $element.animate({ scrollTop: $element.prop("scrollHeight") }, 1000);
      }
    })
  })
})