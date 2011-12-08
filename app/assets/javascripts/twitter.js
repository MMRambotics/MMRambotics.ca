function calculate_tweet_quantity() {
  var total_height = $("#container").height();
  total_height -= $("#non-twitter").outerHeight();
  total_height -= 50;
  return Math.ceil(Math.min(3, total_height / 200));
}

function process_tweet(data) {
  var text = data.text;
  if (data.in_reply_to_screen_name) {
    var sn = data.in_reply_to_screen_name;
    text = text.replace("@" + sn, "<a target='_blank' href='http://twitter.com/" + sn + "'>@" + sn + "</a>");
  }

  text = text.replace(/http:\/\/t\.co\/[a-zA-Z0-9]+/g, "<a target='_blank' href='$&'>$&</a>");
  return text;
}

function tweet(data) {
  return $('<div class="tweet">' + process_tweet(data) + '</div>');
}

function twitter_callback(data) {
  for (var i = 0; i < data.length; ++i) {
    $("#twitter-feed").append(tweet(data[i]));
    $("#twitter-feed").append("<div class='tweet-hr'></div>");
  }

  $("#twitter-feed").append("<div class='tweet'>Follow us on <a href='http://twitter.com/mmrambotics' target='_blank'>Twitter</a>!</div>");
}

$(function() {
  if ($("#twitter-feed").length == 1) {
    var count = calculate_tweet_quantity();
    $("<script src='http://api.twitter.com/1/statuses/user_timeline.json?screen_name=mmrambotics&count=" + count + "&callback=twitter_callback'></script>").appendTo("body");
    $("#twitter-feed").addClass("visible");
  }
});
