$(function() {
  $("#albums-thumb-button").click(function(event) {
    if ($("#albums-thumbnails").css("display") == "none") {
      $("#albums-listing").slideUp(500);
      $("#albums-thumbnails").slideDown(500);
      if (window.history.pushState) {
        window.history.pushState({}, "Thumbnail View", "?view=thumb");
      }
    }
    return false;
  });

  $("#albums-list-button").click(function(event) {
    if ($("#albums-listing").css("display") == "none") {
      $("#albums-thumbnails").slideUp(500);
      $("#albums-listing").slideDown(500);
      if (window.history.pushState) {
        window.history.pushState({}, "Thumbnail View", "?view=list");
      }
    }
    return false;
  });

  $("#albums-thumbnails .image").hover(function() {
    $("#album-header-info").html($(this).children("a:first").attr("title"));
  },
  function() {
    $("#album-header-info").html("");
  });
});
