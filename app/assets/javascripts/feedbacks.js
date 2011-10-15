function getBrowser() {
  ret = "";
  $.each($.browser, function(key, val) {
    ret += key + " (" + val + ") ";
  });
  return ret;
}

$(function() {
  $("#feedback-anchor").click(function() {
    $("#feedback-form").fadeIn(500);
    $("#feedback-browser").val(getBrowser());
    $("#feedback-os").val(navigator.userAgent);
    $("#feedback-width").val($(window).width());
    $("#feedback-height").val($(window).height());
    return false;
  });
});
